--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY "public"."asf_account_post" DROP CONSTRAINT IF EXISTS "post_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_role_permission" DROP CONSTRAINT IF EXISTS "permission_role_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_role_permission" DROP CONSTRAINT IF EXISTS "permission_permission_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_department_role" DROP CONSTRAINT IF EXISTS "dept_role_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_department_role" DROP CONSTRAINT IF EXISTS "dept_department_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_apis" DROP CONSTRAINT IF EXISTS "api_permission_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_account_role" DROP CONSTRAINT IF EXISTS "account_role_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_account_post" DROP CONSTRAINT IF EXISTS "account_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_account_role" DROP CONSTRAINT IF EXISTS "account_account_id_foreign";
ALTER TABLE IF EXISTS ONLY "public"."asf_permission_menu" DROP CONSTRAINT IF EXISTS "FK_asf_permission_menu_asf_permission_permission_id";
ALTER TABLE IF EXISTS ONLY "public"."asf_accounts" DROP CONSTRAINT IF EXISTS "FK_asf_accounts_asf_tenancy_tenancy_id";
ALTER TABLE IF EXISTS ONLY "public"."asf_accounts" DROP CONSTRAINT IF EXISTS "FK_asf_accounts_asf_department_department_id";
DROP INDEX IF EXISTS "public"."IX_asf_translate_name";
DROP INDEX IF EXISTS "public"."IX_asf_role_permission_role_id";
DROP INDEX IF EXISTS "public"."IX_asf_role_permission_permission_id";
DROP INDEX IF EXISTS "public"."IX_asf_permission_name";
DROP INDEX IF EXISTS "public"."IX_asf_permission_menu_title";
DROP INDEX IF EXISTS "public"."IX_asf_permission_menu_permission_id";
DROP INDEX IF EXISTS "public"."IX_asf_permission_menu_menu_url";
DROP INDEX IF EXISTS "public"."IX_asf_dictionary_key";
DROP INDEX IF EXISTS "public"."IX_asf_department_role_role_id";
DROP INDEX IF EXISTS "public"."IX_asf_department_role_department_id";
DROP INDEX IF EXISTS "public"."IX_asf_apis_permission_id";
DROP INDEX IF EXISTS "public"."IX_asf_apis_path";
DROP INDEX IF EXISTS "public"."IX_asf_apis_name";
DROP INDEX IF EXISTS "public"."IX_asf_accounts_username";
DROP INDEX IF EXISTS "public"."IX_asf_accounts_tenancy_id";
DROP INDEX IF EXISTS "public"."IX_asf_accounts_email";
DROP INDEX IF EXISTS "public"."IX_asf_accounts_department_id";
DROP INDEX IF EXISTS "public"."IX_asf_account_role_role_id";
DROP INDEX IF EXISTS "public"."IX_asf_account_role_account_id";
DROP INDEX IF EXISTS "public"."IX_asf_account_post_post_id";
DROP INDEX IF EXISTS "public"."IX_asf_account_post_account_id";
ALTER TABLE IF EXISTS ONLY "public"."asf_translate" DROP CONSTRAINT IF EXISTS "PK_asf_translate";
ALTER TABLE IF EXISTS ONLY "public"."asf_tenancy" DROP CONSTRAINT IF EXISTS "PK_asf_tenancy";
ALTER TABLE IF EXISTS ONLY "public"."asf_security_token" DROP CONSTRAINT IF EXISTS "PK_asf_security_token";
ALTER TABLE IF EXISTS ONLY "public"."asf_scheduled_task" DROP CONSTRAINT IF EXISTS "PK_asf_scheduled_task";
ALTER TABLE IF EXISTS ONLY "public"."asf_role_permission" DROP CONSTRAINT IF EXISTS "PK_asf_role_permission";
ALTER TABLE IF EXISTS ONLY "public"."asf_role" DROP CONSTRAINT IF EXISTS "PK_asf_role";
ALTER TABLE IF EXISTS ONLY "public"."asf_post" DROP CONSTRAINT IF EXISTS "PK_asf_post";
ALTER TABLE IF EXISTS ONLY "public"."asf_permission_menu" DROP CONSTRAINT IF EXISTS "PK_asf_permission_menu";
ALTER TABLE IF EXISTS ONLY "public"."asf_permission" DROP CONSTRAINT IF EXISTS "PK_asf_permission";
ALTER TABLE IF EXISTS ONLY "public"."asf_loginfos" DROP CONSTRAINT IF EXISTS "PK_asf_loginfos";
ALTER TABLE IF EXISTS ONLY "public"."asf_dictionary" DROP CONSTRAINT IF EXISTS "PK_asf_dictionary";
ALTER TABLE IF EXISTS ONLY "public"."asf_department_role" DROP CONSTRAINT IF EXISTS "PK_asf_department_role";
ALTER TABLE IF EXISTS ONLY "public"."asf_department" DROP CONSTRAINT IF EXISTS "PK_asf_department";
ALTER TABLE IF EXISTS ONLY "public"."asf_apis" DROP CONSTRAINT IF EXISTS "PK_asf_apis";
ALTER TABLE IF EXISTS ONLY "public"."asf_accounts" DROP CONSTRAINT IF EXISTS "PK_asf_accounts";
ALTER TABLE IF EXISTS ONLY "public"."asf_account_role" DROP CONSTRAINT IF EXISTS "PK_asf_account_role";
ALTER TABLE IF EXISTS ONLY "public"."asf_account_post" DROP CONSTRAINT IF EXISTS "PK_asf_account_post";
DROP TABLE IF EXISTS "public"."asf_translate";
DROP TABLE IF EXISTS "public"."asf_tenancy";
DROP TABLE IF EXISTS "public"."asf_security_token";
DROP TABLE IF EXISTS "public"."asf_scheduled_task";
DROP TABLE IF EXISTS "public"."asf_role_permission";
DROP TABLE IF EXISTS "public"."asf_role";
DROP TABLE IF EXISTS "public"."asf_post";
DROP TABLE IF EXISTS "public"."asf_permission_menu";
DROP TABLE IF EXISTS "public"."asf_permission";
DROP TABLE IF EXISTS "public"."asf_loginfos";
DROP TABLE IF EXISTS "public"."asf_dictionary";
DROP TABLE IF EXISTS "public"."asf_department_role";
DROP TABLE IF EXISTS "public"."asf_department";
DROP TABLE IF EXISTS "public"."asf_apis";
DROP TABLE IF EXISTS "public"."asf_accounts";
DROP TABLE IF EXISTS "public"."asf_account_role";
DROP TABLE IF EXISTS "public"."asf_account_post";
SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: asf_account_post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_account_post" (
    "id" bigint NOT NULL,
    "account_id" bigint NOT NULL,
    "post_id" bigint NOT NULL,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_account_post"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_account_post" IS '账户岗位中间表';


