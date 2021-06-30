using ASF.Domain.Entities.Center;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
    public class CenterRepositoryContext: DbContext
    {
        public CenterRepositoryContext(DbContextOptions<CenterRepositoryContext> options)
        : base(options)
        {
        }
        // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        // {
        //     optionsBuilder.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
        // }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CenterAccount>(e =>
            {
                e.ToTable("Account")
                    .HasComment("账户表");
                
                e.HasKey(x => x.AccountId);
                e.Property(x => x.AccountId).HasColumnName("id").ValueGeneratedOnAdd();
                e.Property(x => x.RowVersion).HasColumnType("timestamp").HasMaxLength(8).HasComment("版本");
            });
            
            base.OnModelCreating(modelBuilder);
        }
        //账户
        public virtual DbSet<CenterAccount> CenterAccount { get; set; }
    }
}
