// /////////////////////////////////////////////////////////////////////////////
// PLEASE DO NOT RENAME OR REMOVE ANY OF THE CODE BELOW. 
// YOU CAN ADD YOUR CODE TO THIS FILE TO EXTEND THE FEATURES TO USE THEM IN YOUR WORK.
// /////////////////////////////////////////////////////////////////////////////


namespace WebApi.Helpers;

using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata;
using WebApi.Entities;

public class DataContext : DbContext
{
  public DataContext() { }
  public DataContext(DbContextOptions<DataContext> options)
       : base(options) { }

  public DbSet<Player> Players { get; set; }
  public DbSet<PlayerSkill> PlayerSkills { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Player>()
            .HasMany(e => e.PlayerSkills)
            .WithOne(e => e.Player)
            .HasForeignKey(e => e.PlayerId);
    }

}