--
-- Name: COLUMN "asf_account_post"."account_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_account_post"."account_id" IS '账户id';


--
-- Name: COLUMN "asf_account_post"."post_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_account_post"."post_id" IS '岗位id';


--
-- Name: asf_account_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_account_post" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_account_post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_account_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_account_role" (
    "id" bigint NOT NULL,
    "account_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_account_role"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_account_role" IS '账户角色中间表';


--
-- Name: COLUMN "asf_account_role"."account_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_account_role"."account_id" IS '账户id';


--
-- Name: COLUMN "asf_account_role"."role_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_account_role"."role_id" IS '角色id';


--
-- Name: asf_account_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_account_role" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_account_role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_accounts" (
    "id" bigint NOT NULL,
    "tenancy_id" bigint,
    "department_id" bigint,
    "name" character varying(20) NOT NULL,
    "username" character varying(32) NOT NULL,
    "password" character varying(255) NOT NULL,
    "password_salt" character varying(255) NOT NULL,
    "telphone" character varying(20),
    "email" character varying(30),
    "avatar" character varying(255),
    "status" bigint DEFAULT 1,
    "is_deleted" bigint DEFAULT 0,
    "sex" bigint,
    "create_id" bigint DEFAULT 0,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "login_ip" character varying(20),
    "login_time" timestamp without time zone,
    "login_location" character varying(50),
    "token" character varying(1000),
    "refresh_token" character varying(1000),
    "expired" timestamp without time zone
);


--
-- Name: TABLE "asf_accounts"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_accounts" IS '账户表';


--
-- Name: COLUMN "asf_accounts"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_accounts"."department_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."department_id" IS '部门id';


--
-- Name: COLUMN "asf_accounts"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."name" IS '账户昵称';


--
-- Name: COLUMN "asf_accounts"."username"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."username" IS '用户名';


--
-- Name: COLUMN "asf_accounts"."password"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."password" IS '账户密码';


--
-- Name: COLUMN "asf_accounts"."password_salt"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."password_salt" IS '密码加盐';


--
-- Name: COLUMN "asf_accounts"."telphone"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."telphone" IS '账户手机号码';


--
-- Name: COLUMN "asf_accounts"."email"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."email" IS '账户邮箱';


--
-- Name: COLUMN "asf_accounts"."avatar"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."avatar" IS '账户头像';


--
-- Name: COLUMN "asf_accounts"."status"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."status" IS '账户状态, 1允许登录， 0禁止登录';


--
-- Name: COLUMN "asf_accounts"."is_deleted"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."is_deleted" IS '是否删除, 0 否, 1是';


--
-- Name: COLUMN "asf_accounts"."sex"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."sex" IS '性别 0 未知，1，男，2，女';


--
-- Name: COLUMN "asf_accounts"."create_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."create_id" IS '创建用户id';


--
-- Name: COLUMN "asf_accounts"."login_ip"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."login_ip" IS '最后登录ip';


--
-- Name: COLUMN "asf_accounts"."login_time"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."login_time" IS '最后登录时间';


--
-- Name: COLUMN "asf_accounts"."login_location"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."login_location" IS '最后登录位置';


--
-- Name: COLUMN "asf_accounts"."token"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."token" IS 'token';


--
-- Name: COLUMN "asf_accounts"."refresh_token"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."refresh_token" IS '刷新token';


--
-- Name: COLUMN "asf_accounts"."expired"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_accounts"."expired" IS '过期时间';


--
-- Name: asf_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_accounts" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_accounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_apis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_apis" (
    "id" bigint NOT NULL,
    "permission_id" bigint,
    "name" character varying(100) NOT NULL,
    "status" bigint DEFAULT 1,
    "type" bigint,
    "path" character varying(500),
    "http_methods" character varying(100),
    "is_logger" bigint DEFAULT 0,
    "description" character varying(200),
    "is_system" bigint DEFAULT 0,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_apis"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_apis" IS 'api表';


--
-- Name: COLUMN "asf_apis"."permission_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."permission_id" IS '权限id';


--
-- Name: COLUMN "asf_apis"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."name" IS 'api';


--
-- Name: COLUMN "asf_apis"."status"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."status" IS 'api状态';


--
-- Name: COLUMN "asf_apis"."type"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."type" IS 'api类型 1. openapi， 2, authapi';


--
-- Name: COLUMN "asf_apis"."path"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."path" IS 'api地址';


--
-- Name: COLUMN "asf_apis"."http_methods"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."http_methods" IS 'http 方法';


--
-- Name: COLUMN "asf_apis"."is_logger"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."is_logger" IS '是否记录日志';


--
-- Name: COLUMN "asf_apis"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."description" IS '备注';


--
-- Name: COLUMN "asf_apis"."is_system"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_apis"."is_system" IS '是否为系统权限 0 否， 1是';


--
-- Name: asf_apis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_apis" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_apis_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_department" (
    "id" bigint NOT NULL,
    "pid" bigint DEFAULT 0 NOT NULL,
    "tenancy_id" bigint,
    "name" character varying(255) NOT NULL,
    "enabled" bigint DEFAULT 1,
    "sort" integer DEFAULT 0,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_department"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_department" IS '部门表';


--
-- Name: COLUMN "asf_department"."pid"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department"."pid" IS '父id';


--
-- Name: COLUMN "asf_department"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_department"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department"."name" IS '部门名称';


--
-- Name: COLUMN "asf_department"."enabled"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department"."enabled" IS '是否启用';


--
-- Name: COLUMN "asf_department"."sort"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department"."sort" IS '排序';


--
-- Name: asf_department_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_department" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_department_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_department_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_department_role" (
    "id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    "department_id" bigint NOT NULL,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_department_role"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_department_role" IS '部门-角色中间表';


--
-- Name: COLUMN "asf_department_role"."role_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department_role"."role_id" IS '角色id';


--
-- Name: COLUMN "asf_department_role"."department_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_department_role"."department_id" IS '部门id';


--
-- Name: asf_department_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_department_role" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_department_role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_dictionary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_dictionary" (
    "Id" bigint NOT NULL,
    "code" character varying(255),
    "tenancy_id" bigint,
    "key" character varying(255),
    "Value" "text",
    "options" character varying(255),
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_dictionary"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_dictionary" IS '字典表';


--
-- Name: COLUMN "asf_dictionary"."Id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."Id" IS 'id';


--
-- Name: COLUMN "asf_dictionary"."code"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."code" IS '字典编码';


--
-- Name: COLUMN "asf_dictionary"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_dictionary"."key"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."key" IS '字典键';


--
-- Name: COLUMN "asf_dictionary"."options"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."options" IS '字典额外配置';


--
-- Name: asf_dictionary_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_dictionary" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_dictionary_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_loginfos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_loginfos" (
    "id" bigint NOT NULL,
    "account_id" bigint,
    "account_name" character varying(32),
    "type" bigint NOT NULL,
    "subject" character varying(200) NOT NULL,
    "client_ip" character varying(20),
    "client_location" character varying(50),
    "permission_id" bigint,
    "add_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "api_address" character varying(500),
    "api_request" "text",
    "api_response" "text",
    "remark" character varying(500)
);


--
-- Name: TABLE "asf_loginfos"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_loginfos" IS '日志表';


--
-- Name: COLUMN "asf_loginfos"."account_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."account_id" IS '账户id';


--
-- Name: COLUMN "asf_loginfos"."account_name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."account_name" IS '账户名称';


--
-- Name: COLUMN "asf_loginfos"."type"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."type" IS '日志类型，1： 登录日志， 2:操作日志,3 错误日志';


--
-- Name: COLUMN "asf_loginfos"."subject"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."subject" IS '登录方式';


--
-- Name: COLUMN "asf_loginfos"."client_ip"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."client_ip" IS '客户端ip';


--
-- Name: COLUMN "asf_loginfos"."client_location"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."client_location" IS '客户端位置';


--
-- Name: COLUMN "asf_loginfos"."permission_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."permission_id" IS '权限id';


--
-- Name: COLUMN "asf_loginfos"."api_address"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."api_address" IS 'api请求地址';


--
-- Name: COLUMN "asf_loginfos"."api_request"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."api_request" IS 'api请求数据';


--
-- Name: COLUMN "asf_loginfos"."api_response"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."api_response" IS 'api响应数据';


--
-- Name: COLUMN "asf_loginfos"."remark"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_loginfos"."remark" IS '备注';


--
-- Name: asf_loginfos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_loginfos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_loginfos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_permission" (
    "id" bigint NOT NULL,
    "code" character varying(255),
    "parent_id" bigint DEFAULT 0,
    "name" character varying(100) NOT NULL,
    "type" bigint NOT NULL,
    "is_system" bigint DEFAULT 0,
    "description" character varying(200),
    "sort" integer DEFAULT 0,
    "enable" bigint DEFAULT 1,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_permission"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_permission" IS '权限表';


--
-- Name: COLUMN "asf_permission"."code"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."code" IS '权限代码';


--
-- Name: COLUMN "asf_permission"."parent_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."parent_id" IS '上级id';


--
-- Name: COLUMN "asf_permission"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."name" IS '权限名';


--
-- Name: COLUMN "asf_permission"."type"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."type" IS '权限类型 1. 菜单条目权限， 2, 菜单目录,3 功能';


--
-- Name: COLUMN "asf_permission"."is_system"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."is_system" IS '是否为系统权限 0 否， 1是';


--
-- Name: COLUMN "asf_permission"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."description" IS '备注';


--
-- Name: COLUMN "asf_permission"."sort"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."sort" IS '排序';


--
-- Name: COLUMN "asf_permission"."enable"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission"."enable" IS '是否启用';


--
-- Name: asf_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_permission" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_permission_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_permission_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_permission_menu" (
    "Id" bigint NOT NULL,
    "permission_id" bigint NOT NULL,
    "title" character varying(20),
    "subtitle" character varying(100),
    "icon" character varying(250),
    "menu_hidden" bigint DEFAULT 0,
    "menu_url" character varying(250),
    "external_link" character varying(250),
    "menu_redirect" character varying(250),
    "description" character varying(500),
    "translate" character varying(500),
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_permission_menu"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_permission_menu" IS '菜单表';


--
-- Name: COLUMN "asf_permission_menu"."Id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."Id" IS 'id';


--
-- Name: COLUMN "asf_permission_menu"."permission_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."permission_id" IS '权限id';


--
-- Name: COLUMN "asf_permission_menu"."title"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."title" IS '菜单标题';


--
-- Name: COLUMN "asf_permission_menu"."subtitle"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."subtitle" IS '菜单副标题';


--
-- Name: COLUMN "asf_permission_menu"."icon"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."icon" IS '菜单图标';


--
-- Name: COLUMN "asf_permission_menu"."menu_hidden"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."menu_hidden" IS '是否隐藏, 0 否 1 是';


--
-- Name: COLUMN "asf_permission_menu"."menu_url"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."menu_url" IS '菜单地址';


--
-- Name: COLUMN "asf_permission_menu"."external_link"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."external_link" IS '外部链接地址';


--
-- Name: COLUMN "asf_permission_menu"."menu_redirect"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."menu_redirect" IS '菜单重定向地址';


--
-- Name: COLUMN "asf_permission_menu"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."description" IS '菜单备注';


--
-- Name: COLUMN "asf_permission_menu"."translate"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."translate" IS '菜单多语言';


--
-- Name: asf_permission_menu_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_permission_menu" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_permission_menu_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_post" (
    "id" bigint NOT NULL,
    "tenancy_id" bigint,
    "name" character varying(255) NOT NULL,
    "sort" integer DEFAULT 0 NOT NULL,
    "create_id" bigint DEFAULT 0,
    "description" character varying(255),
    "enabled" bigint DEFAULT 1,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_post"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_post" IS '岗位表';


--
-- Name: COLUMN "asf_post"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_post"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."name" IS '岗位名称名称';


--
-- Name: COLUMN "asf_post"."sort"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."sort" IS '排序';


--
-- Name: COLUMN "asf_post"."create_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."create_id" IS '创建者id';


--
-- Name: COLUMN "asf_post"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."description" IS '岗位名称名称';


--
-- Name: COLUMN "asf_post"."enabled"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_post"."enabled" IS '是否启用, 0 禁用 1 启用';


--
-- Name: asf_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_post" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_role" (
    "id" bigint NOT NULL,
    "tenancy_id" bigint,
    "name" character varying(20) NOT NULL,
    "description" character varying(200),
    "enable" bigint DEFAULT 1,
    "create_id" bigint DEFAULT 0 NOT NULL,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_role"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_role" IS '角色表';


--
-- Name: COLUMN "asf_role"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_role"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role"."name" IS '角色名称';


--
-- Name: COLUMN "asf_role"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role"."description" IS '备注';


--
-- Name: COLUMN "asf_role"."enable"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role"."enable" IS '是否启用';


--
-- Name: COLUMN "asf_role"."create_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role"."create_id" IS '创建用户id';


--
-- Name: asf_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_role" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_role_permission" (
    "id" bigint NOT NULL,
    "permission_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_role_permission"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_role_permission" IS '角色权限中间表';


--
-- Name: COLUMN "asf_role_permission"."permission_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role_permission"."permission_id" IS '权限id';


--
-- Name: COLUMN "asf_role_permission"."role_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_role_permission"."role_id" IS '角色id';


--
-- Name: asf_role_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_role_permission" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_role_permission_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_scheduled_task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_scheduled_task" (
    "id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" character varying(255),
    "url" character varying(255),
    "code" character varying(255),
    "task_username" character varying(255),
    "error_email" character varying(255),
    "cron" character varying(255),
    "fail_stop" integer DEFAULT 0,
    "task_status" integer DEFAULT 0,
    "params_content" character varying(255),
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_scheduled_task"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_scheduled_task" IS '任务调度表';


--
-- Name: COLUMN "asf_scheduled_task"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."name" IS '任务名称';


--
-- Name: COLUMN "asf_scheduled_task"."description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."description" IS '调度任务描述';


--
-- Name: COLUMN "asf_scheduled_task"."url"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."url" IS '调度任务执行地址';


--
-- Name: COLUMN "asf_scheduled_task"."code"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."code" IS '调度任务执行代码只限于c#代码';


--
-- Name: COLUMN "asf_scheduled_task"."task_username"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."task_username" IS '任务负责人';


--
-- Name: COLUMN "asf_scheduled_task"."error_email"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."error_email" IS '告警通知邮箱';


--
-- Name: COLUMN "asf_scheduled_task"."cron"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."cron" IS 'cron 表达式';


--
-- Name: COLUMN "asf_scheduled_task"."fail_stop"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."fail_stop" IS '失败后暂停执行, 0:失败后不停止，1,失败后停止';


--
-- Name: COLUMN "asf_scheduled_task"."task_status"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."task_status" IS '任务状态， 0:停止,1:启动';


--
-- Name: COLUMN "asf_scheduled_task"."params_content"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_scheduled_task"."params_content" IS '参数内容';


--
-- Name: asf_scheduled_task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_scheduled_task" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_scheduled_task_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_security_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_security_token" (
    "id" bigint NOT NULL,
    "account_id" bigint,
    "token" character varying(1000),
    "token_expired" timestamp without time zone,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_security_token"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_security_token" IS 'token黑名单表';


--
-- Name: COLUMN "asf_security_token"."account_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_security_token"."account_id" IS '账户id';


--
-- Name: COLUMN "asf_security_token"."token"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_security_token"."token" IS '黑名单token';


--
-- Name: COLUMN "asf_security_token"."token_expired"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_security_token"."token_expired" IS '黑名单token过期时间';


--
-- Name: asf_security_token_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_security_token" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_security_token_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_tenancy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_tenancy" (
    "id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "sort" integer DEFAULT 0,
    "level" integer DEFAULT 0,
    "create_id" bigint DEFAULT 0,
    "status" bigint DEFAULT 1,
    "is_deleted" bigint DEFAULT 0,
    "create_time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_tenancy"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_tenancy" IS '多租户';


--
-- Name: COLUMN "asf_tenancy"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."name" IS '租户名称';


--
-- Name: COLUMN "asf_tenancy"."sort"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."sort" IS '排序';


--
-- Name: COLUMN "asf_tenancy"."level"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."level" IS '等级';


--
-- Name: COLUMN "asf_tenancy"."create_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."create_id" IS '创建者id';


--
-- Name: COLUMN "asf_tenancy"."status"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."status" IS '租户状态 0禁用， 1启用';


--
-- Name: COLUMN "asf_tenancy"."is_deleted"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_tenancy"."is_deleted" IS '是否删除, 0 否, 1是';


--
-- Name: asf_tenancy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_tenancy" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_tenancy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_translate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_translate" (
    "Id" bigint NOT NULL,
    "name" character varying(250),
    "tenancy_id" bigint,
    "key" character varying(500),
    "value" character varying(500)
);


--
-- Name: TABLE "asf_translate"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_translate" IS '多语言表';


--
-- Name: COLUMN "asf_translate"."Id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."Id" IS 'id';


--
-- Name: COLUMN "asf_translate"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."name" IS '多语言名称';


--
-- Name: COLUMN "asf_translate"."tenancy_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."tenancy_id" IS '租户id';


--
-- Name: COLUMN "asf_translate"."key"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."key" IS '多语言key';


--
-- Name: COLUMN "asf_translate"."value"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."value" IS '多语言值';


--
-- Name: asf_translate_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_translate" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_translate_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asf_account_post; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_account_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_accounts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_apis; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_department; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_department_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_dictionary; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_loginfos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_permission; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_permission_menu; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_post; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_role_permission; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_scheduled_task; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_security_token; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_tenancy; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_translate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: asf_account_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_account_post_id_seq"', 1, false);


--
-- Name: asf_account_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_account_role_id_seq"', 1, false);


--
-- Name: asf_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_accounts_id_seq"', 1, false);


--
-- Name: asf_apis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_apis_id_seq"', 1, false);


--
-- Name: asf_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_department_id_seq"', 1, false);


--
-- Name: asf_department_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_department_role_id_seq"', 1, false);


--
-- Name: asf_dictionary_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_dictionary_Id_seq"', 1, false);


--
-- Name: asf_loginfos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_loginfos_id_seq"', 1, false);


--
-- Name: asf_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_permission_id_seq"', 1, false);


--
-- Name: asf_permission_menu_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_permission_menu_Id_seq"', 1, false);


--
-- Name: asf_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_post_id_seq"', 1, false);


--
-- Name: asf_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_role_id_seq"', 1, false);


--
-- Name: asf_role_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_role_permission_id_seq"', 1, false);


--
-- Name: asf_scheduled_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_scheduled_task_id_seq"', 1, false);


--
-- Name: asf_security_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_security_token_id_seq"', 1, false);


--
-- Name: asf_tenancy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_tenancy_id_seq"', 1, false);


--
-- Name: asf_translate_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_translate_Id_seq"', 1, false);


--
-- Name: asf_account_post PK_asf_account_post; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_post"
    ADD CONSTRAINT "PK_asf_account_post" PRIMARY KEY ("id");


--
-- Name: asf_account_role PK_asf_account_role; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_role"
    ADD CONSTRAINT "PK_asf_account_role" PRIMARY KEY ("id");


--
-- Name: asf_accounts PK_asf_accounts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_accounts"
    ADD CONSTRAINT "PK_asf_accounts" PRIMARY KEY ("id");


--
-- Name: asf_apis PK_asf_apis; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_apis"
    ADD CONSTRAINT "PK_asf_apis" PRIMARY KEY ("id");


--
-- Name: asf_department PK_asf_department; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_department"
    ADD CONSTRAINT "PK_asf_department" PRIMARY KEY ("id");


--
-- Name: asf_department_role PK_asf_department_role; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_department_role"
    ADD CONSTRAINT "PK_asf_department_role" PRIMARY KEY ("id");


--
-- Name: asf_dictionary PK_asf_dictionary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_dictionary"
    ADD CONSTRAINT "PK_asf_dictionary" PRIMARY KEY ("Id");


--
-- Name: asf_loginfos PK_asf_loginfos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_loginfos"
    ADD CONSTRAINT "PK_asf_loginfos" PRIMARY KEY ("id");


--
-- Name: asf_permission PK_asf_permission; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_permission"
    ADD CONSTRAINT "PK_asf_permission" PRIMARY KEY ("id");


--
-- Name: asf_permission_menu PK_asf_permission_menu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_permission_menu"
    ADD CONSTRAINT "PK_asf_permission_menu" PRIMARY KEY ("Id");


--
-- Name: asf_post PK_asf_post; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_post"
    ADD CONSTRAINT "PK_asf_post" PRIMARY KEY ("id");


--
-- Name: asf_role PK_asf_role; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_role"
    ADD CONSTRAINT "PK_asf_role" PRIMARY KEY ("id");


--
-- Name: asf_role_permission PK_asf_role_permission; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_role_permission"
    ADD CONSTRAINT "PK_asf_role_permission" PRIMARY KEY ("id");


--
-- Name: asf_scheduled_task PK_asf_scheduled_task; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_scheduled_task"
    ADD CONSTRAINT "PK_asf_scheduled_task" PRIMARY KEY ("id");


--
-- Name: asf_security_token PK_asf_security_token; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_security_token"
    ADD CONSTRAINT "PK_asf_security_token" PRIMARY KEY ("id");


--
-- Name: asf_tenancy PK_asf_tenancy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_tenancy"
    ADD CONSTRAINT "PK_asf_tenancy" PRIMARY KEY ("id");


--
-- Name: asf_translate PK_asf_translate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_translate"
    ADD CONSTRAINT "PK_asf_translate" PRIMARY KEY ("Id");


--
-- Name: IX_asf_account_post_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_account_post_account_id" ON "public"."asf_account_post" USING "btree" ("account_id");


--
-- Name: IX_asf_account_post_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_account_post_post_id" ON "public"."asf_account_post" USING "btree" ("post_id");


--
-- Name: IX_asf_account_role_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_account_role_account_id" ON "public"."asf_account_role" USING "btree" ("account_id");


--
-- Name: IX_asf_account_role_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_account_role_role_id" ON "public"."asf_account_role" USING "btree" ("role_id");


--
-- Name: IX_asf_accounts_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_accounts_department_id" ON "public"."asf_accounts" USING "btree" ("department_id");


--
-- Name: IX_asf_accounts_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_accounts_email" ON "public"."asf_accounts" USING "btree" ("email");


--
-- Name: IX_asf_accounts_tenancy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_accounts_tenancy_id" ON "public"."asf_accounts" USING "btree" ("tenancy_id");


--
-- Name: IX_asf_accounts_username; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_accounts_username" ON "public"."asf_accounts" USING "btree" ("username");


--
-- Name: IX_asf_apis_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_apis_name" ON "public"."asf_apis" USING "btree" ("name");


--
-- Name: IX_asf_apis_path; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_apis_path" ON "public"."asf_apis" USING "btree" ("path");


--
-- Name: IX_asf_apis_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_apis_permission_id" ON "public"."asf_apis" USING "btree" ("permission_id");


--
-- Name: IX_asf_department_role_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_department_role_department_id" ON "public"."asf_department_role" USING "btree" ("department_id");


--
-- Name: IX_asf_department_role_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_department_role_role_id" ON "public"."asf_department_role" USING "btree" ("role_id");


--
-- Name: IX_asf_dictionary_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_dictionary_key" ON "public"."asf_dictionary" USING "btree" ("key");


--
-- Name: IX_asf_permission_menu_menu_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_permission_menu_menu_url" ON "public"."asf_permission_menu" USING "btree" ("menu_url");


--
-- Name: IX_asf_permission_menu_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_permission_menu_permission_id" ON "public"."asf_permission_menu" USING "btree" ("permission_id");


--
-- Name: IX_asf_permission_menu_title; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_permission_menu_title" ON "public"."asf_permission_menu" USING "btree" ("title");


--
-- Name: IX_asf_permission_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_permission_name" ON "public"."asf_permission" USING "btree" ("name");


--
-- Name: IX_asf_role_permission_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_role_permission_permission_id" ON "public"."asf_role_permission" USING "btree" ("permission_id");


--
-- Name: IX_asf_role_permission_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_asf_role_permission_role_id" ON "public"."asf_role_permission" USING "btree" ("role_id");


--
-- Name: IX_asf_translate_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_asf_translate_name" ON "public"."asf_translate" USING "btree" ("name");


--
-- Name: asf_accounts FK_asf_accounts_asf_department_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_accounts"
    ADD CONSTRAINT "FK_asf_accounts_asf_department_department_id" FOREIGN KEY ("department_id") REFERENCES "public"."asf_department"("id") ON DELETE RESTRICT;


--
-- Name: asf_accounts FK_asf_accounts_asf_tenancy_tenancy_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_accounts"
    ADD CONSTRAINT "FK_asf_accounts_asf_tenancy_tenancy_id" FOREIGN KEY ("tenancy_id") REFERENCES "public"."asf_tenancy"("id") ON DELETE RESTRICT;


--
-- Name: asf_permission_menu FK_asf_permission_menu_asf_permission_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_permission_menu"
    ADD CONSTRAINT "FK_asf_permission_menu_asf_permission_permission_id" FOREIGN KEY ("permission_id") REFERENCES "public"."asf_permission"("id") ON DELETE CASCADE;


--
-- Name: asf_account_role account_account_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_role"
    ADD CONSTRAINT "account_account_id_foreign" FOREIGN KEY ("account_id") REFERENCES "public"."asf_accounts"("id") ON DELETE CASCADE;


--
-- Name: asf_account_post account_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_post"
    ADD CONSTRAINT "account_id_foreign" FOREIGN KEY ("account_id") REFERENCES "public"."asf_accounts"("id") ON DELETE CASCADE;


--
-- Name: asf_account_role account_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_role"
    ADD CONSTRAINT "account_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."asf_role"("id") ON DELETE CASCADE;


--
-- Name: asf_apis api_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_apis"
    ADD CONSTRAINT "api_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."asf_permission"("id") ON DELETE RESTRICT;


--
-- Name: asf_department_role dept_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_department_role"
    ADD CONSTRAINT "dept_department_id_foreign" FOREIGN KEY ("department_id") REFERENCES "public"."asf_department"("id") ON DELETE CASCADE;


--
-- Name: asf_department_role dept_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_department_role"
    ADD CONSTRAINT "dept_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."asf_role"("id") ON DELETE CASCADE;


--
-- Name: asf_role_permission permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_role_permission"
    ADD CONSTRAINT "permission_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."asf_permission"("id") ON DELETE CASCADE;


--
-- Name: asf_role_permission permission_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_role_permission"
    ADD CONSTRAINT "permission_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."asf_role"("id") ON DELETE CASCADE;


--
-- Name: asf_account_post post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_account_post"
    ADD CONSTRAINT "post_id_foreign" FOREIGN KEY ("post_id") REFERENCES "public"."asf_post"("id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

