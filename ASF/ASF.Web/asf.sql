-- 插入租户
INSERT INTO asf_tenancy (name,create_id) VALUES('总部集团',1);
INSERT INTO asf_tenancy (name,create_id) VALUES('公司A',1);
-- 插入(控制面板)权限数据
INSERT INTO asf_permission (code,name,type,is_system) VALUES ('asf_dash','控制台',2,1);
INSERT INTO asf_permission (code,name,type,is_system) VALUES ('asf','控制面板权限',1,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_account',2,'账户管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_permission',2,'权限管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_menu',2,'菜单管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_authapi',2,'授权api管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_role',2,'角色管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_audio',2,'审计管理权限',1,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_audio_log',8,'日志权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_scheduled_task',2,'调度任务权限',2,0);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_tenancy',2,'租户管理权限',2,0);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_department',2,'部门管理权限',2,0);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_post',2,'岗位管理权限',2,0);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_translate',2,'多语言管理权限',2,0);

--  插入公共权限
INSERT INTO asf_permission (code,name,type,is_system) VALUES ('asf_openapi','公共权限',3,1);
-- 插入权限菜单数据
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('控制台','控制台菜单',1,'icon-dash_board','/','控制台菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('控制面板','控制面板菜单',2,'icon-dash_board','/control','控制面板菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('账户管理','账户管理',3,'icon--proxyaccount','/control/account','账户管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('权限管理','权限管理',4,'icon-icon-authority','/control/permission','权限管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('菜单管理','菜单管理',5,'icon-caidan','/control/menu','菜单管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('授权api管理','api管理',6,'icon-api','/control/api','授权api菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('角色管理','角色管理',7,'icon-role','/control/role','角色管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('审计管理','审计管理',8,'icon-audio','/audio','审计管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('日志管理','日志管理',9,'icon-errorcorrection_default','/control/audio/getlog','日志管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('调度任务','调度任务',10,'icon-schedule_date','/control/scheduled_task','调度任务菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('租户管理','租户管理',11,'icon-tenancy','/control/tenancy','租户管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('部门管理','部门管理',12,'icon-bumen','/control/department','部门管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('岗位管理','岗位管理',13,'icon-gangwei','/control/post','岗位管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('多语言管理','多语言管理',14,'icon-EA','/control/translate','多语言管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('tiny富文本','tiny富文本',15,'icon-EA','/editor/getlist','富文本编辑器');
-- 插入api 权限数据
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (1, '获取控制台信息权限',2,'/api/asf/dash/getdetails','get',1,'获取控制台信息权限');

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (3, '获取账户列表',2,'/api/asf/account/getlist','get',1,'获取账户信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '添加账户',2,'/api/asf/account/create','post',1,'添加账户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户',2,'/api/asf/account/modify','post,put',1,'修改账户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (3, '获取账户详情',2,'/api/asf/account/details','get',1,'获取账户信息详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '删除账户',2,'/api/asf/account/delete/[0-9]{1,12}','post,delete',1,'删除账户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户状态',2,'/api/asf/account/modifystatus','post,put',1,'修改账户状态权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户密码',2,'/api/asf/account/resetpassword','post,put',1,'修改账户密码权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户邮箱',2,'/api/asf/account/modifyemail','post,put',1,'修改账户邮箱权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户邮箱',2,'/api/asf/account/modifytelphone','post,put',1,'修改账户手机权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '修改账户头像',2,'/api/asf/account/modifyavatar','post,put',1,'修改账户头像权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '账户分配角色',2,'/api/asf/account/assignrole','post,put',1,'账户分配角色权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '账户分配部门',2,'/api/asf/account/assigndepartment','post,put',1,'账户分配部门权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (3, '账户分配岗位',2,'/api/asf/account/assignpost','post,put',1,'账户分配岗位权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (4, '获取权限列表',2,'/api/asf/permission/getlist','get',1,'获取权限信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (4, '添加权限',2,'/api/asf/permission/create','post',1,'添加权限信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (4, '修改权限',2,'/api/asf/permission/modify','post,put',1,'修改权限信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (4, '获取权限详情',2,'/api/asf/permission/details','get',1,'获取权限详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (4, '删除权限',2,'/api/asf/permission/delete/[0-9]{1,12}','post,delete',1,'删除权限信息权限',1);



INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (5, '获取菜单列表',2,'/api/asf/menu/getlist','get',1,'获取菜单信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (5, '添加菜单',2,'/api/asf/menu/create','post',1,'添加菜单信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (5, '修改菜单',2,'/api/asf/menu/modify','post,put',1,'修改菜单信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (5, '获取菜单详情',2,'/api/asf/menu/details','get',1,'获取菜单详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (5, '删除菜单',2,'/api/asf/menu/delete/[0-9]{1,12}','post,delete',1,'删除菜单信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (5, '修改菜单是否隐藏',2,'/api/asf/menu/modifyhidden','post,put',1,'修改菜单隐藏权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (6, '获取api列表',2,'/api/asf/api/getlist','get',1,'获取api信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (6, '添加api',2,'/api/asf/api/create','post',1,'添加api信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (6, '修改api',2,'/api/asf/api/modify','post,put',1,'修改api信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (6, '获取api详情',2,'/api/asf/api/details','get',1,'获取api详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (6, '删除api',2,'/api/asf/api/delete/[0-9]{1,12}','post,delete',1,'删除api信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (6, '删除api',2,'/api/asf/api/batchdelete','post,delete',1,'批量删除api信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (6, '是否禁用api',2,'/api/asf/api/modifystatus','post,put',1,'是否禁用api',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (7, '获取角色列表',2,'/api/asf/role/getlist','get',1,'获取角色信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (7, '添加角色',2,'/api/asf/role/create','post',1,'添加角色信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (7, '修改角色',2,'/api/asf/role/modify','post,put',1,'修改角色信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (7, '获取角色详情',2,'/api/asf/role/details','get',1,'获取角色详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (7, '删除角色',2,'/api/asf/role/delete/[0-9]{1,12}','post,delete',1,'删除角色信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (7, '是否禁用角色',2,'/api/asf/role/modifystatus','post,put',1,'是否禁用角色',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (7, '角色分配权限',2,'/api/asf/role/assignpermission','post,put',1,'角色分配权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (9, '获取日志列表',2,'/api/asf/audio/getloglist','get',1,'获取日志信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (9, '删除日志',2,'/api/asf/audio/deletelog/[0-9]{1,12}','post,delete',1,'删除日志信息权限',1);


INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (10, '获取调度任务列表',2,'/api/asf/task/getlist','get',1,'获取调度任务信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (10, '添加调度任务',2,'/api/asf/task/create','post',1,'添加调度任务信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (10, '修改调度任务',2,'/api/asf/task/modify','post,put',1,'修改调度任务信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (10, '获取调度任务详情',2,'/api/asf/task/details','get',1,'获取调度任务详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (10, '删除调度任务',2,'/api/asf/task/delete/[0-9]{1,12}','post,delete',1,'删除调度任务信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (11, '获取租户分页列表',2,'/api/asf/tenancy/getlist','get',1,'获取租户信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '添加租户',2,'/api/asf/tenancy/create','post',1,'添加租户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '修改租户',2,'/api/asf/tenancy/modify','post,put',1,'修改租户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (11, '获取租户详情',2,'/api/asf/tenancy/details','get',1,'获取租户详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '删除租户',2,'/api/asf/tenancy/delete','post,put',1,'删除租户信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (12, '获取部门分页列表',2,'/api/asf/department/getlist','get',1,'获取部门信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (12, '获取部门列表',2,'/api/asf/department/getlists','get',1,'获取部门信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '添加部门',2,'/api/asf/department/create','post',1,'添加部门信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '修改部门',2,'/api/asf/department/modify','post,put',1,'修改部门信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (12, '获取部门详情',2,'/api/asf/department/details','get',1,'获取部门详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '分配部门角色',2,'/api/asf/department/assign','post,put',1,'分配部门角色',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取岗位分页列表',2,'/api/asf/post/getlist','get',1,'获取岗位信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取岗位列表',2,'/api/asf/post/getlists','get',1,'获取岗位信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '添加岗位',2,'/api/asf/post/create','post',1,'添加岗位信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '修改岗位',2,'/api/asf/post/modify','post,put',1,'修改岗位信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取岗位详情',2,'/api/asf/post/details','get',1,'获取岗位详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '删除岗位',2,'/api/asf/post/delete/[0-9]{1,12}','post,delete',1,'删除岗位信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取多语言分页列表',2,'/api/asf/translate/getlist','get',1,'获取多语言信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取多语言所有列表',2,'/api/asf/translate/getlists','get',1,'获取多语言信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '添加多语言',2,'/api/asf/translate/create','post',1,'添加多语言信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '修改多语言',2,'/api/asf/translate/modify','post,put',1,'修改多语言信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取多语言详情',2,'/api/asf/translate/details','get',1,'获取多语言详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '删除多语言',2,'/api/asf/translate/delete/[0-9]{1,12}','post,delete',1,'删除多语言信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '登录',1,'/api/asf/authorise/login','post',1,'登录账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '登出',1,'/api/asf/authorise/logout','post',1,'登出账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '获取登录账户信息',1,'/api/asf/account/accountinfo','get',1,'登出账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '获取租户列表集合',1,'/api/asf/tenancy/getlists','get',1,'获取租户列表集合',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '获取富文本分页列表',1,'/api/asf/editor/getlist','get',1,'获取富文本分页',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '获取富文本目录',1,'/api/asf/editor/getlists','get',1,'获取富文本目录',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '添加富文本内容',1,'/api/asf/editor/create','post',1,'添加富文本内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '修改富文本内容',1,'/api/asf/editor/modify','put',1,'修改富文本内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '获取富文本内容',1,'/api/asf/editor/geteditor','get',1,'获取富文本内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '提交咨询内容',1,'/api/asf/editor/concat','get',1,'提交咨询内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '咨询内容列表',1,'/api/asf/editor/getConcatList','get',1,'咨询内容列表',0);
-- 插入角色数据
INSERT INTO asf_role (tenancy_id,name,description,create_id) VALUES (1, 'superadmin', '总超级管理员拥有下属租户所有权限',1);
INSERT INTO asf_role (tenancy_id,name,description,create_id) VALUES (1, 'admin', '普通管理员，拥有部分权限',1);
INSERT INTO asf_role (tenancy_id,name,description,create_id) VALUES (1, 'user', '总部 普通员工, 拥有普通权限',1);

-- 分配角色权限
-- 总系统超级管理员
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,2);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,3);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,4);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,5);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,6);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,7);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,8);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,9);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,10);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,11);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,12);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,13);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,14);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,15);
--  下属租户运维部权限
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,2);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,6);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,7);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,8);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,9);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,10);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,11);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,12);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,13);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,14);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,15);
-- 下属租户普通员工
-- INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,15);
-- 插入部门数据
INSERT INTO asf_department (tenancy_id,name) VALUES(1,'开发部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'.net 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'java 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'app 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'php 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'前端 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'ui 组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(1,1,'运维 组');

INSERT INTO asf_department (tenancy_id,name) VALUES(1,'人事部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(9,1,'人事一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(9,1,'人事二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(9,1,'人事三组');

INSERT INTO asf_department (tenancy_id,name) VALUES(1,'财务部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(13,1,'财务一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(13,1,'财务二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(13,1,'财务三组');

INSERT INTO asf_department (tenancy_id,name) VALUES(1,'运营部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(17,1,'运营一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(17,1,'运营二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(17,1,'运营三组');

INSERT INTO asf_department (tenancy_id,name) VALUES(2,'人事部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(21,2,'人事一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(21,2,'人事二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(21,2,'人事三组');

INSERT INTO asf_department (tenancy_id,name) VALUES(2,'财务部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(25,2,'财务一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(25,2,'财务二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(25,2,'财务三组');

INSERT INTO asf_department (tenancy_id,name) VALUES(2,'运营部');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(29,2,'运营一组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(29,2,'运营二组');
INSERT INTO asf_department (pid,tenancy_id,name) VALUES(29,2,'运营三组');
-- 插入岗位数据
INSERT INTO asf_post (tenancy_id, name) VALUES (1, 'java 开发');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '运维');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '.net 开发');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, 'android 开发');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '前端 开发');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, 'ios 开发');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '员工');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '组长');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '经理');
INSERT INTO asf_post (tenancy_id, name) VALUES (1, '主管');

INSERT INTO asf_post (tenancy_id, name) VALUES (2, '员工');
INSERT INTO asf_post (tenancy_id, name) VALUES (2, '组长');
INSERT INTO asf_post (tenancy_id, name) VALUES (2, '经理');
INSERT INTO asf_post (tenancy_id, name) VALUES (2, '主管');

-- 插入用户数据
INSERT INTO asf_accounts (tenancy_id,department_id,name,username,password,password_salt,telphone,email,avatar,sex) VALUES (1, 2, 'keep_wan', 'admin', '20V6MgmX8XVtiRz10AI4Ib5H16a9JyrNmSwmgJ2k0iI=', '8283e4c3-f87e-4d85-85fb-f5c0de063992', '86+13800000000', 'admin@qq.com', '/avatar.jpg', 1);
-- 分配账户角色
INSERT INTO asf_account_role (account_id,role_id) VALUES (1,3);
--  分配角色到部门
INSERT INTO asf_department_role (department_id,role_id) VALUES (1,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (2,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (3,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (4,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (5,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (6,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (7,1);
INSERT INTO asf_department_role (department_id,role_id) VALUES (8,2);
INSERT INTO asf_department_role (department_id,role_id) VALUES (9,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (10,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (11,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (12,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (13,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (14,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (15,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (16,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (17,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (18,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (19,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (20,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (21,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (22,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (23,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (24,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (25,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (26,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (27,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (28,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (29,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (30,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (31,3);
INSERT INTO asf_department_role (department_id,role_id) VALUES (32,3);
--  分配账户岗位
INSERT INTO asf_account_post (account_id,post_id) VALUES (1,3);
INSERT INTO asf_account_post (account_id,post_id) VALUES (1,7);
-- 插入默认富文本内容
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司概况', 1, '/var/www/html/441/a/gongsigaikuang/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>关于我们</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="content-boxs">
            <div class="detail">
              <h2>湖南荆首建设工程有限公司</h2>
              <div class="intro">
                湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。
              </div>
              <div class="intro">
                湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司概念', 1, '/var/www/html/441/a/gongsigainian/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概念</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>关于我们</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="content-boxs">
            <div class="detail">
              <div>
                公司秉承坚持质量为先、打造放心工程、提供超预期的服务理念，我们有专业的施工队伍,专业的设备，可处理复杂地基，经验丰富，质量可靠；为了更好地服务我们的客户，根据工地实况我们将制定一对一的工程方案，积极主动为客户提供最优质的服务，保证在工程质量、工程安全、工程效率以及各方面上精益求精。
                公司始终坚持以&ldquo;质量促发展,管理见效益,服务立信誉&rdquo;的方针；本着&ldquo;专业，专心，诚心&rdquo;的原则，逐步发展为一家拥有较强实力的地基处理公司。欢迎广大客户前来洽谈业务,期待与您合作。
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('首页', 1, '/var/www/html/441/index.html', '{"indexBanner":"https://s1.imagehub.cc/images/2021/07/10/_20210710094116b65d7190215c67be.jpg,https://s1.imagehub.cc/images/2021/07/24/_20210724103549f62b639c54f9cdf7.jpg,https://s1.imagehub.cc/images/2021/07/24/_202107182002481e6bf86d8d126fd3.jpg","deviceBanner":"https://s1.imagehub.cc/images/2021/07/24/9aa715dde679c724cb.png,https://s1.imagehub.cc/images/2021/07/24/8a260ed2e490ab2a82.png,https://s1.imagehub.cc/images/2021/07/24/7a2e5f518a3cf28316.png,https://s1.imagehub.cc/images/2021/07/24/5a688b333bb515fb20.png,https://s1.imagehub.cc/images/2021/07/24/4af49b28e9fafcc2fd.png","hezuo":"https://s1.imagehub.cc/images/2021/08/14/e160b30a01a0621279354202eb9259b7e4d86e79fec41b0d.jpg,https://s1.imagehub.cc/images/2021/08/14/d89a0bdb4c68d89cedcbbf659e1eb50d131105252ae0e508.jpg,https://s1.imagehub.cc/images/2021/08/14/903504b386366483ab1efb573cfb5ce3359a26a9c84a0ff1.jpg,https://s1.imagehub.cc/images/2021/08/14/3b2a1456d313a2860448893dffbfd777da795e6f433ed7de.jpg,https://s1.imagehub.cc/images/2021/08/14/e2dea0d2ff7f572b2e8295cd578ad2e4086d2c36863b4e93.jpg,https://s1.imagehub.cc/images/2021/08/14/30f416491371689ae1d58922067ca37ab886be989b802f40.jpg"}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>湖南荆首建设工程有限公司</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="order by ">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/owl.carousel.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/jquery.flexslider-min.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/owl.carousel.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script src="https://www.hnjingshou.com/skin/js//index.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
    <script src="https://www.hnjingshou.com/skin/js/respond.js"></script>
    <![endif]-->

</head>

<body id="index_box_id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  
  <!-- picture begin-->
  <div id="fh5co-hero" class="layout">
    <div class="line">
      <div class="flexslider">
        <ul class="slides">
          <li
            style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
            <!-- <img src="uploads/allimg/180125/1-1P1252200450-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
            <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195136.jpg"
              alt="">
          </li>
          <li
            style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
            <!-- <img src="uploads/allimg/180125/1-1P1252201280-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
            <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195210.jpg"
              alt="">
          </li>
          <li
            style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
            <!-- <img src="uploads/allimg/180125/1-1P1252201070-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
            <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/07/_20210507225115.jpg"
              alt="">
          </li>
        </ul>
      </div>
    </div>
  </div>
  <!--about begin-->
  <div id="fh5co-about-us" class="layout">
    <div class="bg-about">
      <div class="container">
        <div class="inner"><span class="more"><a href="a/gongsigaikuang/index.html">更多&gt;&gt;</a></span>
          <div class="line fh5co-heading text-center hove-bg">
            <h2><span style="color: #4d96df; font-size: 18pt;"><strong>关于我们</strong></span></h2>
            <!-- <p class="desc"><span style="color: #4d96df;font-size: 20px;">湖南荆首建设工程有限公司</span></p> -->
          </div>
          <div class="show-list line">
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="media-img">&nbsp;</div>
              <div class="media-img">&nbsp;</div>
              <div class="media-img">&nbsp;</div>
              <div class="media-img">&nbsp;</div>
              <div class="media-img">&nbsp;</div>
              <div class="media-img"><img
                  src="https://s1.imagehub.cc/images/2021/07/10/_20210710094444ac9870eb22cb0ff6.jpg" width="344"
                  height="260"></div>
            </div>
            <div class="xl12 xs8 xm8 content margin-large-bottom">
              <div class="desc">
                <h2>湖南荆首建设工程有限公司</h2>
                <div class="intro">
                  湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。
                </div>
                <div class="intro">
                  湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--about end-->
  
  <!-- 我们的服务 -->
  <div class="layout footer-top" style="border-bottom: 1px solid #eee;">
    <div class="container">
      <div class="line-big" style="text-align: center;">
        <div class="hove-bg">
          <h2 class="text-center" style="padding: 15px;"><strong style="font-size: 18pt; color: #4d96df;">我们的服务</strong>
          </h2>
          <p class="desc" style="margin-bottom: 25px;"><span style="color: #000000; font-size: 20px;">高效施工：节省时间 快速优化
              改良基础</span></p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom"
            style="height: 801px; width: 1200px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/15/0e2442a7d933c8957c729ff4da1373f082020034877ec1ccf289e57d.jpg">
          <p class="service-image">人工湖强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom"
            style="height: 533px; width: 800px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/19/srchttp___www.njzh56.com_uploads_allimg_190301_113P31X8_0.jpgreferhttp___www.njzh560f526a9809e5dcb3.jpg">
          <p class="service-image">厂房及物流园强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom"
            style="height: 296px; width: 500px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/19/srchttp___upload.ccidnet.com_2017_0614_1497404047163.jpgreferhttp___upload.ccidnet3592de9b48243a29.jpg">
          <p class="service-image">机场强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom"
            style="height: 381px; width: 640px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/19/gs4fa856278707d3cd.jpg">
          <p class="service-image">路基强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom"
            style="height: 603px; width: 1072px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/15/gk0c4e34f23fdc3e93.jpg">
          <p class="service-image">港口强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom"
            style="height: 420px; width: 560px; min-height: 310px; max-height: 310px;"
            src="https://s1.imagehub.cc/images/2021/06/19/gtf2651978b35e792f6.jpg">
          <p class="service-image">高填方强夯</p>
        </div>
      </div>
    </div>
  </div>
  <!-- 为了保障工程质量我们都有哪些 -->
  <div class="layout footer-top" style="border-bottom: 1px solid #eee;">
    <div class="container">
      <div class="hove-bg">
        <h2 class="text-center" style="padding: 15px;"><span style="font-size: 18pt;"><strong><span
                style="color: hsl(210, 70%, 59%);">为了保障工程质量我们都有哪些</span></strong></span></h2>
      </div>
      <div class="line-big">
        <div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
          <div
            style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);">
            <img style="padding-bottom: 20px; width: 70px; height: 70px;"
              src="https://www.hnjingshou.com/skin/images/25yeash.svg">
            <h3 style="font-size: 23px; color: red;"><strong>26年用心做地基处理</strong></h3>
            <p style="font-size: 16px;">26年来荆首覆盖业务全国各城市，主要承接1000-25000kn .m强夯工程</p>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
          <div
            style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);">
            <img style="padding-bottom: 20px; width: 70px; height: 70px;"
              src="https://www.hnjingshou.com/skin/images/zy.svg">
            <h3 style="font-size: 23px; color: red;"><strong>专业团队</strong></h3>
            <p style="font-size: 16px;">自有设备50多台，高中职称技术人员占比50%，工程技术管理人员占比15%业界口碑领先</p>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
          <div
            style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);">
            <img style="padding-bottom: 20px; width: 70px; height: 70px;"
              src="https://www.hnjingshou.com/skin/images/service.svg">
            <h3 style="font-size: 23px; color: red;"><strong>用心服务</strong></h3>
            <p style="font-size: 16px;">荆首每年施工上百万平米，全程可视化操作，好评率高达98%</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--products begin-->
  <div id="fh5co-product-list" class="layout">
    <div class="bg-product">
      <div class="container">
        <div class="line fh5co-heading text-center hove-bg">
          <h2><span style="color: #4d96df; font-size: 18pt;"><strong>资质展示</strong></span></h2>
          <p class="desc"><span style="color: #000000; font-size: 14pt;">卓越，创新，积极进取，持续改进，精益求精</span></p>
        </div>
        <div class="line show-list">
          <div class="owl-carousel owl-carousel-carousel  zizhi">
            <div class="item margin-large-bottom text-cente">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://s1.imagehub.cc/images/2021/05/07/_20210507220034.png"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://s1.imagehub.cc/images/2021/05/07/_20210507220042.png"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://s1.imagehub.cc/images/2021/05/07/_20210507220126.png"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center  click-zoom">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://s1.imagehub.cc/images/2021/05/07/_20210507220222.png"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://s1.imagehub.cc/images/2021/05/07/_20210507215935.png"> </span></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 合作伙伴 -->
  <div id="fh5co-partner-list" class="layout">
    <div class="bg-partner">
      <div class="container">
        <div class="line fh5co-heading text-center">
          <h2>合作伙伴</h2>
        </div>
        <div class="line show-list">
          <div class="owl-carousel partner-carousel-carousel">
            <div class="item margin-large-bottom text-cente">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252303460-L.png"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252305010-L.jpg"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230A10-L.jpg"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center  click-zoom">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230J70-L.jpg"> </span></div>
            </div>
            <div class="item margin-large-bottom text-center">
              <div class="media-img"><span class="zoomimgs"> <img class="click-zoom"
                    src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230Q60-L.jpg"> </span></div>
            </div>
            <!-- <div class="owl-wrapper-outer">
              <div class="owl-wrapper">
                <div class="owl-item" >
                  <div class="item"> <a class="zoomimgs frizoomimgs"
                      style="background-image:url(https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252303460-L.png)" title="网易163"></a>
                  </div>
                </div>
                <div class="owl-item" >
                  <div class="item"> <a class="zoomimgs frizoomimgs"
                      style="background-image:url(https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252305010-L.jpg)" title="谷歌"></a>
                  </div>
                </div>
                <div class="owl-item" >
                  <div class="item"> <a class="zoomimgs frizoomimgs"
                      style="background-image:url(https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230A10-L.jpg)" title="腾讯网"></a>
                  </div>
                </div>
                <div class="owl-item" >
                  <div class="item"> <a class="zoomimgs frizoomimgs"
                      style="background-image:url(https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230J70-L.jpg)" title="阿里巴巴"></a>
                  </div>
                </div>
                <div class="owl-item" >
                  <div class="item"> <a class="zoomimgs frizoomimgs"
                      style="background-image:url(https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230Q60-L.jpg)" title="百度"></a></div>
                </div>
              </div>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--products end-->
  <div id="fh5co-keyword-list" class="layout">
    <div class="bg-keyword">
      <div class="container">
        <div class="hove-bg">
          <h1 class="show_content padding-large-bottom " style="text-align: center;"><span
              style="color: #4d96df;"><strong>免费获得工程报价</strong></span></h1>
        </div>
        <form id="concat" class="form form-block" style="max-width: 500px; margin: 0px auto;">
          <div class="form-group">
            <div class="field"><input id="name" class="input" name="name" size="50" type="text" placeholder="姓名"
                data-validate="请输入您的姓名。"></div>
          </div>
          <div class="form-group">
            <div class="field"><input id="tel" class="input" name="telPhone" size="50" type="text" placeholder="电话">
            </div>
          </div>
          <div class="form-group">
            <div class="field"><input id="gcmj" class="input" name="area" size="50" type="text" placeholder="工程面积">
            </div>
          </div>
          <div class="form-group">
            <div class="field"><textarea id="content" class="input" name="content" placeholder="内容"
                data-validate="请输入内容"></textarea></div>
          </div>
          <div class="form-button"><button class="button bg-main margin-small-right">提交</button></div>
        </form>
      </div>
    </div>
  </div>
  <div id="fh5co-news-list" class="layout">
    <div class="bg-news">
      <div class="container">
        <div class="line fh5co-heading text-center hove-bg">
          <h2><span style="font-size: 18pt;"><strong><span style="color: #4d96df;">新闻中心</span></strong></span></h2>
          <p class="desc"><span style="color: #000000; font-size: 14pt;">实时新闻，实时关注，最新进展</span></p>
        </div>
        <div class="line show-list">
          <div class="tab" data-toggle="hover">
            <div class="tab-body">
              <div id="tab-art1" class="tab-panel active">
                <div class="line-big">
                  <div class="xl12 xs6 xm6 margin-large-bottom">
                    <div class="media">
                      <div class="media_img"><a class="zoomimgs" href="a/gongsixinwen/18.html"> <img
                            src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg">
                        </a></div>
                      <div class="media-body">
                        <h3>强夯机是如何工作的</h3>
                        <div class="time">2021<span
                            style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">/05/10</span>
                        </div>
                        <p class="desc"><span
                            style="color: #454545; font-family: ''Microsoft Yahei''; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left; text-indent: 25px;">更换为饱和软粘土地基的固结强夯法。和强夯置换法的加固机理是不同的，它是一个高影响的锤高落差产生可以碎石，石材料，炉渣和其他性能强度到地面，形成聚集体墩逐个的基础上.......</span>
                        </p>
                        <p class="more">&nbsp;</p>
                      </div>
                    </div>
                  </div>
                  <div class="xl12 xs6 xm6 margin-large-bottom">
                    <ul>
                      <li>
                        <div class="media media-x">
                          <div class="caldata float-left">
                            <div class="content text-center">
                              <p class="day">10</p>
                              <p class="mon-year">2021/03</p>
                            </div>
                          </div>
                          <div class="media-body">
                            <h4><a title="强夯施工如何选择强夯机"
                                href="https://www.hnjingshou.com/a/gongsixinwen/17.html">强夯施工如何选择强夯机</a></h4>
                            <p class="desc">
                              想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。强夯机已经成为了建筑施工中的主流设备.......</p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="media media-x">
                          <div class="caldata float-left">
                            <div class="content text-center">
                              <p class="day">18</p>
                              <p class="mon-year">2021/02</p>
                            </div>
                          </div>
                          <div class="media-body">
                            <h4><a title="强夯机回填复杂地基施工的过程"
                                href="https://www.hnjingshou.com/a/gongsixinwen/16.html">强夯机回填复杂地基施工的过程</a></h4>
                            <p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。强夯机的施工范围及原理......</p>
                            <p class="more">&nbsp;</p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="media media-x">
                          <div class="caldata float-left">
                            <div class="content text-center">
                              <p class="day">22</p>
                              <p class="mon-year">2021/01</p>
                            </div>
                          </div>
                          <div class="media-body">
                            <h4><a title="地基强夯施工要点" href="https://www.hnjingshou.com/a/gongsixinwen/15.html">地基强夯施工要点</a>
                            </h4>
                            <p class="desc"><span
                                style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">强夯地基是用起重机械（起重机或起重机配三脚架、龙门架）将大吨位（一般8-30t）夯锤起吊到6-30m高度后，自由落下，给地基土以强大的冲击能量的夯击，使土中出.....</span>
                            </p>
                            <p class="more">&nbsp;</p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="media media-x">
                          <div class="caldata float-left">
                            <div class="content text-center">
                              <p class="day">15</p>
                              <p class="mon-year">2020/12</p>
                            </div>
                          </div>
                          <div class="media-body">
                            <h4><a title="强夯施工中表层土夯实的必要性"
                                href="https://www.hnjingshou.com/a/gongsixinwen/14.html">强夯施工中表层土夯实的必要性</a></h4>
                            <p class="desc"><span
                                style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅</span>...
                            </p>
                            <p class="more">&nbsp;</p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="media media-x">
                          <div class="caldata float-left">
                            <div class="content text-center">
                              <p class="day">10</p>
                              <p class="mon-year">2021/12</p>
                            </div>
                          </div>
                          <div class="media-body">
                            <h4><a title="浅谈强夯试夯施工" href="https://www.hnjingshou.com/a/gongsixinwen/13.html">浅谈强夯试夯施工</a>
                            </h4>
                            <p class="desc"><span
                                style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数的选取、修正设计及试夯施工对正式施工的指导作用</span>...
                            </p>
                            <p class="more">&nbsp;</p>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--News end-->
  
  <!--Partner begin-->
  
  <!-- <div id="fh5co-partner-list" class="layout">
    <div class="bg-partner">
      <div class="container">
        <div class="line fh5co-heading text-center">
          <h2>合作伙伴</h2>
        </div>
        <div class="line show-list">
          <div class="owl-carousel partner-carousel-carousel">
            <div class="item"><a class="zoomimgs frizoomimgs" title="网易163"> <img
                  src="uploads/allimg/180125/1-1P1252303460-L.png"></a></div>
            <div class="item"><a class="zoomimgs frizoomimgs" title="谷歌"> <img
                  src="uploads/allimg/180125/1-1P1252305010-L.jpg"></a></div>
            <div class="item"><a class="zoomimgs frizoomimgs" title="腾讯网"> <img
                  src="uploads/allimg/180125/1-1P125230A10-L.jpg"></a></div>
            <div class="item"><a class="zoomimgs frizoomimgs" title="阿里巴巴"> <img
                  src="uploads/allimg/180125/1-1P125230J70-L.jpg"></a></div>
            <div class="item"><a class="zoomimgs frizoomimgs" title="百度"> <img
                  src="uploads/allimg/180125/1-1P125230Q60-L.jpg"></a></div>
          </div>
        </div>
      </div>
    </div>
  </div> -->
  
  <!--Partner end-->
  
  <!--footer-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>邮箱：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!--footer-->
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
  <div class="zoom-img"><img style="max-width: 100%; max-height: 100%;" alt=""></div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司网络', 1, '/var/www/html/441/a/gongsiwangluo/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>关于我们</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li ><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
              <li class="active"><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="content-boxs">
            <div class="detail"> &nbsp;<img alt="" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P12520430A64.jpg"> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('设备展示', 1, '/var/www/html/441/a/products/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>设备展示</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="product-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/09/04/_202109041002203426a86810ce9c8a.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>设备展示</h3>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg"
                          width="300" height="300"></div>
                      <h3><a>公路强夯设备</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg"
                          width="300" height="300"></div>
                      <h3><a>蛙式强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/srchttp___5b0988e595225.cdn.sohucs.com_images_20180831_6e8d032c79b9426eb92929e7d0a19071.jpegreferhttp___5b0988e595225.cdn.sohucs.jpg"
                          width="300" height="300"></div>
                      <h3><a>180吨强夯锤强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg" width="300"
                          height="300"></div>
                      <h3><a>履带式强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg" width="300"
                          height="300"></div>
                      <h3><a>填充法强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="click-zoom"
                          src="https://s1.imagehub.cc/images/2021/05/09/210453534.jpg" width="300" height="300"></div>
                      <h3><a>重锤式强夯机</a></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('工程案例->工业厂房强夯', 1, '/var/www/html/441/a/jingmi/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="product-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>工程案例</h3>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1712133504.jpg"
                          width="408" height="230"></div>
                      <h3><a title="精密汽车零件012">中建筑港港口强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/394622667.jpg"
                          width="307" height="230"></div>
                      <h3><a title="精密汽车零件011">城陵矶强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1891563201.jpg"
                          width="306" height="230"></div>
                      <h3><a title="精密汽车零件010">正宁东方畜牧场强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/2043820902.jpg"
                          width="306" height="230"></div>
                      <h3><a title="精密汽车零件009">湖南临湘工业园强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1994182165.jpg"
                          width="300" height="230"></div>
                      <h3><a title="精密汽车零件008">中国石化工程强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/909011773.jpg"
                          width="307" height="230"></div>
                      <h3><a title="精密汽车零件007">明煌建设土地强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/715941240.jpg"
                          width="307" height="230"></div>
                      <h3><a title="精密汽车零件006">新好农牧强夯项目</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/912121367.jpg"
                          width="3968" height="230"></div>
                      <h3><a title="精密汽车零件005">文化产业园强夯项目</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/933237279.jpg"
                          width="307" height="230"></div>
                      <h3><a title="精密汽车零件004">融湘产业园强夯项目</a></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('工程案例->道路强夯', 1, '/var/www/html/441/a/jingmi/index1.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="product-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>工程案例</h3>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1123945817.jpg"
                          width="350" height="280"></div>
                      <h3>公路地基建设</h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1121998519.jpg"
                          width="350" height="280"></div>
                      <h3>高速公路施工</h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/525570854.jpg"
                          width="350" height="280"></div>
                      <h3><span style="color: #333333;">城市公路建设</span></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1973633635.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件009">公路搭建</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/843613571.md.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件008">城市道路建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1906010390.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件007">道路压实</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1577799980.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件006">道路强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1687874547.md.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件005">中铁合作</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/940453669.md.jpg"
                          width="350" height="280"></div>
                      <h3
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">
                        <a title="精密汽车零件005">高速公路地基夯实</a></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('工程案例->机场码头强夯', 1, '/var/www/html/441/a/jingmi/index2.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="product-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>工程案例</h3>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/541263453.md.jpg"
                          width="350" height="280"></div>
                      <h3
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">
                        机场地基强夯</h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1756915815.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件011">码头地基强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/576097014.md.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件010">码头建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/43024487.md.jpg"
                          width="350" height="280"></div>
                      <h3
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">
                        <a title="精密汽车零件008">机场建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/291269973.md.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件008">机场建设地</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1368468961.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件007">码头地基建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/576097014.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件006">机场建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/940453669.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件005">码头建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1887060040.jpg"
                          width="350" height="280"></div>
                      <h3><span style="color: #ffffff;">机场建设</span></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('工程案例->住宅强夯', 1, '/var/www/html/441/a/jingmi/index3.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="product-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>工程案例</h3>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img
                          src="https://s1.imagehub.cc/images/2021/05/24/455912500ef2bf67f6279acf3.jpg" width="350"
                          height="280"></div>
                      <h3
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">
                        <a style="outline: 0px;" title="精密汽车零件011">住宅地基强夯</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/394622667.jpg"
                          width="350" height="280"></div>
                      <h3
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">
                        <a title="精密汽车零件010">住房地基建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/252454485.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件010">楼盘建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/258010367.jpg"
                          alt="履带式强夯机" width="350" height="280"></div>
                      <h3><a title="精密汽车零件009">履带式强夯机</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/402921916.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件008">地基建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/338436577.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件007">地基建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/194557300.md.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件006">新城建设</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1060855677.jpg"
                          width="350" height="280"></div>
                      <h3>建筑强夯施工</h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1096547534.jpg"
                          width="350" height="280"></div>
                      <h3><a title="精密汽车零件004">楼房地基施工</a></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>邮箱：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a>
    </div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('新闻中心', 1, '/var/www/html/441/a/news/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="line show_list">
              <ul class="list-media article-media">
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a title="强夯施工如何选择强夯机" href="https://www.hnjingshou.com/a/jishuzhanshi/33.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/srchttp___www.zdyt.cc_uploadfile_201505_20150530223346281.jpgreferhttp___www.zdyt.jpg"
                          alt="强夯施工如何选择强夯机" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯施工如何选择强夯机" href="jishuzhanshi/33.html">强夯施工如何选择强夯机</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p class="desc">想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。 强夯机已经成为......</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="https://www.hnjingshou.com/a/xingyexinwen/24.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="强夯施工中表层土夯实的必要性。"
                          width="146" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯施工中表层土夯实的必要性" href="xingyexinwen/24.html">强夯施工中表层土夯实的必要性</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p
                        style="margin-top: 0px; color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: left;">
                        强夯施工中表层土夯实的必要性</p>
                      <p
                        style="margin-top: 0px; color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: left;">
                        &nbsp;&nbsp;&nbsp;
                        在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅，即险加固深层土......</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="https://www.hnjingshou.com/a/gongsixinwen/18.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507222026.jpg" alt="强夯机回填复杂地基施工的过程"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯机回填复杂地基施工的过程" href="https://www.hnjingshou.com/a/gongsixinwen/18.html">强夯机回填复杂地基施工的过程</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。</p>
                      <p class="desc">&nbsp; &nbsp; 强夯机的施工范围及原理1.适用范围。本施工工法适用于桥台背回填、小范围......&nbsp;</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="https://www.hnjingshou.com/a/jishuzhanshi/32.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507222033.jpg" alt="强夯机回填复杂地基施工的过程"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="地基强夯施工要点" href="https://www.hnjingshou.com/a/jishuzhanshi/32.html">地基强夯施工要点</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p
                        style="margin-top: 0px; color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: left;">
                        地基强夯施工基本情况：</p>
                      <p
                        style="margin-top: 0px; color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: left;">
                        &nbsp;&nbsp;&nbsp; 强夯地基是用起重机械（起重机或起重机配三脚架、龙门架）将大吨位（一般8-30t）夯锤起吊到6-30m高度后......</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="https://www.hnjingshou.com/a/jishuzhanshi/31.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/11/24.jpg" alt="强夯机回填复杂地基施工的过程" width="188"
                          height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="路基强夯施工技术研究" href="https://www.hnjingshou.com/a/jishuzhanshi/31.html">路基强夯施工技术研究</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p class="desc"><span
                          style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中......</span>
                      </p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新闻', 1, '/var/www/html/441/a/gongsixinwen/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="line show_list">
              <ul class="list-media article-media">
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="18.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/srchttp___www.zdyt.cc_uploadfile_201505_20150530223346281.jpgreferhttp___www.zdyt.jpg"
                          alt="强夯机是如何工作的" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯机是如何工作的" href="18.html">强夯机是如何工作的</a></h3>
                      <div class="time">时间:2021-5-10</div>
                      <p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。强夯机的施工范围及原理...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="17.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/10/0d9bee6c6774a58287d214f147ac8690.jpg"
                          alt="强夯施工如何选择强夯机" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯施工如何选择强夯机" href="17.html">强夯施工如何选择强夯机</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="16.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg"
                          alt="强夯机回填复杂地基施工的过程" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="强夯机回填复杂地基施工的过程" href="16.html">强夯机回填复杂地基施工的过程</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。强夯机的施工范围及原理适用范围。本施工工法适用于桥台背回填、小范围基...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="15.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg"
                          alt="地基强夯施工要点" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="地基强夯施工要点" href="15.html">地基强夯施工要点</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">强夯施工应属于动态信息化的施工方式,强夯参数的选择应根据工程的实际地质情况及规范的经验取值初步确定强夯参数,通过试夯时的综合检测手段验证取值....</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="14.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg"
                          alt="路基强夯施工技术研究" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="路基强夯施工技术研究" href="14.html">路基强夯施工技术研究</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数...</p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- content end-->
    <footer>
      <div class="layout footer-top hidden-l">
        <div class="container">
          <div class="line-big">
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="plist">
                <h2>联系我们</h2>
                <div class="contact-foot">
                  <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                  <p>电话: 137-0749-9996</p>
                  <p>分队：767970239@qq.com</p>
                </div>
              </div>
            </div>
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="plist">
                <h2>关于我们</h2>
                <ul>
                  <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                  <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                  <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                </ul>
              </div>
            </div>
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="plist">
                <h2>新闻中心</h2>
                <ul>
                  <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                  <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                  <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="layout  footer-bot">
        <div class="container">
          <div class="line-big">
            <div class="xl12 xs12 xm4">
              <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
            </div>
            <div class="xl12 xs12 xm8">
              <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <div class="blank55">&nbsp;</div>
    <div id="toolbar" class="layout text-center">
      <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
      <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
      <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
    </div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新闻内容1', 2, '/var/www/html/441/a/gongsixinwen/18.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>强夯机是如何工作的</h1>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10
                <strong>点击:</strong></div>
              <div class="description">
                <div><span
                    style="color: #454545; font-family: ''Microsoft Yahei''; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-indent: 25px;">&nbsp;
                    &nbsp; &nbsp;
                    更换为饱和软粘土地基的固结强夯法。和强夯置换法的加固机理是不同的，它是一个高影响的锤高落差产生可以碎石，石材料，炉渣和其他性能强度到地面，形成聚集体墩逐个的基础上，对复合地基墩墩的形成，改善地基承载力，减少沉降。在强夯置换过程，土壤结构破坏，土体超孔隙水压力，但随着时间的增加，土壤结构的力量会恢复的。集料墩一般土壤透水性好，在过量的孔隙水压力的消散有利于产生的固体。</span>。
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：没有了</li>
                  <li>下一篇：强夯施工如何选择强夯机</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新闻内容2', 1, '/var/www/html/441/a/gongsixinwen/17.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>强夯施工如何选择强夯机</h1>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-1.
                <strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。</div>
                  <div>
                    &nbsp;强夯机已经成为了建筑施工中的主流设备，目前国内有很多专业的强夯公司，并且拥有自己的强夯机。强夯机主要是供应给强夯施工队，以目前国内的经济建设情况来看，强夯机的需求很大。如何来选择优秀的强夯机呢？有的人看中品牌，有的人看中价格，其实都很重要。
                  </div>
                  <div>&nbsp; &nbsp;
                    强夯机作为建筑业最为常用的施工设备之一，性能是摆在第一位的。目前强夯机有很多种，比如履带式的，液压式的，机械传动式等等，实现原理不同，性能也大不相同。强夯机由于施工环境的限制，要具备非常好的稳定性，并且具备较大的能及。
                  </div>
                  <div>&nbsp; &nbsp;
                    由此可见，液压强夯机是非常不错的选择，它的冲击能级高，并且夯锤提升下降速度稳定，现在已经得到了很广泛的使用。除了上面的液压强夯机意外，机械传动强夯机也有优势，它适用的场所更多，更广泛。不过强夯机的适用性也是我们选择的一个重要因素。
                  </div>
                  <div>现代施工的环境越来越复杂，不再仅仅是在地面上进行施工，有的是在海里，有的是在山谷中，因此需要强夯机能适用不同的环境，满足不同的需要。</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：强夯机是如何工作的</li>
                  <li>下一篇：强夯机回填复杂地基施工的过程</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新闻内容3', 1, '/var/www/html/441/a/gongsixinwen/16.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>强夯机回填复杂地基施工的过程</h1>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10
                <strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。</div>
                  <div>&nbsp; &nbsp; 强夯机的施工范围及原理</div>
                  <div>&nbsp; &nbsp; 1.适用范围。本施工工法适用于桥台背回填、小范围基础处理及深沟槽回填施工。</div>
                  <div>&nbsp; &nbsp; 2.工艺原理。</div>
                  <div>&nbsp; &nbsp; ①夯实机安装在装载机或挖掘机上，灵活机动；</div>
                  <div>&nbsp; &nbsp; ②夯实机夯实无需小型夯实机具对边角进行处理；</div>
                  <div>&nbsp; &nbsp; ③夯实机作用深度大，一次可回填完成1～4m深度；</div>
                  <div>&nbsp; &nbsp; ④夯实机单机即可完成夯实工作，减少小型设备的投入及压实设备周而复始的回填工作；</div>
                  <div>&nbsp; &nbsp; ⑤提升至一定高度的夯锤在重力作用下加速下落，并在液压系统的作用下往复运动，高速击打带缓冲垫、静压在地面上的夯板，再通过夯板夯击地面。</div>
                  <div>&nbsp; &nbsp; 3.工法特点。</div>
                  <div>&nbsp; &nbsp; ①直接安装在装载机或挖掘机上机动灵活，边角部位无需单独采用小型夯实机具处理；</div>
                  <div>&nbsp; &nbsp; ②作用深度大，一次性可回填1～4m，施工效率大大提高；</div>
                  <div>&nbsp; &nbsp; ③减少小型夯实设备及人力的投入，减少压实设备周而复始的使用率，施工成本大大降低；</div>
                  <div>&nbsp; &nbsp; ④具有作用柔和，贯穿能力强而均匀，在基层处理中不易形成表层硬结，可在较大的深度范围内获得较均匀的密实度。强夯机的工作原理你知道了吗？</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：强夯机回填复杂地基施工的过程</li>
                  <li>下一篇：地基强夯施工要点</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新文内容4', 1, '/var/www/html/441/a/gongsixinwen/15.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h4
                style="line-height: 60px; font-size: 18px; color: #333333; text-align: center; font-family: 宋体; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">
                强夯施工中表层土夯实的必要性</h4>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <p
                    style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">
                    &nbsp; &nbsp;<span
                      style="font-size: 12pt;">在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅，即险加固深层土，再加固中层土，最终加固表层土。依照现在强夯施工工艺先用2~3变点夯加固深层土和中层土，最终采纳低能量满夯加固表土。</span>
                  </p>
                  <p
                    style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">
                    <span style="font-size: 12pt;">&nbsp;&nbsp;&nbsp;
                      当点夯完结后，常用推土机将夯坑回填推平，因而夯坑底面标高以上的填土比较疏松，加上发作的强壮振荡，使周围现已夯实的表层土可能有必定程度的振松，所以通过满夯来将表层土夯实。</span></p>
                  <p
                    style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">
                    <span style="font-size: 12pt;">&nbsp;&nbsp;&nbsp;
                      所用夯锤的底面积问题：底面积大小与土的类型有关。一般来说平，关于砂质土和碎石填土，选用底面积2～4平方米较为适宜，关于一般第四纪粘性土主张产用3～4平方米；关于淤泥质土主张产用4～6平方米为宜。</span>
                  </p>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：地基强夯施工要点</li>
                  <li>下一篇：路基强夯施工技术研究</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('公司新闻内容5', 1, '/var/www/html/441/a/gongsixinwen/14.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 公司新闻</title>
  <meta name="keywords" content="新闻中心 / 公司新闻">
  <meta name="description" content="新闻中心 / 公司新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h4
                style="line-height: 60px; font-size: 22px; color: #333333; text-align: center; font-family: 微软雅黑; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">
                浅谈强夯试夯施工</h4>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2018-01-25
                <strong>点击:</strong></div>
              <div class="description">
                <div><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数的选取、修正设计及试夯施工对正式施工的指导作用。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1强夯法处理地基的机理</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1.1强夯单点夯机理</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯巨大的冲击荷载使被压土体承受瞬间的巨大压应力、剪切应力和土体相应产生的约束反力，使土体发生急剧沉降现象，产生压缩和剪切变形，使土颗粒摆脱了原来的胶结，颗粒间挤压移动，土的孔隙被充填压缩；其次，土体受到夯锤底面约束反力的控制，土体距离锤体越近，受到各种方向的作用力就越大，相应密度增加。因此，位于夯锤底面的土体分别是加密状态（土体结构完全破坏，土颗粒基本呈规律排列）；无加密状态（土体结构基本破坏或松动破坏，密度变化较小）。通过不断的对地基进行夯击，夯区的土体及同一夯点上下层厚度内土体趋于加密状态，强夯施工是向土体传递着锤的冲击、破坏、加密作用。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1.2满夯机理</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">满夯是继点夯之后，夯击能多降至点夯的1/4夯能进行最后一遍的夯击。满夯是进一步夯实点夯之间被扰动的土，使夯点与夯点间强度更趋于均匀，促进松动破坏的土层压密，形成整体强度。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">2
                    试夯区的选择与施工参数的确定</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;"
                    data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯施工应该根据现场地形条件选择若干个具有代表性又能满足试夯要求的试夯区，对于夯坑的填料应选择材质好、强度高、级配好、含泥少者最佳，填料采取边夯边填。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3
                    施工参数的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;"
                    data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.1夯击能的选择</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">单点夯击能的选择是首要前提，一般宜根据所要加固地基深度结合图纸设计夯击能综合确定。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2夯锤规格的选择</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2.1夯锤重量一般按照3.2.1式进行取值，因如果夯锤过重，要求起重能力就大，这样会增大施工成本。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">E=mgh
                    （3.2.1）</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;"
                    data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">式中：E――夯击能，KN・m；</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">m――夯锤重，kg；</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">h――起重设备的提起高度，m；</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">g――重力加速度，m/s2。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2.2夯锤底面积一般采用4-7m2，对结构性较强的地基土宜取小值。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.3夯距和布点方式的选择</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯夯点布置形式可根据基础形式、地基土类型和工程特点选用，宜为正方形、矩形、正三角形、等腰三角形等形式，常见夯点布置形式见图</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">如果单从地基强度均匀性考虑时，正三角形优于其它布点形式，同时正方形布设点位较多，施工成本相对较高。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">夯距宜为锤径的1.2～2.5倍，低能级时取小值，高能级及考虑能级组合时取大值。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯常需分遍夯击，强夯遍数往往取决于夯距，即夯距越小，夯点越密。因为一边无法使各点全夯到，故遍数就越多，如考虑孔隙水压力消散时间，由于大面积强夯时，最先夯的夯点，在夯最后的夯击时，孔隙水压力往往已得到消散，可回头第二遍。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4
                    试夯</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;"
                    data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.1试夯区面积选择</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">试夯区的面积不宜过小，一般夯点布置其纵横排数不宜少于5排，必须保证四排。因过少则反映不出夯点之间能量叠加之后实际的加权处理深度。检测点个数受限（因检测不能在边缘夯点之外，而应布在没边都有两排包围的区域之类）检测点越少，检测手段越单一，所取得检测数据就越具有偶然性，缺少各种手段的互为参照性，其代表性和真实性都难以保证。而规范中推荐的试夯区面积也不得少于400m2。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2单点击数的确定</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.1夯前宜埋设好夯点四周的地表沉降或隆起点观测点，应注意两夯点正中间观测点的埋设，应记录每击的地表变形量。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.2详实地记录每击的锤击贯入度，在现场画出夯沉曲线图，并注意观测和描述已出现的各种现象的发生与发展，如隆起量、每击的长度、宽度变化等，结合试夯的结果或已认可的夯沉深度来确定单点强夯击数。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.3注意观测并记录每边夯后的场地沉降量。它是宏观评价强夯效果，如场地压缩量、场地湿陷量的重要依据之一；同时又是指导正式夯击的填料厚度、控制夯后所需场地标高的唯一依据，避免发生填料量或土方量重复调配所产生的浪费，因此必须正确真实的测量其标高变化，切忌将试夯区以外的土或填料推向试夯区，又误将满夯后的场地标高与原场地标高之差作为真实的场地夯沉量加以利用，来指导正式施工，因正式施工的面积远大于试夯区，在场地平整时，没那么多区外土可向区内推，工程夯的场地夯沉量将大于试夯区的夯沉量，造成标高失控，发生大量土方。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5试夯区的夯后检测</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">试夯区的夯后检测是必须进行的，因为它是评价地基处理效果，修改设计的唯一依据和标准。故正确地、客观地、真实的进行夯后检测意义重大。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.1夯后检测间歇期</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">夯后地基检测常需一段间歇期，它与强夯施工每遍之间的间歇期不同。每遍之后的间歇往往考虑地表发生的诸如隆起、橡皮土等现象不应再加剧，以及是否影响安全施工等因素较多，而夯后地基检测的间歇，主要考虑的是深层固结，如土体被迫接受夯击能而要进行缓慢的释放（最明显表现的孔隙水压力消散），空隙水压力消散是由于整个夯区上部土体被破坏，密度增加，自重应力又以附加荷载的形式重新得以发挥而无加密区土体结构受到松动破坏，强度降低，压缩性增大，因此将产生一定新的压缩变形，使得原始粘聚力有所提高，土中结合水在夯击时移动、静止后又重新排列固定；其次，还有一部分上层土（加密层）对下层土（结构呈松动破坏的土层）的压缩变形和强度恢复。但工期往往不允许，故应按规范中强调的间歇性执行。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2检测点的布置数量和检测手段的选择</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.1检测点的布置应确保每种检测手段夯点与夯间都有分布，还应布在纵横都在两排夯点包围范围之内，且每种手段检测数量在夯点与夯间上均不少于两点，以免缺乏代表性。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.2检测手段的选择应针对主要处理目的，主要不良地质现象的需要进行选择，如湿陷性、液限、液化等，但反映地基强度和土的密度等指标还是不可缺少的。一般检测手段不应少于两种，对较重要的地基还应考虑静载荷试验。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.3主要进行夯前和夯后的效果对比分析，主要不良地质现象改善情况。是否达到设计预期目标。充分的、客观地、全面的评价夯后地基的可靠性。如果还有指标尚未达到使用要求，宜从强夯加固地基的机理入手，找出施工参数或辅助措施应进行的调整方向并具体化。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">6结论</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">通过试夯施工的现场施工记录，得出夯击次数与夯沉量关系（见图6.1）。</span><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><br
                    style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">图6.1
                    夯击次数与沉降量关系图（单位：mm）</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;"
                    data-filtered="filtered"><span
                    style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">山平高速路基软基处理设计要求强夯点夯夯击次数为6～8击，夯击最后两击的沉降量不大于5cm，由现场施工记录得出夯击次数与夯沉量关系通过试夯只需达到4～5击，即满足要求，从而修正了设计，减少夯击次数，缩减施工成本，其次，在试夯过程中监测土层变化及其现场出现的情况，得出相关工参数为正式施工提供可靠依据。</span>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：强夯施工的必要性</li>
                  <li>下一篇：没有了</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻', 1, '/var/www/html/441/a/xingyexinwen/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 行业新闻</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="line show_list">
              <ul class="list-media article-media">
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="24.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="高速公路路基强夯施工实施案例"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="高速公路路基强夯施工实施案例" href="24.html">高速公路路基强夯施工实施案例</a></h3>
                      <div class="time">时间:2021-01-31</div>
                      <p class="desc">强夯法处理地基（又称动力固结法）是20世纪60年代由法国Menard技术公司首先创用的，这种方法是利用大型履带式强夯机将重锤.....</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="23.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507222026.jpg" alt="集百项专利技术的国内首台巨无霸强夯机下线"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="集百项专利技术的国内首台巨无霸强夯机下线" href="23.html">集百项专利技术的国内首台巨无霸强夯机下线</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">
                        这台型号为BTM1800的&ldquo;战虎&rdquo;强夯机，由国家高新技术企业湖南博邦重工有限公司厂区(简称&ldquo;博邦重工&rdquo;)研发，集中了近百项专利技术，自重100吨，起重臂高35米，履带有半人...
                      </p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a title="湖南省首台大能量级强夯机宁乡经济开发区开锤" href="22.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507222033.jpg" alt="湖南省首台大能量级强夯机宁乡经济开发区开锤"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="湖南省首台大能量级强夯机宁乡经济开发区开锤" href="22.html">湖南省首台大能量级强夯机宁乡经济开发区开锤</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">湖南省首台大能量级强夯机7000B强夯机徐徐升锤、怦然撼地，拉开了宁乡经济...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="21.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/11/24.jpg" alt="中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破" href="21.html">中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</a>
                      </h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">
                        夯"这个词语在我国建设历史上源远流长，从人工到机械，虽是建筑工程基础施工必备的机械设备，但是只在基础制作过程中使用，不像挖掘机等适用广泛，可以说是一个"冷门机械"...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="20.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/10/0d9bee6c6774a58287d214f147ac8690.jpg"
                          alt="42kj高速液压夯实机型号区分，装载机带的打夯机价格" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="42kj高速液压夯实机型号区分，装载机带的打夯机价格" href="20.html">42kj高速液压夯实机型号区分，装载机带的打夯机价格</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">高速液压夯实机进一步压缩土体的同时，消除或弱化分层碾压导致的土体垂直方向均匀性差及层间结合力差的固有缺陷；施工中严格控制路基常规压实整体质量，补强...</p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻1', 1, '/var/www/html/441/a/xingyexinwen/24.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>行业新闻</title>
  <meta name="keywords" content="行业新闻">
  <meta name="description" content="行业新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  
  <!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>高速公路路基强夯施工实施案例。</h1>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-<span
                  style="font-size: inherit; color: #000000;">05-11 </span><strong
                  style="font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit;">点击:</strong>
              </div>
              <div class="description">
                <div>
                  <div>一、强夯法简介：</div>
                  <div>&nbsp; &nbsp; &nbsp; &nbsp;
                    强夯法处理地基（又称动力固结法）是20世纪60年代由法国Menard技术公司首先创用的，这种方法是利用大型履带式强夯机将重锤（一般为100～400kN）从高处自由落下（落距一般为6～40m）给地基以冲击力和振动，
                  </div>
                  <div>从而提高地基土的强度并降低其压缩性。强夯法施工已广泛运用到高速公路铁路，机场、核电站、大工业区、港口填海等基础加固工程。优点：工期短、效果好、造价低。</div>
                  <div>1、加固深度应根据现场试夯或当地经验确定;</div>
                  <div>2、
                    强夯的单位夯击能量，应根据地基土类别、结构类型荷载大小和要求处理的深度等综合考虑，并通过现场试夯确定。在一般情况下，对于粗颗粒土可取1000～3000KN&middot;m/m2；细颗粒土可取1500～4000KN&middot;m/m2。
                  </div>
                  <div>3、 夯点的夯击次数，应按现场试夯得到的夯击次数和夯沉量关系曲线确定，且应同时满足下列条件：</div>
                  <div>A. 最后两击的平均夯沉量不大于50mm，当单击夯击能量较大时不 大于100mm。</div>
                  <div>B. 夯坑周围地面不应发生过大的隆起。</div>
                  <div>C. 不因夯坑过深而发生起锤困难。</div>
                  <div>4、 夯击遍数应根据地基土的性质确定，一般情况下，可采用2～3遍，最后再以低能量夯击一遍。对于渗透性弱的细粒土，必要时夯击遍数可适当增加。</div>
                  <div>5、 两遍夯击之间应有一定的时间间隔。间隔时间取决于土中超静孔隙水压力的消散时间。当缺少实测资料时，可根据地基土的渗透性确定，</div>
                  <div>对于渗透性较差的黏性土地基的间隔时间，应不少于3～4周；对于渗透性好的地基土可连续夯击。</div>
                  <div>6、 夯击点位置可根据建筑结构类型，采用等边三角形、等腰三角形或正方形布置。第一遍夯击点间距可取5～9m，以后各遍夯击点间距可与第一遍相同，</div>
                  <div>也可适当减小。对于处理深度较大或单击夯击能较大的工程，第一遍夯击点间距宜适当增大。</div>
                  <div>7、 强夯处理范围应大于建筑物基础范围。每边超出基础外缘的宽度宜为设计处理深度的1/2至2/3。并不宜小于3m。</div>
                  <div>8、 根据初步确定的强夯参数，提出强夯试验方案，进行现场试夯。应根据不同土质条件待试夯结束一至数周后，对试夯场地进行测试，并与夯前测试数据进行对比，</div>
                  <div>检验强夯效果，确定工程采用的各项强夯参数。</div>
                  <div>三、强夯实施流程:</div>
                  <div>&nbsp; &nbsp; &nbsp;1、现场技术办公会议纪要（有时也称四方现场会议纪要）这个是变更最初的原始资料，很重要，没有这个东西啥指示都是空谈，搞管理的一定要记住但凡是变更工程，
                  </div>
                  <div>在现场实施前一定要拿到白纸黑字的东西才能做。不然后期结算有得扯皮!</div>
                  <div>2、施工技术方案，这个可以先做，百度上先找找模板再按本项目实际情况修改一下，报总监办审查，一般来说来来回回会被打回来修改几次（很正常），最终要的就是方案的批复。</div>
                  <div>方案有了，特殊情况下，如果工期紧的话现场就可以着手准备施工了。</div>
                  <div>3、施工技术方案申报批复单;</div>
                  <div>4、工程变更申请表及附件（工程量计算表）;</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：没有了</li>
                  <li>下一篇：集百项专利技术的国内首台巨无霸强夯机下线</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻2', 1, '/var/www/html/441/a/xingyexinwen/23.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>未来可能是路上的贵金属</title>
  <meta name="keywords" content="行业新闻">
  <meta name="description" content="行业新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>集百项专利技术的国内首台巨无霸强夯机下线</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>中新网长沙10月31日电 (贺文兵)90吨重的夯锤，轻松举到20米高度，然后脱钩砸向地面，松软的土壤瞬间砸实。31日，国内首台巨无霸履带式强夯机在湖南宁乡高新区正式下线。</div>
                  <div>&nbsp; &nbsp;
                    这台型号为BTM1800的&ldquo;战虎&rdquo;强夯机，由国家高新技术企业湖南博邦重工有限公司厂区(简称&ldquo;博邦重工&rdquo;)研发，集中了近百项专利技术，自重100吨，起重臂高35米，履带有半人高，用于填海、筑路夯实基础、打桩等。
                  </div>
                  <div>&nbsp; &nbsp;
                    强夯机市场小众，加之研发中也存在一些技术难题，许多工程机械企业都放弃生产。&ldquo;液压油温升高和受作业冲击力产生的&lsquo;疲劳&rsquo;等因素，一台液压设备动力强夯机使用年限不长。&rdquo;博邦重工董事长张俊强率团队用了
                  </div>
                  <div>近10年时间、经过上千次改进和实验解决了这一难题。</div>
                  <div>
                    &ldquo;改液压为机械。&rdquo;张俊强说，采用其发明的&ldquo;一种机液双驱动卷扬系统和强夯机&rdquo;专利技术，此次下线的履带式强夯机可以选用相对低排量的发动机而达到高排量需求，达到节能减排目的。
                  </div>
                  <div>针对高强度施工条件下制造的加强型卷扬与传动系统，能够达到同级别强夯机3倍以上的单绳拉力，并可靠工作。</div>
                  <div>&nbsp;
                    &nbsp;张俊强还表示，博邦专利技术打造的专用控制系统，通过液、电、气的控制，能够实现起锤、对点平稳，空中停锤安全可靠，并具备重锤空中安全下放的功能。整机缓冲系统通过防后倾组件、后座力缓冲组件，
                  </div>
                  <div>也能够消除整机工作时的后倾力，减少机器工作冲击力。</div>
                </div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>在同一时间，把我们的贵金属深加工产品到高端的速度加快了本地化的贵金属深加工产业，建成开放，集成的前奏。</div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：<a href="22.html">高速公路路基强夯施工实施案例。</a></li>
                  <li>下一篇：<a href="24.html">湖南省首台大能量级强夯机宁乡经济开发区开锤。</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻3', 1, '/var/www/html/441/a/xingyexinwen/22.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>金属倒在木板上，惊慌失措。</title>
  <meta name="keywords" content="行业新闻">
  <meta name="description" content="行业新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>湖南省首台大能量级强夯机宁乡经济开发区开锤</h1>
              <div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2018-01-25
                <strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>1月上旬，湖南省首台大能量级强夯机7000B强夯机徐徐升锤、怦然撼地，拉开了宁乡经济开发区湖南建工产业园项目全面建设的序幕。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;宁乡经济开发区湖南建工产业园项目位于宁乡市金玉大道以西，玉兴路（规划道路）以南，总投资10亿元，项目用地约250亩，主要生产建筑用产品生产+建筑制造业+建筑设备+技术服务+展示展览+仓储物流。
                  </div>
                  <div>
                    届时湖南省第六工程有限公司钢结构分公司、湖南六建机电安装有限责任公司、湖南省机械化施工有限公司、湖南六建物资租赁有限公司等9家企业将会入驻园区。项目建成后预计第一年产值达7亿元，预计年税收贡献2500万元。
                  </div>
                  <div>预计第五年产值达10亿元，预计年税收贡献3500万元。</div>
                  <div>&nbsp; &nbsp;
                    近几年湖南省机械化施工有限公司为不断做大做强企业品牌，实现产品升级、产业扩张、行业引领，打造&ldquo;专业突出，特色明显&rdquo;的总承包企业，湖南省机械化施工有限公司继2005年，
                  </div>
                  <div>在省内首次引进了两台性能最为先进的山河智能SWDM220型旋挖机之后，2020年6月29日通过公司大型设备采购线上公开招标（线上集采平台）又在省内首次引进HZQH7000B强夯机一台。
                  </div>
                  <div>本次亮相的杭重HZQH7000B强夯机，系湖南省首台大能量级强夯机，落户湖南机械化施工有限公司，夯锤重35t，带门架夯击能达到15000kn.m</div>
                  <div>&nbsp;</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：<a href="21.html">集百项专利技术的国内首台巨无霸强夯机下线</a></li>
                  <li>下一篇：<a href="23.html">中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻4', 1, '/var/www/html/441/a/xingyexinwen/21.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>行业新闻</title>
  <meta name="keywords" content="行业新闻">
  <meta name="description" content="行业新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>&nbsp;"打夯"这个词语在我国建设历史上源远流长，从人工到机械，虽是建筑工程基础施工必备的机械设备，但是只在基础制作过程中使用，不像挖掘机等适用广泛，可以说是一个"冷门机械"。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;最近国内首台履带式90吨夯锤的强夯机"战虎"在湖南宁乡下线，行业热议，有人说这是工程机械行业的巨大进步，也有人说"傻大黑粗"没什么意义。那么强夯机做到如此规格到底有什么什么"黑科技"，
                  </div>
                  <div>所谓冷门机械要不要突破呢？</div>
                  <div>&nbsp; &nbsp; &nbsp;因素1：国内强夯机中的"巨无霸"，助力超级工程基础扎实，提升效率</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;10月底，位于湖南宁乡某公司厂区，国内首台"战虎"巨无霸履带式强夯机正式下线，在进行最后的调试后，将交付给来自重庆的客户。这款履带式强夯机自重就达到了100吨，起重臂35米高。</div>
                  <div>那么这样的巨无霸到底是什么黑科技？</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;强夯机是利用机械动力将几吨至几十吨的重锤，从几米至十几米的高处自由落下，对土体进行动力夯击，使土产生强制压密而减少其压缩性、提高强度。这种加固方法业内叫"强夯法" 。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;强夯机主要用于建筑施工中地基压实作业，根据使用环境不一样，采用强夯机压实机械的类型也不一样：振动型，，液压夯实型，吊锤锤型。使用强夯机提高地基承载力，减少沉降。</div>
                  <div>在动力置换过程中，虽然土体结构遭到破坏，地基土产生超静孔隙水压力，但随着时间的推移土体结构强度会恢复。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;而这套命名为"战虎"的强夯机是目前国内强夯机中夯锤最重的，可以专门用来填海、筑路、超高层建筑的基础夯实、也可以用来打桩，是建筑施工项目基础施工不可缺少的重型工程机械。</div>
                  <div>&nbsp; &nbsp; &nbsp;有人说不就是把东西做大吗，也就"傻大黑粗"是这些我国施工机械的特点。但是这装备用时髦的话说："岂止于大"。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;强夯机施工时候发生的振动影响的安全间隔的断定，一直都是强夯机施工中的难题，它不光涉及到安全规范的断定、地基土的特性，还涉及强夯机能级的巨细、夯锤的面积巨细等许多要素。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;如果不在现场进行振动查验很难给出适合的数据，现场查验又不能每项工程都能做到，特别是在地基处理计划初步断定阶段就进行现场振动查验也不现实。只有在安全运行的前提下，</div>
                  <div>解决行业痛点才能真正意义上市场全面超越。</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：<a href="20.html">湖南省首台大能量级强夯机宁乡经济开发区开锤</a></li>
                  <li>下一篇：<a href="22.html">42kj高速液压夯实机型号区分，装载机带的打夯机价格</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('行业新闻5', 1, '/var/www/html/441/a/xingyexinwen/20.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>汽车工程塑料将取代更多的金属部件</title>
  <meta name="keywords" content="行业新闻">
  <meta name="description" content="行业新闻">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>42kj高速液压夯实机型号区分，装载机带的打夯机价格</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>高速液压夯实机进一步压缩土体的同时，消除或弱化分层碾压导致的土体垂直方向均匀性差及层间结合力差的固有缺陷；施工中严格控制路基常规压实整体质量，补强时不宜过夯，</div>
                  <div>过夯容易导致周边土体隆起侧压及破坏原有分层结构。</div>
                  <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    高速液压夯实机是通过液压油缸将夯锤提升至一定高度后快速释放，夯锤在加速下落过程中通过夯板间接的夯击地面。该设备安装在普通装载机的动臂上，行动方便自如，</div>
                  <div>可以对作业面进行单点或者连续的夯实，实现了高频率、高强度夯实作业，影响深度3米，充分保证了压实效果。</div>
                  <div>&nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;针对三背回填作业面狭小，传统机械无法达到施工标准，通过使用高速液压夯实机作业补强可以有效减少沉降，针对高填路基，高速液压夯实机代替冲击压实机每2米补强，</div>
                  <div>代替强夯每8米补强，切实减少工后沉降。高速液压夯实机在公路路基填筑中主要用于达标路基的补压增强（补强﹑追密）及直接夯实。</div>
                  <div>主要应用部位桥涵墙背﹑填挖结合部﹑新旧路结合部及加宽部﹑鸡爪沟﹑高填方﹑冲击压路机碾压盲区﹑不便或不宜使用强夯的部位等，以及其他需要补强或直接夯实的部位。</div>
                  <div>&nbsp; &nbsp; &nbsp; &nbsp;
                    　高速液压夯实机采用进口高速油缸，其液压系统采用差动回路和蓄能器加压补偿等多项技术，大大提高落锤效率并降低能量损耗；同时，标配GPS卫星水平定位仪，</div>
                  <div>精准定位主机与工作面的垂直角度，确保工作状态正常，极大的提高了作业安全性。</div>
                  <div>　液压夯实机适合桥台背、半填半挖、局部高填方及狭小面积作业，因此经该技术补强后的路基表面竖向变形一般可达10cm以上，可显著提高回填土压实度，可将一定厚度范围内回填土沉降加速消除，</div>
                  <div>对于提高回填土工程质量效果明显，意义显著。在使用高速液压夯实机冲击夯实技术之前，国内高速公路桥台与路面结合部分、新旧路交界处普遍存在基础的不均匀沉降或沉降率不一致。</div>
                </div>
                <div>&nbsp;</div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：<a href="19.html">中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</a></li>
                  <li>下一篇： 没有了</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示', 1, '/var/www/html/441/a/jishuzhanshi/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 技术展示</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="line show_list">
              <ul class="list-media article-media">
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="33.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg"
                          alt="汽车零部件知识的详细分析" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="汽车零部件知识的详细分析" href="33.html">汽车零部件知识的详细分析</a></h3>
                      <div class="time">时间:2018-01-31</div>
                      <p class="desc">我们不需要准确地理解汽车的所有部分，但我们需要知道汽车的四个主要部分， 即：汽车发动机。 ；②汽车底盘；③车身；④汽车电器与电子设备。 1，发...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="32.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg"
                          alt="买几把洗水枪的小窍门" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="买几把洗水枪的小窍门" href="32.html">买几把洗水枪的小窍门</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">有些车主选择自己动手洗车在家，因为它既经济又方便，有些洗车工具自然受到市民追捧，但购买水洗水枪除了看到水的状况外，还得考虑水枪的压力。只...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="31.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg"
                          alt="雨天镜看不到治疗方法" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="雨天镜看不到治疗方法" href="31.html">雨天镜看不到治疗方法</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">下雨天不仅给我们的日常生活带来了许多不便，也给我们开车带来了许多不便。下雨天，我们经常发现左右两侧的后视镜覆盖水，无法清晰地看到汽车的左...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="30.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="你知道汽车备用轮胎最长的寿命吗？"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="你知道汽车备用轮胎最长的寿命吗？" href="30.html">你知道汽车备用轮胎最长的寿命吗？</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">爆胎的车主会发现一个现象：汽车备胎比普通轮胎小，而且大部分颜色鲜艳，为什么这样做？人胎胎也是，主要目的是提醒车主及时更换备胎。有人说，轮...</p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="29.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg"
                          alt="简单实用的维修技术" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="简单实用的维修技术" href="29.html">简单实用的维修技术</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc">汽车每天在不同的道路上行驶，难免会受到损坏。但有时车辆在行驶，村前不能开店怎么办，所以车主每天需要学习简单的维修技术，在紧急情况下使用。...</p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示1', 1, '/var/www/html/441/a/jishuzhanshi/33.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>技术展示</title>
  <meta name="keywords" content="技术展示">
  <meta name="description" content="技术展示">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>盘点强夯机最全操作方法</h1>
              <div class="padding-bottom qhd-title">・2021-05-11 第01<strong>号放大缩小放大缩小</strong></div>
              <div class="description">
                <div>
                  <div>1.强夯法适用于碎石土、砂土、低饱和度粉土、粘性土、湿陷性黄土、高回填土、杂填土等地基加固工程；也可用于粉土及粉砂液化的地基加固工程；</div>
                  <div>但不得用于不允许对工程周围建筑物和设备有一定振动 影响的地基加固工程，必须用时，应采取防震、隔震措施。</div>
                  <div>强夯机在工地上的需求量还是蛮大的，建筑施工地区一般灰层比较多，所处地势也比较风险，有高血压心脏病及视力不清等症的人员是不能进入施工地区</div>
                  <div>更不能操作强夯机。使用强夯机前，应将起重臂仰角置于70&deg;。改换强夯机夯位时，应重新检查门架支脚，将锤提高100~300mm,检查整机的稳定性，可靠后方可作业。</div>
                  <div>强夯机夯锤下落后，将吊钩将至垂吊环邻近，作业后，应将夯锤下架，放真实地上。强夯施工队是一支专业从事地基处理的施工部队，技术力量雄厚，设备配套齐全，</div>
                  <div>拥有各类强夯设备数余台，能够承接各类广场，公路码头，厂房的基础强夯施工和强夯置换施工任务，大力推行项目法 施工，坚持以质量求生存，以信誉谋发展的原则，</div>
                  <div>在很多的工程实践中，积累了很多的施工经验。</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：没有了</li>
                  <li>下一篇：强夯机工作原理及市场</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示2', 1, '/var/www/html/441/a/jishuzhanshi/32.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>技术展示</title>
  <meta name="keywords" content="技术展示">
  <meta name="description" content="技术展示">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>强夯机的工作原理及市场</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11<strong>点击:</strong></div>
              <div class="description">
                <div class="description">&nbsp;1.动力密实</div>
                <div class="description">&nbsp; &nbsp;
                  使用强夯机加固多孔隙、粗颗粒、非饱和土是基于动力密实的机理，即用冲击型动力荷载使土中的孔隙体积减小，土体变得密实，从而提高地基土的强度，</div>
                <div class="description">非饱和土的夯实过程，就是土中的气相被挤出的过程。</div>
                <div class="description">&nbsp; &nbsp;2.动力固结</div>
                <div class="description">动力固结理论是梅纳本人提出的，梅纳认为：</div>
                <div class="description">由于土中存在微小气泡，孔隙水具有压缩性；</div>
                <div class="description">由于冲击力的反复作用，孔隙水压力上升，地基发生液化；</div>
                <div class="description">由于裂隙土接近液化或处于液化状态，还由于细粒土的薄膜水有一部分变为自由水，土的透水性增大；</div>
                <div class="description">由于静置，孔隙水压力降低，土的触变性恢复。</div>
                <div class="description">强夯机法处理细颗粒饱和土，即饱和度较高的粘性土、湿陷性黄土就是基于这一固结机理。但这一机理在很长时间内，在强夯机实践中并没有明显效果。</div>
                <div class="description">&nbsp; &nbsp;3.动力置换</div>
                <div class="description">动力置换可分为整体置换和桩式置换。整体置换是采用强夯机将碎石整体挤入淤泥中，其作用机理类似于换土垫层法；桩式置换是通过强夯机将碎石土填筑土体中，</div>
                <div class="description">
                  部分碎石墩间隔地夯入土中，形成桩式或墩式的碎石桩（墩）。其作用机理类似于振冲法等形成的碎石桩，它主要靠碎石摩擦角和墩间土的侧限来维持桩体的平衡，并与墩间土起复合地基的作</div>
                <div class="description">&nbsp; &nbsp;强夯市场</div>
                <div class="description">&nbsp;
                  &nbsp;强夯单价一般以强夯项目地基施工每平方米的价格及项目所需锤头参数及施工工艺这种方式计算总价，当然特殊情况下也会采取其他核算方式。由于其受到影响的因素较多，</div>
                <div class="description">所以强夯单价多少钱是不固定的。目前强夯机市场占有率仍有优势，投资回报还是很客观的。</div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：盘点强夯机最强的操作方法</li>
                  <li>下一篇：液压夯实机为什么又叫液压强夯机或轻型强夯机</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示3', 1, '/var/www/html/441/a/jishuzhanshi/31.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>技术展示</title>
  <meta name="keywords" content="技术展示">
  <meta name="description" content="技术展示">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <div class="layout inner-title-bg">
    <div class="container">
      <div class="title">
        <ul class="bread">
          <ul class="bread">
            <li>&nbsp;</li>
          </ul>
        </ul>
        <a href="index.html">主页</a>
        <ul class="bread">
          <ul class="bread">&gt;</ul>
        </ul>
        <a href="news/index.html">新闻中心</a>
        <ul class="bread">
          <ul class="bread">&gt;</ul>
        </ul>
        <a href="index.html">技术展示</a>
        <ul class="bread">&gt;</ul>
        <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
      </div>
    </div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>液压夯实机为什么又叫液压强夯机或轻型强夯机</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>&nbsp;这里所说的液压夯实机或轻型强夯机就是通常我们所说的液压夯实机的别名。许多常年做工程的朋友，一下子叫不出液压夯实机的学名，根据其工作原理，</div>
                  <div>就称之为&ldquo;液压强夯机&rdquo;或&ldquo;轻型强夯机&rdquo;。</div>
                  <div>&nbsp; &nbsp; &nbsp; 实际上确实如此，液压夯实机与强夯机工作原理大致相同。</div>
                  <div>&nbsp; &nbsp; &nbsp;
                    液压夯实机与强夯机是两种不同的设备，其工作原理都是利用动能转化为冲击能来夯实土壤，只是在冲程和频率上有所不同。液压夯实机的夯击冲程约为200~1600mm，</div>
                  <div>频率快，可达30次/分钟左右，而强夯机的冲程可高达十数米，而频率则极低，可视为单个的脉冲。</div>
                  <div>&nbsp; &nbsp;
                    &nbsp;强夯机是利用机械动力将几吨至几十吨的重锤，从几米至十几米的高处自由落下，对土体进行动力夯击，使土产生强制压密而减少其压缩性、提高强度。这种加固方法业内叫&ldquo;强夯法&rdquo;，
                  </div>
                  <div>主要适用于颗粒粒径大于0.05mm的粗颗粒土，如砂土、碎石土、山皮土、粉煤灰、杂填土、回填土、低饱和度的粉土、粘性土、微膨胀土和湿陷性黄土，对饱和的粉土和粘性土无明显加固效果。</div>
                  <div>&nbsp; &nbsp;
                    液压夯实机是一种利用机器重力和变力的合力压缩土体的压实机械，对土体的压实方法可称为&ldquo;动力加固法&rdquo;或&ldquo;动力压密法&rdquo;，通过装载机或挖掘机的液压及PLC自动化控制功能来实现操作。
                  </div>
                  <div>相对而言，液压夯实机吨位较小，但工作锤头在自由落体的同时，还拥有液力助推辅助增效功能，且锤头作业面积小，也会形成较大的冲击力，个别大机型液压夯实机的夯实力还会超过小级别强夯机，</div>
                  <div>正是因此，液压夯实机又被人们叫做液压强夯机或轻型强夯机。</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：强夯机的工作原理及市场</li>
                  <li>下一篇：<a href="32.html">强夯施工的优点是什么？正确的施工步骤有哪些？</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示4', 1, '/var/www/html/441/a/jishuzhanshi/30.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>技术展示</title>
  <meta name="keywords" content="技术展示">
  <meta name="description" content="技术展示">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>强夯施工的优点是什么？正确的施工步骤有哪些？</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div>现在的建筑工程的地基都需要对松土进行压实处理，也就都离不开打夯，小的建筑工程夯实地基用小的电动打夯机就能完成，较大的建筑工程通常对地基都有着硬性的指标，</div>
                  <div>需要夯实到某种程度才算合格，这样就对打夯机有了某些指标上的要求，因此就需要用到强夯机。</div>
                  <div>&nbsp; &nbsp;
                    强夯法即强力夯实法，又称动力固结法。是利用大型履带式强夯机将8-30吨的重锤从6-30米高度自由落下，对土进行强力夯实，迅速提高地基的承载力及压缩模量，形成比较均匀的、</div>
                  <div>密实的地基，在地基一定深度内改变了地基土的孔隙分布。</div>
                  <div>强夯法施工已广泛运用到高速公路铁路，机场、核电站、大工业区、港口填海等基础加固工程。优点工期短、效果好、造价低。</div>
                  <div>&nbsp; &nbsp; 强夯法适用于处理碎石土、砂土、低饱和度的粉土与粘性土、湿陷性黄土、素填土和杂填土等地基。强夯施工前，应在施工现场有代表性的场地上选取一个或几个试验区，</div>
                  <div>进行试夯或试验性施工。试验区数量应根据建筑场地复杂程度、建设规模及建筑类型确定。</div>
                  <div>&nbsp; &nbsp; 1.强夯施工的优点有哪些？</div>
                  <div>&nbsp; &nbsp; &nbsp;施工工艺、操作简单；适用土质范围广，加固效果显著，可取得较高的承载力，一般地基强度可提高2～5倍；压缩性可降低2～10倍，加固影响深度可达6～10m；
                  </div>
                  <div>工效高，施工速度快（一般设备每月可加固5000～10000m地基），较换上回填和桩基可缩短工期一半；节省加固原材料；施工费用低，节省投资，比换土回填节省50%费用，</div>
                  <div>与预制桩加固地基相比，可节省投资 50%～70%等。</div>
                  <div>&nbsp; &nbsp;2.浅析强夯法的三种不同加固机理：</div>
                  <div>&nbsp;
                    &nbsp;首先，动力固结：当强夯法应用于处理细颗粒饱和黏土时，其加固机理则是动力固结理论。强夯时，巨大的冲击能量在土中产生很大的应力波，破坏土体的原有结构，使土体局部发生液化并产生许多裂隙，
                  </div>
                  <div>增大了排水通道，使孔隙水顺利逸出，待超孔隙水压力消散后，土体固结。由于软土的触变性，强度得到恢复。（安利一下，触变性是指含水率不变情况下黏土因为重塑而软化，强度降低，</div>
                  <div>软化后随着静置时间延长而硬化，强度增长的性质）</div>
                  <div>&nbsp; 其次、动力密实：采用强夯法加固多孔隙、粗颗粒、非饱和黏土是基于动力密实的机理，即冲击型动力荷载，使土体中的孔隙减小，土体变得密实，从而提高地基土强度。非饱和土的夯实过程，
                  </div>
                  <div>就是土中的气相（空气）被挤出的过程，其夯实变形主要是由于土颗粒的相对位移引起。</div>
                  <div>&nbsp;
                    最后、动力置换：动力置换可分整式置换和桩式置换。整式置换是采用强夯将碎石整体挤入淤泥中，其作用机理类似于换土垫层。桩式置换是通过强夯将碎石填入土中，部分碎石桩（或墩）间隔地夯入软土中，</div>
                  <div>形成桩式（墩式）的碎石桩（墩），其作用机理类似于振冲法形成的碎石桩，整体形成复合地基。</div>
                  <div>&nbsp; &nbsp;3.强夯的正确施工步骤有哪些？</div>
                  <div>1、认真调查，确保强夯场地范围内的地下无构筑物。清除地表土，清除范围为路基坡脚外2～3m。整平后在场地上标出第一遍夯点的位置，点位偏差控制在&plusmn;20cm范围内，并测量场地高程。
                  </div>
                  <div>2、起重机就位，使夯锤对准夯点位置，测量夯前锤顶高程。</div>
                  <div>3、将夯锤起吊到预定高度，待夯锤脱钩自由下落后，放下吊钩，测量锤顶高程。若发现因坑底倾斜而造成夯锤歪斜时，及时将坑底整平。</div>
                  <div>4、重复第三项操作，完成一个夯点的夯击，即每个夯点夯6击。除满足最后2击平均夯沉量不大于50mm外，还要求总夯沉量不小于试夯总夯沉量的90%。</div>
                  <div>5、换夯点，重复第二项和第四项操作，直到完成第1遍全部夯点的夯击。用推土机将夯坑填平，并测量场地高程。</div>
                  <div>6、在规定的间隔时间后，按上述步骤逐次完成第2，3，4遍夯击。</div>
                  <div>7、选用锤质量为3t、落距为6m进行低能量满夯2遍，将场地表层松土夯实，要求后一遍与前一遍错开半夯；最后测量夯后场地高程。</div>
                  <div>
                    8、灰土封闭。在基底地面铺设一层0.20m厚2：8灰土。施工时，石灰撒入土中，不洒水进行初拌，拌匀后应闷料8～12h，再进行洒水复拌，拌匀后即整平、压实；待强度检测合格后在灰土垫层上铺设一层防渗复合土工膜。
                  </div>
                  <div>
                    9、边坡加固。路基面下0.60m处铺设双向精编土工格栅，土工格栅每层垂直间距为0.50m，最上两层沿平面铺通，其余各层深入路堤边坡宽度2.50m，格栅距边坡线的距离不小于0.10m，土工格栅对应伸长率为10%时，
                  </div>
                  <div>纵横向抗拉强度不小于25kN/m。</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：<a href="29.html">液压夯实机为什么又叫液压强夯机或轻型强夯机</a></li>
                  <li>下一篇：<a href="31.html">履带式强夯机是怎么开展路基夯实的？</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('技术展示5', 1, '/var/www/html/441/a/jishuzhanshi/29.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>技术展示</title>
  <meta name="keywords" content="技术展示">
  <meta name="description" content="技术展示">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script type="text/javascript">showNum(17, ''news'', ''add'', ''.countnum'');</script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body" id="article-box-id">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920"></div>
  </div>
  <!-- 内容展示 begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>新闻中心</h3>
            <ul id="subnav" class="nav submenu nav-navicon">
              <li><a title="Technical" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
              <li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
              <li class="active"><a class="thisclass"
                  href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
            </ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-large-bottom  content_detail">
            <div class="show_body detail">
              <h1>履带式强夯机是怎么开展路基夯实的？</h1>
              <div class="padding-bottom qhd-title">
                <strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
              <div class="description">
                <div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">路基压实施工当前普遍采用了大吨位振动压路机甚至履带式强夯机，碾压效果有了明显的改善，对于提高路基土的压实度起了很好的作用。</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp;
                        &nbsp;随着道路车流量及车载量的增大，道路施工要求也有所提高，规范规定高速公路和一级公路路面底面以下80cm-150cm部分的上路堤其压实度必须&ge;95%，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">对其它等级公路当铺筑高级路面时，其压实度亦应按高速公路和一级公路的标准采用。此外，还增加了对路堤基底的压实度不宜小于93%的规定。</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">随着我国道路基础建设的飞速发展，路基施工技术也取得了相当大的进步，对于特殊路基的处理技术也日渐成熟和完善。</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp; 1.过湿地区路基的填压。</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp;
                        &nbsp;过湿土地基的填筑比较简单，一般采用填砂砾垫层和加铺土工格栅的方法，该方法简单易行，处理效果较好。但路基的压实是相当困难的，</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">规范对此作出了若干调整：一是压实度标准可根据试验资料确定或较表列数值降低2&mdash;3个百分点二是对于天然稠度小于1.1，液限大于40，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">塑性指数大于18的粘质土，用于下路床及下路堤填料时，可采用规定的轻型压实标准；三是改善填料的性质，在土中掺加生石灰，通常可以获得预期的效果，也可采用新型吸水材料加固。</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp; 2.黄土路基的压实。</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp;
                        与其他公路路基黏性土相比，黄土尤其易受水的侵害，是一种特殊的黏性土。常将黄土路基划分为两类：非湿陷性黄土和湿陷性黄土。其中，湿陷性黄土主要分布在我国中西部地区，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">其作为路堤填筑材料时，由于受水浸湿后，本身结构被迅速破坏，应有强度减小，若施工不当则会发生很大的下沉量，引起路基失稳，特别是高路堤地段的填筑更是会引发一系列的工程病害。</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">因此，黄土路基的压实也应根据实际情况的不同合理选择。</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp; 3.冲击压实：</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp;
                        &nbsp;冲击压实处理地基的原理是用一定的冲击能量使土体里的水分扩散固结并挤密压实土体而达到加固土体的目的。冲击压实技术只适合于浅层湿陷性及湿软性黄土地基的处理，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">且其有效影响深度一般不超过80cm，冲压遍数以30遍左右为宜。在冲压施工的过程中应注意：保持最佳含水量受冲击压实机的机型限制，被冲压的路基长度一般不应小于120m，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">宽度不宜小于15m;每一层冲压前，应先沿路基边沿冲压5遍左右，以减少在冲压过程中冲击能对路基的侧向挤压作用用冲击压实机进行路堤边沿压实时速度应稍慢，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">否则，可能引起车身滑出路堤冲压时应注意轮迹的连续性，特别是调头处，不要预留空白带而影响压实效果。</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">　4.强夯施工：</span></span></div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">&nbsp;
                        &nbsp;又称动力固结法，是用起重机械将8t～40t夯锤起吊到6m～25m高度后，自由落下，给地基以强大的冲击能量的夯击，使土中出现冲击波和冲击应力，迫使土体孔隙压缩，</span></span>
                  </div>
                  <div><span
                      style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span
                        style="font-size: 16px;">土体局部液化，在夯击点周围产生裂隙，形成良好的排水通道，孔隙水和气体逸出，使土粒重新排列，经时效压密达到固结，从而提高地基承载力，降低其压缩性的一种有效地基加固方法。</span></span>
                  </div>
                  <div>&nbsp;</div>
                </div>
                <ul class="pager padding-big-top padding-big-bottom">
                  <li>上一篇：强夯施工的优点是什么？正确的施工步骤有哪些？</li>
                  <li>下一篇：没有了</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 内容展示 end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('资质证书', 1, '/var/www/html/441/a/service/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>资质证书</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/08/28/111f59c720f5a92f27f.png" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar">
            <h3>资格证书</h3>
            <ul id="subnav" class="nav submenu nav-navicon"></ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="show_content padding-bottom">
            <div class="show_list product_list_box">
              <div class="show-product">
                <div class="line-big">
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/1a3cf131fef2d7414c.md.png" width="500"
                          height="361"></div>
                      <h3><a>营业执照</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/2a79a251fc60c8f941.png" width="230"
                          height="300"></div>
                      <h3><a>营业执照</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/3a2897ceb5806db05e.png" width="230"
                          height="300"></div>
                      <h3><a>银行开户信息</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/4af49b28e9fafcc2fd.png" width="490"
                          height="696"></div>
                      <h3><a>建筑业企业资格证书</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/5a688b333bb515fb20.png" width="495"
                          height="708"></div>
                      <h3><a>建筑业企业资质证书</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/6a1fa2f6271ec9681f.png" width="1883"
                          height="2621"></div>
                      <h3><a>管理体系认证证书</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/7a2e5f518a3cf28316.png" width="350"
                          height="280"></div>
                      <h3><a>管理体系认证证书</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/8a260ed2e490ab2a82.png" width="350"
                          height="280"></div>
                      <h3><a>管理体系认证证书</a></h3>
                    </div>
                  </div>
                  <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                    <div class="item">
                      <div class="media-img"><img class="s-img click-zoom"
                          src="https://s1.imagehub.cc/images/2021/07/24/9aa715dde679c724cb.png" width="230"
                          height="300"></div>
                      <h3><a>管理体系认证证书</a></h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>邮箱：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a>湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn"></a>Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
  <div class="zoom-img"><img style="max-width: 100%; max-height: 100%;" alt=""></div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('在线留言', 1, '/var/www/html/441/a/feedback/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>在线留言</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->

</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%x;"
        src="https://s1.imagehub.cc/images/2021/08/28/_202108281145455085a741ee9f7d57.png" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="show_content padding-large-bottom ">
        <form id="concat" class="form form-block">
          <div class="form-group">
            <div class="field"><input id="name" class="input" name="name" size="50" type="text" placeholder="姓名"
                data-validate="请输入您的姓名。"></div>
          </div>
          <div class="form-group">
            <div class="field"><input id="tel" class="input" name="telPhone" size="50" type="text" placeholder="电话">
            </div>
          </div>
          <div class="form-group">
            <div class="field"><input id="gcmj" class="input" name="area" size="50" type="text" placeholder="工程面积">
            </div>
          </div>
          <div class="form-group">
            <div class="field"><textarea id="content" class="input" name="content" placeholder="内容"
                data-validate="请输入内容"></textarea></div>
          </div>
          <div class="form-button"><button class="button bg-main margin-small-right">提交</button></div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>分队：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="blank55">&nbsp;</div>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>

</html>');
INSERT INTO asf_editor (name,type,path,banner,old_content) VALUES ('联系我们', 1, '/var/www/html/441/a/contact/index.html', NULL, '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>联系我们</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
  <link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
  <script src="https://www.hnjingshou.com/skin/js/main.js"></script>
  <script
    src="https://webapi.amap.com/maps?v=1.4.15&amp;key=c93e1e293e5b1c3dc581f3ff633144d3&amp;plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Walking,AMap.Riding"></script>
    <script language="javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c93e1e293e5b1c3dc581f3ff633144d3值&plugin=AMap.ControlBar"></script>
    <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
  <!-- header begin-->
  <header id="fh5co-header">
    <div class="layout head-middle  hidden-l">
      <div class="container">
        <div class="line">
          <div class="xl12 xs6 xm5">&nbsp;</div>
          <div class="xl12 xs6 xm7 head-info text-right">
            <div class="hot-tel"><img style="vertical-align: middle;"
                src="https://www.hnjingshou.com/skin/images/top_tel.jpg">电话:137-0749-9996</div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout fixed header-box">
      <div class="container">
        <div class="line">
          <div class="xl12 xs4 xm4 xb4">
            <div class="logo">
              <h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;"
                    src="https://www.hnjingshou.com/skin/images/logo.jpeg"><span
                    class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
            </div>
          </div>
          <div class="xl12 xs8 xm8 xb8">
            <div id="nav-main1" class="nav-navicon">
              <ul class="nav  nav-inline  nav-menu nav-right">
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
                <li class=""><a class="first-level"
                    href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                    <li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/jingmi/index.html">工程案例</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index.html">工业厂房强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index1.html">道路强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index2.html">机场码头强夯</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jingmi/index3.html">住宅强夯</a></li>
                    <li><a>其他</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/news/index.html">新闻中心</a>
                  <ul class="drop-menu">
                    <li><a href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
                    <li><a href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
                  </ul>
                </li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
                <li class="current"><a class="first-level"
                    href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header><!-- header end-->
  <div class="layout">
    <div class="slideshow"><img style="height: 100%;"
        src="https://s1.imagehub.cc/images/2021/07/10/_20210710094457c63e64d6d68cd269.jpg" width="1920"></div>
  </div>
  <!-- content begin-->
  <div id="fh5co-content_show" class="layout">
    <div class="container">
      <div class="line-big" style="padding-bottom: 20px;">
        <div class="hidden-l xs4 xm3 xb3">
          <div class="leftbar" style="min-height: auto;">
            <h3>联系我们</h3>
            <ul id="subnav" class="nav submenu nav-navicon"></ul>
          </div>
        </div>
        <div class="xl12 xs8 xm9">
          <div class="content-boxs">
            <div class="detail">
              <p style="font-weight: bold; font-size: 14px; font-family: 微软雅黑;">地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期15栋1305号
              </p>
              <p style="font-weight: bold; font-size: 14px; font-family: 微软雅黑;">路线：地铁3号线星沙文体站3号出口100米</p>
              <p>电话: 13707499996<br>电子信箱: 767970239@qq.com</p>
            </div>
          </div>
        </div>
        <div id="content-map" style="width: 100%; height: 400px; top: 40px;"></div>
      </div>
    </div>
  </div>
  <!-- content end-->
  <footer>
    <div class="layout footer-top hidden-l">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>联系我们</h2>
              <div class="contact-foot">
                <p>地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号房</p>
                <p>电话: 137-0749-9996</p>
                <p>邮箱：767970239@qq.com</p>
              </div>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>关于我们</h2>
              <ul>
                <li><a title="公司概况" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
                <li><a title="公司概念" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
                <li><a title="公司网络" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
              </ul>
            </div>
          </div>
          <div class="xl12 xs4 xm4 margin-large-bottom">
            <div class="plist">
              <h2>新闻中心</h2>
              <ul>
                <li><a title="公司新闻" href="https://www.hnjingshou.com/a/news/index.html">公司新闻</a></li>
                <li><a title="行业新闻" href="https://www.hnjingshou.com/a/news/index.html">行业新闻</a></li>
                <li><a title="技术展示" href="https://www.hnjingshou.com/a/news/index.html">技术展示</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layout  footer-bot about">
      <div class="container">
        <div class="line-big">
          <div class="xl12 xs12 xm4">
            <div class="foot-flink">友情链接: <a target="_blank">湖南荆首建设工程有限公司</a></div>
          </div>
          <div class="xl12 xs12 xm8">
            <div class="Copyright"><a href="https://beian.miit.gov.cn">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</a></div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div id="toolbar" class="layout text-center">
    <div class="x4"><a href="https://www.hnjingshou.com/index.html"><span class="icon-home"></span>首页</a></div>
    <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
    <div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
  </div>
</body>
<script>
  function initMap (){
		// new AMap.Map("map-content",{
		// 	resizeEnable: true,
		// 	center: [113.0067555, 28.1187751],
		// 	zoom: 18
		// }),
		// new AMap.Marker({
		// 		map: n,
		// 		position: [113.0067555, 28.1187751]
		// }),
		// new AMap.Text({
		// 	text: "中建广场A栋1914",
		// 	textAlign: "center",
		// 	verticalAlign: "top",
		// 	draggable: !0,
		// 	cursor: "pointer",
		// 	angle: 0,
		// 	style: {
		// 			"background-color": "#fff",
		// 			border: "solid 1px #eee",
		// 			padding: "10px 20px"
		// 	},
		// 	position: [113.0067555, 28.1187751]
		// 	}).setMap(n)
		map = new AMap.Map(''content-map'', {
			resizeEnable: true,
			rotateEnable:true,
			pitchEnable:true,
			zoom: 17,
			pitch:80,
			rotation:-15,
			viewMode:''3D'',//开启3D视图,默认为关闭
			buildingAnimation:true,//楼块出现是否带动画
			
			expandZoomRange:true,
			zooms:[3,20],
			center:[113.110011,28.246755]
		});
		
		map.addControl(new AMap.ControlBar({
			showZoomBar:false,
			showControlButton:true,
			position:{
				right:''10px'',
				top:''10px''
			}
		}));
	var a = 	new AMap.Marker({
				position: [113.110011,28.246755]
		});
	var b = new AMap.Text({
				text: "湖南省长沙县星沙街道开元东路95号华润置地广场二期15栋1305号",
				textAlign: "center",
				verticalAlign: "top",
				draggable: !0,
				cursor: "pointer",
				angle: 0,
				style: {
						"background-color": "#fff",
						border: "solid 1px #eee",
						padding: "10px 20px"
				},
				position: [113.110011,28.246755]
		});
		map.add(a);
		map.add(b);
	}
	initMap();
</script>
</html>');