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
INSERT INTO asf_editor (name,type,path,old_content) VALUES  ('首页',1,'/var/www/html/441/index.html','<!DOCTYPE html>
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
                  <li class=''''><a class="first-level" href=''a/jingmi/index.html''>工程案例 <span
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
            <div class="item"> <a class="zoomimgs frizoomimgs" title="网易163">
              <img src="uploads/allimg/180125/1-1P1252303460-L.png"/></a></div>
            <div class="item"> <a class="zoomimgs frizoomimgs" title="谷歌">
                <img src="uploads/allimg/180125/1-1P1252305010-L.jpg"/></a></div>
            <div class="item"> <a class="zoomimgs frizoomimgs"
                title="腾讯网">
                <img src="uploads/allimg/180125/1-1P125230A10-L.jpg"/></a></div>
            <div class="item"> <a class="zoomimgs frizoomimgs"
                title="阿里巴巴">
                <img src="uploads/allimg/180125/1-1P125230J70-L.jpg"/></a></div>
            <div class="item"> <a class="zoomimgs frizoomimgs"
               title="百度">
                <img src="uploads/allimg/180125/1-1P125230Q60-L.jpg"/></a></div>
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
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司概况',2,'/var/www/html/441/a/gongsigaikuang/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>关于我们 > 公司概况</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''current''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>关于我们</a> > <a href=''index.html''>公司概况</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">关于我们</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>关于我们</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司概况</a></li>
      <li><a href=''../gongsigainian/index.html'' title=''Technical''>公司概念</a></li>
      
      <li><a href=''../gongsiwangluo/index.html'' title=''Technical''>公司网络</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="content-boxs">
          <div class="detail"> <img alt="" src="../../uploads/allimg/180125/1-1P125202615R4.jpg" /><br />
<br />
<div>
	　　某某金属制品有限公司成立于2010，是一家集生产加工贸易为一体的实业公司。从事大型机械、模具钢材、汽车五金模具为主的加工制造企业。公司拥有近20套大型设备，提供6米以内的龙门电脑锣、龙门磨床、精铣边铣、平面铣、包包装材料全套加工服务。<br />
	&nbsp;</div>
<div>
	　　在机械板、大型铸件、焊接件、汽车五金模具、表面处理、精密零件等方面有丰富的加工经验。</div>
<br />
 </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司概念',3,'/var/www/html/441/a/gongsigainian/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>关于我们 > 公司概念</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''current''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../gongsigaikuang/index.html''>关于我们</a> > <a href=''index.html''>公司概念</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">关于我们</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>关于我们</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsigaikuang/index.html'' title=''Technical''>公司概况</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司概念</a></li>
      <li><a href=''../gongsiwangluo/index.html'' title=''Technical''>公司网络</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="content-boxs">
          <div class="detail"> <div>
	对于任何一个企业来说，只有当绝大多数员工在企业的个人价值观趋同时，才能形成整个企业的价值观。与个人价值观一样，企业所信奉和尊重的价值观是企业日常经营管理行为的内在基础。</div>
<div>
	&nbsp;</div>
<div>
	企业价值观，是指企业在追求企业成功的过程中尊重的基本信念和追求的目标。哲学上，价值观是客体对主体有用的概念。而企业价值观则是企业或广大员工一致同意的企业最终判断的含义。</div>
<div>
	&nbsp;</div>
<div>
	这里的价值是主观的和可替代的关系。一个事物是否有价值不仅取决于它有什么意义，还取决于谁在作出判断。不同的人可能做出完全不同的判断。如判断一个企业的价值，当利润、效率和创新相矛盾时，自然会选择后者，使利润、效率让路。</div>
<div>
	&nbsp;</div>
<div>
	同样，有些公司可能认为企业的价值是丰富的，企业的价值在于利润，企业的价值在于服务，企业的价值在于育人。然后，这些企业的价值可以称为&ldquo;丰富价值&rdquo;、&ldquo;利润价值&rdquo;、&ldquo;服务价值&rdquo;、&ldquo;教育价值&rdquo;。</div>
<div>
	&nbsp;</div>
<div>
	企业价值观简而言之，企业价值观是企业决策者对企业性质、目标和经营方式的选择。这是员工普遍接受的概念。</div>
<div>
	&nbsp;</div>
<div>
	（1）价值观由企业所有员工共享，而不是一个或两个人。</div>
<div>
	&nbsp;</div>
<div>
	（2）企业价值观是支配员工精神的主要价值观。</div>
<div>
	&nbsp;</div>
<div>
	（3）企业价值观是长期积累的产物，而不是突如其来的。</div>
<div>
	&nbsp;</div>
<div>
	（4）企业价值观有意识地培养结果，而不是自发的。</div>
 </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司网络',4,'/var/www/html/441/a/gongsiwangluo/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>关于我们 > 公司网络</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''current''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../gongsigaikuang/index.html''>关于我们</a> > <a href=''index.html''>公司网络</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">关于我们</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>关于我们</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsigaikuang/index.html'' title=''Technical''>公司概况</a></li>
      
      <li><a href=''../gongsigainian/index.html'' title=''Technical''>公司概念</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司网络</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="content-boxs">
          <div class="detail"> &nbsp;<img alt="" src="../../uploads/allimg/180125/1-1P12520430A64.jpg" /> </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('设备展示',5,'/var/www/html/441/a/products/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>设备展示</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''current''><a class="first-level" href=''index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>设备展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">设备展示</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
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
              <div class="line-big"> <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P125211P50-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件012</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P125211H90-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件011</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252116430-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件010</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252116000-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件009</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252115150-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);">精密汽车零件008</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252114400-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件007</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252113560-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件006</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252113240-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件005</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0);" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252112360-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0);" >精密汽车零件004</a></h3>
                  </div>
                </div> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('工程案例',6,'/var/www/html/441/a/jingmi/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>工程案例</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../products/index.html''>工程案例</a> 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">工程案例</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
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
              <div class="line-big"> <div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P125211P50-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件012">精密汽车零件012</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P125211H90-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件011">精密汽车零件011</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252116430-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件010">精密汽车零件010</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252116000-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件009">精密汽车零件009</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252115150-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件008">精密汽车零件008</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252114400-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件007">精密汽车零件007</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252113560-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件006">精密汽车零件006</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252113240-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件005">精密汽车零件005</a></h3>
                  </div>
                </div><div class="xm4 xs6 xl6 margin-large-bottom text-center">
                  <div class="item">
                    <div class="media-img"><a href="javascript:void(0)" class="zoomimgs piczoomimgs" style="background-image:url(../../uploads/allimg/180125/1-1P1252112360-L.jpg)"></a></div>
                    <h3><a href="javascript:void(0)" title="精密汽车零件004">精密汽车零件004</a></h3>
                  </div>
                </div> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('新闻中心',7,'/var/www/html/441/a/news/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>新闻中心</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>新闻中心</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-bottom">
          <div class="line show_list">
            <ul class="list-media article-media">
              <li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="../jishuzhanshi/33.html" ><img src=''../../uploads/allimg/180125/1-1P1252220110-L.jpg'' alt=''汽车零部件知识的详细分析''></a></div>
                  <div class="media-body">
                    <h3><a href="../jishuzhanshi/33.html" title="汽车零部件知识的详细分析">汽车零部件知识的详细分析</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 我们不需要准确地理解汽车的所有部分，但我们需要知道汽车的四个主要部分， 即：汽车发动机。 ；②汽车底盘；③车身；④汽车电器与电子设备。 1，发... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="../xingyexinwen/24.html" ><img src=''../../uploads/allimg/180125/1-1P1252146170-L.jpg'' alt=''金属镶件要热处理的原因。''></a></div>
                  <div class="media-body">
                    <h3><a href="../xingyexinwen/24.html" title="金属镶件要热处理的原因。">金属镶件要热处理的原因。</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 插入物用金属嵌件模制，以改善塑料制品的工作性和增加塑料制品的使用（如提高导电性或促进与其他部件的连接）。 由于金属插入件和塑料的热收缩率大... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="../gongsixinwen/18.html" ><img src=''../../uploads/allimg/180125/1-1P1252131400-L.jpg'' alt=''汽车零部件市场需要渠道整合''></a></div>
                  <div class="media-body">
                    <h3><a href="../gongsixinwen/18.html" title="汽车零部件市场需要渠道整合">汽车零部件市场需要渠道整合</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 最近，阿斯顿马丁在全球范围的大型召回问题汽车涉及17590运营。根据公布的调查由阿斯顿马丁，主要原因为质量缺陷的汽车零部件供应商，他们的论文是... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="../jishuzhanshi/32.html" ><img src=''../../uploads/allimg/180125/1-1P125221Z00-L.jpg'' alt=''买几把洗水枪的小窍门''></a></div>
                  <div class="media-body">
                    <h3><a href="../jishuzhanshi/32.html" title="买几把洗水枪的小窍门">买几把洗水枪的小窍门</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 有些车主选择自己动手洗车在家，因为它既经济又方便，有些洗车工具自然受到市民追捧，但购买水洗水枪除了看到水的状况外，还得考虑水枪的压力。只... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="../jishuzhanshi/31.html" ><img src=''../../uploads/allimg/180125/1-1P125221J80-L.jpg'' alt=''雨天镜看不到治疗方法''></a></div>
                  <div class="media-body">
                    <h3><a href="../jishuzhanshi/31.html" title="雨天镜看不到治疗方法">雨天镜看不到治疗方法</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 下雨天不仅给我们的日常生活带来了许多不便，也给我们开车带来了许多不便。下雨天，我们经常发现左右两侧的后视镜覆盖水，无法清晰地看到汽车的左... </p>
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新闻',8,'/var/www/html/441/a/gongsixinwen/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>新闻中心  /  公司新闻</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-bottom">
          <div class="line show_list">
            <ul class="list-media article-media">
              <li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="18.html" ><img src=''../../uploads/allimg/180125/1-1P1252131400-L.jpg'' alt=''汽车零部件市场需要渠道整合''></a></div>
                  <div class="media-body">
                    <h3><a href="18.html" title="汽车零部件市场需要渠道整合">汽车零部件市场需要渠道整合</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 最近，阿斯顿马丁在全球范围的大型召回问题汽车涉及17590运营。根据公布的调查由阿斯顿马丁，主要原因为质量缺陷的汽车零部件供应商，他们的论文是... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="17.html" ><img src=''../../uploads/allimg/180125/1-1P1252130390-L.jpg'' alt=''零部件售后市场集中度过低''></a></div>
                  <div class="media-body">
                    <h3><a href="17.html" title="零部件售后市场集中度过低">零部件售后市场集中度过低</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 中国的汽车配件售后市场最大的问题是浓度太低，渠道过于分散。辉集团、中国售后业务的陈伟春在接受记者采访时表示，在售后市场总经理，与卖方市场... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="16.html" ><img src=''../../uploads/allimg/180125/1-1P1252129540-L.jpg'' alt=''汽车零部件制造商如何面对新技术''></a></div>
                  <div class="media-body">
                    <h3><a href="16.html" title="汽车零部件制造商如何面对新技术">汽车零部件制造商如何面对新技术</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 雅克是一个大学aschenbroich CEO和董事会（Valeo法雷奥。他是在办公室，在法国政府和当选总统技术顾问什么是希拉克在1987年。2009年以来，他已是首席执行官... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="15.html" ><img src=''../../uploads/allimg/180125/1-1P125212Q90-L.jpg'' alt=''轻巧舒适的完美结合''></a></div>
                  <div class="media-body">
                    <h3><a href="15.html" title="轻巧舒适的完美结合">轻巧舒适的完美结合</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 阿斯派德是圣马可四系列流行的头，轻+中空+表面设计可以满足大部分的骑行爱好者的自行车座垫的要求。阿斯派德不仅舒适，运动性能是一流的。碳FX，赛... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="14.html" ><img src=''../../uploads/allimg/180125/1-1P125212G10-L.jpg'' alt=''即将上市的那些包''></a></div>
                  <div class="media-body">
                    <h3><a href="14.html" title="即将上市的那些包">即将上市的那些包</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 2016赛季，SRAM主办的喀秋莎和AG2R两日游团队。两队使用ETAP无线电在环赛上轮变换。 在2016季的盘式制动器将允许专业体育场，在前面的文章中萧边也谈到了... </p>
                  </div>
                </div>
              </li>
            </ul>
          </div
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新闻内容1',9,'/var/www/html/441/a/gongsixinwen/18.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>汽车零部件市场需要渠道整合</title>
<meta name="keywords" content="汽车,零部件,市场,需要,渠道,整合,最近," />
<meta name="description" content="最近，阿斯顿马丁在全球范围的大型召回问题汽车涉及17590运营。根据公布的调查由阿斯顿马丁，主要原因为质量缺陷的汽车零部件供应商，他们的论文是在中国使用伪造的塑性材料，" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>汽车零部件市场需要渠道整合</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-31</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=18&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	最近，阿斯顿马丁在全球范围的大型召回问题汽车涉及17590运营。根据公布的调查由阿斯顿马丁，主要原因为质量缺陷的汽车零部件供应商，他们的论文是在中国使用伪造的塑性材料，造成缺陷的部分。在售后市场的配件市场，LED在汽车市场所以离波集。实际情况是什么？记者在西安售后做的一项调查。</div>
<div>
	&nbsp;</div>
<div>
	我们做的是利益问题。</div>
<div>
	&nbsp;</div>
<div>
	&ldquo;更多好的知名品牌，假冒的更多。&rdquo;在西安市场，汽车品牌的经销商，在一unnamed说，张说。嘿，所有销售产品，是真正需要的，因为利润是多高于真正的假。博世火花塞到它，例如，博世火花塞铂正版A，光在成本价格需要40元～50元，代理销售的利润中添加到修理店，维修店的成本是50元，60元，即使修复店卖到80元，但利润，所以在20～30元，利润不高</div>
<div>
	&nbsp;</div>
<div>
	相反，如果你在卖假货，博世火花塞铂，成本是只有5元到6元，超过20元的价格贩卖店卖到修复，修复店的价格是60元，但从消费者的角度，收费价格是较低的，但两个中间或修复商店，销售利润是高于正版品。</div>
<div>
	&nbsp;</div>
<div>
	代理系统的畸形的市场推广</div>
<div>
	&nbsp;</div>
<div>
	&ldquo;关键的是卖假，读当前的代理机制太复杂，所产生的假层票价，到创建一个生活空间。&ldquo;A车修理店老板，而且油品牌代理的宋先生说。</div>
<div>
	&nbsp;</div>
<div>
	一般一门配件的公司，在美国一般要设置代理，代理，双代理。西安，a修复店（厂在无锡的生产零部件的制造商，例如，总想在无锡有一剂剂从陕西，江苏，然后卖到双代理，西安，苏州，双代理然后卖到陕西省城市然后，三个代理，销售汽车零部件公司，然后销售到维修站，然后到修理店。层和提高价格，最终价格以修复的商店，通常是高于在4S店，这是一个真正的修复，如果商店销售，就是无用的。最后，一个修复店卖到或是假品，卖小房用品，然后卖小假。</div>
<div>
	&nbsp;</div>
<div>
	配件市场需求的&ldquo;掠食者&rdquo;</div>
<div>
	&nbsp;</div>
<div>
	为了防止经销商到销售假冒零部件制造商，所以想了各种方法。之前，SKF，博世和其他外商投资企业，但也设置一个特殊的防伪打假联盟，我们的合资，稀假成本，但最终没有else。因为有市场，而且在许多国内制造商开始通过假冒品牌的创始人，著名的&ldquo;快捷方式&rdquo;的方法去做。&ldquo;山寨版&rdquo;，论文《假然而CAN和生产成本的产品达到300 %的利润，甚至更高的销售，许多小公司不这样了。</div>
<div>
	&nbsp;</div>
<div>
	&ldquo;为了消除从源说，今年是改革的焦点上的通道，这样的通道是个平面，而加强管理的飞利浦经销商销售经理说。&rdquo;A。与博世，销售负责人，他们是通过一个有限公司，专业从事防伪公司使用他们的最新的安全标准，通过&ldquo;安全码&rdquo;，以防止欺诈。在同一时间，可以提供的产品跟踪系统，供应链管理提供有效的方法来预防falsifying经销商。</div>
<div>
	&nbsp;</div>
<div>
	然而，零部件制造商crackdown是困难的，最关键的原因是，许多崛起的销售渠道，有超过10万中国工商登记零售商或批发商杂货商，超过15000个4S店，维修店约10000万独立，专业轮胎经销商，比97000煤气站。&rdquo;裂纹的过程将需要由通道的变化可以实现的。&rdquo;奇瑞汽车4S店在陕西瑶台批报销售副总经理的那只雪慢通道综合频道大型品牌似乎改变这一局面。如出现专门销售配件，&ldquo;美国&rdquo;，&ldquo;苏宁&rdquo;和&ldquo;让担心京东商城网&rdquo;样样的电力供应商，但这将是一个时间过程。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''17.html''>零部件售后市场集中度过低</a> </li>
                <li>下一篇：没有了 </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新闻内容2',10,'/var/www/html/441/a/gongsixinwen/17.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>零部件售后市场集中度过低</title>
<meta name="keywords" content="零部件,售后,市场,集中度,过低,中国,的," />
<meta name="description" content="中国的汽车配件售后市场最大的问题是浓度太低，渠道过于分散。辉集团、中国售后业务的陈伟春在接受记者采访时表示，在售后市场总经理，与卖方市场覆盖率太低。制造商可能需要" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>零部件售后市场集中度过低</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=17&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	&ldquo;中国的汽车配件售后市场最大的问题是浓度太低，渠道过于分散。&rdquo;辉集团、中国售后业务的陈伟春在接受记者采访时表示，在售后市场总经理，与卖方市场覆盖率太低。制造商可能需要面对1000个客户，难以应付。跟着假货太多。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	汇门集团的这种经验应该是一定的代表。作为一个早期进入中国的汽车零部件市场后，跨国企业，惠婵的品牌维护品牌产品，费洛多品牌的制动系统产品已在中国市场具有较高的知名度。在上海国际汽车零部件展上，惠人2014宣布将推出面向中市场的新品牌瓦格纳，并不断拓展产品线。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	辉门集团，对中国的售后业务总经理陈伟春</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	陈伟春说，在售后方面，回族人是从产品供应商向服务提供商开发，力争做顾问式销售，系统供应商和目标市场的领导者。未来，慧男将为中国消费者量身定做，为新的渠道和新的服务提供全方位的服务，以加强终端服务。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	面对市场集中度低的问题，售后市场的整合是非常重要的。目前授权店仍是汽车零部件企业售后业务的重点渠道。以菲律宾弗劳德刹车门为例，目前已经有100多家专卖店，将继续增加更多的门店。但在未来，我们将适当放慢速度，使现有门店的工作人员可以更好的训练。&rdquo;陈欢春说。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	除了这家店的传统渠道，明亮的门也在积极部署数字平台，明年第一季度将正式在天猫开启，菲利波品牌售后产品的网络店铺。这必然会与传统渠道发生冲突。陈欢春指出：&ldquo;有冲突的两个主要方面，一个是价格，其次是市场。Fingmen将采取有效措施，避免价格冲突，而有效的市场细分。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	陈欢春说：&ldquo;汽车零部件销售业务是大势所趋，但在线销售不会完全消除线路通道。作为制造商，我们正积极顺应这一趋势，并将线上线下一体化、线下销售与线下服务相结合。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''16.html''>汽车零部件制造商如何面对新技术</a> </li>
                <li>下一篇：<a href=''18.html''>汽车零部件市场需要渠道整合</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新闻内容3',11,'/var/www/html/441/a/gongsixinwen/16.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>汽车零部件制造商如何面对新技术</title>
<meta name="keywords" content="汽车,零部件,制造商,如何,面对,新技术,雅克," />
<meta name="description" content="雅克是一个大学aschenbroich CEO和董事会（Valeo法雷奥。他是在办公室，在法国政府和当选总统技术顾问什么是希拉克在1987年。2009年以来，他已是首席执行官的公司。法雷奥集团是一个行" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>汽车零部件制造商如何面对新技术</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=16&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	雅克是一个大学aschenbroich CEO和董事会（Valeo法雷奥。他是在办公室，在法国政府和当选总统技术顾问什么是希拉克在1987年。2009年以来，他已是首席执行官的公司。法雷奥集团是一个行业领先的供应商（汽车部件销售11.8亿欧元，以在2012年。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	今天，我们的工作与automakers IT，互联网，和通信公司的智能驾驶的汽车和他们的协作与传统的组件被供应。新技术的出现带来了新的挑战。未来发展到组件供应。例如，一些人开始出现speculate，三维印刷，不是一个点，在汽车公司依赖的可能性减少零部件供应商，零部件供应商的未来将是&ldquo;去&rdquo;？雅克aschenbroich法雷奥，行政总裁，安切洛蒂第一金融周刊上表达他的意见。他认为只有增加研发投资，技术创新的步伐，以跟上发展的产业。在长期中，只有最创新的公司在市场生存条件恶劣的CAN，both for组件供应商和汽车制造商。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	C：不长前，A公司不依赖于美国的零部件供应商，打印和三维打印技术的汽车零部件供应商，如何对付挑战的创新科技学院吗？</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	A：这个问题很有趣。三维印刷现在是一个非常新的技术，至少在最近几年，它是非常昂贵的，是不太可能被用于大规模生产，特别是用于汽车工业。因为汽车的生产和铸造或注塑模具的使用，因此我们公司每天产生的6万件汽车配件，它使用三维打印到不现实的。然而，在零部件的设计过程，是非常重要的试验样品。样本必须确保产品的生产开发，可以应用到汽车，但汽车制造商因此to Meet on the服概念的模型。虽然我们可以通过CAD画，但安静，发展了很多铸造厂模具，通过一个示例。的样品和生产成本是非常昂贵的，所以我们正在学习是不可能通过3D打印技术产生的样本样本，减少生产成本。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	C：在连续出现的新技术，未来的零部件供应商将被&ldquo;遗弃&rdquo;的IT？</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	答：在长期中，我们相信，只有最创新的公司生存的严酷的市场环境中CAN for a，两个组件供应商和汽车制造商。我们都知道，在2009年的全球金融危机，汽车工业是那么的痛苦。&ldquo;但我们在危机增加研发投资，研究和开发成本accounted总销售的10%，今年将在现有的基础上增加10%。从我们的观点仍然是伟大的创新空间。例如，我们现在集中在两个方面：一是技术创新，二氧化碳和其他排放，是我们如何在城市环境，辅助驾驶技术，如自动停车系统。有几个地区的方向是这样的：提供自动启动和停止功能，变速箱，包括在混合和插件的混合，和纯电动汽车的工作人员等等。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	C：现在汽车制造商是一个聪明的在汽车，汽车网络技术的研发，零部件供应商可以发挥的作用是什么？</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	答：所有的第一，有一个明确定义的汽车网络，我认为它意味着网络的汽车，这车，和外面的世界，例如，和你的智能手机和网络在一起。创新在这两个速度是inconsistent汽车和电信产业。总的来说，智能手机可以取代一些时代的一年，但一辆车总是开三或五年。现在，包括智能手机，iPad，电脑，我们已经有自己熟悉的系统，但如果你的系统和你的车流系统是完全不同的，那么你将非常适合。组件供应商需要提供一些解决方案，这是驱动，可以使用自己的公共信息系统的使用transplanted到他的车。例如，你可以把一个电话到汽车车，GPS，它是经常更新的速度比原来的多，在车的速度。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	只是说，智能车，我想它的均值的无人驾驶车辆。我的智囊团，为无人驾驶车辆一邹是可以识别周围的环境和分析收到的信息。例如，有一类应该是雷达探测器的无人车辆。当检测到前面的路，突然一球中的智能设备，能够自动确定后面的球可以即刻和随访儿童，让车辆</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''15.html''>轻巧舒适的完美结合</a> </li>
                <li>下一篇：<a href=''17.html''>零部件售后市场集中度过低</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新文内容4',12,'/var/www/html/441/a/gongsixinwen/15.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>轻巧舒适的完美结合</title>
<meta name="keywords" content="轻巧,舒适,的,完美,结合,阿斯,派德,是,圣马可," />
<meta name="description" content="阿斯派德是圣马可四系列流行的头，轻+中空+表面设计可以满足大部分的骑行爱好者的自行车座垫的要求。阿斯派德不仅舒适，运动性能是一流的。碳FX，赛车，动态三版本的选择也满足" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>轻巧舒适的完美结合</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=15&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	阿斯派德是圣马可四系列流行的头，轻+中空+表面设计可以满足大部分的骑行爱好者的自行车座垫的要求。阿斯派德不仅舒适，运动性能是一流的。碳FX，赛车，动态三版本的选择也满足不同价格的需要。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	大的开放</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	对于坐垫的舒适的开口更大是不言而喻的，对于做设计的一种新的空心开放新阿斯派德。对于敏感部位的充分释放压力和良好的通风可以非常直观的乘坐感觉。全新的开放式设计，更符合人体工程学，对于释放的压力更为彻底。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	轻</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	Three versions of Aspide are used with different bottom and track materials, respectively.</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	碳FX版采用DNA碳纤维跑道和碳纤维复合材料底材，重量仅150克。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	赛车版采用xsilite钛合金铁和碳纤维复合材料的底料，重180克。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	动力版采用锰锰合金钢轨和玻璃纤维复合底材，重215克。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	无论是顶炭FX版还是词条动态版都有不错的价格，在相应的权重表现上。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	更大的宽度</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	根据东方人的生理特点和在中国市场的主要销售的实际需要，一142mm宽版的使用。有更好的支撑性能，带来更好的舒适体验。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''14.html''>即将上市的那些包</a> </li>
                <li>下一篇：<a href=''16.html''>汽车零部件制造商如何面对新技术</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('公司新闻内容5',13,'/var/www/html/441/a/gongsixinwen/14.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>即将上市的那些包</title>
<meta name="keywords" content="即将,上市,的,那些,包,2016,赛季,SRAM,主办,的" />
<meta name="description" content="2016赛季，SRAM主办的喀秋莎和AG2R两日游团队。两队使用ETAP无线电在环赛上轮变换。 在2016季的盘式制动器将允许专业体育场，在前面的文章中萧边也谈到了SRAM的经理坦言，液压广播在发" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>公司新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      <li class=''active''><a href=''index.html'' class=''thisclass''>公司新闻</a></li>
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>即将上市的那些包</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=14&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	2016赛季，SRAM主办的喀秋莎和AG2R两日游团队。两队使用ETAP无线电在环赛上轮变换。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	在2016季的盘式制动器将允许专业体育场，在前面的文章中萧边也谈到了SRAM的经理坦言，液压广播在发展中，但具体情况公司尚未开放。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	目前唯一可见的FSA电变化仍维持在去年的环法自行车赛，2015届世界冠军航科驾驶的车。火箭队和快速轨道小组说，2016赛季的FSA不会出现在他们的车上。FSA只有赞助商的弯曲，把站、坐、只会出现在非在通孔的车。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	这确实让人们质疑FSA的电子速度。如果顶级专业团队不使用，FSA会在市场上生产这种产品吗？当然，也许不是产品本身，要知道禧玛诺，省督，SRAM的三套房有相关的数百项专利，这很可能导致FSA触电上市困难。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''13.html''>很酷的备件</a> </li>
                <li>下一篇：<a href=''15.html''>轻巧舒适的完美结合</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻',14,'/var/www/html/441/a/xingyexinwen/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>新闻中心  /  行业新闻</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-bottom">
          <div class="line show_list">
            <ul class="list-media article-media">
              <li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="24.html" ><img src=''../../uploads/allimg/180125/1-1P1252146170-L.jpg'' alt=''金属镶件要热处理的原因。''></a></div>
                  <div class="media-body">
                    <h3><a href="24.html" title="金属镶件要热处理的原因。">金属镶件要热处理的原因。</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 插入物用金属嵌件模制，以改善塑料制品的工作性和增加塑料制品的使用（如提高导电性或促进与其他部件的连接）。 由于金属插入件和塑料的热收缩率大... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="23.html" ><img src=''../../uploads/allimg/180125/1-1P1252145180-L.jpg'' alt=''未来可能是路上的贵金属''></a></div>
                  <div class="media-body">
                    <h3><a href="23.html" title="未来可能是路上的贵金属">未来可能是路上的贵金属</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 有组织的5月17日，由中国有色金属工业协会金银分会、郴州市贵银实业有限公司、北京安泰科信息有限公司（中国）主办的第十一届年会在贵金属），湖南... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="22.html" ><img src=''../../uploads/allimg/180125/1-1P1252144260-L.jpg'' alt=''金属倒在木板上，惊慌失措。''></a></div>
                  <div class="media-body">
                    <h3><a href="22.html" title="金属倒在木板上，惊慌失措。">金属倒在木板上，惊慌失措。</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 锌：上海锌跌破40日线支撑，录得四连阴，材料天运行在24050-24500元/吨，下方关注24000元/吨的整数关口。查看详情 镍：镍价上涨从六月中旬没有经历一个有... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="21.html" ><img src=''../../uploads/allimg/180125/1-1P1252142440-L.jpg'' alt=''将是未来的金铜合金？''></a></div>
                  <div class="media-body">
                    <h3><a href="21.html" title="将是未来的金铜合金？">将是未来的金铜合金？</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 众所周知，铜常被视为经济是否健康的指示器。历史上，当制造业和建筑业的总规模缩水，铜价下跌，整个制造业和建筑业正处于扩张期和铜价上涨时期。... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="20.html" ><img src=''../../uploads/allimg/180125/1-1P1252141380-L.jpg'' alt=''汽车工程塑料将取代更多的金属部件''></a></div>
                  <div class="media-body">
                    <h3><a href="20.html" title="汽车工程塑料将取代更多的金属部件">汽车工程塑料将取代更多的金属部件</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 奇瑞路虎揽胜极光，SUV的轻量化设计是比较好的车型，它被认为是同级SUV轻，而它的许多部件都是使用工程塑料。3月3日，中国工程塑料工业协会秘书长郑... </p>
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
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻1',15,'/var/www/html/441/a/xingyexinwen/24.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>金属镶件要热处理的原因。</title>
<meta name="keywords" content="金属,镶件,要,热处理,的,原因,。,插入物,用," />
<meta name="description" content="插入物用金属嵌件模制，以改善塑料制品的工作性和增加塑料制品的使用（如提高导电性或促进与其他部件的连接）。 由于金属插入件和塑料的热收缩率大不相同，在金属镶块周围的温" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>金属镶件要热处理的原因。</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-31</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=24&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	插入物用金属嵌件模制，以改善塑料制品的工作性和增加塑料制品的使用（如提高导电性或促进与其他部件的连接）。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	由于金属插入件和塑料的热收缩率大不相同，在金属镶块周围的温度下，注入模具腔内的熔体的温度非常快，对周围的塑料造成应力，这时会出现裂纹，从而使两个连接件的硬度降低。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	为了调整金属嵌件与塑料注塑温度趋于降低两叶之间的温度差，刀片必须在熔体的成型加热和加热，加热温度一般都在110以上℃，用于金属插入直径小，熔体的温度很快就会被加热的注射，一般不需预热处理。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''23.html''>未来可能是路上的贵金属</a> </li>
                <li>下一篇：没有了 </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻2',16,'/var/www/html/441/a/xingyexinwen/23.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>未来可能是路上的贵金属</title>
<meta name="keywords" content="未来,可能,是,路上,的,贵金属,有组织,的,5月," />
<meta name="description" content="有组织的5月17日，由中国有色金属工业协会金银分会、郴州市贵银实业有限公司、北京安泰科信息有限公司（中国）主办的第十一届年会在贵金属），湖南省郴州市举行。副总裁，中国" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>未来可能是路上的贵金属</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=23&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	有组织的5月17日，由中国有色金属工业协会金银分会、郴州市贵银实业有限公司、北京安泰科信息有限公司（中国）主办的第十一届年会在贵金属），湖南省郴州市举行。副总裁，中国有色金属工业协会，王健，副市长，市人民政府《郴州永贵，曹先生，主席jinui银实业有限公司永德，曹总裁jinui银实业有限公司attended交货的会议和演讲。国内和国外的珍贵金属工业企业和相关科研机构的代表在会议上attended 500以上。该会议是由chaired胡德将军，副秘书长，中国有色金属工业协会总监及稀有元素。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	王健在详细分析贵金属行业的发展在国内和国外，他说自国际金融危机爆发的2008年后的近10年中，困难的调整，目前的世界经济已出现体征的恢复，全球结构的外部需求的逐步提高，全球经济恢复的势头增强，发达的经济，不仅对经济增长路径的快速加速，新兴经济体也被恢复。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	王健尖出，中国第一季度国内生产总值增长率6.9%的很，在同一时期增加了0.2个百分点。去年第四季度相比，点，用0.1百分之去年增加点，实现了良好的开局。这表明，中国的经济发展继续保持积极的和积极的动力。今年，在有色金属工业中的供应侧的结构改革的驱动，表现在制造业的增长，价格上涨的局面，在良好的效益。其主要性能：在第一季度，中国的10个非有色金属的生产设备为13.49万吨，一个增长百分之九。该量表在8112有色金属企业营业收入（亿元1436.9安，增长19.6%。总的进出口贸易学院有色金属（包括黄金首饰和配件贸易为29.47亿美元），由上年的11.8%年在线。总固定资产投资的有色金属工业是82.4亿元。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	在2016年，美国国家110.3色调的黄金生产，下降3.6%。生产一银23706.9吨，增长9.6 %。本年第一季度，全国黄金生产的银制品很很的3.9%、8.8%。在2016年，我国贵金属矿业、主营业务收入很盈达14.1%，24.8 %；冶炼行业，主营业务收入的6%，盈利很涨4.7%；轧制，加工工业，主要业务收入下跌了1.4%，年利润上涨2.7%的年在线。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	在同一时间，把我们的贵金属深加工产品到高端的速度加快了本地化的贵金属深加工产业，建成开放，集成的前奏。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''22.html''>金属倒在木板上，惊慌失措。</a> </li>
                <li>下一篇：<a href=''24.html''>金属镶件要热处理的原因。</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻3',17,'/var/www/html/441/a/xingyexinwen/22.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>金属倒在木板上，惊慌失措。</title>
<meta name="keywords" content="金属,倒在,木板,上,惊慌失措,。,锌,上海,跌破," />
<meta name="description" content="锌：上海锌跌破40日线支撑，录得四连阴，材料天运行在24050-24500元/吨，下方关注24000元/吨的整数关口。查看详情 镍：镍价上涨从六月中旬没有经历一个有效的回调，在九月，印度尼西" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>金属倒在木板上，惊慌失措。</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=22&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	锌：上海锌跌破40日线支撑，录得四连阴，材料天运行在24050-24500元/吨，下方关注24000元/吨的整数关口。&rdquo;查看详情</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	镍：镍价上涨从六月中旬没有经历一个有效的回调，在九月，印度尼西亚将有更多的镍矿石的出口配额证明，市场逐渐认可，而废发票问题逐渐流出，不锈钢厂钢废物利用的比例或逐步回暖，坏原耗镍，镍价格下跌回调。星期五镍价下跌，今日或仍将面临惯性下跌，上海镍主力88500～89500元/吨，现货镍88300～89300元/吨。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''21.html''>将是未来的金铜合金？</a> </li>
                <li>下一篇：<a href=''23.html''>未来可能是路上的贵金属</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻4',18,'/var/www/html/441/a/xingyexinwen/21.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>将是未来的金铜合金？</title>
<meta name="keywords" content="将是,未来,的,金铜,合金,众所周知,铜,常被," />
<meta name="description" content="众所周知，铜常被视为经济是否健康的指示器。历史上，当制造业和建筑业的总规模缩水，铜价下跌，整个制造业和建筑业正处于扩张期和铜价上涨时期。 目前，铜价在3美元/磅以上，" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>将是未来的金铜合金？</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=21&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	众所周知，铜常被视为经济是否健康的指示器。历史上，当制造业和建筑业的总规模缩水，铜价下跌，整个制造业和建筑业正处于扩张期和铜价上涨时期。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	目前，铜价在3美元/磅以上，铜博士今年上涨近28%，远远超过2012至2016的五年平均水平。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	澳大利亚矿业巨头必和必拓首席商务官Arnoud balhuizen接受媒体采访时表示，上个月，铜是金属之王的未来。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	2017电动汽车市场是一个创新的一年，铜是金属之王的未来，balhuizen说。他补充说，电动汽车需要四倍以上，比一般的汽车，比一般的汽车，考虑到纯电动汽车的需求激增（BEV）在全球市场上，目前市场低估了铜的潜力。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''20.html''>汽车工程塑料将取代更多的金属部件</a> </li>
                <li>下一篇：<a href=''22.html''>金属倒在木板上，惊慌失措。</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('行业新闻5',19,'/var/www/html/441/a/xingyexinwen/20.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>汽车工程塑料将取代更多的金属部件</title>
<meta name="keywords" content="汽车,工程塑料,将,取代,更,多的,金属,部件," />
<meta name="description" content="奇瑞路虎揽胜极光，SUV的轻量化设计是比较好的车型，它被认为是同级SUV轻，而它的许多部件都是使用工程塑料。3月3日，中国工程塑料工业协会秘书长郑恺在接受采访时说，路虎揽胜" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="index.html">行业新闻</a></li>
                  
                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>行业新闻</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>行业新闻</a></li>
      <li><a href=''../jishuzhanshi/index.html'' title=''Technical''>技术展示</a></li>
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>汽车工程塑料将取代更多的金属部件</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=20&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	奇瑞路虎揽胜极光，SUV的轻量化设计是比较好的车型，它被认为是同级SUV轻，而它的许多部件都是使用工程塑料。3月3日，中国工程塑料工业协会秘书长郑恺在接受采访时说，路虎揽胜极光在一系列高层轻质材料制造，如PA/PPO合金中使用的前翼子板，对吸能块行人保护PC/PBT合金，长玻璃纤维增强用于仪表板门内模块的聚丙烯，使它的重量不到1.6吨，比35%的揽胜版打火机，二氧化碳排放量低于130克/公里。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	发达国家将塑料车用量作为衡量汽车设计和制造水平的一个重要指标，目前德国汽车消费量最大，占整车材料的15%以上。除了英国路虎、Lamborghini、奔驰SLR、宝马I系列等众多车型外，还采用了更广泛的汽车工程塑料。甚至有专家预测，未来新型材料的创新应用可能颠覆传统汽车。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	雾霾、节能和更严格的油耗法规，国内汽车企业正在不遗余力地开发汽车轻量化技术。众所周知，汽车轻量化主要体现在汽车的优化设计、合金材料和非金属材料的应用上，其次是汽车的重量损失10%至15%、30%至40%、45%至55%。郑恺告诉记者，工程塑料等非金属材料的&ldquo;减肥&rdquo;效果是显而易见的，它在汽车中的主要作用是使汽车轻量化。目前，越来越多的汽车零件开始使用工程塑料代替金属零件。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''19.html''>内需引导金属有望企稳</a> </li>
                <li>下一篇：<a href=''21.html''>将是未来的金铜合金？</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示',20,'/var/www/html/441/a/jishuzhanshi/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>新闻中心  /  技术展示</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-bottom">
          <div class="line show_list">
            <ul class="list-media article-media">
              <li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="33.html" ><img src=''../../uploads/allimg/180125/1-1P1252220110-L.jpg'' alt=''汽车零部件知识的详细分析''></a></div>
                  <div class="media-body">
                    <h3><a href="33.html" title="汽车零部件知识的详细分析">汽车零部件知识的详细分析</a></h3>
                    <div class=''time''> 时间:2018-01-31  </div>
                    <p class="desc"> 我们不需要准确地理解汽车的所有部分，但我们需要知道汽车的四个主要部分， 即：汽车发动机。 ；②汽车底盘；③车身；④汽车电器与电子设备。 1，发... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="32.html" ><img src=''../../uploads/allimg/180125/1-1P125221Z00-L.jpg'' alt=''买几把洗水枪的小窍门''></a></div>
                  <div class="media-body">
                    <h3><a href="32.html" title="买几把洗水枪的小窍门">买几把洗水枪的小窍门</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 有些车主选择自己动手洗车在家，因为它既经济又方便，有些洗车工具自然受到市民追捧，但购买水洗水枪除了看到水的状况外，还得考虑水枪的压力。只... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="31.html" ><img src=''../../uploads/allimg/180125/1-1P125221J80-L.jpg'' alt=''雨天镜看不到治疗方法''></a></div>
                  <div class="media-body">
                    <h3><a href="31.html" title="雨天镜看不到治疗方法">雨天镜看不到治疗方法</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 下雨天不仅给我们的日常生活带来了许多不便，也给我们开车带来了许多不便。下雨天，我们经常发现左右两侧的后视镜覆盖水，无法清晰地看到汽车的左... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="30.html" ><img src=''../../uploads/allimg/180125/1-1P1252216410-L.jpg'' alt=''你知道汽车备用轮胎最长的寿命吗？''></a></div>
                  <div class="media-body">
                    <h3><a href="30.html" title="你知道汽车备用轮胎最长的寿命吗？">你知道汽车备用轮胎最长的寿命吗？</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 爆胎的车主会发现一个现象：汽车备胎比普通轮胎小，而且大部分颜色鲜艳，为什么这样做？人胎胎也是，主要目的是提醒车主及时更换备胎。有人说，轮... </p>
                  </div>
                </div>
              </li><li>
                <div class="media media-x">
                  <div class="media_img float-left"><a  href="29.html" ><img src=''../../uploads/allimg/180125/1-1P1252215450-L.jpg'' alt=''简单实用的维修技术''></a></div>
                  <div class="media-body">
                    <h3><a href="29.html" title="简单实用的维修技术">简单实用的维修技术</a></h3>
                    <div class=''time''> 时间:2018-01-25  </div>
                    <p class="desc"> 汽车每天在不同的道路上行驶，难免会受到损坏。但有时车辆在行驶，村前不能开店怎么办，所以车主每天需要学习简单的维修技术，在紧急情况下使用。... </p>
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
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示1',21,'/var/www/html/441/a/jishuzhanshi/33.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>汽车零部件知识的详细分析</title>
<meta name="keywords" content="汽车,零部件,知识,的,详细,分析,我们,不需要," />
<meta name="description" content="我们不需要准确地理解汽车的所有部分，但我们需要知道汽车的四个主要部分， 即：汽车发动机。 ；②汽车底盘；③车身；④汽车电器与电子设备。 1，发动机 发动机是汽车的动力装" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>汽车零部件知识的详细分析</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-31</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=33&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	我们不需要准确地理解汽车的所有部分，但我们需要知道汽车的四个主要部分，</div>
<div>
	&nbsp;</div>
<div>
	即：汽车发动机。</div>
<div>
	&nbsp;</div>
<div>
	；②汽车底盘；③车身；④汽车电器与电子设备。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1，发动机</div>
<div>
	&nbsp;</div>
<div>
	发动机是汽车的动力装置，主要由机体、曲柄连杆机构、空气分配机构、冷却系统、润滑系统、燃油系统和点火系统（柴油机没有点火系统）组成。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1）冷却系统</div>
<div>
	&nbsp;</div>
<div>
	一般由水箱、水泵、散热器、风扇、温控器、水温、排污开关组成。汽车发动机采用两种冷却方式，即风冷和水冷。通用汽车发动机使用防冻冷却。</div>
<div>
	&nbsp;</div>
<div>
	2）润滑系统</div>
<div>
	&nbsp;</div>
<div>
	发动机润滑油泵、过滤器、油过滤器、油、限压阀、油表、压塞及油尺等组成。</div>
<div>
	&nbsp;</div>
<div>
	3）燃油系统</div>
<div>
	&nbsp;</div>
<div>
	汽油机的燃料由油箱、汽油表、汽油管、汽油滤清器、汽油泵、喷油器、空气滤清器、排气歧管等部件组成。</div>
<div>
	&nbsp;</div>
<div>
	4）点火系统</div>
<div>
	&nbsp;</div>
<div>
	由点火电源、点火开关、点火线圈、火花塞、高压线路组成。</div>
<div>
	&nbsp;</div>
<div>
	2、汽车底盘</div>
<div>
	&nbsp;</div>
<div>
	汽车底盘主要由传动系统、驱动系统、转向系统、制动系统等组成。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''32.html''>买几把洗水枪的小窍门</a> </li>
                <li>下一篇：没有了 </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示2',22,'/var/www/html/441/a/jishuzhanshi/32.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>买几把洗水枪的小窍门</title>
<meta name="keywords" content="买,几把,洗,水枪,的,小,窍门,有些,车主,选择," />
<meta name="description" content="有些车主选择自己动手洗车在家，因为它既经济又方便，有些洗车工具自然受到市民追捧，但购买水洗水枪除了看到水的状况外，还得考虑水枪的压力。只有统筹兼顾，才能达到节约用" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>买几把洗水枪的小窍门</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=32&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> 有些车主选择自己动手洗车在家，因为它既经济又方便，有些洗车工具自然受到市民追捧，但购买水洗水枪除了看到水的状况外，还得考虑水枪的压力。只有统筹兼顾，才能达到节约用水、节约用水的目的。在这里给你一些购买这些产品的一些方法和技巧。在购买之前，你必须意识到洗涤时使用的水。比如家用水管是否使用？家里的水管压力能满足吗？如果不能用水管，只能买自压式洗车水炮。如果你已经确定了上述条件，至于电压力和机械压力，那么看看你自己的喜好。
              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''31.html''>雨天镜看不到治疗方法</a> </li>
                <li>下一篇：<a href=''33.html''>汽车零部件知识的详细分析</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示3',23,'/var/www/html/441/a/jishuzhanshi/31','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>雨天镜看不到治疗方法</title>
<meta name="keywords" content="雨天,镜,看不到,治疗方法,下雨天,不仅,给," />
<meta name="description" content="下雨天不仅给我们的日常生活带来了许多不便，也给我们开车带来了许多不便。下雨天，我们经常发现左右两侧的后视镜覆盖水，无法清晰地看到汽车的左右两侧，给交通带来一些安全" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>雨天镜看不到治疗方法</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=31&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	下雨天不仅给我们的日常生活带来了许多不便，也给我们开车带来了许多不便。下雨天，我们经常发现左右两侧的后视镜覆盖水，无法清晰地看到汽车的左右两侧，给交通带来一些安全隐患。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	司机在雨中看到后视镜的情况，视线需要越过侧窗玻璃、后视镜。视线经过多层屏障加上雨后，看到后视镜的物体基本上是不可能完成的任务。那么，我们如何降低后视镜，以及窗户的一面下雨？以下4点可以分享：</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1打开后视镜加热功能。</div>
<div>
	&nbsp;</div>
<div>
	对于后视镜上的雨水加热功能，此功能相对简单，电加热后的镜子都嵌入透镜内，经过加热丝加热后，镜面温度会逐渐上升到40度以上，加速镜面水汽蒸发，确保镜头清晰。但这只是为了后视镜保持清晰，因为玻璃一侧的水是没有办法的。此外，并非所有的汽车都配备了这个功能，安装仍然是太麻烦了，所以如果你使用它，最好是在考虑这种配置之前购买汽车。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	2安装雨具</div>
<div>
	&nbsp;</div>
<div>
	雨具</div>
<div>
	&nbsp;</div>
<div>
	到后视镜加挡雨，适合雨的雨具是不太大的时候使用，但雨非常大，其作用将大大减弱，只有保证后视镜1/3非常清晰，当然，窗外安装同样的雨方能上窗户的水块，整体保持镜和侧玻璃清晰。这种安装方式更方便，价格也越来越长，也就是说，当高速雨具会增加风干。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	3驱油剂</div>
<div>
	&nbsp;</div>
<div>
	到后视镜也可以放保持后视镜视野清晰，市场上已经有很多玻璃驱油剂是硅油的主要成分，通过改变水在玻璃表面张力对玻璃染色雨洪水利用后实现后视镜镜面水，小水滴会形成一个圆形的水滴，一点点的抖动、风或水的液滴能从后视镜中分离。使用驱油剂不仅可以用于后视镜，也可以使用侧边玻璃，成本低，使用方便。但耐久性较差，一年或一个月将重新涂上一层驱油剂。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	4 DIY用肥皂或洗涤剂</div>
<div>
	&nbsp;</div>
<div>
	用干净的湿布擦拭肥皂（清洁剂），然后在后视镜上均匀地涂抹在湿布上。等3到4分钟后，将镜子背面的肥皂（洗涤剂）晾干，用纸巾擦拭即可。这种做法有点类似于驱油原理，但这种时效性和效果更差，当然，这些材料将更容易和更便宜。偶尔用A也可以用很长时间，很不方便。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	以上四种方法在一定程度上解决了后视镜水的麻烦，但即使效果再好也不能完全与阳光充足的情况相比。所以，下雨的时候，我们开车或旅行要小心。特别是汽车司机不是很好或新手，当雨量很大时，可以停在一个可靠的地方，避免最安全的驾驶最重要。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''30.html''>你知道汽车备用轮胎最长的寿命吗？</a> </li>
                <li>下一篇：<a href=''32.html''>买几把洗水枪的小窍门</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示4',24,'/var/www/html/441/a/jishuzhanshi/30.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>你知道汽车备用轮胎最长的寿命吗？</title>
<meta name="keywords" content="你,知道,汽车,备用轮胎,最,长的,寿命,吗,爆胎," />
<meta name="description" content="爆胎的车主会发现一个现象：汽车备胎比普通轮胎小，而且大部分颜色鲜艳，为什么这样做？人胎胎也是，主要目的是提醒车主及时更换备胎。有人说，轮胎比普通轮胎小，已经逐渐成" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>你知道汽车备用轮胎最长的寿命吗？</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=30&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	爆胎的车主会发现一个现象：汽车备胎比普通轮胎小，而且大部分颜色鲜艳，为什么这样做？人胎胎也是，主要目的是提醒车主及时更换备胎。有人说，轮胎比普通轮胎小，已经逐渐成为汽车的发展趋势，原因有两点：</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1，通过这种强烈的对比，为车主尽快推广备胎，为普通轮胎提供备用轮胎；</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	2，节省车厢空间，减轻重量。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	备胎不仅比普通轮胎更细腻，使用起来更需要呵护，看看如何照顾备胎呢。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1、备胎长达4年</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	许多车主认为备胎在后备箱，只要没有，你可以&ldquo;备胎到老&rdquo;，事实真的是这样吗？有的不关心汽车备胎的骨头，经常发现轮胎在轮胎老化后已经严重老化，不能使用。萧边说，备用轮胎是橡胶制品，存放时间过长会发生老化，备用轮胎老化周期一般是4年，因此建议您更换备用轮胎每四年。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	2、备胎需要定期测试。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	日常保养时，很多维修店都会忽视对备胎的保养；有的车主在长途旅行前，很少检查备胎，这种区别对待，所以备胎被冤枉了。萧边指出，无论日常保养，还是长途旅行，都需要备胎作为一种&ldquo;大保健&rdquo;，主要测试项目是胎儿正常的压力，胎侧是小裂纹，如果侧壁裂纹，跑长距离。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	3、汽车备胎不能高速行驶。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	相比之下，备胎比普通轮胎更引以为傲，需要更多的呵护。换上备用轮胎，该速度应不超过80km/h，从而避免一系列事故。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	4、防止备胎被油&ldquo;擦&rdquo;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	汽车备胎的主要组成部分是橡胶、橡胶，最忌讳油污侵蚀，即使油，也会导致备胎&ldquo;怀孕&rdquo;（肿胀）。所以，一旦发现备胎沾上油污，一定要尽快使用中性清洁剂来清洗油污。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	5、备胎不宜长期占用宫殿。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	备胎不仅小巧玲珑，而且由于使用频率低、平整率、轮胎宽度等都不同于普通轮胎，更换备胎时，四种轮胎有不同的摩擦系数，地面附着力不同，使用时间长，会影响车辆的制动系统。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''29.html''>简单实用的维修技术</a> </li>
                <li>下一篇：<a href=''31.html''>雨天镜看不到治疗方法</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('技术展示5',25,'/var/www/html/441/a/jishuzhanshi/29.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>简单实用的维修技术</title>
<meta name="keywords" content="简单,实,用的,维修,技术,汽车,每天,在,不同," />
<meta name="description" content="汽车每天在不同的道路上行驶，难免会受到损坏。但有时车辆在行驶，村前不能开店怎么办，所以车主每天需要学习简单的维修技术，在紧急情况下使用。 如果水箱的老板是否有漏水现" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
<script type="text/javascript">showNum(17,''news'',''add'',''.countnum'');</script>
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
        <div class="xl12 xs6 xm5">
          <div class="welcome-word">响应式金属制品汽车配件类keep_wan模板(自适应手机端)</div>
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
        </div>
      </div>
    </div>
  </div>
  <div class="layout fixed header-box">
    <div class="container">
      <div class="line">
        <!-- <div class="xl12 xs3 xm3 xb3">
          <div class="logo">
            <h1><a href="../../index.html" title="响应式金属制品汽车配件类keep_wan模板(自适应手机端)"><img src="../../"/></a></h1>
          </div>
        </div> -->
        <div class="xl12 xs12 xm12 xb12">
          <div class="nav-navicon" id="nav-main1">
            <ul class="nav  nav-inline  nav-menu nav-right">
              <li ><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>
                  
                  <li><a href="../gongsigainian/index.html">公司概念</a></li>
                  
                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../products/index.html''>产品展示 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../shukong/index.html">数控加工零件</a></li>
                  
                  <li><a href="../zxclj/index.html">自行车零件</a></li>
                  
                  <li><a href="../jiqi/index.html">机器零件</a></li>
                  
                  <li><a href="../jingmi/index.html">精密汽车零件</a></li>
                  
                  
                </ul>
                 </li><li class=''current''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a> 
                <ul class="drop-menu">
                  
                  
                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>
                  
                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>
                  
                  <li><a href="index.html">技术展示</a></li>
                  
                  
                </ul>
                 </li><li class=''''><a class="first-level" href=''../service/index.html''>技术服务 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span style="display:none"></span></a> 
                  
                   </li><li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span style="display:none"></span></a> 
                  
                   </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
 
<!-- header end-->

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''../news/index.html''>新闻中心</a> > <a href=''index.html''>技术展示</a> > 
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">新闻中心</h2>
    </div>
  </div>
</div>
<!-- 内容展示 begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>新闻中心</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
      <li><a href=''../gongsixinwen/index.html'' title=''Technical''>公司新闻</a></li>
      
      <li><a href=''../xingyexinwen/index.html'' title=''Technical''>行业新闻</a></li>
      <li class=''active''><a href=''index.html'' class=''thisclass''>技术展示</a></li>
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="show_content padding-large-bottom  content_detail">
          <div class="show_body detail">
            <h1>简单实用的维修技术</h1>
            <div class="padding-bottom qhd-title"> <span><strong>文章来源:</strong>未知</span><span><strong>时间:</strong>2018-01-25</span> <span><strong>点击:</strong><font class="countnum"><script src="../../plus/count.php%EF%B9%96view=yes&amp;aid=29&amp;mid=1.html"type=''text/javascript'' language="javascript"></script></font></span></div>
            <div class="description"> <div>
	汽车每天在不同的道路上行驶，难免会受到损坏。但有时车辆在行驶，村前不能开店怎么办，所以车主每天需要学习简单的维修技术，在紧急情况下使用。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	如果水箱的老板是否有漏水现象，先去维修店检查，更换新的水箱，如果漏水情况依然存在，那么这个时候业主应该考虑以下四点：第一，检查油箱盖已拧紧；质量问题；第三、尝试补进水箱，看水箱水压时，渗流的位置，然后决定修补程序；第四、拧开发动机加机油盖看油的存在的话，打开发动机更换气缸垫。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	在驾驶过程中，如果汽车水箱橡胶管接头漏水，车主可以用螺丝刀将胶管接头夹在胶管接头处，将其缠绕在两个左右，再用钳子拧紧。如胶管损坏，可用胶带断裂，系紧包装，临时使用。车辆使用后，请到修理厂更换新的橡胶软管接头。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	此外，如果汽车在行驶过程中，由于汽车振动或车辆事故，导致水箱破裂渗漏，就必须采取具体措施：漏水不超过1mm的裂缝或2mm的孔洞，水箱中加入一个水箱强力堵剂，启动汽车运行。还可以使用密封剂，如果不带泄漏剂，个别热管稍有泄漏，可暂时将单独的香烟放入水箱中，使用水循环压力，使堵塞在热管内泄漏，暂时使用。</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	上面简单的维护方法只能是紧急的，不能真正解决问题。车主自己解决后，车辆必须及时到维修店及时修理，以保证车辆的安全使用。</div>

              <ul class="pager padding-big-top padding-big-bottom">
                <li>上一篇：<a href=''28.html''>如何维护这五个部分</a> </li>
                <li>下一篇：<a href=''30.html''>你知道汽车备用轮胎最长的寿命吗？</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 内容展示 end--> 
<!--footer--> 
<footer>
  <div class="layout footer-top hidden-l">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist"> <h2>联系我们</h2>
            <div class="contact-foot">
              <p>地址: 广东省广州市番禺经济开发区58号</p>
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>
              
              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>
              
              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>
              
              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>产品展示</h2>
            <ul>
              
              <li><a href="../shukong/index.html" title="数控加工零件">数控加工零件</a></li>
              
              <li><a href="../zxclj/index.html" title="自行车零件">自行车零件</a></li>
              
              <li><a href="../jiqi/index.html" title="机器零件">机器零件</a></li>
              
              <li><a href="../jingmi/index.html" title="精密汽车零件">精密汽车零件</a></li>
              
            </ul>
          </div>
        </div><div class="xl12 xs3 xm3 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>
              
              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>
              
              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>
              
              <li><a href="index.html" title="技术展示">技术展示</a></li>
              
            </ul>
          </div>
        </div> </div>
    </div>
  </div>
  <div class="layout  footer-bot">
    <div class="container">
      <div class="line-big">
        <div class="xl12 xs12 xm4">
          <div class="foot-flink">友情链接: <a href=''javascript:void(9)'' target=''_blank''>网站模板</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(9)'' target=''_blank''>keep模版</a>   <a href=''javascript:void(0)'' target=''_blank''>keep_wan模板</a>   <a href=''javascript:void(9)'' target=''_blank''>企业网站模板</a>  </div>
        </div>
        <div class="xl12 xs12 xm8">
          <div class="Copyright">Copyright @ 2011-2018 keep_wan帮 版权所有</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<!--footer-->

<div class="blank55"></div>
<div id="toolbar" class="layout text-center">
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('资质证书',26,'/var/www/html/441/a/service/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>资质证书</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''current''><a class="first-level" href=''index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>技术服务</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">技术服务</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>技术服务</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="content-boxs">
          <div class="detail"> <div style="text-align: center;">
	<img alt="" src="../../uploads/allimg/180125/1-1P125203250218.jpg" /></div>
 </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>
</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('在线留言',26,'/var/www/html/441/a/feedback/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>在线留言</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../contact/index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>在线留言</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">在线留言</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="show_content padding-large-bottom " >
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
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="../contact/index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');
INSERT INTO asf_editor (name,type,path,old_content) VALUES ('联系我们',26,'/var/www/html/441/a/contact/index.html','<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
<title>联系我们</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/pintuer.css" />
<link rel="stylesheet" type="text/css" href="https://react.keep-wan.me/skin/css/style.css" />
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="https://react.keep-wan.me/skin/js/pintuer.js"></script>
<script src="https://react.keep-wan.me/skin/js/main.js"></script>
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
        <div class="xl12 xs6 xm5">
          
        </div>
        <div class="xl12 xs6 xm7 head-info text-right">
          <div class="hot-tel"><span>电话:</span>13707499996</div>
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
              <li class=''''><a class="first-level" href=''../../index.html''>首页</a></li>
              <li class=''''><a class="first-level" href=''../gongsigaikuang/index.html''>关于我们 <span
                    class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsigaikuang/index.html">公司概况</a></li>

                  <li><a href="../gongsigainian/index.html">公司概念</a></li>

                  <li><a href="../gongsiwangluo/index.html">公司网络</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../products/index.html''>设备展示 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../jingmi/index.html''>工程案例 <span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../news/index.html''>新闻中心 <span class="downward"></span></a>
                <ul class="drop-menu">


                  <li><a href="../gongsixinwen/index.html">公司新闻</a></li>

                  <li><a href="../xingyexinwen/index.html">行业新闻</a></li>

                  <li><a href="../jishuzhanshi/index.html">技术展示</a></li>


                </ul>
              </li>
              <li class=''''><a class="first-level" href=''../service/index.html''>资质证书<span
                    style="display:none"></span></a>

              </li>
              <li class=''''><a class="first-level" href=''../feedback/index.html''>在线留言 <span
                    style="display:none"></span></a>

              </li>
              <li class=''current''><a class="first-level" href=''index.html''>联系我们 <span
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

<div class="layout">
  <div class="slideshow"> <img src="https://react.keep-wan.me/skin/images/20171029133446781.jpg" style="height: 100%;"/></div>
</div>
<div class="layout inner-title-bg">
  <div class="container">
    <div class="title"><span class="hidden-l">
      <ul class="bread">
        <li><i class="icon-home"></i></li>
        <a href=''../../index.html''>主页</a> > <a href=''index.html''>联系我们</a>
      </ul>
      </span>
      <h2 class="hidden-s hidden-m hidden-b title">联系我们</h2>
    </div>
  </div>
</div>
<!-- content begin-->
<div class="layout"  id="fh5co-content_show">
  <div class="container">
    <div class="line-big"> 
<div class="hidden-l xs4 xm3 xb3">
  <div class="leftbar">
    <h3>联系我们</h3>
    <ul class="nav submenu nav-navicon" id="subnav">
      
    </ul>
  </div>
</div>

      <div class="xl12 xs8 xm9">
        <div class="content-boxs">
          <div class="detail">
            <p style="font-weight:bold;font-size:14px;font-family:微软雅黑;"> 地址: 广东省广州市番禺经济开发区58号 </p>
            <p> 电话: 13707499996 <br />
              传真: 020-66889888 <br />
              电子信箱: admin@admin.com </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- content end--> 
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
              <p>电话: 13707499996</p>
              <p>传真: 020-66889888</p>
              <p>邮箱: admin@admin.com</p>
            </div>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>关于我们</h2>
            <ul>

              <li><a href="../gongsigaikuang/index.html" title="公司概况">公司概况</a></li>

              <li><a href="../gongsigainian/index.html" title="公司概念">公司概念</a></li>

              <li><a href="../gongsiwangluo/index.html" title="公司网络">公司网络</a></li>

            </ul>
          </div>
        </div>
        <div class="xl12 xs4 xm4 margin-large-bottom">
          <div class="plist">
            <h2>新闻中心</h2>
            <ul>

              <li><a href="../gongsixinwen/index.html" title="公司新闻">公司新闻</a></li>

              <li><a href="../xingyexinwen/index.html" title="行业新闻">行业新闻</a></li>

              <li><a href="../jishuzhanshi/index.html" title="技术展示">技术展示</a></li>

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
  <div class="x4"><a href="../../index.html"><span class="icon-home"></span>首页</a></div>
  <div class="x4"><a href="tel:13707499996"><span class="icon-phone"></span>电话</a></div>
  <div class="x4"><a href="index.html"><span class="icon-user"></span>联系我们</a></div>
</div>

</body>
</html>');