// /////////////////////////////////////////////////////////////////////////////
// YOU CAN FREELY MODIFY THE CODE BELOW IN ORDER TO COMPLETE THE TASK
// /////////////////////////////////////////////////////////////////////////////

namespace WebApi.Controllers;

using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApi.Helpers;
using WebApi.Entities;
using Microsoft.EntityFrameworkCore;
using WebApi.Entities.DTO;
using System.Net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

[ApiController]
[Route("api/[controller]")]
public class PlayerController : ControllerBase
{
  private readonly DataContext Context;

  public PlayerController(DataContext context)
  {
    Context = context;
  }

  [HttpGet]
  public async Task<ActionResult<List<Player>>> GetAll()
  {
        List<Player> data = await Context.Players
            .GroupJoin(
                Context.PlayerSkills,
                player => player.Id,
                playerSkill => playerSkill.PlayerId,
                (player, playerSkills) => new { player, playerSkills })
            .SelectMany(
                x => x.playerSkills.DefaultIfEmpty(),
                (player, playerSkill) => new { player.player, playerSkill })
            .GroupBy(
                x => x.player,
                x => x.playerSkill,
                (player, playerSkills) => new Player
                {
                    Id = player.Id,
                    Name = player.Name,
                    Position = player.Position,
                    PlayerSkills = playerSkills
                        .Where(skill => skill != null)
                        .Select(skill => new PlayerSkill
                        {
                            Id = skill.Id,
                            Skill = skill.Skill,
                            Value = skill.Value,
                            PlayerId = skill.PlayerId
                        })
                        .ToList()
                })
            .ToListAsync();

        return data;
  }

  [HttpPost]
  public async Task<ActionResult<Player>> PostPlayer(PlayerDTO playerDto)
  {
        //check if the player name is exists
        var existsPlayer = await Context.Players.FirstOrDefaultAsync(x => x.Name.Equals(playerDto.Name));
        if (existsPlayer != null)
        {
            return BadRequest(new { 
                message =  playerDto.Name + " is already registered" 
            });
        }
        //enable auto increment first, to avoid error upon inserting it
        //wandi: this two lines below had to be uncommented if you are using SQL Server
        //Context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT Players ON");
        //Context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT PlayerSkills ON");

        //insert data
        Player player = new Player();
        player.Name = playerDto.Name;
        player.Position = playerDto.Position;

        Context.Players.Add(player);
        await Context.SaveChangesAsync();



        List<PlayerSkill> skillList = new List<PlayerSkill>();
        foreach(var data in playerDto.PlayerSkills)
        {
            PlayerSkill skill = new PlayerSkill();
            skill.Skill = data.Skill;
            skill.Value = data.Value;
            skill.Player = player;

            skillList.Add(skill);
            Context.PlayerSkills.Add(skill);
        }

        await Context.SaveChangesAsync();

        return Ok(player);


    }

  [HttpPut("{id}")]
  public async Task<ActionResult<Player>> PutPlayer([FromRoute] int id, PlayerDTO playerDto)
  {
        //check if the player name is exists
        var existsPlayer = await Context.Players.FirstOrDefaultAsync(x => x.Id.Equals(id));
        if (existsPlayer == null)
        {
            return NotFound(new
            {
                message = playerDto.Name + " is not found"
            });
        }

        //if existsPlayer is null, then we can start editing it
        existsPlayer.Name = playerDto.Name;
        existsPlayer.Position = playerDto.Position;

        //after that, grab the skillset
        var data = Context.PlayerSkills.Where(x => x.PlayerId.Equals(id)).ToListAsync();

        //next update it, there is a better practice for it but i dont quite remember it. so lets left it as a temporal solution before we found one
        for(var i = 0; i <data.Result.Count; i++)
        {
            var skill = data.Result[i];
            var skillDto = playerDto.PlayerSkills[i];
            
            skill.Skill = skillDto.Skill;
            skill.Value = skillDto.Value;
        }

        await Context.SaveChangesAsync();
        return Ok(new
        {
            message = playerDto.Name + "'s information has been updated"
        });
    }
    [ServiceFilter(typeof(BearerTokenAuthorizationFilter))]
    [HttpDelete("{id}")]
    public async Task<ActionResult<Player>> DeletePlayer([FromRoute] int id)
    {
        //define
        var player = await Context.Players.FirstOrDefaultAsync(x => x.Id.Equals(id));
        var skills = await Context.PlayerSkills.Where(x => x.PlayerId.Equals(id)).ToListAsync();

        if(player == null)
        {
            return NotFound(new
            {
                message = "No data found"
            });
        }

        //start deleting
        Context.PlayerSkills.RemoveRange(skills);
        Context.Players.Remove(player);

        await Context.SaveChangesAsync();

        return Ok(new
        {
            message = "Data Has been deleted successfully"
        });
    }
}

 