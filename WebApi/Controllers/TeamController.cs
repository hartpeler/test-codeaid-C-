// /////////////////////////////////////////////////////////////////////////////
// YOU CAN FREELY MODIFY THE CODE BELOW IN ORDER TO COMPLETE THE TASK
// /////////////////////////////////////////////////////////////////////////////

using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApi.Helpers;
using WebApi.Entities;
using Microsoft.EntityFrameworkCore;
using WebApi.Entities.DTO;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TeamController : ControllerBase
    {
        private readonly DataContext Context;

        public TeamController(DataContext context)
        {
            Context = context;
        }

        [HttpPost("process")]
        public async Task<ActionResult<List<Player>>> Process(List<TeamRequirementDto> tr)
        {
            //case 0: if there is no player then return 404
            var player = Context.Players.Count();
            if (player == 0)
            {
                return NotFound(new
                {
                    message = "No data found"
                });
            }
            var bestPlayersInPositionSkill = new List<Player>();

            foreach (var requirement in tr)
            {
                var position = requirement.Position;
                var skill = requirement.MainSkill;
                var numberOfPlayers = requirement.NumberOfPlayers;

                var tmp = Context.Players
                    .Include(p => p.PlayerSkills)
                    .Where(p => p.Position == position)
                    .OrderByDescending(p => p.PlayerSkills
                        .Where(ps => ps.Skill == skill)
                        .Select(ps => (int?)ps.Value)  // Convert Value to nullable int
                        .Max() ?? 0)
                    .Take(numberOfPlayers)
                    .ToList();

                bestPlayersInPositionSkill.AddRange(tmp);
                var count = bestPlayersInPositionSkill.Count;

                if (count < numberOfPlayers)
                {
                    var remainingPlayers = Context.Players
                        .Include(p => p.PlayerSkills)
                        .Where(p => p.Position == position && !bestPlayersInPositionSkill.Contains(p))
                        .OrderByDescending(p => p.PlayerSkills
                            .Where(ps => ps.Skill == skill)
                            .Select(ps => (int?)ps.Value)  // Convert Value to nullable int
                            .Max() ?? 0)
                        .Take(numberOfPlayers - count)
                        .ToList();

                    bestPlayersInPositionSkill.AddRange(remainingPlayers);
                }


                if (bestPlayersInPositionSkill.Count < numberOfPlayers)
                {
                    return NotFound(new
                    {
                        message = "Insufficient number of players for position: " + position
                    });
                }
            }

            return bestPlayersInPositionSkill;

        }
    }
}
