using ASF.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
    public class RepositoryContext: DbContext
    {
        public RepositoryContext(DbContextOptions<RepositoryContext> options)
        : base(options)
        {
        }
        // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        // {
        //     optionsBuilder.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
        // }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(e =>
            {
                e.ToTable("asf_accounts")
                    .HasComment("账户表");
                
                e.HasKey(x => x.Id);
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                // 账户索引
                e.HasIndex(x => x.Username);
                // 手机索引
                e.HasIndex(x => x.Username);
                //邮箱索引
                e.HasIndex(x => x.Email);
                
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");

                e.Property(x => x.DepartmentId)
                    
                    .HasColumnName("department_id")
                    .HasComment("部门id");
                
                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(20)")
                    .IsRequired()
                    .HasComment("账户昵称");
                
                e.Property(x => x.Username)
                    .HasColumnName("username")
                    .HasColumnType("varchar(32)")
                    .IsRequired()
                    .HasComment("用户名");
                
                e.Property(x => x.Password)
                    .HasColumnName("password")
                    .IsRequired()
                    .HasColumnType("varchar(255)")
                    .HasComment("账户密码");
                
                e.Property(x => x.PasswordSalt)
                    .HasColumnName("password_salt")
                    .IsRequired()
                    .HasColumnType("varchar(255)")
                    .HasComment("密码加盐");
                
                e.Property(x => x.TelPhone)
                    .HasColumnName("telphone")
                    .HasColumnType("varchar(20)")
                    .HasComment("账户手机号码");
                
                e.Property(x => x.Status)
                    .HasColumnName("status")
                    
                    .HasDefaultValueSql("1")
                    .HasComment("账户状态, 1允许登录， 0禁止登录");
                
                e.Property(x => x.Email)
                    .HasColumnName("email")
                    .HasColumnType("varchar(30)")
                    .HasComment("账户邮箱");
                
                e.Property(x => x.Avatar)
                    .HasColumnName("avatar")
                    .HasColumnType("varchar(255)")
                    .HasComment("账户头像");
                
                e.Property(x => x.CreateId)
                    .HasColumnName("create_id")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("创建用户id");
                
                e.Property(x => x.IsDeleted)
                    
                    .HasColumnName("is_deleted")
                    .HasDefaultValueSql("0")
                    .HasComment("是否删除, 0 否, 1是");
                
                e.Property(x => x.Sex)
                    .HasColumnName("sex")
                    
                    .HasComment("性别 0 未知，1，男，2，女");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.Property(x => x.LoginTime)
                    .HasColumnName("login_time")
                    
                    .HasComment("最后登录时间");
                
                e.Property(x => x.LoginIp)
                    .HasColumnName("login_ip")
                    .HasColumnType("varchar(20)")
                    .HasComment("最后登录ip");
                
                e.Property(x => x.LoginLocation)
                    .HasColumnName("login_location")
                    .HasColumnType("varchar(50)")
                    .HasComment("最后登录位置");
                
                e.Property(x => x.Token)
                    .HasColumnName("token")
                    .HasColumnType("varchar(1000)")
                    .HasComment("token");
                
                e.Property(x => x.RefreshToken)
                    .HasColumnName("refresh_token")
                    .HasColumnType("varchar(1000)")
                    .HasComment("刷新token");
                
                e.Property(x => x.Expired)
                    .HasColumnName("expired")
                    
                    .HasComment("过期时间");
                
                
                // 多个用户关联一租户
                e.HasOne(l => l.Tenancys).WithMany(w => w.Accounts)
                    .HasForeignKey(f => f.TenancyId);
                
                
                // 一个部门关联多个用户
                e.HasOne(l => l.Department).WithMany(w => w.Accounts)
                    .HasForeignKey(f => f.DepartmentId);
                
            });
            modelBuilder.Entity<LogInfo>(e =>
            {
                e.ToTable("asf_loginfos").HasComment("日志表");
                
                e.HasKey(x => x.Id);
                
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                e.Property(x => x.AccountId)
                    
                    .HasColumnName("account_id")
                    .HasComment("账户id");
                
                e.Property(x => x.AccountName)
                    .HasColumnName("account_name")
                    .HasColumnType("varchar(32)")
                    .HasComment("账户名称");
                
                e.Property(x => x.Type)
                    .HasColumnName("type")
                    
                    .IsRequired()
                    .HasComment("日志类型，1： 登录日志， 2:操作日志,3 错误日志");
                
                e.Property(x => x.Subject)
                    .HasColumnName("subject")
                    .HasColumnType("varchar(200)")
                    .IsRequired()
                    .HasComment("登录方式");
                
                e.Property(x => x.ClientIp)
                    .HasColumnName("client_ip")
                    .HasColumnType("varchar(20)")
                    .HasComment("客户端ip");
                
                e.Property(x => x.ClientLocation)
                    .HasColumnName("client_location")
                    .HasColumnType("varchar(50)")
                    .HasComment("客户端位置");
                
                e.Property(x => x.PermissionId)
                    
                    .HasColumnName("permission_id")
                    .HasComment("权限id");
                
                e.Property(x => x.AddTime)
                    .HasColumnName("add_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.Property(x => x.ApiAddress)
                    .HasColumnType("varchar(500)")
                    .HasColumnName("api_address")
                    .HasComment("api请求地址");
                
                e.Property(x => x.ApiRequest)
                    .HasColumnType("text")
                    .HasColumnName("api_request")
                    .HasComment("api请求数据");
                
                e.Property(x => x.ApiResponse)
                    .HasColumnType("text")
                    .HasColumnName("api_response")
                    .HasComment("api响应数据");
                
                e.Property(x => x.Remark)
                    .HasColumnType("varchar(500)")
                    .HasColumnName("remark")
                    .HasComment("备注");

            });
            // token 黑名单
            modelBuilder.Entity<SecurityToken>(e =>
            {
                e.ToTable("asf_security_token").HasComment("token黑名单表");
                
                e.HasKey(x => x.Id);
                
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                e.Property(x => x.AccountId)
                    
                    .HasColumnName("account_id")
                    .HasComment("账户id");
                

                
                e.Property(x => x.Token)
                    .HasColumnName("token")
                    .HasColumnType("varchar(1000)")
                    .HasComment("黑名单token");
                
                e.Property(x => x.TokenExpired)
                    
                    .HasColumnName("token_expired")
                    .HasComment("黑名单token过期时间");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });
            
            modelBuilder.Entity<Permission>(e =>
            {
                e.ToTable("asf_permission").HasComment("权限表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                // 权限名称
                e.HasIndex(x => x.Name);

                e.Property(x => x.Code)
                    .HasColumnType("varchar(255)")
                    .HasColumnName("code")
                    .HasComment("权限代码");
                
                e.Property(x => x.ParentId)
                    
                    .HasColumnName("parent_id")
                    .HasDefaultValueSql("0")
                    .HasComment("上级id");
                
                e.Property(x => x.Name)
                    .HasColumnType("varchar(100)")
                    .HasColumnName("name")
                    .IsRequired()
                    .HasComment("权限名");
                
                e.Property(x => x.Type)
                    
                    .HasColumnName("type")
                    .HasComment("权限类型 1. 菜单条目权限， 2, 菜单目录,3 功能");
                
                e.Property(x => x.IsSystem)
                    
                    .HasColumnName("is_system")
                    .HasDefaultValueSql("0")
                    .HasComment("是否为系统权限 0 否， 1是");
                
                
                e.Property(x => x.Sort)
                    .HasColumnType("int")
                    .HasColumnName("sort")
                    .HasDefaultValueSql("0")
                    .HasComment("排序");
                
                e.Property(x => x.Enable)
                    
                    .HasDefaultValueSql("1")
                    .HasColumnName("enable")
                    .HasComment("是否启用");
                
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.Property(x => x.Description)
                    .HasColumnType("varchar(200)")
                    .HasColumnName("description")
                    .HasComment("备注");
                
            });
            
            modelBuilder.Entity<Api>(e =>
            {
                e.ToTable("asf_apis").HasComment("api表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                // api名称索引
                e.HasIndex(x => x.Name);
                // api路径索引
                e.HasIndex(x => x.Path).IsUnique();
                
                e.Property(x => x.PermissionId)
                    
                    .HasColumnName("permission_id")
                    .HasComment("权限id");
                
                e.Property(x => x.Name)
                    .HasColumnType("varchar(100)")
                    .HasColumnName("name")
                    .IsRequired()
                    .HasComment("api");
                
                e.Property(x => x.Type)
                    
                    .HasColumnName("type")
                    .HasComment("api类型 1. openapi， 2, authapi");
                
                e.Property(x => x.IsSystem)
                    
                    .HasColumnName("is_system")
                    .HasDefaultValueSql("0")
                    .HasComment("是否为系统权限 0 否， 1是");
                
                e.Property(x => x.Path)
                    .HasColumnType("varchar(500)")
                    .HasColumnName("path")
                    .HasComment("api地址");
                
                e.Property(x => x.IsLogger)
                    
                    .HasColumnName("is_logger")
                    .HasDefaultValueSql("0")
                    .HasComment("是否记录日志");
                
                
                e.Property(x => x.Status)
                    
                    .HasColumnName("status")
                    .HasDefaultValueSql("1")
                    .HasComment("api状态");
                
                
                e.Property(x => x.HttpMethods)
                    .HasColumnType("varchar(100)")
                    .HasColumnName("http_methods")
                    .HasComment("http 方法");
                
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.Property(x => x.Description)
                    .HasColumnType("varchar(200)")
                    .HasColumnName("description")
                    .HasComment("备注");
                // 关联对应权限
                e.HasOne(l => l.Permission).WithMany(w => w.Apis)
                    .HasForeignKey(f => f.PermissionId)
                    .HasConstraintName("api_permission_id_foreign");
            });
            
            modelBuilder.Entity<Role>(e =>
            {
                e.ToTable("asf_role").HasComment("角色表");
                e.HasKey(x => x.Id);
                
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");
                
                e.Property(x => x.Name)
                    .HasColumnType("varchar(20)")
                    .HasColumnName("name")
                    .IsRequired()
                    .HasComment("角色名称");
                
                e.Property(x => x.Description)
                    .HasColumnType("varchar(200)")
                    .HasColumnName("description")
                    .HasComment("备注");
                
                e.Property(x => x.Enable)
                    
                    .HasColumnName("enable")
                    .HasDefaultValueSql("1")
                    .HasComment("是否启用");
                
                e.Property(x => x.CreateId)
                    .HasColumnName("create_id")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("创建用户id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });
            //调度任务
            modelBuilder.Entity<ScheduledTasks>(e => {
                e.ToTable("asf_scheduled_task").HasComment("任务调度表");
                e.HasKey(x => x.Id);
                
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(255)")
                    .IsRequired()
                    .HasComment("任务名称");
                
                e.Property(x => x.Description)
                    .HasColumnName("description")
                    .HasColumnType("varchar(255)")
                    .HasComment("调度任务描述");
                
                e.Property(x => x.Url)
                    .HasColumnName("url")
                    .HasColumnType("varchar(255)")
                    .HasComment("调度任务执行地址");
                
                e.Property(x => x.Code)
                    .HasColumnName("code")
                    .HasColumnType("varchar(255)")
                    .HasComment("调度任务执行代码只限于c#代码");
                
                e.Property(x => x.TaskUserName)
                    .HasColumnName("task_username")
                    .HasColumnType("varchar(255)")
                    .HasComment("任务负责人");
                
                e.Property(x => x.ErrorEmail)
                    .HasColumnName("error_email")
                    .HasColumnType("varchar(255)")
                    .HasComment("告警通知邮箱");
                
                e.Property(x => x.Cron)
                    .HasColumnName("cron")
                    .HasColumnType("varchar(255)")
                    .HasComment("cron 表达式");
                
                e.Property(x => x.FailStop)
                    .HasColumnName("fail_stop")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("失败后暂停执行, 0:失败后不停止，1,失败后停止");
                
                e.Property(x => x.TaskStatus)
                    .HasColumnName("task_status")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("任务状态， 0:停止,1:启动");
                
                e.Property(x => x.ParamsContent)
                    .HasColumnName("params_content")
                    .HasColumnType("varchar(255)")
                    .HasComment("参数内容");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
            });
            // 部门表
            modelBuilder.Entity<Department>(e =>
            {
                e.ToTable("asf_department").HasComment("部门表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();
                
                e.Property(x => x.Pid).HasColumnName("pid").HasDefaultValueSql("0").HasComment("父id");
                
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");
                
                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(255)")
                    .IsRequired()
                    .HasComment("部门名称");
                
                e.Property(x => x.Enabled)
                    .HasColumnName("enabled")
                    
                    .HasDefaultValueSql("1")
                    .HasComment("是否启用");
                
                e.Property(x => x.Sort)
                    .HasColumnName("sort")
                    .HasColumnType("int")
                    .HasDefaultValueSql("0")
                    .HasComment("排序");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });
            // 岗位表
            modelBuilder.Entity<Post>(e =>
            {
                e.ToTable("asf_post").HasComment("岗位表");
                
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();
                
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");

                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(255)")
                    .IsRequired()
                    .HasComment("岗位名称名称");
                
                e.Property(x => x.Enabled)
                    .HasColumnName("enabled")
                    
                    .HasDefaultValueSql("1")
                    .HasComment("是否启用, 0 禁用 1 启用");
                
                e.Property(x => x.Sort)
                    .HasColumnType("int")
                    .HasColumnName("sort")
                    .HasDefaultValueSql("0")
                    .HasComment("排序");
                    
                e.Property(x => x.CreateId)
                    .HasColumnName("create_id")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("创建者id");
                
                e.Property(x => x.Description)
                    .HasColumnName("description")
                    .HasColumnType("varchar(255)")
                    .HasComment("岗位名称名称");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                
            });
            
            // 多租户表
            modelBuilder.Entity<Tenancy>(e =>
            {
                e.ToTable("asf_tenancy").HasComment("多租户");
                
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();
                
                
                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(255)")
                    .IsRequired()
                    .HasComment("租户名称");
                
                e.Property(x => x.Level)
                    .HasColumnType("int")
                    .HasColumnName("level")
                    .HasDefaultValueSql("0")
                    .HasComment("等级");
                
                e.Property(x => x.Sort)
                    .HasColumnType("int")
                    .HasColumnName("sort")
                    .HasDefaultValueSql("0")
                    .HasComment("排序");
                
                e.Property(x => x.Status)
                    
                    .HasColumnName("status")
                    .HasDefaultValueSql("1")
                    .HasComment("租户状态 0禁用， 1启用");
                
                
                e.Property(x => x.IsDeleted)
                    
                    .HasColumnName("is_deleted")
                    .HasDefaultValueSql("0")
                    .HasComment("是否删除, 0 否, 1是");
                
                e.Property(x => x.CreateId)
                    .HasColumnName("create_id")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("创建者id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

            });
            
            // 账户角色中间表
            modelBuilder.Entity<AccountRole>(e =>
            {
                e.ToTable("asf_account_role").HasComment("账户角色中间表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();

                e.Property(x => x.AccountId)
                    
                    .HasColumnName("account_id")
                    .HasComment("账户id");

                e.Property(x => x.RoleId)
                    
                    .HasColumnName("role_id")
                    .HasComment("角色id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.HasOne(d => d.Role)
                    .WithMany("AccountRole")
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("account_role_id_foreign");

                e.HasOne(d => d.Account)
                    .WithMany("AccountRole")
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("account_account_id_foreign");
            });
            
            // 账户岗位中间表
            modelBuilder.Entity<AccountPost>(e =>
            {
                e.ToTable("asf_account_post").HasComment("账户岗位中间表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();

                e.Property(x => x.AccountId)
                    
                    .HasColumnName("account_id")
                    .HasComment("账户id");

                e.Property(x => x.PostId)
                    
                    .HasColumnName("post_id")
                    .HasComment("岗位id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.HasOne(d => d.Post)
                    .WithMany("AccountPost")
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("post_id_foreign");

                e.HasOne(d => d.Account)
                    .WithMany("AccountPost")
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("account_id_foreign");
            });

            // 角色权限中间表
            modelBuilder.Entity<PermissionRole>(e =>
            {
                e.ToTable("asf_role_permission").HasComment("角色权限中间表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();
                
                e.Property(x => x.PermissionId)
                    
                    .HasColumnName("permission_id")
                    .HasComment("权限id");

                e.Property(x => x.RoleId)
                    
                    .HasColumnName("role_id")
                    .HasComment("角色id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.HasOne(d => d.Role)
                    .WithMany("PermissionRole")
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("permission_role_id_foreign");

                e.HasOne(d => d.Permission)
                    .WithMany("PermissionRole")
                    .HasForeignKey(d => d.PermissionId)
                    .HasConstraintName("permission_permission_id_foreign");
                
            });
            
            // 角色部门中间表
            modelBuilder.Entity<DepartmentRole>(e =>
            {
                e.ToTable("asf_department_role").HasComment("部门-角色中间表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();
                
                e.Property(x => x.RoleId)
                    
                    .HasColumnName("role_id")
                    .HasComment("角色id");

                e.Property(x => x.DepartmentId)
                    
                    .HasColumnName("department_id")
                    .HasComment("部门id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                
                e.HasOne(d => d.Role)
                    .WithMany("DepartmentRole")
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("dept_role_id_foreign");

                e.HasOne(d => d.Department)
                    .WithMany("DepartmentRole")
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("dept_department_id_foreign");
                
            });
            // 菜单表
            modelBuilder.Entity<PermissionMenu>(e =>
            {
                e.ToTable("asf_permission_menu").HasComment("菜单表");
                e.HasKey(x => x.Id);
                e.Property(x => x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                // 标题索引
                e.HasIndex(x => x.Title).IsUnique();
                // 菜单地址索引
                e.HasIndex(x => x.MenuUrl).IsUnique();
                
                e.Property(x => x.Title)
                    .HasColumnName("title")
                    .HasColumnType("varchar(20)")
                    .HasComment("菜单标题");
                
                e.Property(x => x.Subtitle)
                    .HasColumnName("subtitle")
                    .HasColumnType("varchar(100)")
                    .HasComment("菜单副标题");
                
                e.Property(x => x.Icon)
                    .HasColumnName("icon")
                    .HasColumnType("varchar(250)")
                    .HasComment("菜单图标");
                
                e.Property(x => x.MenuHidden)
                    .HasColumnName("menu_hidden")
                    
                    .HasDefaultValueSql("0")
                    .HasComment("是否隐藏, 0 否 1 是");
                
                e.Property(x => x.MenuUrl)
                    .HasColumnName("menu_url")
                    .HasColumnType("varchar(250)")
                    .HasComment("菜单地址");
                
                e.Property(x => x.ExternalLink)
                    .HasColumnName("external_link")
                    .HasColumnType("varchar(250)")
                    .HasComment("外部链接地址");
                
                e.Property(x => x.MenuRedirect)
                    .HasColumnName("menu_redirect")
                    .HasColumnType("varchar(250)")
                    .HasComment("菜单重定向地址");
                
                e.Property(x => x.Description)
                    .HasColumnName("description")
                    .HasColumnType("varchar(500)")
                    .HasComment("菜单备注");
                
                
                e.Property(x => x.Translate)
                    .HasColumnName("translate")
                    .HasColumnType("varchar(500)")
                    .HasComment("菜单多语言");
                
                e.Property(x => x.PermissionId)
                    
                    .HasColumnName("permission_id")
                    .HasComment("权限id");
                
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
                // 一个权限关联一个菜单
                e.HasOne(l => l.Permissions).WithOne(w => w.PermissionMenus)
                    .HasForeignKey<PermissionMenu>(f => f.PermissionId);
            });

            modelBuilder.Entity<Translate>(e =>
            {
                e.ToTable("asf_translate").HasComment("多语言表");
                e.HasKey(x => x.Id);
                
                e.Property(x=> x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                //名称索引
                e.HasIndex(x => x.Name).IsUnique();
                
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");
                e.Property(x => x.Name)
                    .HasColumnName("name")
                    .HasColumnType("varchar(250)")
                    .HasComment("多语言名称");
                
                e.Property(x => x.Key)
                    .HasColumnName("key")
                    .HasColumnType("varchar(500)")
                    .HasComment("多语言key");
                
                e.Property(x => x.Value)
                    .HasColumnName("value")
                    .HasColumnType("varchar(500)")
                    .HasComment("多语言值");
            });
            modelBuilder.Entity<AsfDictionary>(e =>
            {
                e.ToTable("asf_dictionary").HasComment("字典表");
                e.HasKey(x => x.Id);
                //字典 key 索引
                e.HasIndex(x => x.Key).IsUnique();
                
                e.Property(x=> x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                e.Property(x => x.TenancyId).HasColumnName("tenancy_id").HasComment("租户id");
                e.Property(x => x.Code).HasColumnName("code").HasColumnType("varchar(255)").HasComment("字典编码");
                e.Property(x => x.Key).HasColumnName("key").HasColumnType("varchar(255)").HasComment("字典键");
                e.Property(x => x.Options).HasColumnName("options").HasColumnType("varchar(255)").HasComment("字典额外配置");
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

            });
            // 富文本内容
            modelBuilder.Entity<Editor>(e =>
            {
                e.ToTable("asf_editor").HasComment("富文本内容");
                e.HasKey(x => x.Id);
                
                e.Property(x=> x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                
                e.Property(x => x.Name).HasColumnName("name").HasComment("名称");
                e.Property(x => x.Path).HasColumnName("path").HasComment("生成html路径");
                e.Property(x => x.Banner).HasColumnName("banner").HasComment("轮播图");
                e.Property(x => x.Type).HasColumnName("type").HasComment("类型");
                e.Property(x => x.OldContent).HasColumnName("old_content").HasComment("旧网页");
                e.Property(x => x.NewContent).HasColumnName("new_content").HasComment("新网页");
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });
            // 联系方式
            modelBuilder.Entity<Concat>(e =>
            {
                e.ToTable("asf_concat").HasComment("富文本内容");
                e.HasKey(x => x.Id);
                
                e.Property(x=> x.Id).HasColumnName("id").ValueGeneratedOnAdd();
                e.Property(x => x.TelPhone).HasColumnName("tel_phone").HasComment("手机号码");
                e.Property(x => x.Name).HasColumnName("name").HasComment("姓名");
                e.Property(x => x.Area).HasColumnName("area").HasComment("面积");
                e.Property(x => x.Content).HasColumnName("content").HasComment("内容");
                e.Property(x => x.CreateTime)
                    .HasColumnName("create_time")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });
            base.OnModelCreating(modelBuilder);
        }

        // 多租户
        public virtual DbSet<Tenancy> Tenancy { get; set; }
        //账户
        public virtual DbSet<Account> Account { get; set; }
        // 登入日志
        public virtual DbSet<LogInfo> LogInfo { get; set; }
        // 权限
        public virtual DbSet<Permission> Permission { get; set; }
        // api权限
        public virtual DbSet<Api> Api { get; set; }
        // 角色
        public virtual DbSet<Role> Role { get; set; }
        //调度任务
        public virtual DbSet<ScheduledTasks> ScheduledTask{ get; set;}
        // 部门
        public virtual DbSet<Department> Department { get; set; }
        // 岗位
        public virtual DbSet<Post> Post { get; set; }
        //账户角色中间表
        public virtual DbSet<AccountRole> AccountRole { get; set; }
        // 账户岗位中间表
        public virtual DbSet<AccountPost> AccountPost { get; set; }
        // 角色权限中间表
        public virtual DbSet<PermissionRole> PermissionRole { get; set; }
        // 部门-角色中间表
        public virtual DbSet<DepartmentRole> DepartmentRole { get; set; }
        // 菜单表
        public virtual DbSet<PermissionMenu> PermissionMenu { get; set; }
        // 多语言表
        public virtual DbSet<Translate> Translate { get; set; }
        //字典表
        public virtual DbSet<AsfDictionary> AsfDictionary { get; set; }
        //富文本
        public virtual DbSet<Editor> Editors { get; set; }

    }
}
