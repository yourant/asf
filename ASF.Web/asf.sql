-- 插入租户
INSERT INTO `asf_tenancy` (`name`,`create_id`) VALUES('总部集团',1);
INSERT INTO `asf_tenancy` (`name`,`create_id`) VALUES('公司a',1);
-- 插入(控制面板)权限数据
INSERT INTO `asf_permission` (`code`,`name`,`type`,`is_system`) VALUES ('asf','控制面板权限',1,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_account',1,'账户管理权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_permission',1,'权限管理权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_menu',1,'菜单管理权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_authapi',1,'授权api管理权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_role',1,'角色管理权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_audio',1,'审计管理权限',1,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_audio_error',7,'错误日志权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_audio_log',7,'操作日志权限',2,1);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_scheduled_task',1,'调度任务权限',2,0);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_tenancy',1,'租户管理权限',2,0);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_department',1,'部门管理权限',2,0);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_post',1,'岗位管理权限',2,0);
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_translate',1,'多语言管理权限',2,0);

--  插入公共权限
INSERT INTO `asf_permission` (`code`,`parent_id`,`name`,`type`,`is_system`) VALUES ('asf_openapi',1,'公共权限',3,1);
-- 插入权限菜单数据
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`description`) VALUES ('控制面板','控制面板菜单',1,'anticon-table','控制面板菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('账户管理','账户管理',2,'anticon-user','/control/account','账户管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('权限管理','权限管理',3,'anticon-unlock','/control/permission','权限管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('菜单管理','菜单管理',4,'anticon-unordered-list','/control/menu','菜单管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('授权api管理','api管理',5,'anticon-compass','/control/api','授权api菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('角色管理','角色管理',6,'anticon-team','/control/role','角色管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`description`) VALUES ('审计管理','审计管理',7,'anticon-exception','审计管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('错误日志','错误日志',8,'anticon-field-number','/control/audio-error','错误日志菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('操作日志','操作日志',9,'anticon-field-string','/control/audio-oper','操作日志菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('调度任务','调度任务',10,'anticon-field-time','/control/scheduled_task','调度任务菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('租户管理','租户管理',11,'anticon-user-switch','/control/tenancy','租户管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('部门管理','部门管理',12,'anticon-hdd','/control/department','部门管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('岗位管理','岗位管理',13,'anticon-radar-chart','/control/post','岗位管理菜单');
INSERT INTO `asf_permission_menu` (`title`,`subtitle`,`permission_id`,`icon`,`menu_url`,`description`) VALUES ('多语言管理','多语言管理',14,'anticon-translate','/control/translate','多语言管理菜单');
-- 插入api 权限数据
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (2, '获取账户列表',2,'/api/asf/account/getlist','get',1,'获取账户信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '添加账户',2,'/api/asf/account/create','post',1,'添加账户信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户',2,'/api/asf/account/modify','post,put',1,'修改账户信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (2, '获取账户详情',2,'/api/asf/account/details','get',1,'获取账户信息详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '删除账户',2,'/api/asf/account/delete/[0-9]{1,12}','post,delete',1,'删除账户信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户状态',2,'/api/asf/account/modifystatus','post,put',1,'修改账户状态权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户密码',2,'/api/asf/account/resetpassword','post,put',1,'修改账户密码权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户邮箱',2,'/api/asf/account/modifyemail','post,put',1,'修改账户邮箱权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户邮箱',2,'/api/asf/account/modifytelphone','post,put',1,'修改账户手机权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '修改账户头像',2,'/api/asf/account/modifyavatar','post,put',1,'修改账户头像权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '账户分配角色',2,'/api/asf/account/assignrole','post,put',1,'账户分配角色权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '账户分配部门',2,'/api/asf/account/assigndepartment','post,put',1,'账户分配部门权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (2, '账户分配岗位',2,'/api/asf/account/assignpost','post,put',1,'账户分配岗位权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (3, '获取权限列表',2,'/api/asf/permission/getlist','get',1,'获取权限信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (3, '添加权限',2,'/api/asf/permission/create','post',1,'添加权限信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (3, '修改权限',2,'/api/asf/permission/modify','post,put',1,'修改权限信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (3, '获取权限详情',2,'/api/asf/permission/details','get',1,'获取权限详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (3, '删除权限',2,'/api/asf/permission/delete/[0-9]{1,12}','post,delete',1,'删除权限信息权限',1);



INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (4, '获取菜单列表',2,'/api/asf/menu/getlist','get',1,'获取菜单信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (4, '添加菜单',2,'/api/asf/menu/create','post',1,'添加菜单信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (4, '修改菜单',2,'/api/asf/menu/modify','post,put',1,'修改菜单信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (4, '获取菜单详情',2,'/api/asf/menu/details','get',1,'获取菜单详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (4, '删除菜单',2,'/api/asf/menu/delete/[0-9]{1,12}','post,delete',1,'删除菜单信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (4, '修改菜单是否隐藏',2,'/api/asf/menu/modifyhidden','post,put',1,'修改菜单隐藏权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (5, '获取api列表',2,'/api/asf/api/getlist','get',1,'获取api信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (5, '添加api',2,'/api/asf/api/create','post',1,'添加api信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (5, '修改api',2,'/api/asf/api/modify','post,put',1,'修改api信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (5, '获取api详情',2,'/api/asf/api/details','get',1,'获取api详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (5, '删除api',2,'/api/asf/api/delete/[0-9]{1,12}','post,delete',1,'删除api信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (5, '删除api',2,'/api/asf/api/batchdelete','post,delete',1,'批量删除api信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (5, '是否禁用api',2,'/api/asf/api/modifystatus','post,put',1,'是否禁用api',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (6, '获取角色列表',2,'/api/asf/role/getlist','get',1,'获取角色信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (6, '添加角色',2,'/api/asf/role/create','post',1,'添加角色信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (6, '修改角色',2,'/api/asf/role/modify','post,put',1,'修改角色信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (6, '获取角色详情',2,'/api/asf/role/details','get',1,'获取角色详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (6, '删除角色',2,'/api/asf/role/delete/[0-9]{1,12}','post,delete',1,'删除角色信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (6, '是否禁用角色',2,'/api/asf/role/modifystatus','post,put',1,'是否禁用角色',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (6, '角色分配权限',2,'/api/asf/role/assignpermission','post,put',1,'角色分配权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (8, '获取错误日志列表',2,'/api/asf/audio/geterrorlist','get',1,'获取错误日志信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (8, '获取错误日志详情',2,'/api/asf/audio/errordetails','get',1,'获取错误日志详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (8, '删除错误日志',2,'/api/asf/audio/deleteerror/[0-9]{1,12}','post,delete',1,'删除错误日志信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (9, '获取操作日志列表',2,'/api/asf/audio/getloglist','get',1,'获取操作日志信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (9, '获取操作日志详情',2,'/api/asf/audio/detailslog','get',1,'获取操作日志详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (9, '删除操作日志',2,'/api/asf/audio/deletelog/[0-9]{1,12}','post,delete',1,'删除操作日志信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (10, '获取调度任务列表',2,'/api/asf/task/getlist','get',1,'获取调度任务信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (10, '添加调度任务',2,'/api/asf/task/create','post',1,'添加调度任务信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (10, '修改调度任务',2,'/api/asf/task/modify','post,put',1,'修改调度任务信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (10, '获取调度任务详情',2,'/api/asf/task/details','get',1,'获取调度任务详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (10, '删除调度任务',2,'/api/asf/task/delete/[0-9]{1,12}','post,delete',1,'删除调度任务信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (11, '获取租户分页列表',2,'/api/asf/tenancy/getlist','get',1,'获取租户信息分页列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (11, '添加租户',2,'/api/asf/tenancy/create','post',1,'添加租户信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (11, '修改租户',2,'/api/asf/tenancy/modify','post,put',1,'修改租户信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (11, '获取租户详情',2,'/api/asf/tenancy/details','get',1,'获取租户详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (11, '删除租户',2,'/api/asf/tenancy/delete','post,put',1,'删除租户信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (12, '获取部门分页列表',2,'/api/asf/department/getlist','get',1,'获取部门信息分页列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (12, '获取部门列表',2,'/api/asf/department/getlists','get',1,'获取部门信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (12, '添加部门',2,'/api/asf/department/create','post',1,'添加部门信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (12, '修改部门',2,'/api/asf/department/modify','post,put',1,'修改部门信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (12, '获取部门详情',2,'/api/asf/department/details','get',1,'获取部门详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (12, '分配部门角色',2,'/api/asf/department/assign','post,put',1,'分配部门角色',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (13, '获取岗位分页列表',2,'/api/asf/post/getlist','get',1,'获取岗位信息分页列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (13, '获取岗位列表',2,'/api/asf/post/getlists','get',1,'获取岗位信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (13, '添加岗位',2,'/api/asf/post/create','post',1,'添加岗位信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (13, '修改岗位',2,'/api/asf/post/modify','post,put',1,'修改岗位信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (13, '获取岗位详情',2,'/api/asf/post/details','get',1,'获取岗位详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (13, '删除岗位',2,'/api/asf/post/delete/[0-9]{1,12}','post,delete',1,'删除岗位信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (14, '获取多语言分页列表',2,'/api/asf/translate/getlist','get',1,'获取多语言信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (14, '获取多语言所有列表',2,'/api/asf/translate/getlists','get',1,'获取多语言信息列表权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (14, '添加多语言',2,'/api/asf/translate/create','post',1,'添加多语言信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (14, '修改多语言',2,'/api/asf/translate/modify','post,put',1,'修改多语言信息权限',1);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`) VALUES (14, '获取多语言详情',2,'/api/asf/translate/details','get',1,'获取多语言详情权限');
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (14, '删除多语言',2,'/api/asf/translate/delete/[0-9]{1,12}','post,delete',1,'删除多语言信息权限',1);

INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (15, '登录',1,'/api/asf/authorise/login','post',1,'登录账户权限',0);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (15, '登出',1,'/api/asf/authorise/logout','post',1,'登出账户权限',0);
INSERT INTO `asf_apis` (`permission_id`, `name`,`type`,`path`,`http_methods`,`is_system`,`description`,`is_logger`) VALUES (15, '获取登录账户信息',1,'/api/asf/account/accountinfo','get',1,'登出账户权限',0);
-- 插入角色数据
INSERT INTO `asf_role` (`tenancy_id`,`name`,`description`,`create_id`) VALUES (1, 'superadmin', '总超级管理员拥有下属租户所有权限',1);
INSERT INTO `asf_role` (`tenancy_id`,`name`,`description`,`create_id`) VALUES (1, 'admin', '普通管理员，拥有部分权限',1);
INSERT INTO `asf_role` (`tenancy_id`,`name`,`description`,`create_id`) VALUES (1, 'user', '总部 普通员工, 拥有普通权限',1);

-- 分配角色权限
-- 总系统超级管理员
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,1);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,2);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,3);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,4);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,5);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,6);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,7);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,8);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,9);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,10);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,11);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,12);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,13);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,14);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (1,15);
--  下属租户运维部权限
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,1);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,2);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,6);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,7);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,8);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,9);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,10);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,12);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,13);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,14);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (2,15);
-- 下属租户普通员工
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (3,1);
INSERT INTO `asf_role_permission` (`role_id`,`permission_id`) VALUES (3,15);
-- 插入部门数据
INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(1,'开发部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'.net 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'java 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'app 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'php 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'前端 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'ui 组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(1,1,'运维 组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(1,'人事部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(9,1,'人事一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(9,1,'人事二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(9,1,'人事三组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(1,'财务部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(13,1,'财务一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(13,1,'财务二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(13,1,'财务三组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(1,'运营部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(17,1,'运营一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(17,1,'运营二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(17,1,'运营三组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(2,'人事部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(21,2,'人事一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(21,2,'人事二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(21,2,'人事三组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(2,'财务部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(25,2,'财务一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(25,2,'财务二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(25,2,'财务三组');

INSERT INTO `asf_department` (`tenancy_id`,`name`) VALUES(2,'运营部');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(29,2,'运营一组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(29,2,'运营二组');
INSERT INTO `asf_department` (`pid`,`tenancy_id`,`name`) VALUES(29,2,'运营三组');
-- 插入岗位数据
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, 'java 开发');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '运维');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '.net 开发');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, 'android 开发');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '前端 开发');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, 'ios 开发');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '员工');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '组长');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '经理');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (1, '主管');

INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (2, '员工');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (2, '组长');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (2, '经理');
INSERT INTO `asf_post` (`tenancy_id`, `name`) VALUES (2, '主管');

-- 插入用户数据
INSERT INTO `asf_accounts` (`tenancy_id`,`department_id`,`name`,`username`,`password`,`password_salt`,`telphone`,`email`,`avatar`,`sex`) VALUES (1, 2, 'keep_wan', 'admin', '20V6MgmX8XVtiRz10AI4Ib5H16a9JyrNmSwmgJ2k0iI=', '8283e4c3-f87e-4d85-85fb-f5c0de063992', '86+13800000000', 'admin@qq.com', '/avatar.jpg', 1);
-- 分配账户角色
-- INSERT INTO `asf_account_role` (`account_id`,`role_id`) VALUES (1,1);
--  分配角色到部门
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (2,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (3,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (4,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (5,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (6,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (7,1);
INSERT INTO `asf_department_role` (`department_id`,`role_id`) VALUES (8,2);
--  分配账户岗位
INSERT INTO `asf_account_post` (`account_id`,`post_id`) VALUES (1,3);
INSERT INTO `asf_account_post` (`account_id`,`post_id`) VALUES (1,7);
