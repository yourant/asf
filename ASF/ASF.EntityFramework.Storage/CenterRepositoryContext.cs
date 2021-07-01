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
            // 账户
            modelBuilder.Entity<CenterAccount>(e =>
            {
                e.ToTable("Accounts")
                    .HasComment("账户表");
                
                e.HasKey(x => x.AccountId);
                e.Property(x => x.AccountId).HasColumnName("AccountID").ValueGeneratedOnAdd();
                e.Property(x => x.GroupShopId).HasColumnName("GroupShopID");
            });
            //商户
            modelBuilder.Entity<CenterShop>(e =>
            {
                e.ToTable("Shops")
                    .HasComment("商城表");
                e.HasKey(x => x.ShopId);
                e.Property(x => x.ShopId).HasColumnName("ShopID").ValueGeneratedOnAdd();
                e.Property(x => x.ChainId).HasColumnName("ChainID").HasComment("供应商id");
                e.Property(x => x.RegionId).HasComment("RegionID").HasComment("商户区域id");
                e.Property(x => x.RowVersion).HasColumnType("timestamp").HasMaxLength(8).HasComment("版本");
            });
            //应用
            modelBuilder.Entity<CenterProgram>(e =>
            {
                e.ToTable("Programs")
                    .HasComment("应用表");
                e.HasKey(x => x.ProgramId);
                e.Property(x => x.ProgramId).HasColumnName("ProgramID").ValueGeneratedOnAdd();
                e.Property(x => x.ChainId).HasColumnName("ChainID").HasComment("供应商id");
                e.Property(x => x.AccountId).HasColumnName("AccountID").HasComment("账户id");
                e.Property(x => x.ProgramGroupId).HasColumnName("ProgramGroupID").HasComment("应用组id");
                e.Property(x => x.MerchantId).HasColumnName("MerchantID").HasComment("商户id");
                e.Property(x => x.GroupShopId).HasColumnName("GroupShopID").HasComment("商户id");
            });
            base.OnModelCreating(modelBuilder);
        }
        //账户
        public virtual DbSet<CenterAccount> CenterAccount { get; set; }
        //商户
        public virtual DbSet<CenterShop> CenterShops { get; set; }
        //应用组
        public virtual DbSet<CenterProgram> CenterPrograms { get; set; }

    }
}
