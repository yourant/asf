-- 插入租户
INSERT INTO asf_tenancy (name,create_id) VALUES('总部集团',1);
INSERT INTO asf_tenancy (name,create_id) VALUES('公司a',1);
-- 插入(控制面板)权限数据
INSERT INTO asf_permission (code,name,type,is_system) VALUES ('asf_dash','控制台',2,1);
INSERT INTO asf_permission (code,name,type,is_system) VALUES ('asf','控制面板权限',1,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_account',2,'账户管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_permission',2,'权限管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_menu',2,'菜单管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_authapi',2,'授权api管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_role',2,'角色管理权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_audio',2,'审计管理权限',1,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_audio_error',8,'错误日志权限',2,1);
INSERT INTO asf_permission (code,parent_id,name,type,is_system) VALUES ('asf_audio_log',8,'操作日志权限',2,1);
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
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('错误日志','错误日志',9,'icon-errorcorrection_default','/control/audio-error','错误日志菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('操作日志','操作日志',10,'icon-errorcorrection_default','/control/audio-oper','操作日志菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('调度任务','调度任务',11,'icon-schedule_date','/control/scheduled_task','调度任务菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('租户管理','租户管理',12,'icon-tenancy','/control/tenancy','租户管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('部门管理','部门管理',13,'icon-bumen','/control/department','部门管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('岗位管理','岗位管理',14,'icon-gangwei','/control/post','岗位管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('多语言管理','多语言管理',15,'icon-EA','/control/translate','多语言管理菜单');
INSERT INTO asf_permission_menu (title,subtitle,permission_id,icon,menu_url,description) VALUES ('tiny富文本','tiny富文本',16,'icon-EA','/editor','富文本编辑器');
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

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (9, '获取错误日志列表',2,'/api/asf/audio/geterrorlist','get',1,'获取错误日志信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (9, '删除错误日志',2,'/api/asf/audio/deleteerror/[0-9]{1,12}','post,delete',1,'删除错误日志信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (10, '获取操作日志列表',2,'/api/asf/audio/getloglist','get',1,'获取操作日志信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (10, '删除操作日志',2,'/api/asf/audio/deletelog/[0-9]{1,12}','post,delete',1,'删除操作日志信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (11, '获取调度任务列表',2,'/api/asf/task/getlist','get',1,'获取调度任务信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '添加调度任务',2,'/api/asf/task/create','post',1,'添加调度任务信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '修改调度任务',2,'/api/asf/task/modify','post,put',1,'修改调度任务信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (11, '获取调度任务详情',2,'/api/asf/task/details','get',1,'获取调度任务详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (11, '删除调度任务',2,'/api/asf/task/delete/[0-9]{1,12}','post,delete',1,'删除调度任务信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (12, '获取租户分页列表',2,'/api/asf/tenancy/getlist','get',1,'获取租户信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '添加租户',2,'/api/asf/tenancy/create','post',1,'添加租户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '修改租户',2,'/api/asf/tenancy/modify','post,put',1,'修改租户信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (12, '获取租户详情',2,'/api/asf/tenancy/details','get',1,'获取租户详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (12, '删除租户',2,'/api/asf/tenancy/delete','post,put',1,'删除租户信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取部门分页列表',2,'/api/asf/department/getlist','get',1,'获取部门信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取部门列表',2,'/api/asf/department/getlists','get',1,'获取部门信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '添加部门',2,'/api/asf/department/create','post',1,'添加部门信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '修改部门',2,'/api/asf/department/modify','post,put',1,'修改部门信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (13, '获取部门详情',2,'/api/asf/department/details','get',1,'获取部门详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (13, '分配部门角色',2,'/api/asf/department/assign','post,put',1,'分配部门角色',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取岗位分页列表',2,'/api/asf/post/getlist','get',1,'获取岗位信息分页列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取岗位列表',2,'/api/asf/post/getlists','get',1,'获取岗位信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '添加岗位',2,'/api/asf/post/create','post',1,'添加岗位信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '修改岗位',2,'/api/asf/post/modify','post,put',1,'修改岗位信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (14, '获取岗位详情',2,'/api/asf/post/details','get',1,'获取岗位详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (14, '删除岗位',2,'/api/asf/post/delete/[0-9]{1,12}','post,delete',1,'删除岗位信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (15, '获取多语言分页列表',2,'/api/asf/translate/getlist','get',1,'获取多语言信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (15, '获取多语言所有列表',2,'/api/asf/translate/getlists','get',1,'获取多语言信息列表权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '添加多语言',2,'/api/asf/translate/create','post',1,'添加多语言信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '修改多语言',2,'/api/asf/translate/modify','post,put',1,'修改多语言信息权限',1);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description) VALUES (15, '获取多语言详情',2,'/api/asf/translate/details','get',1,'获取多语言详情权限');
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (15, '删除多语言',2,'/api/asf/translate/delete/[0-9]{1,12}','post,delete',1,'删除多语言信息权限',1);

INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '登录',1,'/api/asf/authorise/login','post',1,'登录账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '登出',1,'/api/asf/authorise/logout','post',1,'登出账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '获取登录账户信息',1,'/api/asf/account/accountinfo','get',1,'登出账户权限',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '获取租户列表集合',1,'/api/asf/tenancy/getlists','get',1,'获取租户列表集合',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '获取富文本内容',1,'/api/asf/editor/getlists','get',1,'获取富文本内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '修改富文本内容',1,'/api/asf/editor/modify','put',1,'修改富文本内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '获取轮播图',1,'/api/asf/editor/getbanner','get',1,'获取轮播图',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '提交咨询内容',1,'/api/asf/editor/concat','get',1,'提交咨询内容',0);
INSERT INTO asf_apis (permission_id, name,type,path,http_methods,is_system,description,is_logger) VALUES (16, '咨询内容列表',1,'/api/asf/editor/getConcatList','get',1,'咨询内容列表',0);
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
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (1,16);
--  下属租户运维部权限
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,2);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,6);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,7);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,8);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,9);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,10);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,12);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,13);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,14);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,15);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (2,16);
-- 下属租户普通员工
-- INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,1);
INSERT INTO asf_role_permission (role_id,permission_id) VALUES (3,16);
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
INSERT INTO asf_editor (name,type,path,old_content) VALUES  ('首页',1,'/Users/mowenfeng/Desktop/asf-react/src/assets/index.html','<!DOCTYPE html>
  <html lang="zh-cn">
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
    <title>湖南荆首建筑有限公司</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="order by " />
    <link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
    <link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
    <script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
    <script src="https://react.keep-wan.me/skin/js/jquery.flexslider-min.js"></script>
    <script src="https://react.keep-wan.me/skin/js/owl.carousel.js"></script>
    <script src="https://react.keep-wan.me/skin/js/main.js"></script>
    <script src="https://react.keep-wan.me/skin/js/index.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="https://react.keep-wan.me/skin/js/respond.js"></script>
    <![endif]-->
  
  </head>
  
  <body id="index_box_id">
    <!-- header begin-->
    <header id="fh5co-header">
      <div class="layout head-middle  hidden-l">
        <div class="container">
          <div class="line">
            <div class="xl12 xs6 xm5">
              
            </div>
            <div class="xl12 xs6 xm7 head-info text-right">
              <div class="hot-tel"><span>电话:</span>020-66889777</div>
            </div>
          </div>
        </div>
      </div>
      <div class="layout fixed header-box">
        <div class="container">
          <div class="line">
            <!-- <div class="xl12 xs3 xm3 xb3">
              <div class="logo">
                <h1><a href="index.html" title="湖南荆首建筑有限公司"><img src=""/></a></h1>
              </div>
            </div> -->
            <div class="xl12 xs12 xm12 xb12">
              <div class="nav-navicon" id="nav-main1">
                <ul class="nav  nav-inline  nav-menu nav-right">
                  <li class=''current''><a class="first-level" href=''index.html''>首页</a></li>
                  <li class=''''><a class="first-level" href=''a/gongsigaikuang/index.html''>关于我们 <span
                        class="downward"></span></a>
                    <ul class="drop-menu">
  
  
                      <li><a href="a/gongsigaikuang/index.html">公司概况</a></li>
  
                      <li><a href="a/gongsigainian/index.html">公司概念</a></li>
  
                      <li><a href="a/gongsiwangluo/index.html">公司网络</a></li>
  
  
                    </ul>
                  </li>
                  <li class=''''><a class="first-level" href=''a/products/index.html''>设备展示 <span
                        style="display:none"></span></a>
  
                  </li>
                  <li class=''''><a class="first-level" href=''a/products/index.html''>工程案例 <span
                        style="display:none"></span></a>
  
                  </li>
                  <li class=''''><a class="first-level" href=''a/news/index.html''>新闻中心 <span class="downward"></span></a>
                    <ul class="drop-menu">
  
  
                      <li><a href="a/gongsixinwen/index.html">公司新闻</a></li>
  
                      <li><a href="a/xingyexinwen/index.html">行业新闻</a></li>
  
                      <li><a href="a/jishuzhanshi/index.html">技术展示</a></li>
  
  
                    </ul>
                  </li>
                  <li class=''''><a class="first-level" href=''a/service/index.html''>资质证书<span
                        style="display:none"></span></a>
  
                  </li>
                  <li class=''''><a class="first-level" href=''a/feedback/index.html''>在线留言 <span
                        style="display:none"></span></a>
  
                  </li>
                  <li class=''''><a class="first-level" href=''a/contact/index.html''>联系我们 <span
                        style="display:none"></span></a>
  
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  
    <!-- header end-->
    <!-- picture begin-->
    <div class="layout" id="fh5co-hero">
      <div class="line">
        <div class="flexslider">
          <ul class="slides">
            <li
              style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
              <!-- <img src="uploads/allimg/180125/1-1P1252200450-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
              <img src="https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00686-3143.jpg" alt="" style="height: 100%;width: 100%;">
            </li>
            <li
              style=" width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
              <!-- <img src="uploads/allimg/180125/1-1P1252201280-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
              <img src="https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00238-790.jpg" alt="" style="height: 100%;width: 100%;">
            </li>
            <li
              style=" width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;">
              <!-- <img src="uploads/allimg/180125/1-1P1252201070-L.jpg" alt="" style="height: 100%;width: 100%;"> -->
              <img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=613200305,3618982671&fm=26&gp=0.jpg" alt="" style="height: 100%;width: 100%;">
            </li>
  
          </ul>
        </div>
      </div>
    </div>
    <div id="fh5co-keyword-list" class="layout">
    <div class="bg-keyword">
      <div class="container">
        <div class="show_content padding-large-bottom " style="max-width: 500px;margin: 0px auto;">
          <h2 class=text-center>免费获得工程报价</h2>
          <form action="javascript:void(0)"  class="form form-block" id="concat">
            <div class="form-group">
              <div class="field">
                <input type="text" class="input" id="name" name="name" size="50" data-validate="请输入您的姓名。" placeholder="姓名" />
              </div>
            </div>
            <div class="form-group">
              <div class="field">
                <input type="text" class="input" id="tel" name="telPhone" size="50"  placeholder="电话" />
              </div>
            </div>
            <div class="form-group">
              <div class="field">
                <input type="text" class="input" id="gcmj" name="area" size="50"  placeholder="工程面积" />
              </div>
            </div>
            <div class="form-group">
              <div class="field">
                <textarea  class="input" id="content" name="content"  data-validate="请输入内容" placeholder="内容"></textarea>
              </div>
            </div>
            <div class="form-button">
              <button class="button bg-main margin-small-right">提交</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- 为了保障工程质量我们都有哪些 -->
  <div class="layout footer-top" style="border-bottom: 1px solid #eee;">
    <div class="container">
      <div class="line-big">
        <h2 class="text-center" style="padding: 15px;">为了保障工程质量我们都有哪些</h2>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center">
          <div style="
            padding: 70px 15px;
            border-radius: 15px;
            min-height: 260px;
            box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);
          ">
            <h3>25年用心做强夯</h3>
            <p>25年来荆首覆盖全国所有城市，主要承接1000-18000KN.m强夯施工</p>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center">
          <div style="
          padding: 70px 15px;
          border-radius: 15px;
          min-height: 260px;
          box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);
          ">
            <h3>专业团队</h3>
            <p>自有强夯设备50多台，高中职称技术人员占比50%，工程技术管理人员占比15%业界口碑领先</p>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center">
          <div style="
          padding: 70px 15px;
          border-radius: 15px;
          min-height: 260px;
          box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);
          ">
            <h3>用心服务</h3>
            <p>荆首强夯每年施工上百万平米，全程可视化操作，好评率高达98%</p>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  <!-- 我们的服务 -->
  <div class="layout footer-top" style="border-bottom: 1px solid #eee;">
    <div class="container">
      <div class="line-big">
        <h2 class="text-center" style="padding: 15px;">我们的服务</h2>
        <p class="text-center">高效强夯可帮助作业者节省时间，快速优化改良基础，强夯置换</p>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAgz-OX8wUo_L3K3wQwtgc4lgc!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">人工湖强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAgmfKX8wUojvPDyQQw9AM49wI!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">厂房强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAgvu_X8wUopcGIJjDEBDixAw!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">实时强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAg___X8wUoubW5vAMwlAQ4rAI!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">路基强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAgl-OX8wUo9vDMmQYw2AQ4wgM!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">港口强夯</p>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom text-center" style="
          position: relative;
        ">
          <img style="height: 100%; width: 100%; min-height: 310px;" src="http://20666306.s21i.faiusr.com/2/ABUIABACGAAgmPGX8wUogKretQMw2AQ4wgM!450x450.jpg"/>
          <p style="
          position: absolute;
          bottom: 0px;
          color: #fff;
          text-align: left;
          padding-left: 5px;
          ">基地强夯</p>
        </div>
      </div>
    </div>
  </div>
  <!--products begin-->
  <div id="fh5co-product-list" class="layout">
    <div class="bg-product">
      <div class="container">
        <div class="line fh5co-heading text-center">
          <h2>资质展示</h2>
          <p class="desc">卓越，创新，积极进取，持续改进，精益求精</p>
        </div>
        <div class="line show-list">
          <div class="owl-carousel owl-carousel-carousel">
            <div class="item margin-large-bottom text-center"><a href="a/products/index.html" title="精密汽车零件012">
                <div class="media-img"><span class="zoomimgs piczoomimgs">
                    <img src="uploads/allimg/180125/1-1P125211P50-L.jpg" />
                  </span></div>
                <h3>精密汽车零件012</h3>
              </a></div>
            <div class="item margin-large-bottom text-center"><a href="a/products/index.html" title="精密汽车零件011">
                <div class="media-img"><span class="zoomimgs piczoomimgs"
                    >
                    <img src="uploads/allimg/180125/1-1P125211H90-L.jpg" />
                  </span></div>
                <h3>精密汽车零件011</h3>
              </a></div>
            <div class="item margin-large-bottom text-center"><a href="a/products/index.html" title="精密汽车零件010">
                <div class="media-img"><span class="zoomimgs piczoomimgs"
                    >
                    <img src="uploads/allimg/180125/1-1P1252116430-L.jpg" />
                  </span></div>
                <h3>精密汽车零件010</h3>
              </a></div>
            <div class="item margin-large-bottom text-center"><a href="a/products/index.html" title="精密汽车零件009">
                <div class="media-img"><span class="zoomimgs piczoomimgs"
                    >
                    <img src="uploads/allimg/180125/1-1P1252116000-L.jpg" />
                  </span></div>
                <h3>精密汽车零件009</h3>
              </a></div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--products end-->
    <!--about begin-->
    <div id="fh5co-about-us" class="layout">
      <div class="bg-about">
        <div class="container">
          <div class="inner"> <span class="more"><a href="a/gongsigaikuang/index.html">更多&gt;&gt;</a></span>
            <div class="line fh5co-heading text-center">
              <h2>关于我们</h2>
              <p class="desc">精密零件及高端珠宝公司</p>
            </div>
            <div class="show-list line">
              <div class="xl12 xs4 xm4 margin-large-bottom">
                <div class="media-img"> <img src="https://react.keep-wan.me/skin/images/about.jpg" /> </div>
              </div>
              <div class="xl12 xs8 xm8 content margin-large-bottom">
                <div class="desc"> <span class="t-top"></span> <span class="t-bottom"></span>
                  <h2>湖南荆首建筑有限公司</h2>
                  <div class="intro">
                    某某金属制品有限公司成立于2010，是一家集生产加工贸易为一体的实业公司。从事大型机械、模具钢材、汽车五金模具为主的加工制造企业。公司拥有近20套大型设备，提供6米以内的龙门电脑锣、龙门磨床、精铣边铣、平面铣、包包装材料全套加工服务。
                    在机械板、大型铸件、焊接件、汽车五金模具、表面处理、精密零件等方面有丰富的加工经验。 ... </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--about end-->
    <!--News begin-->
    <div id="fh5co-news-list" class="layout">
      <div class="bg-news">
        <div class="container">
          <div class="line fh5co-heading text-center">
            <h2>新闻中心</h2>
            <p class="desc">实时新闻，实时关注，最新进展</p>
          </div>
          <div class="line show-list">
            <div class="tab" data-toggle="hover">
              <div class="tab-body">
                <div class="tab-panel active" id="tab-art1">
                  <div class="line-big">
                    <div class="xl12 xs6 xm6 margin-large-bottom">
                      <div class="media l-item">
                        <div class="media_img"><a href="a/gongsixinwen/18.html" class="zoomimgs artzoomimgs"
                            >
                            <img src="https://react.keep-wan.me/uploads/allimg/180125/1-1P1252131400-L.jpg" />
                            </a></div>
                        <div class="media-body">
                          <h3><a href="a/gongsixinwen/18.html" title="汽车零部件市场需要渠道整合">汽车零部件市场需要渠道整合</a></h3>
                          <div class="time"> 2018/01/31</div>
                          <p class="desc"> 最近，阿斯顿马丁在全球范围的大型召回问题汽车涉及17590运营。根据公布的调查由阿斯顿马丁，主要原因为质量缺陷的汽车零部件供应商，他们的论文是... </p>
                          <p class="more"><a href="a/gongsixinwen/18.html"></a></p>
                        </div>
                      </div>
                    </div>
                    <div class="xl12 xs6 xm6 margin-large-bottom">
                      <ul>
                        <li>
                          <div class="media media-x">
                            <div class="caldata float-left">
                              <div class="content text-center">
                                <p class="day">25</p>
                                <p class="mon-year">2018/01</p>
                              </div>
                            </div>
                            <div class="media-body">
                              <h4><a href="a/gongsixinwen/17.html" title="零部件售后市场集中度过低">零部件售后市场集中度过低</a></h4>
                              <p class="desc">中国的汽车配件售后市场最大的问题是浓度太低，渠道过于分散。辉集团、中国售后业务的陈伟春在接受记者采访时表示，在售后市场总经理，与卖方市场... </p>
                              <p class="more"><a href="a/gongsixinwen/17.html"></a></p>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="media media-x">
                            <div class="caldata float-left">
                              <div class="content text-center">
                                <p class="day">25</p>
                                <p class="mon-year">2018/01</p>
                              </div>
                            </div>
                            <div class="media-body">
                              <h4><a href="a/gongsixinwen/16.html" title="汽车零部件制造商如何面对新技术">汽车零部件制造商如何面对新技术</a></h4>
                              <p class="desc">雅克是一个大学aschenbroich
                                CEO和董事会（Valeo法雷奥。他是在办公室，在法国政府和当选总统技术顾问什么是希拉克在1987年。2009年以来，他已是首席执行官... </p>
                              <p class="more"><a href="a/gongsixinwen/16.html"></a></p>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="media media-x">
                            <div class="caldata float-left">
                              <div class="content text-center">
                                <p class="day">25</p>
                                <p class="mon-year">2018/01</p>
                              </div>
                            </div>
                            <div class="media-body">
                              <h4><a href="a/gongsixinwen/15.html" title="轻巧舒适的完美结合">轻巧舒适的完美结合</a></h4>
                              <p class="desc">阿斯派德是圣马可四系列流行的头，轻+中空+表面设计可以满足大部分的骑行爱好者的自行车座垫的要求。阿斯派德不仅舒适，运动性能是一流的。碳FX，赛...
                              </p>
                              <p class="more"><a href="a/gongsixinwen/15.html"></a></p>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="media media-x">
                            <div class="caldata float-left">
                              <div class="content text-center">
                                <p class="day">25</p>
                                <p class="mon-year">2018/01</p>
                              </div>
                            </div>
                            <div class="media-body">
                              <h4><a href="a/gongsixinwen/14.html" title="即将上市的那些包">即将上市的那些包</a></h4>
                              <p class="desc">2016赛季，SRAM主办的喀秋莎和AG2R两日游团队。两队使用ETAP无线电在环赛上轮变换。
                                在2016季的盘式制动器将允许专业体育场，在前面的文章中萧边也谈到了... </p>
                              <p class="more"><a href="a/gongsixinwen/14.html"></a></p>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="media media-x">
                            <div class="caldata float-left">
                              <div class="content text-center">
                                <p class="day">25</p>
                                <p class="mon-year">2018/01</p>
                              </div>
                            </div>
                            <div class="media-body">
                              <h4><a href="a/gongsixinwen/13.html" title="很酷的备件">很酷的备件</a></h4>
                              <p class="desc">2017年9月14日，第七届亚洲自行车展将在南京国际博览中心隆重开幕。展出的不仅是琳琅满目的豪华车，还有水晶晶莹闪亮的配件哦！今天，让我们一起来看...
                              </p>
                              <p class="more"><a href="a/gongsixinwen/13.html"></a></p>
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
    <div id="fh5co-partner-list" class="layout">
      <div class="bg-partner">
        <div class="container">
          <div class="line fh5co-heading text-center">
            <h2>合作伙伴</h2>
          </div>
          <div class="line show-list">
            <div class="owl-carousel partner-carousel-carousel">
              <div class="item"> <a class="zoomimgs frizoomimgs"
                  style="background-image:url(uploads/allimg/180125/1-1P1252303460-L.png)" title="网易163"></a></div>
              <div class="item"> <a class="zoomimgs frizoomimgs"
                  style="background-image:url(uploads/allimg/180125/1-1P1252305010-L.jpg)" title="谷歌"></a></div>
              <div class="item"> <a class="zoomimgs frizoomimgs"
                  style="background-image:url(uploads/allimg/180125/1-1P125230A10-L.jpg)" title="腾讯网"></a></div>
              <div class="item"> <a class="zoomimgs frizoomimgs"
                  style="background-image:url(uploads/allimg/180125/1-1P125230J70-L.jpg)" title="阿里巴巴"></a></div>
              <div class="item"> <a class="zoomimgs frizoomimgs"
                  style="background-image:url(uploads/allimg/180125/1-1P125230Q60-L.jpg)" title="百度"></a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
                  <p>地址: 广东省广州市番禺经济开发区58号</p>
                  <p>电话: 020-66889777</p>
                  <p>传真: 020-66889888</p>
                  <p>邮箱: admin@admin.com</p>
                </div>
              </div>
            </div>
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="plist">
                <h2>关于我们</h2>
                <ul>
  
                  <li><a href="a/gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
  
                  <li><a href="a/gongsigainian/index.html" title="公司概念">公司概念</a></li>
  
                  <li><a href="a/gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
  
                </ul>
              </div>
            </div>
            <div class="xl12 xs4 xm4 margin-large-bottom">
              <div class="plist">
                <h2>新闻中心</h2>
                <ul>
  
                  <li><a href="a/gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
  
                  <li><a href="a/xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
  
                  <li><a href="a/jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
  
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
              <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a> <a
                  href=''javascript:void(9)'' target=''_blank''>keep模版</a> <a href=''javascript:void(9)''
                  target=''_blank''>keep模版</a> <a href=''javascript:void(0)'' target=''_blank''>keep模板</a> <a
                  href=''javascript:void(9)'' target=''_blank''>企业网站模板</a> </div>
            </div>
            <div class="xl12 xs12 xm8">
              <div class="Copyright">Copyright @ 2011-2018 keep帮 版权所有</div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  
    <!--footer-->
  
    <div class="blank55"></div>
    <div id="toolbar" class="layout text-center">
      <div class="x4"><a href="index.html"><span class="icon-home"></span>首页</a></div>
      <div class="x4"><a href="tel:020-66889777"><span class="icon-phone"></span>电话</a></div>
      <div class="x4"><a href="a/contact/index.html"><span class="icon-user"></span>联系我们</a></div>
    </div>
  
  </body>
  
  </html>');
