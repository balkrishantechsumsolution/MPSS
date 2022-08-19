using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using CitizenPortal.DAL;

namespace CitizenPortal.DAL
{
    public class DataContext : DbContext
    {
        public DataContext()
            : base("CitizenPortalMasterDB")
        {

        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .HasMany(u => u.Roles)
                .WithMany(r=>r.Users)
                .Map(m =>
                {
                    m.ToTable("UserRoles");
                    m.MapLeftKey("LoginID");
                    m.MapRightKey("RoleId");
                });
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
    }
}