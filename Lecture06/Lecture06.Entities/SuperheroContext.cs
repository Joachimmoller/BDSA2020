using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using static Lecture06.Entities.Gender;

namespace Lecture06.Entities
{
    public class SuperheroContext : DbContext, ISuperheroContext
    {
        public DbSet<Superhero> Superheroes { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Power> Powers { get; set; }
        public DbSet<SuperheroPower> SuperheroPowers { get; set; }

        public SuperheroContext(DbContextOptions<SuperheroContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<Superhero>()
                .Property(e => e.Gender)
                .HasConversion(
                    e => e.ToString(),
                    e => Enum.Parse<Gender>(e));

            modelBuilder.Entity<SuperheroPower>().HasKey(c => new { c.SuperheroId, c.PowerId });

            modelBuilder.Entity<City>()
                        .HasMany(c => c.Superheroes)
                        .WithOne(s => s.City)
                        .OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<City>()
                        .HasIndex(s => s.Name)
                        .IsUnique();

            modelBuilder.Entity<Power>()
                        .HasIndex(p => p.Name)
                        .IsUnique();
        }
    }
}
