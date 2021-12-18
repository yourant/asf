--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
ALTER TABLE IF EXISTS ONLY "public"."asf_editor" DROP CONSTRAINT IF EXISTS "PK_asf_editor";
ALTER TABLE IF EXISTS ONLY "public"."asf_dictionary" DROP CONSTRAINT IF EXISTS "PK_asf_dictionary";
ALTER TABLE IF EXISTS ONLY "public"."asf_department_role" DROP CONSTRAINT IF EXISTS "PK_asf_department_role";
ALTER TABLE IF EXISTS ONLY "public"."asf_department" DROP CONSTRAINT IF EXISTS "PK_asf_department";
ALTER TABLE IF EXISTS ONLY "public"."asf_concat" DROP CONSTRAINT IF EXISTS "PK_asf_concat";
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
DROP TABLE IF EXISTS "public"."asf_editor";
DROP TABLE IF EXISTS "public"."asf_dictionary";
DROP TABLE IF EXISTS "public"."asf_department_role";
DROP TABLE IF EXISTS "public"."asf_department";
DROP TABLE IF EXISTS "public"."asf_concat";
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "login_ip" character varying(20),
    "login_time" timestamp with time zone,
    "login_location" character varying(50),
    "token" character varying(1000),
    "refresh_token" character varying(1000),
    "expired" timestamp with time zone
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
-- Name: asf_concat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_concat" (
    "id" bigint NOT NULL,
    "name" character varying(100) NOT NULL,
    "tel_phone" character varying(100) NOT NULL,
    "area" character varying(100) DEFAULT NULL::character varying,
    "content" "text",
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_concat"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_concat" IS '联系方式表';


--
-- Name: COLUMN "asf_concat"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_concat"."name" IS '姓名';


--
-- Name: COLUMN "asf_concat"."tel_phone"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_concat"."tel_phone" IS '手机号码';


--
-- Name: COLUMN "asf_concat"."area"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_concat"."area" IS '面积';


--
-- Name: COLUMN "asf_concat"."content"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_concat"."content" IS '描述内容';


--
-- Name: COLUMN "asf_concat"."create_time"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_concat"."create_time" IS '创建时间s';


--
-- Name: asf_concat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_concat" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_concat_id_seq"
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "id" bigint NOT NULL,
    "code" character varying(255),
    "tenancy_id" bigint,
    "key" character varying(255),
    "Value" "text",
    "options" character varying(255),
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_dictionary"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_dictionary" IS '字典表';


--
-- Name: COLUMN "asf_dictionary"."id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_dictionary"."id" IS 'id';


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

ALTER TABLE "public"."asf_dictionary" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_dictionary_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asf_editor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."asf_editor" (
    "id" bigint NOT NULL,
    "name" character varying(100) NOT NULL,
    "type" bigint DEFAULT 1 NOT NULL,
    "path" character varying(100) NOT NULL,
    "banner" character varying(10000) DEFAULT NULL::character varying,
    "old_content" "text",
    "new_content" "text",
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "meta" character varying(1000) DEFAULT NULL::character varying
);


--
-- Name: TABLE "asf_editor"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_editor" IS '富文本表';


--
-- Name: COLUMN "asf_editor"."name"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."name" IS '名称';


--
-- Name: COLUMN "asf_editor"."type"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."type" IS '富文本类型 0->手机页面，1->网站页面';


--
-- Name: COLUMN "asf_editor"."path"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."path" IS '生成html路径';


--
-- Name: COLUMN "asf_editor"."banner"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."banner" IS '首页轮播图';


--
-- Name: COLUMN "asf_editor"."old_content"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."old_content" IS '原始html';


--
-- Name: COLUMN "asf_editor"."new_content"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."new_content" IS '新html';


--
-- Name: COLUMN "asf_editor"."create_time"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_editor"."create_time" IS '创建时间s';


--
-- Name: asf_editor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE "public"."asf_editor" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."asf_editor_id_seq"
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
    "add_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "id" bigint NOT NULL,
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: TABLE "asf_permission_menu"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."asf_permission_menu" IS '菜单表';


--
-- Name: COLUMN "asf_permission_menu"."id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_permission_menu"."id" IS 'id';


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

ALTER TABLE "public"."asf_permission_menu" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "token_expired" timestamp with time zone,
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "create_time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "id" bigint NOT NULL,
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
-- Name: COLUMN "asf_translate"."id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."asf_translate"."id" IS 'id';


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

ALTER TABLE "public"."asf_translate" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
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

INSERT INTO "public"."asf_account_post" VALUES (1, 1, 3, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_account_post" VALUES (2, 1, 7, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_account_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_account_role" VALUES (1, 1, 3, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_accounts" VALUES (15, 1, 18, '梁涛', 'liangtao', 'xAyjZigzrnpHo0Iluxrv34zjZUJApf+USLNdlED5I1M=', '1f0cca80-49e8-4aae-a5ce-52bf74ef2edd', '86+17573415981', '2365990551@qq.com', NULL, 1, 0, 1, 1, '2021-11-15 06:31:42.864678+00', '116.128.229.195', '2021-11-22 06:23:05.850424+00', '中国,湖南,长沙', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNiVhMiU4MSVlNiViNiU5YiIsImxpYW5ndGFvIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTUiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2Mzc1NjIxODUsImV4cCI6MTYzNzY0ODU4NSwiaWF0IjoxNjM3NTYyMTg1LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.mrf_C-X3LqeTBk7pFxyLOtGVKvda2o11626LfpvfRTO6GPPw41dm0RWsNXlZ_MJwfWMONV0ffB5EN3NuncglZvKFoA1AGLDb0KyR2aFA0KnCl_7GBlLmjHzWebc8aUaqc0TG9TfeJWM34sfm4b7tvFi9UbRdY-9VW2sPML6gzB7yfA_VdNnqgVxVVMOCxA9ltjF5WyV6N18AA9qwBuq-DSA8naGxIBa_YUfClyLk5rudIjxujQSJDnSK_RjdCdK-kODYM6k80knMvKjc7MuIJ9-nVAMJzH9Vs57LaiuD6GejTdGx9bpn3v1pdBe4yUkiOsl755NZG7HAqi6eRMa4hg', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNiVhMiU4MSVlNiViNiU5YiIsImxpYW5ndGFvIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTUiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2Mzc1NjIxODUsImV4cCI6MTYzNzY5MTc4NSwiaWF0IjoxNjM3NTYyMTg1LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.YPbhk8oigzNQBXcjVQ-S7ScSkG9IoyC4kwxPDxLVU1y0Jasn6I7x85Z_87bwivJPn9x9wj5PjW0gPeFw5F0WsEj8NsN2O38hqpLydqf-EYS58NHQj7cIYB42-Ol_YWCRIuhX1cWb2jbJNETSQH2KZ0zoB0g9UPUanjbhLGvy6rTLWsJLfAU1VE0YkYrMzQ7AfAsPn9S89yywvJLY8pZfcSBM2eguPJw7FXFL9_b9bjRvviBAHMj6kd2R9rfkgPmxRDhdQjdX21_vbqbs7q2JDwkpVCt05jn7RT-2_QVL_hdW2K4_Qx9oVcIgaa8NACFbr8Xw6SemsBHTbOkpPrwqFQ', '2021-11-23 06:23:05.845352+00');
INSERT INTO "public"."asf_accounts" VALUES (14, 1, 18, '丁鲁欣', 'dingluxin', '4ZZ2l2dUJe/wBTKIXxEn1YZ39YI0AOam7NjGXkyg7nA=', 'bcc9d9fc-3da8-4bdb-a7a7-e542bd5cee7a', '86+13144445251', '1459189099@qq.com', NULL, 1, 0, 1, 1, '2021-11-15 06:30:35.685013+00', '117.136.24.171', '2021-11-22 06:23:19.012836+00', '中国,湖南,长沙', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNCViOCU4MSVlOSViMiU4MSVlNiVhYyVhMyIsImRpbmdsdXhpbiJdLCJyb2xlIjoidXNlciIsInN1YiI6IjE0IiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTYyMTk4LCJleHAiOjE2Mzc2NDg1OTgsImlhdCI6MTYzNzU2MjE5OCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.FTXrH8glLF_lAOWC2eW1qfbdUTKh-cs5G3k2Hikqs1f39-8kI7ceyw-XUuXRkjCqWE1giYvfVYiCHLBsHHFwt83OI-8yy8WynubToYkAnH7nZkioo3cctlV1PEc0xo6klR4oY-ihdTx_EpFn4deJw3DC09IgI-CXmv6DV6hRRFYvyA9dWOO19vCQAAh6nDlvun85kqInMK2kuXg5c-hHBIaA2D6XrOTRevgDtPW4f7L46i2ZOM7oiasXk6vKGbPGgZPprgghrmO0TzNCy6Cyg7q3alMaKbMx0Y90Cxi0eEmzxaMuYKUdbCBWgvieGVT4IpOXIPoPqoC0-z7evabMgg', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNCViOCU4MSVlOSViMiU4MSVlNiVhYyVhMyIsImRpbmdsdXhpbiJdLCJyb2xlIjoidXNlciIsInN1YiI6IjE0IiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTYyMTk5LCJleHAiOjE2Mzc2OTE3OTksImlhdCI6MTYzNzU2MjE5OSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.ZU5XFXxFOI0e7m-0U0MTNO-hYAWtwrNDfQ7irVzlRSMl6Y6HLJQTEB3EKP0nUFhNG-0hd44sFhd57y57qE_pMYAtw-ONIp81XyNcS-J1QAKcTxOzoI-_dGzw3EFnYrk4ngA3_eCfwc3b5gx_VY4VlCXXlaOX4pBesGUPxzxwMpwtsWmmuANO9IWfWr74QI4NuYXcLz24sDWnTi0u2B3Mi7FLmaRSUvq568aKdcagCSKXQ5C6N3fp2g3AFa51hxIZbFaDX8ESj2apIHB0gnT8jpSrd5RyxdHlXpKFK9YP8D2oif-ieB_ZGsUZqTkJmgQ4uy2N0uvQyIvp3BSTS2B0vw', '2021-11-23 06:23:19.007202+00');
INSERT INTO "public"."asf_accounts" VALUES (16, 1, 18, '零星', 'hezhongxing', 'Lr87FIQKVmSdN7lFXuoIcKleHzbCXZ4iN0dDjATLMQA=', '1a47adb2-f688-48f5-af1b-d7300e61336e', '86+17261288915', '2858193923@qq.com', NULL, 1, 0, 1, 1, '2021-11-15 06:34:35.456847+00', '223.104.130.131', '2021-11-15 06:34:39.598659+00', '中国,湖南,长沙', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlOSU5YiViNiVlNiU5OCU5ZiIsImhlemhvbmd4aW5nIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTYiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NTgwNzksImV4cCI6MTYzNzA0NDQ3OSwiaWF0IjoxNjM2OTU4MDc5LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.Oc-zK0-yQmQQAiJyA4kSqflAqvVb-mi3sVV3fLVoyJfLM2gwyTAG4_s4PpfnISz48O1UgNPcqAemITVb0s9ETPnZFWTG42j3OwI39r4AFGwuO1Un33TL7OqWnVnTaHgaMwyymc3r9avuLvHbAESclBc-eeVgU3XyT-4UrYYayDJaRlYZd7MFujP7_ELaxD7LNHph8lO8PU9FPoc0Jie7XyQKfVDZ7DDKZee3wGI4sSL65pl3MJApLWR_X_-pfImRilQpmvkBTHlvfBlBEEDZadxko_7wzC0WzMSti8k7h517Dtcx3VP1Pya_v0ZyhmYXzVQOExZVHWOJQPSYPfod8Q', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlOSU5YiViNiVlNiU5OCU5ZiIsImhlemhvbmd4aW5nIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTYiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NTgwNzksImV4cCI6MTYzNzA4NzY3OSwiaWF0IjoxNjM2OTU4MDc5LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.SCuHQaOlwRVOQIk2OAgZsgTfb-HTj3KnsfKWwikaWC02Ez65ROT7klrbz2bW4SIrnKtgqbWXiofrtmUTBiQEq01LkVrz90wsCGF85T8u6fwVhcgA7-EMcqmmFTYhMa14XyJdifeNSLAqW-mbc6Ovri35ih8TGR_0_VwBhZB5wp9daoPu7tgRKbS-eZSUIP-FQBjDbYYQeUB6DVdH8yu1DsR9AIsN5-cOTgAlMcrZ2SeOE4cCT7cAcdvRHniwQBicN37MhIuDMgLPcREvBKX86ThYi_IniFllg6KIzVy4GRfJVwQmJNtiJI2sBJSGW4XTCaMvMZvhdmFuFfRFgqe_Cw', '2021-11-16 06:34:39.598658+00');
INSERT INTO "public"."asf_accounts" VALUES (17, 1, 30, '崔友稀', 'cuiyouxi', 'U5kOsmI8lTTciN1c8eqIQVVq2IeGFSRre37jqEsAmgc=', '64529176-9bda-4853-b7d3-ca8ad7a75603', '86+13607483162', '416409524@qq.com', NULL, 1, 0, 1, 1, '2021-11-15 07:21:24.550098+00', '203.168.22.100', '2021-11-22 07:55:48.468459+00', '中国,广东,广州', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNSViNCU5NCVlNSU4ZiU4YiVlNyVhOCU4MCIsImN1aXlvdXhpIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTciLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2Mzc1Njc3NDgsImV4cCI6MTYzNzY1NDE0OCwiaWF0IjoxNjM3NTY3NzQ4LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.wQfYIt1nHyGr2oF4JJ0CWwfbMHKjLs819h5DhhcuF5o_GnuR1VYBHM777H_LhG2VnSsRAuh-VVsVClkqUsHsWtsYC7heMt9GC22TjV3Ya4NQPzxyaFcfXdmccek2CwJo85o9rd3Ar5O6Vxfecho7aB2Cga8fNtP-aBh8PkiQGXSY410jmwetJl8yWfjpIRnRML41PzIiqoIkXj0BbQxdnQGtxNGeTc3ZaCYJasASFtqP1jo5qtTG1rmDq1pOFV6hUDVtqzFjkWXnJHyhOTC-1MfAVk6H14TiPdtZU90W3glwAkCrBSomydpUIN-ViSxOKtFGXvL-4kDycoaV_aQkIg', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNSViNCU5NCVlNSU4ZiU4YiVlNyVhOCU4MCIsImN1aXlvdXhpIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTciLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2Mzc1Njc3NDgsImV4cCI6MTYzNzY5NzM0OCwiaWF0IjoxNjM3NTY3NzQ4LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.elgkXYh9yYw_0atkNy3HOKlyvlXpLGeqmBGGMZC9zZZBg3zbFSb327_9yOpwRb9UGnwJZROC71LT-69tUeaWuZ11bh4nHKQDPtabwYqRi8tcz6GZhvlYCqqibBffhPlyXPzUQccOCFvjSXHcImUKmZmSgyk14koUVchsIcypUmXaOM8RClzfXW3yKoA00IOmqyyoSNl97u-LPyQfuvyt95LQRkBlg48KQzHv7XspGDflLkf-dQZ28W90049kX927mfhfcbAMP-RViyTbE5ypRfC56hR30_H9agF-tgFgCWuVaW8tLvYpk5az9tpnFdYG371AnOos84NJKeru85unyw', '2021-11-23 07:55:48.462111+00');
INSERT INTO "public"."asf_accounts" VALUES (1, 1, 2, 'keep_wan', 'admin', '20V6MgmX8XVtiRz10AI4Ib5H16a9JyrNmSwmgJ2k0iI=', '8283e4c3-f87e-4d85-85fb-f5c0de063992', '86+13800000000', 'admin@qq.com', '/avatar.jpg', 1, 0, 1, 0, '2021-11-12 07:06:30.76408+00', '127.0.0.1', '2021-12-18 04:24:52.119417+00', '本地', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAxNDkxLCJleHAiOjE2Mzk4ODc4OTEsImlhdCI6MTYzOTgwMTQ5MSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.fAg7TA3aFCMpyPKFeG0e7YDLgRzlOHXz5N_78Mcgh1Vb4TEKbOR7SQNTGyCe9kT-m7pGzxn0TpUeTNbHBQTczsifn5Q3OxdUegRI_YccTeZ7WNV8yFNN6KWgRAQgnuaVMVTrHR8gAcS7hVB2fP8oECzO0Ctchdq6o06jIgwgUdSTfx0yO-iRbFfx9iXigXvXLjpu3nkf2xjkHkSxDycWY9ycXf5B9VW3mecu2tn4CJljbV4xGcVKPgu6Qph6ZHIPbkZFaNOOQdO2W8vt9kh3JDj6Acq5ZikGKUdhH9lkvYyPhbZkMD4RQ5QuG7X7iJY_Qk6Bbbzp_sah_JaeLCrvpA', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAxNDkyLCJleHAiOjE2Mzk5MzEwOTIsImlhdCI6MTYzOTgwMTQ5MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.KiAqG--20wmUTziQBpi7Mi7SN5EhXmuRBnMZkA2TDwPh77glmO4xeo0oxAvZo3jtAMAP-dIMTyK2NmqriRV9BFhrDecEnpzC5q21JRHiWKDbMJgc4VxrFgAOQSxux040O-ZdUbgkWBQVJ0VsaRxj6hGKAS0b0i9ukTQIwCjwaPhf1vDFDlnhCC4URdoTo0V778lGuodwCS4-ow-0UVsi4wR2uQ5RXbtcSN-Wp9oycxv_CVYSv0k6Vpovfa6C4vpFJqoyvFq1w-UI1Fc4tYytq2P3ElcXlqP52D7Ke_k7wDHm0_r_V6WtRjcaVdFxi7dXnoLuhHoOivkGOSCv8FDkGg', '2021-12-19 04:24:52.006757+00');


--
-- Data for Name: asf_apis; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_apis" VALUES (1, 1, '获取控制台信息权限', 1, 2, '/api/asf/dash/getdetails', 'get', 0, '获取控制台信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (2, 3, '获取账户列表', 1, 2, '/api/asf/account/getlist', 'get', 0, '获取账户信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (3, 3, '添加账户', 1, 2, '/api/asf/account/create', 'post', 1, '添加账户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (4, 3, '修改账户', 1, 2, '/api/asf/account/modify', 'post,put', 1, '修改账户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (5, 3, '获取账户详情', 1, 2, '/api/asf/account/details', 'get', 0, '获取账户信息详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (6, 3, '删除账户', 1, 2, '/api/asf/account/delete/[0-9]{1,12}', 'post,delete', 1, '删除账户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (7, 3, '修改账户状态', 1, 2, '/api/asf/account/modifystatus', 'post,put', 1, '修改账户状态权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (8, 3, '修改账户密码', 1, 2, '/api/asf/account/resetpassword', 'post,put', 1, '修改账户密码权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (9, 3, '修改账户邮箱', 1, 2, '/api/asf/account/modifyemail', 'post,put', 1, '修改账户邮箱权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (10, 3, '修改账户邮箱', 1, 2, '/api/asf/account/modifytelphone', 'post,put', 1, '修改账户手机权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (11, 3, '修改账户头像', 1, 2, '/api/asf/account/modifyavatar', 'post,put', 1, '修改账户头像权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (12, 3, '账户分配角色', 1, 2, '/api/asf/account/assignrole', 'post,put', 1, '账户分配角色权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (13, 3, '账户分配部门', 1, 2, '/api/asf/account/assigndepartment', 'post,put', 1, '账户分配部门权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (14, 3, '账户分配岗位', 1, 2, '/api/asf/account/assignpost', 'post,put', 1, '账户分配岗位权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (15, 4, '获取权限列表', 1, 2, '/api/asf/permission/getlist', 'get', 0, '获取权限信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (16, 4, '添加权限', 1, 2, '/api/asf/permission/create', 'post', 1, '添加权限信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (17, 4, '修改权限', 1, 2, '/api/asf/permission/modify', 'post,put', 1, '修改权限信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (18, 4, '获取权限详情', 1, 2, '/api/asf/permission/details', 'get', 0, '获取权限详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (19, 4, '删除权限', 1, 2, '/api/asf/permission/delete/[0-9]{1,12}', 'post,delete', 1, '删除权限信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (20, 5, '获取菜单列表', 1, 2, '/api/asf/menu/getlist', 'get', 0, '获取菜单信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (21, 5, '添加菜单', 1, 2, '/api/asf/menu/create', 'post', 1, '添加菜单信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (22, 5, '修改菜单', 1, 2, '/api/asf/menu/modify', 'post,put', 1, '修改菜单信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (23, 5, '获取菜单详情', 1, 2, '/api/asf/menu/details', 'get', 0, '获取菜单详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (24, 5, '删除菜单', 1, 2, '/api/asf/menu/delete/[0-9]{1,12}', 'post,delete', 1, '删除菜单信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (25, 5, '修改菜单是否隐藏', 1, 2, '/api/asf/menu/modifyhidden', 'post,put', 1, '修改菜单隐藏权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (26, 6, '获取api列表', 1, 2, '/api/asf/api/getlist', 'get', 0, '获取api信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (27, 6, '添加api', 1, 2, '/api/asf/api/create', 'post', 1, '添加api信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (28, 6, '修改api', 1, 2, '/api/asf/api/modify', 'post,put', 1, '修改api信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (29, 6, '获取api详情', 1, 2, '/api/asf/api/details', 'get', 0, '获取api详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (30, 6, '删除api', 1, 2, '/api/asf/api/delete/[0-9]{1,12}', 'post,delete', 1, '删除api信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (31, 6, '删除api', 1, 2, '/api/asf/api/batchdelete', 'post,delete', 1, '批量删除api信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (32, 6, '是否禁用api', 1, 2, '/api/asf/api/modifystatus', 'post,put', 1, '是否禁用api', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (33, 7, '获取角色列表', 1, 2, '/api/asf/role/getlist', 'get', 0, '获取角色信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (34, 7, '添加角色', 1, 2, '/api/asf/role/create', 'post', 1, '添加角色信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (35, 7, '修改角色', 1, 2, '/api/asf/role/modify', 'post,put', 1, '修改角色信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (36, 7, '获取角色详情', 1, 2, '/api/asf/role/details', 'get', 0, '获取角色详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (37, 7, '删除角色', 1, 2, '/api/asf/role/delete/[0-9]{1,12}', 'post,delete', 1, '删除角色信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (38, 7, '是否禁用角色', 1, 2, '/api/asf/role/modifystatus', 'post,put', 1, '是否禁用角色', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (39, 7, '角色分配权限', 1, 2, '/api/asf/role/assignpermission', 'post,put', 1, '角色分配权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (40, 9, '获取日志列表', 1, 2, '/api/asf/audio/getloglist', 'get', 0, '获取日志信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (41, 9, '删除日志', 1, 2, '/api/asf/audio/deletelog/[0-9]{1,12}', 'post,delete', 1, '删除日志信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (42, 10, '获取调度任务列表', 1, 2, '/api/asf/task/getlist', 'get', 0, '获取调度任务信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (43, 10, '添加调度任务', 1, 2, '/api/asf/task/create', 'post', 1, '添加调度任务信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (44, 10, '修改调度任务', 1, 2, '/api/asf/task/modify', 'post,put', 1, '修改调度任务信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (45, 10, '获取调度任务详情', 1, 2, '/api/asf/task/details', 'get', 0, '获取调度任务详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (46, 10, '删除调度任务', 1, 2, '/api/asf/task/delete/[0-9]{1,12}', 'post,delete', 1, '删除调度任务信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (47, 11, '获取租户分页列表', 1, 2, '/api/asf/tenancy/getlist', 'get', 0, '获取租户信息分页列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (48, 11, '添加租户', 1, 2, '/api/asf/tenancy/create', 'post', 1, '添加租户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (49, 11, '修改租户', 1, 2, '/api/asf/tenancy/modify', 'post,put', 1, '修改租户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (50, 11, '获取租户详情', 1, 2, '/api/asf/tenancy/details', 'get', 0, '获取租户详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (51, 11, '删除租户', 1, 2, '/api/asf/tenancy/delete', 'post,put', 1, '删除租户信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (52, 12, '获取部门分页列表', 1, 2, '/api/asf/department/getlist', 'get', 0, '获取部门信息分页列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (53, 12, '获取部门列表', 1, 2, '/api/asf/department/getlists', 'get', 0, '获取部门信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (54, 12, '添加部门', 1, 2, '/api/asf/department/create', 'post', 1, '添加部门信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (55, 12, '修改部门', 1, 2, '/api/asf/department/modify', 'post,put', 1, '修改部门信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (56, 12, '获取部门详情', 1, 2, '/api/asf/department/details', 'get', 0, '获取部门详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (57, 12, '分配部门角色', 1, 2, '/api/asf/department/assign', 'post,put', 1, '分配部门角色', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (58, 13, '获取岗位分页列表', 1, 2, '/api/asf/post/getlist', 'get', 0, '获取岗位信息分页列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (59, 13, '获取岗位列表', 1, 2, '/api/asf/post/getlists', 'get', 0, '获取岗位信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (60, 13, '添加岗位', 1, 2, '/api/asf/post/create', 'post', 1, '添加岗位信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (61, 13, '修改岗位', 1, 2, '/api/asf/post/modify', 'post,put', 1, '修改岗位信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (62, 13, '获取岗位详情', 1, 2, '/api/asf/post/details', 'get', 0, '获取岗位详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (63, 13, '删除岗位', 1, 2, '/api/asf/post/delete/[0-9]{1,12}', 'post,delete', 1, '删除岗位信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (64, 14, '获取多语言分页列表', 1, 2, '/api/asf/translate/getlist', 'get', 0, '获取多语言信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (65, 14, '获取多语言所有列表', 1, 2, '/api/asf/translate/getlists', 'get', 0, '获取多语言信息列表权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (66, 14, '添加多语言', 1, 2, '/api/asf/translate/create', 'post', 1, '添加多语言信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (67, 14, '修改多语言', 1, 2, '/api/asf/translate/modify', 'post,put', 1, '修改多语言信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (68, 14, '获取多语言详情', 1, 2, '/api/asf/translate/details', 'get', 0, '获取多语言详情权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (69, 14, '删除多语言', 1, 2, '/api/asf/translate/delete/[0-9]{1,12}', 'post,delete', 1, '删除多语言信息权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (70, 15, '登录', 1, 1, '/api/asf/authorise/login', 'post', 0, '登录账户权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (71, 15, '登出', 1, 1, '/api/asf/authorise/logout', 'post', 0, '登出账户权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (72, 15, '获取登录账户信息', 1, 1, '/api/asf/account/accountinfo', 'get', 0, '登出账户权限', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (73, 15, '获取租户列表集合', 1, 1, '/api/asf/tenancy/getlists', 'get', 0, '获取租户列表集合', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (74, 16, '获取富文本分页列表', 1, 1, '/api/asf/editor/getlist', 'get', 0, '获取富文本分页', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (75, 16, '获取富文本目录', 1, 1, '/api/asf/editor/getlists', 'get', 0, '获取富文本目录', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (76, 16, '添加富文本内容', 1, 1, '/api/asf/editor/create', 'post', 0, '添加富文本内容', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (77, 16, '修改富文本内容', 1, 1, '/api/asf/editor/modify', 'put', 0, '修改富文本内容', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (78, 16, '获取富文本内容', 1, 1, '/api/asf/editor/geteditor', 'get', 0, '获取富文本内容', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (79, 16, '提交咨询内容', 1, 1, '/api/asf/editor/concat', 'get', 0, '提交咨询内容', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (80, 16, '咨询内容列表', 1, 1, '/api/asf/editor/getConcatList', 'get', 0, '咨询内容列表', 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_apis" VALUES (81, 17, '获取股票收益列表', 1, 1, '/api/asf/jqdata/getfundamentals', 'get', 0, '获取股票收益列表', 0, '2021-12-18 12:19:38+00');
INSERT INTO "public"."asf_apis" VALUES (82, 17, '获取股票标的数据', 1, 1, '/api/asf/jqdata/getallsecurities', 'get', 0, '获取股票标的数据', 0, '2021-12-18 04:22:02.847723+00');


--
-- Data for Name: asf_concat; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_department; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_department" VALUES (1, 0, 1, '开发部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (2, 1, 1, '.net 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (3, 1, 1, 'java 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (4, 1, 1, 'app 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (5, 1, 1, 'php 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (6, 1, 1, '前端 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (7, 1, 1, 'ui 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (8, 1, 1, '运维 组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (9, 0, 1, '人事部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (10, 9, 1, '人事一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (11, 9, 1, '人事二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (12, 9, 1, '人事三组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (13, 0, 1, '财务部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (14, 13, 1, '财务一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (15, 13, 1, '财务二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (16, 13, 1, '财务三组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (17, 0, 1, '运营部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (18, 17, 1, '运营一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (19, 17, 1, '运营二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (20, 17, 1, '运营三组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (21, 0, 2, '人事部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (22, 21, 2, '人事一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (23, 21, 2, '人事二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (24, 21, 2, '人事三组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (25, 0, 2, '财务部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (26, 25, 2, '财务一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (27, 25, 2, '财务二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (28, 25, 2, '财务三组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (29, 0, 2, '运营部', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (30, 29, 2, '运营一组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (31, 29, 2, '运营二组', 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department" VALUES (32, 29, 2, '运营三组', 1, 0, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_department_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_department_role" VALUES (1, 3, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (2, 1, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (3, 1, 3, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (4, 1, 4, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (5, 1, 5, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (6, 1, 6, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (7, 1, 7, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (8, 2, 8, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (9, 3, 9, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (10, 3, 10, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (11, 3, 11, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (12, 3, 12, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (13, 3, 13, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (14, 3, 14, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (15, 3, 15, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (16, 3, 16, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (17, 3, 17, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (18, 3, 18, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (19, 3, 19, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (20, 3, 20, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (21, 3, 21, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (22, 3, 22, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (23, 3, 23, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (24, 3, 24, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (25, 3, 25, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (26, 3, 26, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (27, 3, 27, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (28, 3, 28, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (29, 3, 29, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (30, 3, 30, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (31, 3, 31, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_department_role" VALUES (32, 3, 32, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_dictionary; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_editor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_editor" VALUES (12, '强夯机是如何工作的', 2, '/var/www/html/441/a/gongsixinwen/18.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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
                    style="color: #454545; font-family: "Microsoft Yahei"; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-indent: 25px;">&nbsp;
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>强夯机是如何工作的</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10 <strong>点击:</strong></div>
<div class="description">
<div><span style="color: #454545;">&nbsp; &nbsp; &nbsp; 更换为饱和软粘土地基的固结强夯法。和强夯置换法的加固机理是不同的，它是一个高影响的锤高落差产生可以碎石，石材料，炉渣和其他性能强度到地面，形成聚集体墩逐个的基础上，对复合地基墩墩的形成，改善地基承载力，减少沉降。在强夯置换过程，土壤结构破坏，土体超孔隙水压力，但随着时间的增加，土壤结构的力量会恢复的。集料墩一般土壤透水性好，在过量的孔隙水压力的消散有利于产生的固体。</span>。</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (26, '液压夯实机为什么又叫液压强夯机或轻型强夯机', 1, '/var/www/html/441/a/jishuzhanshi/31.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>液压夯实机为什么又叫液压强夯机或轻型强夯机</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div>&nbsp;这里所说的液压夯实机或轻型强夯机就是通常我们所说的液压夯实机的别名。许多常年做工程的朋友，一下子叫不出液压夯实机的学名，根据其工作原理，</div>
<div>就称之为&ldquo;液压强夯机&rdquo;或&ldquo;轻型强夯机&rdquo;。</div>
<div>&nbsp; &nbsp; &nbsp; 实际上确实如此，液压夯实机与强夯机工作原理大致相同。</div>
<div>&nbsp; &nbsp; &nbsp; 液压夯实机与强夯机是两种不同的设备，其工作原理都是利用动能转化为冲击能来夯实土壤，只是在冲程和频率上有所不同。液压夯实机的夯击冲程约为200~1600mm，</div>
<div>频率快，可达30次/分钟左右，而强夯机的冲程可高达十数米，而频率则极低，可视为单个的脉冲。</div>
<div>&nbsp; &nbsp; &nbsp;强夯机是利用机械动力将几吨至几十吨的重锤，从几米至十几米的高处自由落下，对土体进行动力夯击，使土产生强制压密而减少其压缩性、提高强度。这种加固方法业内叫&ldquo;强夯法&rdquo;，</div>
<div>主要适用于颗粒粒径大于0.05mm的粗颗粒土，如砂土、碎石土、山皮土、粉煤灰、杂填土、回填土、低饱和度的粉土、粘性土、微膨胀土和湿陷性黄土，对饱和的粉土和粘性土无明显加固效果。</div>
<div>&nbsp; &nbsp; 液压夯实机是一种利用机器重力和变力的合力压缩土体的压实机械，对土体的压实方法可称为&ldquo;动力加固法&rdquo;或&ldquo;动力压密法&rdquo;，通过装载机或挖掘机的液压及PLC自动化控制功能来实现操作。</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (8, '湖南荆首|荆首建设专业从事地基工程26年，每年施工上百万平', 1, '/var/www/html/441/a/jingmi/index2.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" alt="湖南荆首" width="1920" /></div>
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
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/541263453.md.jpg" alt="机场地基强夯" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;">机场地基强夯</h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1756915815.jpg" alt="码头地基强夯" width="350" height="280" /></div>
<h3><a title="精密汽车零件011">码头地基强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/576097014.md.jpg" alt="码头建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件010">码头建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/43024487.md.jpg" alt="机场建设" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;"><a title="精密汽车零件008">机场建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/291269973.md.jpg" alt="机场建设地" width="350" height="280" /></div>
<h3><a title="精密汽车零件008">机场建设地</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1368468961.jpg" alt="码头地基建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件007">码头地基建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/576097014.jpg" alt="码头地基建设" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: ''Microsoft Yahei'', arial, tahoma, sans-serif;"><a title="精密汽车零件007">码头地基建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/940453669.jpg" alt="码头建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件005">码头建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1887060040.jpg" alt="机场建设" width="350" height="280" /></div>
<h3><span style="color: #000000;">机场建设</span></h3>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (9, '湖南荆首|荆首建设专业从事地基工程26年，每年施工上百万平', 1, '/var/www/html/441/a/jingmi/index3.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="width: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" alt="湖南荆首" height="100%" /></div>
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
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/455912500ef2bf67f6279acf3.jpg" alt="住宅地基强夯" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;"><a style="outline: 0px;" title="精密汽车零件011">住宅地基强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/394622667.jpg" alt="住房地基建设" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;"><a title="精密汽车零件010">住房地基建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/252454485.jpg" alt="楼盘建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件010">楼盘建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/258010367.jpg" alt="履带式强夯机" width="350" height="280" /></div>
<h3><a title="精密汽车零件009">履带式强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/402921916.jpg" alt="地基建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件008">地基建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/338436577.jpg" alt="地基建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件007">地基建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/194557300.md.jpg" alt="新城建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件006">新城建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1060855677.jpg" alt="建筑强夯施工" width="350" height="280" /></div>
<h3>建筑强夯施工</h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1096547534.jpg" alt="楼房地基施工" width="350" height="280" /></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (6, '湖南荆首|荆首建设专业从事地基工程26年，每年施工上百万平', 1, '/var/www/html/441/a/jingmi/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" alt="湖南荆首" width="1920" /></div>
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
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1712133504.jpg" alt="中建筑港港口强夯" width="408" height="230" /></div>
<h3><a title="精密汽车零件012">中建筑港港口强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/394622667.jpg" alt="城陵矶强夯" width="307" height="230" /></div>
<h3><a title="精密汽车零件011">城陵矶强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1891563201.jpg" alt="正宁东方畜牧场强夯" width="306" height="230" /></div>
<h3><a title="精密汽车零件010">正宁东方畜牧场强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/2043820902.jpg" alt="湖南临湘工业园强夯" width="306" height="230" /></div>
<h3><a title="精密汽车零件009">湖南临湘工业园强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1994182165.jpg" alt="中国石化工程强夯" width="300" height="230" /></div>
<h3><a title="精密汽车零件008">中国石化工程强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/909011773.jpg" alt="明煌建设土地强夯" width="307" height="230" /></div>
<h3><a title="精密汽车零件007">明煌建设土地强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/715941240.jpg" alt="新好农牧强夯项目" width="307" height="230" /></div>
<h3><a title="精密汽车零件006">新好农牧强夯项目</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/912121367.jpg" alt="文化产业园强夯项目" width="3968" height="230" /></div>
<h3><a title="精密汽车零件005">文化产业园强夯项目</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/933237279.jpg" alt="融湘产业园强夯项目" width="307" height="230" /></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (25, '强夯机的工作原理及市场', 1, '/var/www/html/441/a/jishuzhanshi/32.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>强夯机的工作原理及市场</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11<strong>点击:</strong></div>
<div class="description">
<div class="description">&nbsp;1.动力密实</div>
<div class="description">&nbsp; &nbsp; 使用强夯机加固多孔隙、粗颗粒、非饱和土是基于动力密实的机理，即用冲击型动力荷载使土中的孔隙体积减小，土体变得密实，从而提高地基土的强度，</div>
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
<div class="description">部分碎石墩间隔地夯入土中，形成桩式或墩式的碎石桩（墩）。其作用机理类似于振冲法等形成的碎石桩，它主要靠碎石摩擦角和墩间土的侧限来维持桩体的平衡，并与墩间土起复合地基的作</div>
<div class="description">&nbsp; &nbsp;强夯市场</div>
<div class="description">&nbsp; &nbsp;强夯单价一般以强夯项目地基施工每平方米的价格及项目所需锤头参数及施工工艺这种方式计算总价，当然特殊情况下也会采取其他核算方式。由于其受到影响的因素较多，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (5, '湖南荆首|荆首建设公司强夯设备齐全,是地基处理行业的领军企业', 1, '/var/www/html/441/a/products/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>设备展示</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>设备展示</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
<ul class="drop-menu">
<li><a href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
<li><a href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li><a href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a></li>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/09/04/_202109041002203426a86810ce9c8a.jpg" alt="地基处理" width="1920" /></div>
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
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg" alt="公路强夯设备" width="300" height="300" /></div>
<h3><a>公路强夯设备</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg" alt="蛙式强夯机" width="300" height="300" /></div>
<h3><a>蛙式强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/srchttp___5b0988e595225.cdn.sohucs.com_images_20180831_6e8d032c79b9426eb92929e7d0a19071.jpegreferhttp___5b0988e595225.cdn.sohucs.jpg" alt="180吨强夯锤强夯机" width="300" height="300" /></div>
<h3><a>180吨强夯锤强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg" alt="履带式强夯机" width="300" height="300" /></div>
<h3><a>履带式强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg" alt="填充法强夯机" width="300" height="300" /></div>
<h3><a>填充法强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/09/210453534.jpg" alt="重锤式强夯机" width="300" height="300" /></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (4, '湖南荆首|荆首建设目前已有湖南湖北两地资源互通，合作伙伴中铁、中建、中交等', 1, '/var/www/html/441/a/gongsiwangluo/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
</div>
<!-- content begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>关于我们</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li><a class="thisclass" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li class="active"><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="content-boxs">
<div class="detail">&nbsp;<img src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P12520430A64.jpg" alt="" /></div>
</div>
</div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (28, '履带式强夯机是怎么开展路基夯实的？', 1, '/var/www/html/441/a/jishuzhanshi/29.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>履带式强夯机是怎么开展路基夯实的？</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">路基压实施工当前普遍采用了大吨位振动压路机甚至履带式强夯机，碾压效果有了明显的改善，对于提高路基土的压实度起了很好的作用。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; &nbsp;随着道路车流量及车载量的增大，道路施工要求也有所提高，规范规定高速公路和一级公路路面底面以下80cm-150cm部分的上路堤其压实度必须&ge;95%，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">对其它等级公路当铺筑高级路面时，其压实度亦应按高速公路和一级公路的标准采用。此外，还增加了对路堤基底的压实度不宜小于93%的规定。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">随着我国道路基础建设的飞速发展，路基施工技术也取得了相当大的进步，对于特殊路基的处理技术也日渐成熟和完善。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; 1.过湿地区路基的填压。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; &nbsp;过湿土地基的填筑比较简单，一般采用填砂砾垫层和加铺土工格栅的方法，该方法简单易行，处理效果较好。但路基的压实是相当困难的，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">规范对此作出了若干调整：一是压实度标准可根据试验资料确定或较表列数值降低2&mdash;3个百分点二是对于天然稠度小于1.1，液限大于40，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">塑性指数大于18的粘质土，用于下路床及下路堤填料时，可采用规定的轻型压实标准；三是改善填料的性质，在土中掺加生石灰，通常可以获得预期的效果，也可采用新型吸水材料加固。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; 2.黄土路基的压实。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; 与其他公路路基黏性土相比，黄土尤其易受水的侵害，是一种特殊的黏性土。常将黄土路基划分为两类：非湿陷性黄土和湿陷性黄土。其中，湿陷性黄土主要分布在我国中西部地区，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">其作为路堤填筑材料时，由于受水浸湿后，本身结构被迅速破坏，应有强度减小，若施工不当则会发生很大的下沉量，引起路基失稳，特别是高路堤地段的填筑更是会引发一系列的工程病害。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">因此，黄土路基的压实也应根据实际情况的不同合理选择。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; 3.冲击压实：</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; &nbsp;冲击压实处理地基的原理是用一定的冲击能量使土体里的水分扩散固结并挤密压实土体而达到加固土体的目的。冲击压实技术只适合于浅层湿陷性及湿软性黄土地基的处理，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">且其有效影响深度一般不超过80cm，冲压遍数以30遍左右为宜。在冲压施工的过程中应注意：保持最佳含水量受冲击压实机的机型限制，被冲压的路基长度一般不应小于120m，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">宽度不宜小于15m;每一层冲压前，应先沿路基边沿冲压5遍左右，以减少在冲压过程中冲击能对路基的侧向挤压作用用冲击压实机进行路堤边沿压实时速度应稍慢，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">否则，可能引起车身滑出路堤冲压时应注意轮迹的连续性，特别是调头处，不要预留空白带而影响压实效果。</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">　4.强夯施工：</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">&nbsp; &nbsp;又称动力固结法，是用起重机械将8t～40t夯锤起吊到6m～25m高度后，自由落下，给地基以强大的冲击能量的夯击，使土中出现冲击波和冲击应力，迫使土体孔隙压缩，</span></span></div>
<div><span style="color: #333333; font-family: PingFang SC, Lantinghei SC, Microsoft YaHei, arial, 宋体, sans-serif, tahoma;"><span style="font-size: 16px;">土体局部液化，在夯击点周围产生裂隙，形成良好的排水通道，孔隙水和气体逸出，使土粒重新排列，经时效压密达到固结，从而提高地基承载力，降低其压缩性的一种有效地基加固方法。</span></span></div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (31, '湖南荆首|湖南荆首坐等大家咨询哦', 1, '/var/www/html/441/a/contact/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
	<title>联系我们</title>
	
	
	<link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
	<link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
	<script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
	<script src="https://www.hnjingshou.com/skin/js/main.js"></script>
	<script
		src="https://webapi.amap.com/maps?v=1.4.15&amp;key=c93e1e293e5b1c3dc581f3ff633144d3&amp;plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Walking,AMap.Riding"></script>
	<script language="javascript"
		src="https://webapi.amap.com/maps?v=1.4.15&key=c93e1e293e5b1c3dc581f3ff633144d3值&plugin=AMap.ControlBar"></script>
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
								<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a>
								</li>
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
								<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a>
								</li>
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
							<p style="font-weight: bold; font-size: 14px; font-family: 微软雅黑;">路线：地铁3号线星沙文体站4号出口100米</p>
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
	function initMap() {
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
		map = new AMap.Map("content-map", {
			resizeEnable: true,
			rotateEnable: true,
			pitchEnable: true,
			zoom: 17,
			pitch: 80,
			rotation: -15,
			viewMode: "3D",//开启3D视图,默认为关闭
			buildingAnimation: true,//楼块出现是否带动画

			expandZoomRange: true,
			zooms: [3, 20],
			center: [113.110011, 28.246755]
		});

		map.addControl(new AMap.ControlBar({
			showZoomBar: false,
			showControlButton: true,
			position: {
				right: "10px",
				top: "10px"
			}
		}));
		var a = new AMap.Marker({
			position: [113.110011, 28.246755]
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
			position: [113.110011, 28.246755]
		});
		map.add(a);
		map.add(b);
	}
	initMap();
</script>

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
	<title>联系我们</title>
	
	
	<link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/pintuer.css">
	<link rel="stylesheet" type="text/css" href="https://www.hnjingshou.com/skin/css/style.css">
	<script type="text/javascript" src="https://www.hnjingshou.com/skin/js/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.hnjingshou.com/skin/js/pintuer.js"></script>
	<script src="https://www.hnjingshou.com/skin/js/main.js"></script>
	<script
		src="https://webapi.amap.com/maps?v=1.4.15&amp;key=c93e1e293e5b1c3dc581f3ff633144d3&amp;plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Walking,AMap.Riding"></script>
	<script language="javascript"
		src="https://webapi.amap.com/maps?v=1.4.15&key=c93e1e293e5b1c3dc581f3ff633144d3值&plugin=AMap.ControlBar"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/441/skin/js/respond.js"></script>
<![endif]-->
</head>

<body class="inner-box-body">
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
</header><!-- header end-->
<div class="layout">
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_20210710094457c63e64d6d68cd269.jpg" alt="合作共赢" width="1920" /></div>
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
<p style="font-weight: bold; font-size: 14px; font-family: 微软雅黑;">地址: 湖南省长沙县星沙街道开元东路95号华润置地广场二期15栋1305号</p>
<p style="font-weight: bold; font-size: 14px; font-family: 微软雅黑;">路线：地铁3号线星沙文体站4号出口100米</p>
<p>电话: 13707499996<br />电子信箱: 767970239@qq.com</p>
</div>
</div>
</div>
<div id="content-map" style="width: 100%; height: 400px; top: 40px;"></div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>
<script>
	function initMap() {
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
		map = new AMap.Map("content-map", {
			resizeEnable: true,
			rotateEnable: true,
			pitchEnable: true,
			zoom: 17,
			pitch: 80,
			rotation: -15,
			viewMode: "3D",//开启3D视图,默认为关闭
			buildingAnimation: true,//楼块出现是否带动画

			expandZoomRange: true,
			zooms: [3, 20],
			center: [113.110011, 28.246755]
		});

		map.addControl(new AMap.ControlBar({
			showZoomBar: false,
			showControlButton: true,
			position: {
				right: "10px",
				top: "10px"
			}
		}));
		var a = new AMap.Marker({
			position: [113.110011, 28.246755]
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
			position: [113.110011, 28.246755]
		});
		map.add(a);
		map.add(b);
	}
	initMap();
</script>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (7, '湖南荆首|荆首建设专业从事地基工程26年，每年施工上百万平', 1, '/var/www/html/441/a/jingmi/index1.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" alt="湖南荆首" width="1920" /></div>
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
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1123945817.jpg" alt="公路地基建设" width="350" height="280" /></div>
<h3>公路地基建设</h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1121998519.jpg" alt="高速公路施工" width="350" height="280" /></div>
<h3>高速公路施工</h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/525570854.jpg" alt="城市公路建设" width="350" height="280" /></div>
<h3><span style="color: #333333;">城市公路建设</span></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1973633635.jpg" alt="公路搭建" width="350" height="280" /></div>
<h3><a title="精密汽车零件009">公路搭建</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/843613571.md.jpg" alt="城市道路建设" width="350" height="280" /></div>
<h3><a title="精密汽车零件008">城市道路建设</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1906010390.jpg" alt="道路压实" width="350" height="280" /></div>
<h3><a title="精密汽车零件007">道路压实</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1577799980.jpg" alt="道路强夯机" width="350" height="280" /></div>
<h3><a title="精密汽车零件006">道路强夯机</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/1687874547.md.jpg" alt="中铁合作" width="350" height="280" /></div>
<h3><a title="精密汽车零件005">中铁合作</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/24/940453669.md.jpg" alt="高速公路地基夯实" width="350" height="280" /></div>
<h3 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen, Ubuntu, Cantarell, ''Open Sans'', ''Helvetica Neue'', sans-serif;"><a title="精密汽车零件005">高速公路地基夯实</a></h3>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (2, '【湖南荆首】荆首建设秉承坚持质量为先、打造放心工程、提供超预期的服务理念', 1, '/var/www/html/441/a/gongsigainian/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>【湖南荆首】荆首建设秉承坚持质量为先,打造放心工程,提供超预期的服务理念</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="content-boxs">
<div class="detail">
<div>公司秉承坚持质量为先、打造放心工程、提供超预期的服务理念，我们有专业的施工队伍,专业的设备，可处理复杂地基，经验丰富，质量可靠；为了更好地服务我们的客户，根据工地实况我们将制定一对一的工程方案，积极主动为客户提供最优质的服务，保证在工程质量、工程安全、工程效率以及各方面上精益求精。 公司始终坚持以&ldquo;质量促发展,管理见效益,服务立信誉&rdquo;的方针；本着&ldquo;专业，专心，诚心&rdquo;的原则，逐步发展为一家拥有较强实力的地基处理公司。欢迎广大客户前来洽谈业务,期待与您合作。</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>【湖南荆首】荆首建设秉承坚持质量为先,打造放心工程,提供超预期的服务理念</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="content-boxs">
<div class="detail">
<div>公司秉承坚持质量为先、打造放心工程、提供超预期的服务理念，我们有专业的施工队伍,专业的设备，可处理复杂地基，经验丰富，质量可靠；为了更好地服务我们的客户，根据工地实况我们将制定一对一的工程方案，积极主动为客户提供最优质的服务，保证在工程质量、工程安全、工程效率以及各方面上精益求精。 公司始终坚持以&ldquo;质量促发展,管理见效益,服务立信誉&rdquo;的方针；本着&ldquo;专业，专心，诚心&rdquo;的原则，逐步发展为一家拥有较强实力的地基处理公司。欢迎广大客户前来洽谈业务,期待与您合作。</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.76408+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (16, '浅谈强夯试夯施工', 1, '/var/www/html/441/a/gongsixinwen/14.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h4 style="line-height: 60px; font-size: 22px; color: #333333; text-align: center; font-family: 微软雅黑; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">浅谈强夯试夯施工</h4>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2018-01-25 <strong>点击:</strong></div>
<div class="description">
<div><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数的选取、修正设计及试夯施工对正式施工的指导作用。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1强夯法处理地基的机理</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1.1强夯单点夯机理</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯巨大的冲击荷载使被压土体承受瞬间的巨大压应力、剪切应力和土体相应产生的约束反力，使土体发生急剧沉降现象，产生压缩和剪切变形，使土颗粒摆脱了原来的胶结，颗粒间挤压移动，土的孔隙被充填压缩；其次，土体受到夯锤底面约束反力的控制，土体距离锤体越近，受到各种方向的作用力就越大，相应密度增加。因此，位于夯锤底面的土体分别是加密状态（土体结构完全破坏，土颗粒基本呈规律排列）；无加密状态（土体结构基本破坏或松动破坏，密度变化较小）。通过不断的对地基进行夯击，夯区的土体及同一夯点上下层厚度内土体趋于加密状态，强夯施工是向土体传递着锤的冲击、破坏、加密作用。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">1.2满夯机理</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">满夯是继点夯之后，夯击能多降至点夯的1/4夯能进行最后一遍的夯击。满夯是进一步夯实点夯之间被扰动的土，使夯点与夯点间强度更趋于均匀，促进松动破坏的土层压密，形成整体强度。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">2 试夯区的选择与施工参数的确定</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯施工应该根据现场地形条件选择若干个具有代表性又能满足试夯要求的试夯区，对于夯坑的填料应选择材质好、强度高、级配好、含泥少者最佳，填料采取边夯边填。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3 施工参数的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.1夯击能的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">单点夯击能的选择是首要前提，一般宜根据所要加固地基深度结合图纸设计夯击能综合确定。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2夯锤规格的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2.1夯锤重量一般按照3.2.1式进行取值，因如果夯锤过重，要求起重能力就大，这样会增大施工成本。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">E=mgh （3.2.1）</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">式中：E――夯击能，KN・m；</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">m――夯锤重，kg；</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">h――起重设备的提起高度，m；</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">g――重力加速度，m/s2。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.2.2夯锤底面积一般采用4-7m2，对结构性较强的地基土宜取小值。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">3.3夯距和布点方式的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯夯点布置形式可根据基础形式、地基土类型和工程特点选用，宜为正方形、矩形、正三角形、等腰三角形等形式，常见夯点布置形式见图</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">如果单从地基强度均匀性考虑时，正三角形优于其它布点形式，同时正方形布设点位较多，施工成本相对较高。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">夯距宜为锤径的1.2～2.5倍，低能级时取小值，高能级及考虑能级组合时取大值。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">强夯常需分遍夯击，强夯遍数往往取决于夯距，即夯距越小，夯点越密。因为一边无法使各点全夯到，故遍数就越多，如考虑孔隙水压力消散时间，由于大面积强夯时，最先夯的夯点，在夯最后的夯击时，孔隙水压力往往已得到消散，可回头第二遍。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4 试夯</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.1试夯区面积选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">试夯区的面积不宜过小，一般夯点布置其纵横排数不宜少于5排，必须保证四排。因过少则反映不出夯点之间能量叠加之后实际的加权处理深度。检测点个数受限（因检测不能在边缘夯点之外，而应布在没边都有两排包围的区域之类）检测点越少，检测手段越单一，所取得检测数据就越具有偶然性，缺少各种手段的互为参照性，其代表性和真实性都难以保证。而规范中推荐的试夯区面积也不得少于400m2。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2单点击数的确定</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.1夯前宜埋设好夯点四周的地表沉降或隆起点观测点，应注意两夯点正中间观测点的埋设，应记录每击的地表变形量。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.2详实地记录每击的锤击贯入度，在现场画出夯沉曲线图，并注意观测和描述已出现的各种现象的发生与发展，如隆起量、每击的长度、宽度变化等，结合试夯的结果或已认可的夯沉深度来确定单点强夯击数。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">4.2.3注意观测并记录每边夯后的场地沉降量。它是宏观评价强夯效果，如场地压缩量、场地湿陷量的重要依据之一；同时又是指导正式夯击的填料厚度、控制夯后所需场地标高的唯一依据，避免发生填料量或土方量重复调配所产生的浪费，因此必须正确真实的测量其标高变化，切忌将试夯区以外的土或填料推向试夯区，又误将满夯后的场地标高与原场地标高之差作为真实的场地夯沉量加以利用，来指导正式施工，因正式施工的面积远大于试夯区，在场地平整时，没那么多区外土可向区内推，工程夯的场地夯沉量将大于试夯区的夯沉量，造成标高失控，发生大量土方。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5试夯区的夯后检测</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">试夯区的夯后检测是必须进行的，因为它是评价地基处理效果，修改设计的唯一依据和标准。故正确地、客观地、真实的进行夯后检测意义重大。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.1夯后检测间歇期</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">夯后地基检测常需一段间歇期，它与强夯施工每遍之间的间歇期不同。每遍之后的间歇往往考虑地表发生的诸如隆起、橡皮土等现象不应再加剧，以及是否影响安全施工等因素较多，而夯后地基检测的间歇，主要考虑的是深层固结，如土体被迫接受夯击能而要进行缓慢的释放（最明显表现的孔隙水压力消散），空隙水压力消散是由于整个夯区上部土体被破坏，密度增加，自重应力又以附加荷载的形式重新得以发挥而无加密区土体结构受到松动破坏，强度降低，压缩性增大，因此将产生一定新的压缩变形，使得原始粘聚力有所提高，土中结合水在夯击时移动、静止后又重新排列固定；其次，还有一部分上层土（加密层）对下层土（结构呈松动破坏的土层）的压缩变形和强度恢复。但工期往往不允许，故应按规范中强调的间歇性执行。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2检测点的布置数量和检测手段的选择</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.1检测点的布置应确保每种检测手段夯点与夯间都有分布，还应布在纵横都在两排夯点包围范围之内，且每种手段检测数量在夯点与夯间上均不少于两点，以免缺乏代表性。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.2检测手段的选择应针对主要处理目的，主要不良地质现象的需要进行选择，如湿陷性、液限、液化等，但反映地基强度和土的密度等指标还是不可缺少的。一般检测手段不应少于两种，对较重要的地基还应考虑静载荷试验。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">5.2.3主要进行夯前和夯后的效果对比分析，主要不良地质现象改善情况。是否达到设计预期目标。充分的、客观地、全面的评价夯后地基的可靠性。如果还有指标尚未达到使用要求，宜从强夯加固地基的机理入手，找出施工参数或辅助措施应进行的调整方向并具体化。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">6结论</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">通过试夯施工的现场施工记录，得出夯击次数与夯沉量关系（见图6.1）。</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">图6.1 夯击次数与沉降量关系图（单位：mm）</span><br style="margin: 0px; padding: 0px; color: #454545; font-family: 微软雅黑;" data-filtered="filtered" /><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">山平高速路基软基处理设计要求强夯点夯夯击次数为6～8击，夯击最后两击的沉降量不大于5cm，由现场施工记录得出夯击次数与夯沉量关系通过试夯只需达到4～5击，即满足要求，从而修正了设计，减少夯击次数，缩减施工成本，其次，在试夯过程中监测土层变化及其现场出现的情况，得出相关工参数为正式施工提供可靠依据。</span></div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (30, '湖南荆首|湖南荆首建设工程有限公司欢迎大家积极留言！', 1, '/var/www/html/441/a/feedback/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>在线留言</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>在线留言</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
</header><!-- header end-->
<div class="layout">
<div class="slideshow"><img style="height: 100%x;" src="https://s1.imagehub.cc/images/2021/08/28/_202108281145455085a741ee9f7d57.png" alt="专业团队|用心服务" width="1920" /></div>
</div>
<!-- content begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="show_content padding-large-bottom "><form id="concat" class="form form-block">
<div class="form-group">
<div class="field"><input class="input" size="50" type="text" placeholder="姓名" data-validate="请输入您的姓名。" /></div>
</div>
<div class="form-group">
<div class="field"><input id="tel" class="input" name="telPhone" size="50" type="text" placeholder="电话" /></div>
</div>
<div class="form-group">
<div class="field"><input id="gcmj" class="input" name="area" size="50" type="text" placeholder="工程面积" /></div>
</div>
<div class="form-group">
<div class="field"><textarea id="content" class="input" name="content" placeholder="内容" data-validate="请输入内容"></textarea></div>
</div>
<div class="form-button"><button class="button bg-main margin-small-right">提交</button></div>
</form></div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (22, '42kj高速液压夯实机型号区分，装载机带的打夯机价格', 1, '/var/www/html/441/a/xingyexinwen/20.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>42kj高速液压夯实机型号区分，装载机带的打夯机价格</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div>高速液压夯实机进一步压缩土体的同时，消除或弱化分层碾压导致的土体垂直方向均匀性差及层间结合力差的固有缺陷；施工中严格控制路基常规压实整体质量，补强时不宜过夯，</div>
<div>过夯容易导致周边土体隆起侧压及破坏原有分层结构。</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高速液压夯实机是通过液压油缸将夯锤提升至一定高度后快速释放，夯锤在加速下落过程中通过夯板间接的夯击地面。该设备安装在普通装载机的动臂上，行动方便自如，</div>
<div>可以对作业面进行单点或者连续的夯实，实现了高频率、高强度夯实作业，影响深度3米，充分保证了压实效果。</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;针对三背回填作业面狭小，传统机械无法达到施工标准，通过使用高速液压夯实机作业补强可以有效减少沉降，针对高填路基，高速液压夯实机代替冲击压实机每2米补强，</div>
<div>代替强夯每8米补强，切实减少工后沉降。高速液压夯实机在公路路基填筑中主要用于达标路基的补压增强（补强﹑追密）及直接夯实。</div>
<div>主要应用部位桥涵墙背﹑填挖结合部﹑新旧路结合部及加宽部﹑鸡爪沟﹑高填方﹑冲击压路机碾压盲区﹑不便或不宜使用强夯的部位等，以及其他需要补强或直接夯实的部位。</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; 　高速液压夯实机采用进口高速油缸，其液压系统采用差动回路和蓄能器加压补偿等多项技术，大大提高落锤效率并降低能量损耗；同时，标配GPS卫星水平定位仪，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (14, '强夯机回填复杂地基施工的过程', 1, '/var/www/html/441/a/gongsixinwen/16.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>强夯机回填复杂地基施工的过程</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10 <strong>点击:</strong></div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (13, '强夯施工如何选择强夯机', 1, '/var/www/html/441/a/gongsixinwen/17.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>强夯施工如何选择强夯机</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-1. <strong>点击:</strong></div>
<div class="description">
<div>
<div>想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。</div>
<div>&nbsp;强夯机已经成为了建筑施工中的主流设备，目前国内有很多专业的强夯公司，并且拥有自己的强夯机。强夯机主要是供应给强夯施工队，以目前国内的经济建设情况来看，强夯机的需求很大。如何来选择优秀的强夯机呢？有的人看中品牌，有的人看中价格，其实都很重要。</div>
<div>&nbsp; &nbsp; 强夯机作为建筑业最为常用的施工设备之一，性能是摆在第一位的。目前强夯机有很多种，比如履带式的，液压式的，机械传动式等等，实现原理不同，性能也大不相同。强夯机由于施工环境的限制，要具备非常好的稳定性，并且具备较大的能及。</div>
<div>&nbsp; &nbsp; 由此可见，液压强夯机是非常不错的选择，它的冲击能级高，并且夯锤提升下降速度稳定，现在已经得到了很广泛的使用。除了上面的液压强夯机意外，机械传动强夯机也有优势，它适用的场所更多，更广泛。不过强夯机的适用性也是我们选择的一个重要因素。</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (3, '湖南荆首|荆首建设是以强夯等地基建设为主的公司', 1, '/var/www/html/441/a/gongsigaikuang/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" width="1920" /></div>
</div>
<!-- content begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>关于我们</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="content-boxs">
<div class="detail">
<h2>湖南荆首建设工程有限公司</h2>
<div class="intro">湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。</div>
<div class="intro">湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>关于我们 > 公司概况</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
</div>
<!-- content begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>关于我们</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">公司概况</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsigainian/index.html">公司概念</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/gongsiwangluo/index.html">公司网络</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="content-boxs">
<div class="detail">
<h2>湖南荆首建设工程有限公司</h2>
<div class="intro">湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。</div>
<div class="intro">湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.76408+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (27, '强夯施工的优点是什么？正确的施工步骤有哪些？', 1, '/var/www/html/441/a/jishuzhanshi/30.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品质|用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>强夯施工的优点是什么？正确的施工步骤有哪些？</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div>现在的建筑工程的地基都需要对松土进行压实处理，也就都离不开打夯，小的建筑工程夯实地基用小的电动打夯机就能完成，较大的建筑工程通常对地基都有着硬性的指标，</div>
<div>需要夯实到某种程度才算合格，这样就对打夯机有了某些指标上的要求，因此就需要用到强夯机。</div>
<div>&nbsp; &nbsp; 强夯法即强力夯实法，又称动力固结法。是利用大型履带式强夯机将8-30吨的重锤从6-30米高度自由落下，对土进行强力夯实，迅速提高地基的承载力及压缩模量，形成比较均匀的、</div>
<div>密实的地基，在地基一定深度内改变了地基土的孔隙分布。</div>
<div>强夯法施工已广泛运用到高速公路铁路，机场、核电站、大工业区、港口填海等基础加固工程。优点工期短、效果好、造价低。</div>
<div>&nbsp; &nbsp; 强夯法适用于处理碎石土、砂土、低饱和度的粉土与粘性土、湿陷性黄土、素填土和杂填土等地基。强夯施工前，应在施工现场有代表性的场地上选取一个或几个试验区，</div>
<div>进行试夯或试验性施工。试验区数量应根据建筑场地复杂程度、建设规模及建筑类型确定。</div>
<div>&nbsp; &nbsp; 1.强夯施工的优点有哪些？</div>
<div>&nbsp; &nbsp; &nbsp;施工工艺、操作简单；适用土质范围广，加固效果显著，可取得较高的承载力，一般地基强度可提高2～5倍；压缩性可降低2～10倍，加固影响深度可达6～10m；</div>
<div>工效高，施工速度快（一般设备每月可加固5000～10000m地基），较换上回填和桩基可缩短工期一半；节省加固原材料；施工费用低，节省投资，比换土回填节省50%费用，</div>
<div>与预制桩加固地基相比，可节省投资 50%～70%等。</div>
<div>&nbsp; &nbsp;2.浅析强夯法的三种不同加固机理：</div>
<div>&nbsp; &nbsp;首先，动力固结：当强夯法应用于处理细颗粒饱和黏土时，其加固机理则是动力固结理论。强夯时，巨大的冲击能量在土中产生很大的应力波，破坏土体的原有结构，使土体局部发生液化并产生许多裂隙，</div>
<div>增大了排水通道，使孔隙水顺利逸出，待超孔隙水压力消散后，土体固结。由于软土的触变性，强度得到恢复。（安利一下，触变性是指含水率不变情况下黏土因为重塑而软化，强度降低，</div>
<div>软化后随着静置时间延长而硬化，强度增长的性质）</div>
<div>&nbsp; 其次、动力密实：采用强夯法加固多孔隙、粗颗粒、非饱和黏土是基于动力密实的机理，即冲击型动力荷载，使土体中的孔隙减小，土体变得密实，从而提高地基土强度。非饱和土的夯实过程，</div>
<div>就是土中的气相（空气）被挤出的过程，其夯实变形主要是由于土颗粒的相对位移引起。</div>
<div>&nbsp; 最后、动力置换：动力置换可分整式置换和桩式置换。整式置换是采用强夯将碎石整体挤入淤泥中，其作用机理类似于换土垫层。桩式置换是通过强夯将碎石填入土中，部分碎石桩（或墩）间隔地夯入软土中，</div>
<div>形成桩式（墩式）的碎石桩（墩），其作用机理类似于振冲法形成的碎石桩，整体形成复合地基。</div>
<div>&nbsp; &nbsp;3.强夯的正确施工步骤有哪些？</div>
<div>1、认真调查，确保强夯场地范围内的地下无构筑物。清除地表土，清除范围为路基坡脚外2～3m。整平后在场地上标出第一遍夯点的位置，点位偏差控制在&plusmn;20cm范围内，并测量场地高程。</div>
<div>2、起重机就位，使夯锤对准夯点位置，测量夯前锤顶高程。</div>
<div>3、将夯锤起吊到预定高度，待夯锤脱钩自由下落后，放下吊钩，测量锤顶高程。若发现因坑底倾斜而造成夯锤歪斜时，及时将坑底整平。</div>
<div>4、重复第三项操作，完成一个夯点的夯击，即每个夯点夯6击。除满足最后2击平均夯沉量不大于50mm外，还要求总夯沉量不小于试夯总夯沉量的90%。</div>
<div>5、换夯点，重复第二项和第四项操作，直到完成第1遍全部夯点的夯击。用推土机将夯坑填平，并测量场地高程。</div>
<div>6、在规定的间隔时间后，按上述步骤逐次完成第2，3，4遍夯击。</div>
<div>7、选用锤质量为3t、落距为6m进行低能量满夯2遍，将场地表层松土夯实，要求后一遍与前一遍错开半夯；最后测量夯后场地高程。</div>
<div>8、灰土封闭。在基底地面铺设一层0.20m厚2：8灰土。施工时，石灰撒入土中，不洒水进行初拌，拌匀后应闷料8～12h，再进行洒水复拌，拌匀后即整平、压实；待强度检测合格后在灰土垫层上铺设一层防渗复合土工膜。</div>
<div>9、边坡加固。路基面下0.60m处铺设双向精编土工格栅，土工格栅每层垂直间距为0.50m，最上两层沿平面铺通，其余各层深入路堤边坡宽度2.50m，格栅距边坡线的距离不小于0.10m，土工格栅对应伸长率为10%时，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (29, '湖南荆首|湖南荆首建设工程有限公司拥有营业执照、建筑业企业等权威证书', 1, '/var/www/html/441/a/service/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>资质证书</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>资质证书</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/a/service/index.html">资质证书</a></li>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/08/28/111f59c720f5a92f27f.png" alt="湖南荆首" width="1920" /></div>
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
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/1a3cf131fef2d7414c.md.png" alt="营业执照" width="500" height="361" /></div>
<h3><a>营业执照</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/2a79a251fc60c8f941.png" alt="营业执照" width="230" height="300" /></div>
<h3><a>营业执照</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/3a2897ceb5806db05e.png" alt="银行开户信息" width="230" height="300" /></div>
<h3><a>银行开户信息</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/4af49b28e9fafcc2fd.png" alt="建筑业企业资格证书" width="490" height="696" /></div>
<h3><a>建筑业企业资格证书</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/5a688b333bb515fb20.png" alt="建筑业企业资质证书" width="495" height="708" /></div>
<h3><a>建筑业企业资质证书</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/6a1fa2f6271ec9681f.png" alt="管理体系认证证书" width="1883" height="2621" /></div>
<h3><a>管理体系认证证书</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/7a2e5f518a3cf28316.png" alt="管理体系认证证书" width="350" height="280" /></div>
<h3><a>管理体系认证证书</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/8a260ed2e490ab2a82.png" alt="管理体系认证证书" width="350" height="280" /></div>
<h3><a>管理体系认证证书</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img class="s-img click-zoom" src="https://s1.imagehub.cc/images/2021/07/24/9aa715dde679c724cb.png" alt="管理体系认证证书" width="230" height="300" /></div>
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
<!-- content end--><footer>
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
<div class="Copyright">Copyright @ 2021-2022 湖南荆首建设工程有限公司 版权所有</div>
</div>
</div>
</div>
</div>
</footer>
<div class="blank55">&nbsp;</div>
<div id="toolbar" class="layout text-center">
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
<div class="zoom-img"><img style="max-width: 100%; max-height: 100%;" alt="" /></div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (19, '集百项专利技术的国内首台巨无霸强夯机下线', 1, '/var/www/html/441/a/xingyexinwen/23.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>集百项专利技术的国内首台巨无霸强夯机下线</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div>中新网长沙10月31日电 (贺文兵)90吨重的夯锤，轻松举到20米高度，然后脱钩砸向地面，松软的土壤瞬间砸实。31日，国内首台巨无霸履带式强夯机在湖南宁乡高新区正式下线。</div>
<div>&nbsp; &nbsp; 这台型号为BTM1800的&ldquo;战虎&rdquo;强夯机，由国家高新技术企业湖南博邦重工有限公司厂区(简称&ldquo;博邦重工&rdquo;)研发，集中了近百项专利技术，自重100吨，起重臂高35米，履带有半人高，用于填海、筑路夯实基础、打桩等。</div>
<div>&nbsp; &nbsp; 强夯机市场小众，加之研发中也存在一些技术难题，许多工程机械企业都放弃生产。&ldquo;液压油温升高和受作业冲击力产生的&lsquo;疲劳&rsquo;等因素，一台液压设备动力强夯机使用年限不长。&rdquo;博邦重工董事长张俊强率团队用了</div>
<div>近10年时间、经过上千次改进和实验解决了这一难题。</div>
<div>&ldquo;改液压为机械。&rdquo;张俊强说，采用其发明的&ldquo;一种机液双驱动卷扬系统和强夯机&rdquo;专利技术，此次下线的履带式强夯机可以选用相对低排量的发动机而达到高排量需求，达到节能减排目的。</div>
<div>针对高强度施工条件下制造的加强型卷扬与传动系统，能够达到同级别强夯机3倍以上的单绳拉力，并可靠工作。</div>
<div>&nbsp; &nbsp;张俊强还表示，博邦专利技术打造的专用控制系统，通过液、电、气的控制，能够实现起锤、对点平稳，空中停锤安全可靠，并具备重锤空中安全下放的功能。整机缓冲系统通过防后倾组件、后座力缓冲组件，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (11, '荆首新闻|公司新闻|荆首建设', 1, '/var/www/html/441/a/gongsixinwen/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- content begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
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
<div class="media_img float-left"><a href="18.html"><img src="https://s1.imagehub.cc/images/2021/05/07/srchttp___www.zdyt.cc_uploadfile_201505_20150530223346281.jpgreferhttp___www.zdyt.jpg" alt="强夯机是如何工作的" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="强夯机是如何工作的" href="18.html">强夯机是如何工作的</a></h3>
<div class="time">时间:2021-5-10</div>
<p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。强夯机的施工范围及原理...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="17.html"><img src="https://s1.imagehub.cc/images/2021/05/10/0d9bee6c6774a58287d214f147ac8690.jpg" alt="强夯施工如何选择强夯机" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="强夯施工如何选择强夯机" href="17.html">强夯施工如何选择强夯机</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="16.html"><img src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg" alt="强夯机回填复杂地基施工的过程" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="强夯机回填复杂地基施工的过程" href="16.html">强夯机回填复杂地基施工的过程</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">强夯机在施工过程中，会出现填料不足的情况，这是需要人工的施工。强夯机的施工范围及原理适用范围。本施工工法适用于桥台背回填、小范围基...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="15.html"><img src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg" alt="地基强夯施工要点" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="地基强夯施工要点" href="15.html">地基强夯施工要点</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">强夯施工应属于动态信息化的施工方式,强夯参数的选择应根据工程的实际地质情况及规范的经验取值初步确定强夯参数,通过试夯时的综合检测手段验证取值....</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="14.html"><img src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg" alt="路基强夯施工技术研究" width="188" height="141" /></a></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (18, '高速公路路基强夯施工实施案例。', 1, '/var/www/html/441/a/xingyexinwen/24.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<p>&nbsp;</p>
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<p>&nbsp;</p>
<!-- header end-->
<div class="layout">
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>高速公路路基强夯施工实施案例。</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-<span style="font-size: inherit; color: #000000;">05-11 </span><strong style="font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit;">点击:</strong></div>
<div class="description">
<div>
<div>一、强夯法简介：</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; 强夯法处理地基（又称动力固结法）是20世纪60年代由法国Menard技术公司首先创用的，这种方法是利用大型履带式强夯机将重锤（一般为100～400kN）从高处自由落下（落距一般为6～40m）给地基以冲击力和振动，</div>
<div>从而提高地基土的强度并降低其压缩性。强夯法施工已广泛运用到高速公路铁路，机场、核电站、大工业区、港口填海等基础加固工程。优点：工期短、效果好、造价低。</div>
<div>1、加固深度应根据现场试夯或当地经验确定;</div>
<div>2、 强夯的单位夯击能量，应根据地基土类别、结构类型荷载大小和要求处理的深度等综合考虑，并通过现场试夯确定。在一般情况下，对于粗颗粒土可取1000～3000KN&middot;m/m2；细颗粒土可取1500～4000KN&middot;m/m2。</div>
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
<div>&nbsp; &nbsp; &nbsp;1、现场技术办公会议纪要（有时也称四方现场会议纪要）这个是变更最初的原始资料，很重要，没有这个东西啥指示都是空谈，搞管理的一定要记住但凡是变更工程，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (10, '荆首新闻|荆首建设|荆首资讯|荆首工程', 1, '/var/www/html/441/a/news/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心</title>
  
  
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
          <div class="page-list xl12">
            <div class="pre xl6" >上一页</div>
            <div class="next xl6">下一页</div>
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心</title>
  
  
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
          <div class="page-list xl12">
            <div class="pre xl6" >上一页</div>
            <div class="next xl6">下一页</div>
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

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (17, '荆首新闻|行业新闻|荆首建设', 1, '/var/www/html/441/a/xingyexinwen/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 行业新闻</title>
  
  
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 行业新闻</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
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
<div class="media_img float-left"><a href="24.html"><img src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="高速公路路基强夯施工实施案例" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="高速公路路基强夯施工实施案例" href="24.html">高速公路路基强夯施工实施案例</a></h3>
<div class="time">时间:2021-01-31</div>
<p class="desc">强夯法处理地基（又称动力固结法）是20世纪60年代由法国Menard技术公司首先创用的，这种方法是利用大型履带式强夯机将重锤.....</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="23.html"><img src="https://s1.imagehub.cc/images/2021/05/07/_20210507222026.jpg" alt="集百项专利技术的国内首台巨无霸强夯机下线" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="集百项专利技术的国内首台巨无霸强夯机下线" href="23.html">集百项专利技术的国内首台巨无霸强夯机下线</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">这台型号为BTM1800的&ldquo;战虎&rdquo;强夯机，由国家高新技术企业湖南博邦重工有限公司厂区(简称&ldquo;博邦重工&rdquo;)研发，集中了近百项专利技术，自重100吨，起重臂高35米，履带有半人...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a title="湖南省首台大能量级强夯机宁乡经济开发区开锤" href="22.html"><img src="https://s1.imagehub.cc/images/2021/05/07/_20210507222033.jpg" alt="湖南省首台大能量级强夯机宁乡经济开发区开锤" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="湖南省首台大能量级强夯机宁乡经济开发区开锤" href="22.html">湖南省首台大能量级强夯机宁乡经济开发区开锤</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">湖南省首台大能量级强夯机7000B强夯机徐徐升锤、怦然撼地，拉开了宁乡经济...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="21.html"><img src="https://s1.imagehub.cc/images/2021/05/11/24.jpg" alt="中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破" href="21.html">中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc">夯"这个词语在我国建设历史上源远流长，从人工到机械，虽是建筑工程基础施工必备的机械设备，但是只在基础制作过程中使用，不像挖掘机等适用广泛，可以说是一个"冷门机械"...</p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="20.html"><img src="https://s1.imagehub.cc/images/2021/05/10/0d9bee6c6774a58287d214f147ac8690.jpg" alt="42kj高速液压夯实机型号区分，装载机带的打夯机价格" width="188" height="141" /></a></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (20, '湖南省首台大能量级强夯机宁乡经济开发区开锤', 1, '/var/www/html/441/a/xingyexinwen/22.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>湖南省首台大能量级强夯机宁乡经济开发区开锤</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2018-01-25 <strong>点击:</strong></div>
<div class="description">
<div>
<div>1月上旬，湖南省首台大能量级强夯机7000B强夯机徐徐升锤、怦然撼地，拉开了宁乡经济开发区湖南建工产业园项目全面建设的序幕。</div>
<div>&nbsp; &nbsp; &nbsp;宁乡经济开发区湖南建工产业园项目位于宁乡市金玉大道以西，玉兴路（规划道路）以南，总投资10亿元，项目用地约250亩，主要生产建筑用产品生产+建筑制造业+建筑设备+技术服务+展示展览+仓储物流。</div>
<div>届时湖南省第六工程有限公司钢结构分公司、湖南六建机电安装有限责任公司、湖南省机械化施工有限公司、湖南六建物资租赁有限公司等9家企业将会入驻园区。项目建成后预计第一年产值达7亿元，预计年税收贡献2500万元。</div>
<div>预计第五年产值达10亿元，预计年税收贡献3500万元。</div>
<div>&nbsp; &nbsp; 近几年湖南省机械化施工有限公司为不断做大做强企业品牌，实现产品升级、产业扩张、行业引领，打造&ldquo;专业突出，特色明显&rdquo;的总承包企业，湖南省机械化施工有限公司继2005年，</div>
<div>在省内首次引进了两台性能最为先进的山河智能SWDM220型旋挖机之后，2020年6月29日通过公司大型设备采购线上公开招标（线上集采平台）又在省内首次引进HZQH7000B强夯机一台。</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (21, '中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破', 1, '/var/www/html/441/a/xingyexinwen/21.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h1>中国首台90吨强夯机下线，超级工程添利器，冷门机械是否要突破</h1>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-11&nbsp;<strong>点击:</strong></div>
<div class="description">
<div>
<div>&nbsp;"打夯"这个词语在我国建设历史上源远流长，从人工到机械，虽是建筑工程基础施工必备的机械设备，但是只在基础制作过程中使用，不像挖掘机等适用广泛，可以说是一个"冷门机械"。</div>
<div>&nbsp; &nbsp; &nbsp;最近国内首台履带式90吨夯锤的强夯机"战虎"在湖南宁乡下线，行业热议，有人说这是工程机械行业的巨大进步，也有人说"傻大黑粗"没什么意义。那么强夯机做到如此规格到底有什么什么"黑科技"，</div>
<div>所谓冷门机械要不要突破呢？</div>
<div>&nbsp; &nbsp; &nbsp;因素1：国内强夯机中的"巨无霸"，助力超级工程基础扎实，提升效率</div>
<div>&nbsp; &nbsp; &nbsp;10月底，位于湖南宁乡某公司厂区，国内首台"战虎"巨无霸履带式强夯机正式下线，在进行最后的调试后，将交付给来自重庆的客户。这款履带式强夯机自重就达到了100吨，起重臂35米高。</div>
<div>那么这样的巨无霸到底是什么黑科技？</div>
<div>&nbsp; &nbsp; &nbsp;强夯机是利用机械动力将几吨至几十吨的重锤，从几米至十几米的高处自由落下，对土体进行动力夯击，使土产生强制压密而减少其压缩性、提高强度。这种加固方法业内叫"强夯法" 。</div>
<div>&nbsp; &nbsp; &nbsp;强夯机主要用于建筑施工中地基压实作业，根据使用环境不一样，采用强夯机压实机械的类型也不一样：振动型，，液压夯实型，吊锤锤型。使用强夯机提高地基承载力，减少沉降。</div>
<div>在动力置换过程中，虽然土体结构遭到破坏，地基土产生超静孔隙水压力，但随着时间的推移土体结构强度会恢复。</div>
<div>&nbsp; &nbsp; &nbsp;而这套命名为"战虎"的强夯机是目前国内强夯机中夯锤最重的，可以专门用来填海、筑路、超高层建筑的基础夯实、也可以用来打桩，是建筑施工项目基础施工不可缺少的重型工程机械。</div>
<div>&nbsp; &nbsp; &nbsp;有人说不就是把东西做大吗，也就"傻大黑粗"是这些我国施工机械的特点。但是这装备用时髦的话说："岂止于大"。</div>
<div>&nbsp; &nbsp; &nbsp;强夯机施工时候发生的振动影响的安全间隔的断定，一直都是强夯机施工中的难题，它不光涉及到安全规范的断定、地基土的特性，还涉及强夯机能级的巨细、夯锤的面积巨细等许多要素。</div>
<div>&nbsp; &nbsp; &nbsp;如果不在现场进行振动查验很难给出适合的数据，现场查验又不能每项工程都能做到，特别是在地基处理计划初步断定阶段就进行现场振动查验也不现实。只有在安全运行的前提下，</div>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (15, '强夯施工中表层土夯实的必要性', 1, '/var/www/html/441/a/gongsixinwen/15.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<h4 style="line-height: 60px; font-size: 18px; color: #333333; text-align: center; font-family: 宋体; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;"><strong><span style="font-size: 18pt;">强夯施工中表层土夯实的必要性</span></strong></h4>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp;<span style="font-size: 12pt;">在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅，即险加固深层土，再加固中层土，最终加固表层土。依照现在强夯施工工艺先用2~3变点夯加固深层土和中层土，最终采纳低能量满夯加固表土。</span></p>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;"><span style="font-size: 12pt;">&nbsp;&nbsp;&nbsp; 当点夯完结后，常用推土机将夯坑回填推平，因而夯坑底面标高以上的填土比较疏松，加上发作的强壮振荡，使周围现已夯实的表层土可能有必定程度的振松，所以通过满夯来将表层土夯实。</span></p>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;"><span style="font-size: 12pt;">&nbsp;&nbsp;&nbsp; 所用夯锤的底面积问题：底面积大小与土的类型有关。一般来说平，关于砂质土和碎石填土，选用底面积2～4平方米较为适宜，关于一般第四纪粘性土主张产用3～4平方米；关于淤泥质土主张产用4～6平方米为宜。</span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (23, '荆首新闻|技术展示|湖南荆首', 1, '/var/www/html/441/a/jishuzhanshi/index.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 技术展示</title>
  
  
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
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/products/index.html">设备展示</a>
                </li>
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
                <li class=""><a class="first-level" href="https://www.hnjingshou.com/a/feedback/index.html">在线留言</a>
                </li>
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
                      <h3><a title="汽车零部件知识的详细分析" href="33.html">盘点强夯机最全操作方法</a></h3>
                      <div class="time">时间:2018-01-31</div>
                      <p class="desc"><span
                          style="color: #000000; font-family: "Microsoft Yahei", arial, tahoma, sans-serif; font-size: 8pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: start;">1.强夯法适用于碎石土、砂土、低饱和度粉土、粘性土、湿陷性黄土、高回填土、杂填土等地基加固工程；也可用于粉土及粉砂液化的地基加固工程...</span>
                      </p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="32.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg"
                          alt="买几把洗水枪的小窍门" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="买几把洗水枪的小窍门" href="32.html">强夯及的工作原理及市场</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <div
                        style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px; font-family: "Microsoft Yahei", arial, tahoma, sans-serif; color: #000000;">
                        <div class="description"
                          style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px; font-family: "Microsoft Yahei", arial, tahoma, sans-serif;">
                          1.动力密实</div>
                        <div class="description"
                          style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px; font-family: "Microsoft Yahei", arial, tahoma, sans-serif;">
                          &nbsp; &nbsp; <span
                            style="font-size: 8pt;">使用强夯机加固多孔隙、粗颗粒、非饱和土是基于动力密实的机理，即用冲击型动力荷载使土中的孔隙体积减小，土体变得密实，从而提高地基土的强度，非饱和土的夯实过程，就是土中的气相被挤出的过程...</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <h3>&nbsp;</h3>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="31.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg"
                          alt="雨天镜看不到治疗方法" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="雨天镜看不到治疗方法" href="31.html">液压夯实机为什么又叫液压强夯及或轻型强夯机</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc"><span
                          style="color: #000000; font-family: "Microsoft Yahei", arial, tahoma, sans-serif; font-size: 10.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">这里所说的液压夯实机或轻型强夯机就是通常我们所说的液压夯实机的别名。许多常年做工程的朋友，一下子叫不出液压夯实机的学名，根据其工作原理，</span><span
                          style="color: #000000; font-family: "Microsoft Yahei", arial, tahoma, sans-serif; font-size: 10.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">就称之为&ldquo;液压强夯机&rdquo;或&ldquo;轻型强夯机&rdquo;....</span>
                      </p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="30.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="你知道汽车备用轮胎最长的寿命吗？"
                          width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3><a title="你知道汽车备用轮胎最长的寿命吗？" href="30.html">强夯施工的优点是什么？正确的施工步骤有哪些？</a></h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc"><span
                          style="color: #000000; font-family: "Microsoft Yahei", arial, tahoma, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: start;">现在的建筑工程的地基都需要对松土进行压实处理，也就都离不开打夯，小的建筑工程夯实地基用小的电动打夯机就能完成，较大的建筑工程通常对地基都有着硬性的指标...</span>
                      </p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="media media-x">
                    <div class="media_img float-left"><a href="29.html"><img
                          src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg"
                          alt="简单实用的维修技术" width="188" height="141"></a></div>
                    <div class="media-body">
                      <h3>履带式强夯机是怎么开展路基夯实的？</h3>
                      <div class="time">时间:2018-01-25</div>
                      <p class="desc"><span
                          style="color: #333333; font-family: "PingFang SC", "Lantinghei SC", "Microsoft YaHei", arial, 宋体, sans-serif, tahoma; font-size: 8pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: start;">路基压实施工当前普遍采用了大吨位振动压路机甚至履带式强夯机，碾压效果有了明显的改善，对于提高路基土的压实度起了很好的作用。</span>
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

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>新闻中心 / 技术展示</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-bottom">
<div class="line show_list">
<ul class="list-media article-media">
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="33.html"><img src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg" alt="汽车零部件知识的详细分析" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="汽车零部件知识的详细分析" href="33.html">盘点强夯机最全操作方法</a></h3>
<div class="time">时间:2018-01-31</div>
<p class="desc"><span style="color: #000000;">1.强夯法适用于碎石土、砂土、低饱和度粉土、粘性土、湿陷性黄土、高回填土、杂填土等地基加固工程；也可用于粉土及粉砂液化的地基加固工程...</span></p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="32.html"><img src="https://s1.imagehub.cc/images/2021/05/09/3ec0d920721cbe7cc766a27d8457a60.jpg" alt="买几把洗水枪的小窍门" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="买几把洗水枪的小窍门" href="32.html">强夯及的工作原理及市场</a></h3>
<div class="time">时间:2018-01-25</div>
<div style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px;">
<div class="description" style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px;">1.动力密实</div>
<div class="description" style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px;">&nbsp; &nbsp; <span style="font-size: 8pt;">使用强夯机加固多孔隙、粗颗粒、非饱和土是基于动力密实的机理，即用冲击型动力荷载使土中的孔隙体积减小，土体变得密实，从而提高地基土的强度，非饱和土的夯实过程，就是土中的气相被挤出的过程...</span></div>
</div>
</div>
</div>
</li>
<li>
<h3>&nbsp;</h3>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="31.html"><img src="https://s1.imagehub.cc/images/2021/05/09/1905131113444296003000696308.jpg" alt="雨天镜看不到治疗方法" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="雨天镜看不到治疗方法" href="31.html">液压夯实机为什么又叫液压强夯及或轻型强夯机</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc"><span style="color: #000000;">这里所说的液压夯实机或轻型强夯机就是通常我们所说的液压夯实机的别名。许多常年做工程的朋友，一下子叫不出液压夯实机的学名，根据其工作原理，</span><span style="color: #000000;">就称之为&ldquo;液压强夯机&rdquo;或&ldquo;轻型强夯机&rdquo;....</span></p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="30.html"><img src="https://s1.imagehub.cc/images/2021/05/07/_20210507221957.jpg" alt="你知道汽车备用轮胎最长的寿命吗？" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="你知道汽车备用轮胎最长的寿命吗？" href="30.html">强夯施工的优点是什么？正确的施工步骤有哪些？</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc"><span style="color: #000000;">现在的建筑工程的地基都需要对松土进行压实处理，也就都离不开打夯，小的建筑工程夯实地基用小的电动打夯机就能完成，较大的建筑工程通常对地基都有着硬性的指标...</span></p>
</div>
</div>
</li>
<li>
<div class="media media-x">
<div class="media_img float-left"><a href="29.html"><img src="https://s1.imagehub.cc/images/2021/05/09/b151f8198618367a89204b466e4af2d1b21ce5ba.jpg" alt="简单实用的维修技术" width="188" height="141" /></a></div>
<div class="media-body">
<h3><a title="履带式强夯机是怎么开展路基夯实的？" href="https://www.hnjingshou.com/a/jishuzhanshi/29.html" target="_blank" rel="noopener">履带式强夯机是怎么开展路基夯实的？</a></h3>
<div class="time">时间:2018-01-25</div>
<p class="desc"><span style="color: #333333;">路基压实施工当前普遍采用了大吨位振动压路机甚至履带式强夯机，碾压效果有了明显的改善，对于提高路基土的压实度起了很好的作用。</span></p>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (24, '盘点强夯机最全操作方法', 1, '/var/www/html/441/a/jishuzhanshi/33.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009450725cfea5884aa8efa.jpg" alt="优质品用心服务" width="1920" /></div>
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
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (33, '瑞金市城乡学校建设项目强夯工程', 1, '/var/www/html/441/a/gongsixinwen/d1.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormalIndent" style="margin-left: 0pt; text-indent: 28pt; line-height: 150%; text-align: center;"><!-- [if !supportLists]--><strong><span style="font-family: 宋体; line-height: 150%; font-size: 18pt;"><span style="font-family: 宋体;">瑞金市城乡学校建设项目强夯工程</span></span></strong></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp;<span style="font-family: 宋体; font-size: 14pt; color: #000000; text-indent: 28pt;">湖南荆首建设有限公司承接了瑞金市城乡学校建设工程，为瑞金重点建设工程，瑞金市长征小学，长征幼儿园新建项目为瑞金市城乡学校建设项目之一。建设单位：瑞金市红都市政工程管理有限公司；设计单位：信息产业电子第十一设计研究院科技工程股份有限公司；施工单位：中冶交通建设集团有限公司。</span></p>
<p class="MsoNormal" style="text-indent: 28pt;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span><span style="font-family: Calibri;">10000</span><span style="font-family: 宋体;">平方米，采用</span><span style="font-family: Calibri;">2000KN.m</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">12000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">5</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">5</span><span style="font-family: 宋体;">日完工。湖南荆首建设有限公司一直秉承高效施工，节省时间、快速优化、改良基础的理念，用最快最短的时间完成目标任务。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。强夯施工开始清理场地机具准备、按设计要求布置锤位线、</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">标出第一遍夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">、</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">并测量场地高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯击、夯锤位移、施工场地平整、</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">对各项施工参数及施工情况进行详细记录</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">带门架按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
<p class="MsoNormal">&nbsp;</p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormalIndent" style="margin-left: 0pt; text-indent: 28pt; line-height: 150%; text-align: center;"><!-- [if !supportLists]--><strong><span style="font-family: 宋体; line-height: 150%; font-size: 18pt;"><span style="font-family: 宋体;">瑞金市城乡学校建设项目强夯工程</span></span></strong></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp;<span style="font-family: 宋体; font-size: 14pt; color: #000000; text-indent: 28pt;">湖南荆首建设有限公司承接了瑞金市城乡学校建设工程，为瑞金重点建设工程，瑞金市长征小学，长征幼儿园新建项目为瑞金市城乡学校建设项目之一。建设单位：瑞金市红都市政工程管理有限公司；设计单位：信息产业电子第十一设计研究院科技工程股份有限公司；施工单位：中冶交通建设集团有限公司。</span></p>
<p class="MsoNormal" style="text-indent: 28pt;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span><span style="font-family: Calibri;">10000</span><span style="font-family: 宋体;">平方米，采用</span><span style="font-family: Calibri;">2000KN.m</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">12000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">5</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">5</span><span style="font-family: 宋体;">日完工。湖南荆首建设有限公司一直秉承高效施工，节省时间、快速优化、改良基础的理念，用最快最短的时间完成目标任务。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。强夯施工开始清理场地机具准备、按设计要求布置锤位线、</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">标出第一遍夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">、</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">并测量场地高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯击、夯锤位移、施工场地平整、</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">对各项施工参数及施工情况进行详细记录</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">带门架按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
<p class="MsoNormal">&nbsp;</p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-22 08:29:27.971493+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (32, '瑞金市城乡学校建设项目强夯工程', 1, '/var/www/html/441/a/jingmi/c1.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>工程案例</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_2021071009452398b9ffca95ebccf6.jpg" width="1920" /></div>
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
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1712133504.jpg" width="408" height="230" /></div>
<h3><a title="精密汽车零件012">中建筑港港口强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/394622667.jpg" width="307" height="230" /></div>
<h3><a title="精密汽车零件011">城陵矶强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1891563201.jpg" width="306" height="230" /></div>
<h3><a title="精密汽车零件010">正宁东方畜牧场强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/2043820902.jpg" width="306" height="230" /></div>
<h3><a title="精密汽车零件009">湖南临湘工业园强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/1994182165.jpg" width="300" height="230" /></div>
<h3><a title="精密汽车零件008">中国石化工程强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/20/909011773.jpg" width="307" height="230" /></div>
<h3><a title="精密汽车零件007">明煌建设土地强夯</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/715941240.jpg" width="307" height="230" /></div>
<h3><a title="精密汽车零件006">新好农牧强夯项目</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/912121367.jpg" width="3968" height="230" /></div>
<h3><a title="精密汽车零件005">文化产业园强夯项目</a></h3>
</div>
</div>
<div class="xm4 xs6 xl6 margin-large-bottom text-center">
<div class="item">
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/05/22/933237279.jpg" width="307" height="230" /></div>
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
<!-- content end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', NULL, '2021-11-22 08:23:27.833675+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (34, '正威韶关浈江土石方地基处理项目', 1, '/var/www/html/441/a/gongsixinwen/d2.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal" style="text-indent: 28.0000pt; mso-char-indent-count: 2.0000; text-autospace: ideograph-numeric; mso-pagination: none; line-height: 150%;"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; line-height: 150%; font-style: normal;"><span style="font-family: 宋体;">正威韶关浈江土石方地基处理项目</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp; &nbsp;<span style="font-size: 14pt; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #000000; font-family: 宋体;">该项目位于东莞（韶关）浈江产业转移工业园内，工程主要内容为土方平整、强夯、挖方、填方等。一期投资约</span><span style="font-family: 宋体; font-size: 14pt; font-style: normal; color: #000000;">103亿元。项目单位：韶关市浈江区莞汇展鹏投资有限公司。</span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span><span style="font-family: Calibri;">40</span><span style="font-family: 宋体;">多万平方米，采用</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">5000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">18</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">20</span><span style="font-family: 宋体;">日完工。</span><span style="font-family: Calibri;">26</span><span style="font-family: 宋体;">年来荆首建设覆盖业务全国各城市，主要承接</span><span style="font-family: Calibri;">1000-25000kn .m</span><span style="font-family: 宋体;">强夯工程。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。湖南荆首建设有限公司先</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">清理并平整施工场地</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">标出第一遍夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">并测量场地高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤置于夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">测量夯前锤</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">顶</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，夯锤脱钩自由下落，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用杭重</span><span style="font-family: Calibri;">3000C</span><span style="font-family: 宋体;">、宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">带门架按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%; text-align: center;"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; line-height: 150%; font-style: normal;"><span style="font-family: 宋体;">正威韶关浈江土石方地基处理项目</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp; &nbsp;<span style="font-size: 14pt; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #000000; font-family: 宋体;">该项目位于东莞（韶关）浈江产业转移工业园内，工程主要内容为土方平整、强夯、挖方、填方等。一期投资约</span><span style="font-family: 宋体; font-size: 14pt; font-style: normal; color: #000000;">103亿元。项目单位：韶关市浈江区莞汇展鹏投资有限公司。</span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span><span style="font-family: Calibri;">40</span><span style="font-family: 宋体;">多万平方米，采用</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">5000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">18</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">20</span><span style="font-family: 宋体;">日完工。</span><span style="font-family: Calibri;">26</span><span style="font-family: 宋体;">年来荆首建设覆盖业务全国各城市，主要承接</span><span style="font-family: Calibri;">1000-25000kn .m</span><span style="font-family: 宋体;">强夯工程。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。湖南荆首建设有限公司先</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">清理并平整施工场地</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">标出第一遍夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">并测量场地高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤置于夯点位置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">测量夯前锤</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">顶</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">高程</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">；</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，夯锤脱钩自由下落，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用杭重</span><span style="font-family: Calibri;">3000C</span><span style="font-family: 宋体;">、宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">带门架按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-22 08:32:09.732633+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (35, '东源风行牧业有限公司下欧庄岗生猪养殖项目土石方工程', 1, '/var/www/html/441/a/gongsixinwen/d3.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%; text-align: center;"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; line-height: 150%;"><span style="font-family: 宋体;">东源风行牧业有限公司下欧庄岗生猪养殖项目土石方工程</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp; &nbsp;<span style="color: #000000; font-weight: normal; text-indent: 28pt; font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: 宋体;">该工程占地面积约</span><span style="font-family: Calibri;">2500</span><span style="font-family: 宋体;">亩。包含</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">栋</span><span style="font-family: Calibri;">3</span><span style="font-family: 宋体;">层楼钢筋混凝土母猪楼房，</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">栋</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">层楼钢筋混凝土育肥楼，</span><span style="font-family: Calibri;">1</span><span style="font-family: 宋体;">栋单层隔离舍，</span><span style="font-family: Calibri;">1</span><span style="font-family: 宋体;">栋单层公猪站，三处配套办公生活区，一处综合环保区，其他零星配套管理用房。挖方工程量约</span><span style="font-family: Calibri;">140.8</span><span style="font-family: 宋体;">万</span><span style="font-family: Calibri;">m3</span><span style="font-family: 宋体;">、填方工程量约</span><span style="font-family: Calibri;">112.8</span><span style="font-family: 宋体;">万</span><span style="font-family: Calibri;">m3</span><span style="font-family: 宋体;">；强夯面积约</span><span style="font-family: Calibri;">19.0</span><span style="font-family: 宋体;">万㎡；边坡护坡面积总共约</span><span style="font-family: Calibri;">15.7</span><span style="font-family: 宋体;">万㎡，挖方边坡</span><span style="font-family: Calibri;">7.5</span><span style="font-family: 宋体;">万㎡，填方边坡约</span><span style="font-family: Calibri;">8.2</span><span style="font-family: 宋体;">万㎡，其中高边坡约</span><span style="font-family: Calibri;">5.9</span><span style="font-family: 宋体;">万㎡；挡土墙长度约</span><span style="font-family: Calibri;">2470m</span><span style="font-family: 宋体;">。项目控制价为：</span><span style="font-family: Calibri;">61015156.86</span><span style="font-family: 宋体;">元。</span></span><span style="color: #000000; font-style: normal; font-weight: normal; text-indent: 28pt; font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: 宋体;">项目单位：东源风行牧业有限公司。</span></span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span></span><span style="font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: Calibri;">190033.91</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">平方米，采用</span><span style="font-family: Calibri;">1000KN.m</span><span style="font-family: 宋体;">、</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">25</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">23</span><span style="font-family: 宋体;">日完工。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">正式强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。施工前场地平整，按照设计压实度分层填碎石至设计标高，标出第一遍夯点位置测量场地高程，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，开启脱钩装置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤脱钩自由下落，放下吊钩，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%; text-align: center;"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; line-height: 150%;"><span style="font-family: 宋体;">东源风行牧业有限公司下欧庄岗生猪养殖项目土石方工程</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp; &nbsp;<span style="color: #000000; font-weight: normal; text-indent: 28pt; font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: 宋体;">该工程占地面积约</span><span style="font-family: Calibri;">2500</span><span style="font-family: 宋体;">亩。包含</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">栋</span><span style="font-family: Calibri;">3</span><span style="font-family: 宋体;">层楼钢筋混凝土母猪楼房，</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">栋</span><span style="font-family: Calibri;">6</span><span style="font-family: 宋体;">层楼钢筋混凝土育肥楼，</span><span style="font-family: Calibri;">1</span><span style="font-family: 宋体;">栋单层隔离舍，</span><span style="font-family: Calibri;">1</span><span style="font-family: 宋体;">栋单层公猪站，三处配套办公生活区，一处综合环保区，其他零星配套管理用房。挖方工程量约</span><span style="font-family: Calibri;">140.8</span><span style="font-family: 宋体;">万</span><span style="font-family: Calibri;">m3</span><span style="font-family: 宋体;">、填方工程量约</span><span style="font-family: Calibri;">112.8</span><span style="font-family: 宋体;">万</span><span style="font-family: Calibri;">m3</span><span style="font-family: 宋体;">；强夯面积约</span><span style="font-family: Calibri;">19.0</span><span style="font-family: 宋体;">万㎡；边坡护坡面积总共约</span><span style="font-family: Calibri;">15.7</span><span style="font-family: 宋体;">万㎡，挖方边坡</span><span style="font-family: Calibri;">7.5</span><span style="font-family: 宋体;">万㎡，填方边坡约</span><span style="font-family: Calibri;">8.2</span><span style="font-family: 宋体;">万㎡，其中高边坡约</span><span style="font-family: Calibri;">5.9</span><span style="font-family: 宋体;">万㎡；挡土墙长度约</span><span style="font-family: Calibri;">2470m</span><span style="font-family: 宋体;">。项目控制价为：</span><span style="font-family: Calibri;">61015156.86</span><span style="font-family: 宋体;">元。</span></span><span style="color: #000000; font-style: normal; font-weight: normal; text-indent: 28pt; font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: 宋体;">项目单位：东源风行牧业有限公司。</span></span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">湖南荆首建设有限公司承接强夯地基处理工程量</span></span><span style="font-family: 宋体; line-height: 150%; font-size: 14pt;"><span style="font-family: Calibri;">190033.91</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">平方米，采用</span><span style="font-family: Calibri;">1000KN.m</span><span style="font-family: 宋体;">、</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">25</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">8</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">23</span><span style="font-family: 宋体;">日完工。</span></span></p>
<p class="MsoNormal"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">正式强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。施工前场地平整，按照设计压实度分层填碎石至设计标高，标出第一遍夯点位置测量场地高程，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，开启脱钩装置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤脱钩自由下落，放下吊钩，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">按地基处理设计要求施工，以达到设计要求，检测合格。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-22 08:34:44.762919+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (36, '湖北襄阳汉江新集水电站工程建设项目', 1, '/var/www/html/441/a/gongsixinwen/d4.html', '{"indexBanner":null,"deviceBanner":null,"hezuo":null}', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; font-style: normal;"><span style="font-family: 宋体;">湖北襄阳汉江新集水电站工程建设项目</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp;<span style="font-family: 宋体; font-size: 14pt; font-style: normal; color: #000000;">该项目位于湖北省襄阳市，我司工程主要内容为强夯地基处理施工及航道灌注桩施工。总包单位：中国水利水电四局。</span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">承接强夯地基处理工程量</span><span style="font-family: Calibri;">21</span><span style="font-family: 宋体;">万平方米，航道灌注桩桩径</span><span style="font-family: Calibri;">80</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">150cm</span><span style="font-family: 宋体;">共</span><span style="font-family: Calibri;">12</span><span style="font-family: 宋体;">万延米。强夯采用</span><span style="font-family: Calibri;">1000KN.m</span><span style="font-family: 宋体;">、</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">11</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">9</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">23</span><span style="font-family: 宋体;">日完工。荆首建设自有设备</span><span style="font-family: Calibri;">50</span><span style="font-family: 宋体;">多台，高中职称技术人员占比</span><span style="font-family: Calibri;">50%</span><span style="font-family: 宋体;">，工程技术管理人员占比</span><span style="font-family: Calibri;">15%</span><span style="font-family: 宋体;">业界口碑领先。</span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：强夯</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">正式强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。施工前场地平整，按照设计压实度分层填碎石至设计标高，标出第一遍夯点位置测量场地高程，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，开启脱钩装置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤脱钩自由下落，放下吊钩，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">按地基处理设计要求施工，以达到设计要求，检测合格。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">荆首</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">建设</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">每年施工上百万平米，全程可视化操作，好评率高达</span><span style="font-family: Calibri;">98%</span><span style="font-family: 宋体;">。</span></span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;">&nbsp;</p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">航道灌注桩旋挖施工先对施工现场进行测量并确定好孔桩的位置并进行标注，埋设护筒其上沿通常比地面高</span><span style="font-family: Calibri;">10cm</span><span style="font-family: 宋体;">左右，护筒中心和孔桩中心一致，调整好钻头、钻杆，当钻机钻孔到设计深度，对钻孔进行检查，确保深度符合设计要求，最后严格按施工要求对钢筋进行焊接将其制作成钢筋笼，放入桩孔固定，孔桩浇筑完成后及时做好养护工作。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '<!DOCTYPE html>
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class=""><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<div class="slideshow"><img style="height: 100%;" src="https://s1.imagehub.cc/images/2021/07/10/_202107100944504eddfd8c9348abff.jpg" alt="湖南荆首" width="1920" /></div>
</div>
<!-- 内容展示 begin-->
<div id="fh5co-content_show" class="layout">
<div class="container">
<div class="line-big">
<div class="hidden-l xs4 xm3 xb3">
<div class="leftbar">
<h3>新闻中心</h3>
<ul id="subnav" class="nav submenu nav-navicon">
<li class="active"><a class="thisclass" href="https://www.hnjingshou.com/a/gongsixinwen/index.html">公司新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/xingyexinwen/index.html">行业新闻</a></li>
<li><a title="Technical" href="https://www.hnjingshou.com/a/jishuzhanshi/index.html">技术展示</a></li>
</ul>
</div>
</div>
<div class="xl12 xs8 xm9">
<div class="show_content padding-large-bottom  content_detail">
<div class="show_body detail">
<p class="MsoNormal" style="text-align: center;"><span style="font-size: 18pt;"><strong><span style="font-family: 宋体; font-style: normal;"><span style="font-family: 宋体;">湖北襄阳汉江新集水电站工程建设项目</span></span></strong></span></p>
<div class="padding-bottom qhd-title"><strong>文章来源:</strong>未知<strong>时间:</strong>2021-05-10<strong>点击:</strong></div>
<div class="description">
<div>
<p style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">&nbsp; &nbsp;<span style="font-family: 宋体; font-size: 14pt; font-style: normal; color: #000000;">该项目位于湖北省襄阳市，我司工程主要内容为强夯地基处理施工及航道灌注桩施工。总包单位：中国水利水电四局。</span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">承接强夯地基处理工程量</span><span style="font-family: Calibri;">21</span><span style="font-family: 宋体;">万平方米，航道灌注桩桩径</span><span style="font-family: Calibri;">80</span><span style="font-family: 宋体;">～</span><span style="font-family: Calibri;">150cm</span><span style="font-family: 宋体;">共</span><span style="font-family: Calibri;">12</span><span style="font-family: 宋体;">万延米。强夯采用</span><span style="font-family: Calibri;">1000KN.m</span><span style="font-family: 宋体;">、</span><span style="font-family: Calibri;">3000KN.m</span><span style="font-family: 宋体;">夯击能，于</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">7</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">11</span><span style="font-family: 宋体;">日开工至</span><span style="font-family: Calibri;">2021</span><span style="font-family: 宋体;">年</span><span style="font-family: Calibri;">9</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">23</span><span style="font-family: 宋体;">日完工。荆首建设自有设备</span><span style="font-family: Calibri;">50</span><span style="font-family: 宋体;">多台，高中职称技术人员占比</span><span style="font-family: Calibri;">50%</span><span style="font-family: 宋体;">，工程技术管理人员占比</span><span style="font-family: Calibri;">15%</span><span style="font-family: 宋体;">业界口碑领先。</span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">&nbsp; &nbsp; 工作内容：强夯</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">正式强夯施工前</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">应根据初步确定的强夯参数，进行现场试夯，检验</span></span><span style="mso-spacerun: ''yes''; font-family: Calibri; mso-fareast-font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">满足要求方能进行正式强夯施工</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">。施工前场地平整，按照设计压实度分层填碎石至设计标高，标出第一遍夯点位置测量场地高程，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">将夯锤起吊到预定高度，开启脱钩装置</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">，</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">夯锤脱钩自由下落，放下吊钩，测量锤顶高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">最后，采用低能量满夯，将场地表层松土夯实，并测量夯后场地高程。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">此工程采用宇通强夯机</span><span style="font-family: Calibri;">450B</span><span style="font-family: 宋体;">按地基处理设计要求施工，以达到设计要求，检测合格。</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">荆首</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">建设</span></span><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">每年施工上百万平米，全程可视化操作，好评率高达</span><span style="font-family: Calibri;">98%</span><span style="font-family: 宋体;">。</span></span></p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;">&nbsp;</p>
<p class="MsoNormal" style="text-indent: 28pt; line-height: 150%;"><span style="mso-spacerun: ''yes''; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: ''Times New Roman''; line-height: 150%; font-size: 14.0000pt; mso-font-kerning: 1.0000pt;"><span style="font-family: 宋体;">航道灌注桩旋挖施工先对施工现场进行测量并确定好孔桩的位置并进行标注，埋设护筒其上沿通常比地面高</span><span style="font-family: Calibri;">10cm</span><span style="font-family: 宋体;">左右，护筒中心和孔桩中心一致，调整好钻头、钻杆，当钻机钻孔到设计深度，对钻孔进行检查，确保深度符合设计要求，最后严格按施工要求对钢筋进行焊接将其制作成钢筋笼，放入桩孔固定，孔桩浇筑完成后及时做好养护工作。</span></span></p>
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
<!-- 内容展示 end--><footer>
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
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
</body>

</html>', '2021-11-22 08:38:06.18623+00', NULL);
INSERT INTO "public"."asf_editor" VALUES (1, '湖南荆首|湖南荆首建设|荆首官网', 1, '/var/www/html/441/index.html', '{"indexBanner":"https://s1.imagehub.cc/images/2021/07/10/_20210710094116b65d7190215c67be.jpg,https://s1.imagehub.cc/images/2021/07/24/_20210724103549f62b639c54f9cdf7.jpg,https://s1.imagehub.cc/images/2021/07/24/_202107182002481e6bf86d8d126fd3.jpg","deviceBanner":"https://s1.imagehub.cc/images/2021/07/24/9aa715dde679c724cb.png,https://s1.imagehub.cc/images/2021/07/24/8a260ed2e490ab2a82.png,https://s1.imagehub.cc/images/2021/07/24/7a2e5f518a3cf28316.png,https://s1.imagehub.cc/images/2021/07/24/5a688b333bb515fb20.png,https://s1.imagehub.cc/images/2021/07/24/4af49b28e9fafcc2fd.png","hezuo":"https://s1.imagehub.cc/images/2021/08/14/e160b30a01a0621279354202eb9259b7e4d86e79fec41b0d.jpg,https://s1.imagehub.cc/images/2021/08/14/d89a0bdb4c68d89cedcbbf659e1eb50d131105252ae0e508.jpg,https://s1.imagehub.cc/images/2021/08/14/903504b386366483ab1efb573cfb5ce3359a26a9c84a0ff1.jpg,https://s1.imagehub.cc/images/2021/08/14/3b2a1456d313a2860448893dffbfd777da795e6f433ed7de.jpg,https://s1.imagehub.cc/images/2021/08/14/e2dea0d2ff7f572b2e8295cd578ad2e4086d2c36863b4e93.jpg,https://s1.imagehub.cc/images/2021/08/14/30f416491371689ae1d58922067ca37ab886be989b802f40.jpg"}', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>湖南荆首建设工程有限公司</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<p>&nbsp;</p>
<!-- picture begin-->
<div id="fh5co-hero" class="layout">
<div class="line">
<div class="flexslider">
<ul class="slides">
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252200450-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195136.jpg" alt="" /></li>
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252201280-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195210.jpg" alt="" /></li>
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252201070-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/07/_20210507225115.jpg" alt="" /></li>
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
<!-- <p class="desc"><span style="color: #4d96df;font-size: 20px;">湖南荆首建设工程有限公司</span></p> --></div>
<div class="show-list line">
<div class="xl12 xs4 xm4 margin-large-bottom">
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/07/10/_20210710094444ac9870eb22cb0ff6.jpg" width="344" height="260" /></div>
</div>
<div class="xl12 xs8 xm8 content margin-large-bottom">
<div class="desc">
<h2>湖南荆首建设工程有限公司</h2>
<div class="intro">湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。</div>
<div class="intro">湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--about end-->
<p>&nbsp;</p>
<!-- 我们的服务 -->
<div class="layout footer-top" style="border-bottom: 1px solid #eee;">
<div class="container">
<div class="line-big" style="text-align: center;">
<div class="hove-bg">
<h2 class="text-center" style="padding: 15px;"><strong style="font-size: 18pt; color: #4d96df;">我们的服务</strong></h2>
<p class="desc" style="margin-bottom: 25px;"><span style="color: #000000; font-size: 20px;">高效施工：节省时间 快速优化 改良基础</span></p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom" style="height: 801px; width: 1200px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/15/0e2442a7d933c8957c729ff4da1373f082020034877ec1ccf289e57d.jpg" />
<p class="service-image">人工湖强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom" style="height: 533px; width: 800px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/srchttp___www.njzh56.com_uploads_allimg_190301_113P31X8_0.jpgreferhttp___www.njzh560f526a9809e5dcb3.jpg" />
<p class="service-image">厂房及物流园强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 296px; width: 500px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/srchttp___upload.ccidnet.com_2017_0614_1497404047163.jpgreferhttp___upload.ccidnet3592de9b48243a29.jpg" />
<p class="service-image">机场强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 381px; width: 640px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/gs4fa856278707d3cd.jpg" />
<p class="service-image">路基强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 603px; width: 1072px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/15/gk0c4e34f23fdc3e93.jpg" />
<p class="service-image">港口强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 420px; width: 560px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/gtf2651978b35e792f6.jpg" />
<p class="service-image">高填方强夯</p>
</div>
</div>
</div>
</div>
<!-- 为了保障工程质量我们都有哪些 -->
<div class="layout footer-top" style="border-bottom: 1px solid #eee;">
<div class="container">
<div class="hove-bg">
<h2 class="text-center" style="padding: 15px;"><span style="font-size: 18pt;"><strong><span style="color: hsl(210, 70%, 59%);">为了保障工程质量我们都有哪些</span></strong></span></h2>
</div>
<div class="line-big">
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/25yeash.svg" />
<h3 style="font-size: 23px; color: red;"><strong>26年用心做地基处理</strong></h3>
<p style="font-size: 16px;">26年来荆首覆盖业务全国各城市，主要承接1000-25000kn .m强夯工程</p>
</div>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/zy.svg" />
<h3 style="font-size: 23px; color: red;"><strong>专业团队</strong></h3>
<p style="font-size: 16px;">自有设备50多台，高中职称技术人员占比50%，工程技术管理人员占比15%业界口碑领先</p>
</div>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/service.svg" />
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
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220034.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220042.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220126.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center  click-zoom">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220222.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507215935.png" /> </span></div>
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
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252303460-L.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252305010-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230A10-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center  click-zoom">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230J70-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230Q60-L.jpg" /> </span></div>
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
            </div> --></div>
</div>
</div>
</div>
</div>
<!--products end-->
<div id="fh5co-keyword-list" class="layout">
<div class="bg-keyword">
<div class="container">
<div class="hove-bg">
<h1 class="show_content padding-large-bottom " style="text-align: center;"><span style="color: #4d96df;"><strong>免费获得工程报价</strong></span></h1>
</div>
<form id="concat" class="form form-block" style="max-width: 500px; margin: 0px auto;">
<div class="form-group">
<div class="field"><input class="input" size="50" type="text" placeholder="姓名" data-validate="请输入您的姓名。" /></div>
</div>
<div class="form-group">
<div class="field"><input id="tel" class="input" name="telPhone" size="50" type="text" placeholder="电话" /></div>
</div>
<div class="form-group">
<div class="field"><input id="gcmj" class="input" name="area" size="50" type="text" placeholder="工程面积" /></div>
</div>
<div class="form-group">
<div class="field"><textarea id="content" class="input" name="content" placeholder="内容" data-validate="请输入内容"></textarea></div>
</div>
<div class="form-button"><button class="button bg-main margin-small-right">提交</button></div>
</form></div>
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
<div class="media_img"><a class="zoomimgs" href="a/gongsixinwen/18.html"> <img src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg" /> </a></div>
<div class="media-body">
<h3>强夯机是如何工作的</h3>
<div class="time">2021<span style="font-family: -apple-system, BlinkMacSystemFont,;">/05/10</span></div>
<p class="desc"><span style="color: #454545;">更换为饱和软粘土地基的固结强夯法。和强夯置换法的加固机理是不同的，它是一个高影响的锤高落差产生可以碎石，石材料，炉渣和其他性能强度到地面，形成聚集体墩逐个的基础上.......</span></p>
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
<h4><a title="强夯施工如何选择强夯机" href="https://www.hnjingshou.com/a/gongsixinwen/17.html">强夯施工如何选择强夯机</a></h4>
<p class="desc">想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。强夯机已经成为了建筑施工中的主流设备.......</p>
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
<h4><a title="强夯机回填复杂地基施工的过程" href="https://www.hnjingshou.com/a/gongsixinwen/16.html">强夯机回填复杂地基施工的过程</a></h4>
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
<h4><a title="地基强夯施工要点" href="https://www.hnjingshou.com/a/gongsixinwen/15.html">地基强夯施工要点</a></h4>
<p class="desc"><span style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">强夯地基是用起重机械（起重机或起重机配三脚架、龙门架）将大吨位（一般8-30t）夯锤起吊到6-30m高度后，自由落下，给地基土以强大的冲击能量的夯击，使土中出.....</span></p>
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
<h4><a title="强夯施工中表层土夯实的必要性" href="https://www.hnjingshou.com/a/gongsixinwen/14.html">强夯施工中表层土夯实的必要性</a></h4>
<p class="desc"><span style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅</span>...</p>
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
<h4><a title="浅谈强夯试夯施工" href="https://www.hnjingshou.com/a/gongsixinwen/13.html">浅谈强夯试夯施工</a></h4>
<p class="desc"><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数的选取、修正设计及试夯施工对正式施工的指导作用</span>...</p>
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
<p>&nbsp;</p>
<!--Partner begin-->
<p>&nbsp;</p>
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
<p>&nbsp;</p>
<!--Partner end-->
<p>&nbsp;</p>
<!--footer--><footer>
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
</footer><!--footer-->
<div class="blank55">&nbsp;</div>
<div id="toolbar" class="layout text-center">
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
<div class="zoom-img"><img style="max-width: 100%; max-height: 100%;" alt="" /></div>
</body>

</html>', '<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)">
  <title>湖南荆首建设工程有限公司</title>
  
  
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
<!-- header begin--><header id="fh5co-header">
<div class="layout head-middle  hidden-l">
<div class="container">
<div class="line">
<div class="xl12 xs6 xm5">&nbsp;</div>
<div class="xl12 xs6 xm7 head-info text-right">
<div class="hot-tel"><img style="vertical-align: middle;" src="https://www.hnjingshou.com/skin/images/top_tel.jpg" />电话:137-0749-9996</div>
</div>
</div>
</div>
</div>
<div class="layout fixed header-box">
<div class="container">
<div class="line">
<div class="xl12 xs4 xm4 xb4">
<div class="logo">
<h1><a title="湖南荆首建设工程有限公司" href="https://www.hnjingshou.com/index.html"><img style="width: 80px;" src="https://www.hnjingshou.com/skin/images/logo.jpeg" /><span class="logo-title">湖南荆首建设工程有限公司</span></a></h1>
</div>
</div>
<div class="xl12 xs8 xm8 xb8">
<div id="nav-main1" class="nav-navicon">
<ul class="nav  nav-inline  nav-menu nav-right">
<li class="current"><a class="first-level" href="https://www.hnjingshou.com/index.html">首页</a></li>
<li class=""><a class="first-level" href="https://www.hnjingshou.com/a/gongsigaikuang/index.html">关于我们</a>
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
<p>&nbsp;</p>
<!-- picture begin-->
<div id="fh5co-hero" class="layout">
<div class="line">
<div class="flexslider">
<ul class="slides">
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252200450-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195136.jpg" alt="" /></li>
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252201280-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/05/_20210505195210.jpg" alt="" /></li>
<li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 1;"><!-- <img src="uploads/allimg/180125/1-1P1252201070-L.jpg" alt="" style="height: 100%;width: 100%;"> --> <img style="height: 100%; width: 100%;" src="https://s1.imagehub.cc/images/2021/05/07/_20210507225115.jpg" alt="湖南荆首" /></li>
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
<!-- <p class="desc"><span style="color: #4d96df;font-size: 20px;">湖南荆首建设工程有限公司</span></p> --></div>
<div class="show-list line">
<div class="xl12 xs4 xm4 margin-large-bottom">
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img">&nbsp;</div>
<div class="media-img"><img src="https://s1.imagehub.cc/images/2021/07/10/_20210710094444ac9870eb22cb0ff6.jpg" alt="湖南荆首" width="344" height="260" /></div>
</div>
<div class="xl12 xs8 xm8 content margin-large-bottom">
<div class="desc">
<h2>湖南荆首建设工程有限公司</h2>
<div class="intro">湖南荆首建设工程有限公司是湖北荆首全资子公司，公司从1996年开始从事强夯工程服务，主要承接全国范围内专业高速公路路基强夯、厂房及物流园等强夯、高层楼房地基强夯、机场地基强夯、港口及人工湖强夯等大型土地强夯工程及咨询服务。</div>
<div class="intro">湖南荆首坐落于美丽星城湖南省长沙市，公司位于湖南省长沙县星沙街道开元东路95号华润置地广场二期第15栋13层1305号，公司拥有50多台设备、湖南荆首注册资金8000万元，拥有80余技术人员，中级职称占比50%。荆首自从业以来一直以服务客户为宗旨，专业团队、专业技术、精益求精的精神是我们荆首人一直的信念。</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--about end-->
<p>&nbsp;</p>
<!-- 我们的服务 -->
<div class="layout footer-top" style="border-bottom: 1px solid #eee;">
<div class="container">
<div class="line-big" style="text-align: center;">
<div class="hove-bg">
<h2 class="text-center" style="padding: 15px;"><strong style="font-size: 18pt; color: #4d96df;">我们的服务</strong></h2>
<p class="desc" style="margin-bottom: 25px;"><span style="color: #000000; font-size: 20px;">高效施工：节省时间 快速优化 改良基础</span></p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom" style="height: 801px; width: 1200px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/15/0e2442a7d933c8957c729ff4da1373f082020034877ec1ccf289e57d.jpg" alt="人工湖强夯" />
<p class="service-image">人工湖强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center " style="position: relative;"><img class="click-zoom" style="height: 533px; width: 800px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/srchttp___www.njzh56.com_uploads_allimg_190301_113P31X8_0.jpgreferhttp___www.njzh560f526a9809e5dcb3.jpg" alt="厂房及物流园强夯" />
<p class="service-image">厂房及物流园强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 296px; width: 500px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/srchttp___upload.ccidnet.com_2017_0614_1497404047163.jpgreferhttp___upload.ccidnet3592de9b48243a29.jpg" alt="机场强夯" />
<p class="service-image">机场强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><a title="高速公路路基强夯施工实施案例" href="https://www.hnjingshou.com/a/xingyexinwen/24.html" target="_blank" rel="noopener"><img class="click-zoom" style="height: 381px; width: 640px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/gs4fa856278707d3cd.jpg" alt="路基强夯" /></a>
<p class="service-image">路基强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 603px; width: 1072px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/15/gk0c4e34f23fdc3e93.jpg" alt="港口强夯" />
<p class="service-image">港口强夯</p>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center" style="position: relative;"><img class="click-zoom" style="height: 420px; width: 560px; min-height: 310px; max-height: 310px;" src="https://s1.imagehub.cc/images/2021/06/19/gtf2651978b35e792f6.jpg" alt="高填方强夯" />
<p class="service-image">高填方强夯</p>
</div>
</div>
</div>
</div>
<!-- 为了保障工程质量我们都有哪些 -->
<div class="layout footer-top" style="border-bottom: 1px solid #eee;">
<div class="container">
<div class="hove-bg">
<h2 class="text-center" style="padding: 15px;"><span style="font-size: 18pt;"><strong><span style="color: hsl(210, 70%, 59%);">为了保障工程质量我们都有哪些</span></strong></span></h2>
</div>
<div class="line-big">
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/25yeash.svg" />
<h3 style="font-size: 23px; color: red;"><strong>26年用心做地基处理</strong></h3>
<p style="font-size: 16px;">26年来荆首覆盖业务全国各城市，主要承接1000-25000kn .m强夯工程</p>
</div>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/zy.svg" />
<h3 style="font-size: 23px; color: red;"><strong>专业团队</strong></h3>
<p style="font-size: 16px;">自有设备50多台，高中职称技术人员占比50%，工程技术管理人员占比15%业界口碑领先</p>
</div>
</div>
<div class="xl12 xs4 xm4 margin-large-bottom text-center card-hove">
<div style="padding: 70px 15px; border-radius: 15px; min-height: 260px; max-height: 270px; box-shadow: 0 0.375rem 1.1625rem 0.0875rem rgb(50 98 255 / 18%);"><img style="padding-bottom: 20px; width: 70px; height: 70px;" src="https://www.hnjingshou.com/skin/images/service.svg" />
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
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220034.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220042.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220126.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center  click-zoom">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507220222.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://s1.imagehub.cc/images/2021/05/07/_20210507215935.png" /> </span></div>
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
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252303460-L.png" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P1252305010-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230A10-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center  click-zoom">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230J70-L.jpg" /> </span></div>
</div>
<div class="item margin-large-bottom text-center">
<div class="media-img"><span class="zoomimgs"> <img class="click-zoom" src="https://www.861ppt.com/441/uploads/allimg/180125/1-1P125230Q60-L.jpg" /> </span></div>
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
            </div> --></div>
</div>
</div>
</div>
</div>
<!--products end-->
<div id="fh5co-keyword-list" class="layout">
<div class="bg-keyword">
<div class="container">
<div class="hove-bg">
<h1 class="show_content padding-large-bottom " style="text-align: center;"><span style="color: #4d96df;"><strong>免费获得工程报价</strong></span></h1>
</div>
<form id="concat" class="form form-block" style="max-width: 500px; margin: 0px auto;">
<div class="form-group">
<div class="field"><input class="input" size="50" type="text" placeholder="姓名" data-validate="请输入您的姓名。" /></div>
</div>
<div class="form-group">
<div class="field"><input id="tel" class="input" name="telPhone" size="50" type="text" placeholder="电话" /></div>
</div>
<div class="form-group">
<div class="field"><input id="gcmj" class="input" name="area" size="50" type="text" placeholder="工程面积" /></div>
</div>
<div class="form-group">
<div class="field"><textarea id="content" class="input" name="content" placeholder="内容" data-validate="请输入内容"></textarea></div>
</div>
<div class="form-button"><button class="button bg-main margin-small-right">提交</button></div>
</form></div>
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
<div class="media_img"><a class="zoomimgs" href="a/gongsixinwen/18.html"> <img src="https://s1.imagehub.cc/images/2021/05/09/u38995889473729438566fm199app68fJPEGw750h750s3A2AD604CFEFCF4D560B04C90300E0BA.jpg" alt="强夯机" width="580" height="580" /> </a></div>
<div class="media-body">
<h3>强夯机是如何工作的</h3>
<div class="time">2021<span style="font-family: -apple-system, BlinkMacSystemFont,;">/05/10</span></div>
<p class="desc"><span style="color: #454545;">更换为饱和软粘土地基的固结强夯法。和强夯置换法的加固机理是不同的，它是一个高影响的锤高落差产生可以碎石，石材料，炉渣和其他性能强度到地面，形成聚集体墩逐个的基础上.......</span></p>
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
<h4><a title="强夯施工如何选择强夯机" href="https://www.hnjingshou.com/a/gongsixinwen/17.html">强夯施工如何选择强夯机</a></h4>
<p class="desc">想要做好强夯地基处理，首先需要选择一个好的设备，或者是租赁一个好的设备，如果是没有条件就找到一个靠谱的地基强夯施工公司。强夯机已经成为了建筑施工中的主流设备.......</p>
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
<h4><a title="强夯机回填复杂地基施工的过程" href="https://www.hnjingshou.com/a/gongsixinwen/16.html">强夯机回填复杂地基施工的过程</a></h4>
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
<h4><a title="地基强夯施工要点" href="https://www.hnjingshou.com/a/gongsixinwen/15.html">地基强夯施工要点</a></h4>
<p class="desc"><span style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: left;">强夯地基是用起重机械（起重机或起重机配三脚架、龙门架）将大吨位（一般8-30t）夯锤起吊到6-30m高度后，自由落下，给地基土以强大的冲击能量的夯击，使土中出.....</span></p>
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
<h4><a title="强夯施工中表层土夯实的必要性" href="https://www.hnjingshou.com/a/gongsixinwen/14.html">强夯施工中表层土夯实的必要性</a></h4>
<p class="desc"><span style="color: #454545; font-family: 宋体; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">在工程实践中，当进行夯后质量检测时，常发现表层土的密实程度要比底层土差，其原因首要是与选用的满夯方法与遍数不妥有关。由于强夯的加固顺序是先深后浅</span>...</p>
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
<h4><a title="浅谈强夯试夯施工" href="https://www.hnjingshou.com/a/gongsixinwen/13.html">浅谈强夯试夯施工</a></h4>
<p class="desc"><span style="color: #454545; font-family: 微软雅黑; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">目前，应用强夯法处理地基的工程范围越来越广，实用性和加固方法具有广泛性和有效性，结合山平高速公路工程中的软土地基强夯处理，简要的分析了强夯试夯施工参数的选取、修正设计及试夯施工对正式施工的指导作用</span>...</p>
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
<p>&nbsp;</p>
<!--Partner begin-->
<p>&nbsp;</p>
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
<p>&nbsp;</p>
<!--Partner end-->
<p>&nbsp;</p>
<!--footer--><footer>
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
</footer><!--footer-->
<div class="blank55">&nbsp;</div>
<div id="toolbar" class="layout text-center">
<div class="x4"><a href="https://www.hnjingshou.com/index.html">首页</a></div>
<div class="x4"><a href="tel:13707499996">电话</a></div>
<div class="x4"><a href="https://www.hnjingshou.com/a/contact/index.html">联系我们</a></div>
</div>
<div class="zoom-img"><img style="max-width: 100%; max-height: 100%;" alt="" /></div>
</body>

</html>', '2021-11-12 07:06:30.910617+00', NULL);


--
-- Data for Name: asf_loginfos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_loginfos" VALUES (1, 1, 'admin', 1, 'UsernameAndPassword', '220.202.233.74', '中国,北京市,北京', NULL, '2021-11-12 07:14:20.258669+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (2, 1, 'admin', 1, 'UsernameAndPassword', '113.246.216.150', '中国,湖南,长沙', NULL, '2021-11-13 03:00:06.60173+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (3, 1, 'admin', 1, 'UsernameAndPassword', '220.202.233.74', '中国,北京市,北京', NULL, '2021-11-13 04:07:22.490405+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (4, 1, 'admin', 1, 'UsernameAndPassword', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 06:26:33.562084+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (5, 1, 'keep_wan', 2, '添加账户', '220.202.152.66', '中国,北京市,北京', 3, '2021-11-15 06:30:37.058607+00', '/api/asf/account/create', '{"tenancyId":1,"departmentId":18,"username":"dingluxin","password":"dingluxin","telphone":"13144445251","email":"1459189099@qq.com","name":"丁鲁欣","sex":1}', '{"status":200,"message":"Success"}', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (6, 1, 'keep_wan', 2, '添加账户', '220.202.152.66', '中国,北京市,北京', 3, '2021-11-15 06:31:23.906658+00', '/api/asf/account/create', '{"tenancyId":1,"departmentId":18,"username":"liangtao","password":"liangtao","telphone":"17573415981","email":"1459189099@qq.com","name":"梁涛","sex":1}', '{"status":11010,"message":"输入的账户名或手机号码或邮箱地址已经被人使用了"}', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (7, 1, 'keep_wan', 2, '添加账户', '220.202.152.66', '中国,北京市,北京', 3, '2021-11-15 06:31:43.207282+00', '/api/asf/account/create', '{"tenancyId":1,"departmentId":18,"username":"liangtao","password":"liangtao","telphone":"17573415981","email":"2365990551@qq.com","name":"梁涛","sex":1}', '{"status":200,"message":"Success"}', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (8, 1, 'keep_wan', 2, '添加账户', '220.202.152.66', '中国,北京市,北京', 3, '2021-11-15 06:34:37.16259+00', '/api/asf/account/create', '{"tenancyId":1,"departmentId":18,"username":"hezhongxing","password":"hezhongxing","telphone":"17261288915","email":"2858193923@qq.com","name":"零星","sex":1}', '{"status":200,"message":"Success"}', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (9, 16, 'hezhongxing', 1, 'UsernameAndPassword', '223.104.130.131', '中国,湖南,长沙', NULL, '2021-11-15 06:34:39.947493+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (10, 15, 'liangtao', 1, 'UsernameAndPassword', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 06:36:30.270753+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (11, 14, 'dingluxin', 1, 'UsernameAndPassword', '117.136.24.89', '中国,湖南,长沙', NULL, '2021-11-15 06:39:21.46672+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (12, 1, 'admin', 1, 'UsernameAndPassword', '117.136.24.167', '中国,湖南,长沙', NULL, '2021-11-15 06:48:31.918519+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (13, 16, '%e9%9b%b6%e6%98%9f', 3, '异常消息', '223.104.130.131', '中国,湖南,长沙', NULL, '2021-11-15 07:05:30.411335+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (14, 16, '%e9%9b%b6%e6%98%9f', 3, '异常消息', '223.104.130.131', '中国,湖南,长沙', NULL, '2021-11-15 07:07:36.428392+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (15, 16, '%e9%9b%b6%e6%98%9f', 3, '异常消息', '223.104.130.131', '中国,湖南,长沙', NULL, '2021-11-15 07:07:54.364941+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (16, 15, '%e6%a2%81%e6%b6%9b', 3, '异常消息', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 07:16:59.352802+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (17, 15, '%e6%a2%81%e6%b6%9b', 3, '异常消息', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 07:17:06.183017+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (18, 15, '%e6%a2%81%e6%b6%9b', 3, '异常消息', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 07:20:07.394136+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (19, 1, 'keep_wan', 2, '添加账户', '117.136.24.167', '中国,湖南,长沙', 3, '2021-11-15 07:21:26.33169+00', '/api/asf/account/create', '{"tenancyId":1,"departmentId":30,"username":"cuiyouxi","password":"cuiyouxi","telphone":"13607483162","email":"416409524@qq.com","name":"崔友稀","sex":1}', '{"status":200,"message":"Success"}', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (20, 17, 'cuiyouxi', 1, 'UsernameAndPassword', '39.144.190.104', '中国,山东省,聊城', NULL, '2021-11-15 07:22:01.088286+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (21, 15, '%e6%a2%81%e6%b6%9b', 3, '异常消息', '220.202.152.66', '中国,北京市,北京', NULL, '2021-11-15 07:23:06.46644+00', '/api/asf/editor/modify', '', 'Multiple node elements can''t be created.', '操作记录');
INSERT INTO "public"."asf_loginfos" VALUES (22, 1, 'admin', 1, 'UsernameAndPassword', '116.128.229.188', '中国,湖南,长沙', NULL, '2021-11-19 09:06:08.903981+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (23, 1, 'admin', 1, 'UsernameAndPassword', '113.246.217.18', '中国,湖南,长沙', NULL, '2021-11-20 02:40:56.950408+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (24, 1, 'admin', 1, 'UsernameAndPassword', '203.168.22.100', '中国,广东,广州', NULL, '2021-11-22 06:22:36.583083+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (25, 15, 'liangtao', 1, 'UsernameAndPassword', '116.128.229.195', '中国,湖南,长沙', NULL, '2021-11-22 06:23:06.19925+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (26, 14, 'dingluxin', 1, 'UsernameAndPassword', '117.136.24.171', '中国,湖南,长沙', NULL, '2021-11-22 06:23:20.419397+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (27, 1, 'admin', 1, 'UsernameAndPassword', '220.202.233.90', '中国,北京市,北京', NULL, '2021-11-22 07:37:06.777542+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (28, 17, 'cuiyouxi', 1, 'UsernameAndPassword', '203.168.22.100', '中国,广东,广州', NULL, '2021-11-22 07:55:57.207097+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (29, 1, 'admin', 1, 'UsernameAndPassword', '203.168.22.100', '中国,广东,广州', NULL, '2021-11-22 08:18:05.615178+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (30, 1, 'admin', 1, 'UsernameAndPassword', '220.202.233.90', '中国,北京市,北京', NULL, '2021-11-22 08:42:21.070045+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (31, 1, 'admin', 1, 'UsernameAndPassword', '203.168.22.100', '中国,广东,广州', NULL, '2021-11-22 08:50:22.589152+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (32, 1, 'admin', 1, 'UsernameAndPassword', '220.202.233.90', '中国,北京市,北京', NULL, '2021-11-22 09:21:35.920139+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (33, 1, 'admin', 1, 'UsernameAndPassword', '203.168.22.100', '中国,广东,广州', NULL, '2021-11-22 09:23:37.632835+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (34, 1, 'admin', 1, 'UsernameAndPassword', '113.246.213.172', '中国,湖南,长沙', NULL, '2021-11-27 02:35:57.113385+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (35, 1, 'admin', 1, 'UsernameAndPassword', '127.0.0.1', '本地', NULL, '2021-12-18 04:16:01.952321+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (36, 1, 'admin', 1, 'UsernameAndPassword', '127.0.0.1', '本地', NULL, '2021-12-18 04:16:22.553803+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (37, 1, 'admin', 1, 'UsernameAndPassword', '127.0.0.1', '本地', NULL, '2021-12-18 04:23:02.789233+00', NULL, NULL, NULL, '登录成功');
INSERT INTO "public"."asf_loginfos" VALUES (38, 1, 'admin', 1, 'UsernameAndPassword', '127.0.0.1', '本地', NULL, '2021-12-18 04:24:52.128935+00', NULL, NULL, NULL, '登录成功');


--
-- Data for Name: asf_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_permission" VALUES (1, 'asf_dash', 0, '控制台', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (2, 'asf', 0, '控制面板权限', 1, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (3, 'asf_account', 2, '账户管理权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (4, 'asf_permission', 2, '权限管理权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (5, 'asf_menu', 2, '菜单管理权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (6, 'asf_authapi', 2, '授权api管理权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (7, 'asf_role', 2, '角色管理权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (8, 'asf_audio', 2, '审计管理权限', 1, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (9, 'asf_audio_log', 8, '日志权限', 2, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (10, 'asf_scheduled_task', 2, '调度任务权限', 2, 0, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (11, 'asf_tenancy', 2, '租户管理权限', 2, 0, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (12, 'asf_department', 2, '部门管理权限', 2, 0, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (13, 'asf_post', 2, '岗位管理权限', 2, 0, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (14, 'asf_translate', 2, '多语言管理权限', 2, 0, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (15, 'asf_openapi', 0, '公共权限', 3, 1, NULL, 0, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission" VALUES (16, 'asf_editor', 0, '富文本编辑器', 3, 0, NULL, 0, 1, '2021-12-18 11:41:42+00');
INSERT INTO "public"."asf_permission" VALUES (17, 'asf_fundamentals', 0, '股票收益分析', 3, 0, NULL, 0, 1, '2021-12-18 11:42:49+00');


--
-- Data for Name: asf_permission_menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_permission_menu" VALUES (1, 1, '控制台', '控制台菜单', 'icon-dash_board', 0, '/', NULL, NULL, '控制台菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (2, 2, '控制面板', '控制面板菜单', 'icon-dash_board', 0, '/control', NULL, NULL, '控制面板菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (3, 3, '账户管理', '账户管理', 'icon--proxyaccount', 0, '/control/account', NULL, NULL, '账户管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (4, 4, '权限管理', '权限管理', 'icon-icon-authority', 0, '/control/permission', NULL, NULL, '权限管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (5, 5, '菜单管理', '菜单管理', 'icon-caidan', 0, '/control/menu', NULL, NULL, '菜单管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (6, 6, '授权api管理', 'api管理', 'icon-api', 0, '/control/api', NULL, NULL, '授权api菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (7, 7, '角色管理', '角色管理', 'icon-role', 0, '/control/role', NULL, NULL, '角色管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (8, 8, '审计管理', '审计管理', 'icon-audio', 0, '/audio', NULL, NULL, '审计管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (9, 9, '日志管理', '日志管理', 'icon-errorcorrection_default', 0, '/control/audio/getlog', NULL, NULL, '日志管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (10, 10, '调度任务', '调度任务', 'icon-schedule_date', 0, '/control/scheduled_task', NULL, NULL, '调度任务菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (11, 11, '租户管理', '租户管理', 'icon-tenancy', 0, '/control/tenancy', NULL, NULL, '租户管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (12, 12, '部门管理', '部门管理', 'icon-bumen', 0, '/control/department', NULL, NULL, '部门管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (13, 13, '岗位管理', '岗位管理', 'icon-gangwei', 0, '/control/post', NULL, NULL, '岗位管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (14, 14, '多语言管理', '多语言管理', 'icon-EA', 0, '/control/translate', NULL, NULL, '多语言管理菜单', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (15, 16, 'tiny富文本', 'tiny富文本', 'icon-EA', 0, '/editor/getlist', NULL, NULL, '富文本编辑器', NULL, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_permission_menu" VALUES (16, 17, '股票收益', '股票收益', 'icon-EA', 0, '/jqdata/getfundamentals', NULL, NULL, '股票收益', NULL, '2021-12-18 11:47:48+00');


--
-- Data for Name: asf_post; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_post" VALUES (1, 1, 'java 开发', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (2, 1, '运维', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (3, 1, '.net 开发', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (4, 1, 'android 开发', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (5, 1, '前端 开发', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (6, 1, 'ios 开发', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (7, 1, '员工', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (8, 1, '组长', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (9, 1, '经理', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (10, 1, '主管', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (11, 2, '员工', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (12, 2, '组长', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (13, 2, '经理', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_post" VALUES (14, 2, '主管', 0, 0, NULL, 1, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_role" VALUES (1, 1, 'superadmin', '总超级管理员拥有下属租户所有权限', 1, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role" VALUES (2, 1, 'admin', '普通管理员，拥有部分权限', 1, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role" VALUES (3, 1, 'user', '总部 普通员工, 拥有普通权限', 1, 1, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_role_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_role_permission" VALUES (1, 1, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (2, 2, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (3, 3, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (4, 4, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (5, 5, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (6, 6, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (7, 7, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (8, 8, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (9, 9, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (10, 10, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (11, 11, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (12, 12, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (13, 13, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (14, 14, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (15, 15, 1, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (16, 1, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (17, 2, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (18, 6, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (19, 7, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (20, 8, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (21, 9, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (22, 10, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (23, 11, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (24, 12, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (25, 13, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (26, 14, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (27, 15, 2, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (28, 1, 3, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (29, 15, 3, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_role_permission" VALUES (30, 16, 1, '2021-12-18 03:48:53.763678+00');
INSERT INTO "public"."asf_role_permission" VALUES (31, 17, 1, '2021-12-18 03:49:23.985943+00');
INSERT INTO "public"."asf_role_permission" VALUES (32, 16, 2, '2021-12-18 03:49:35.509014+00');
INSERT INTO "public"."asf_role_permission" VALUES (33, 16, 3, '2021-12-18 03:49:41.603736+00');


--
-- Data for Name: asf_scheduled_task; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: asf_security_token; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_security_token" VALUES (1, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2NzAxMjU4LCJleHAiOjE2MzY3ODc2NTgsImlhdCI6MTYzNjcwMTI1OCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.P7j4LEyISHCWs1CIsYuE4Oo575vlBEi6co6QIZHmM-JPqf6Rvl1oBmnUX_4Jc5BWRn_-Lto7_ZkLBVzAhm9isMV9o5SnHq8xBGtWcO2Qwa4T2le53UePt6FpJocZo9q1-xSCK8kulGe_cDY_7TmdhfLicUXi4azSk7iIXNrHaJuvoWJEH0tY4i8o2yAi6b77-0GSA2zewxw_uC6QjTJyGMwn1YeeI4kgmw75mL5x0adHY-QVu32UnnLnPHnpX4yEWrNV-nkpfuSPx1wjY7kKskluEhBzkT2kBAvovraTxJVB0_ogBonZs1lcBhBlrJ_He54BbqN5e_VHh_FHJgO8xw', '2021-11-13 07:14:18.254268+00', '2021-11-13 03:00:02.878135+00');
INSERT INTO "public"."asf_security_token" VALUES (2, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2NzAxMjU4LCJleHAiOjE2MzY4MzA4NTgsImlhdCI6MTYzNjcwMTI1OCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.fgqTO0BmhqIEYWvODc825z_mFX6B-aH3klYfFvi6apZwor-9CjlN-R4SZlncYcXEN1o1I8ZgmNA8mBkLnEZXOa_7KRMSwa5owPzZLCdIePgY8S7FeVmEebAHXoL8Bm9HJoWNbX7JmCjdtKw-WQTPRd3Rp8HWkVlkFtfv2VMhaVwHjTrRAxDJmF0h54Z6thshiJSVGFIq7gltpmH3ZCMUJh0MAb1Q2HaxTG6lvR9E6WYXyh7ff3lWQiBQb-geB_fnDt17MPPIeoD4-TcdUxBng2wu_2PaOAQ1m-fOorHDZ-kTTGvthlwlpL3nooaLExT2Ucn0E465JS4Fc8Nu595mzw', '2021-11-13 07:14:18.254268+00', '2021-11-13 03:00:02.883202+00');
INSERT INTO "public"."asf_security_token" VALUES (3, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2NzcyNDAyLCJleHAiOjE2MzY4NTg4MDIsImlhdCI6MTYzNjc3MjQwMiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.ARHF0ESeaXtxVvZc_UM9eQ6UyomJmN-X0M-rr8ouSWBtp99gCYV_VgFZilCnp9SGHZOJFM9dg0d7hbAWNV3MMWuTKzytN_vfPDM-EoQsVHgXiFPbHUxB61OS-XjI2mYkFffEc9a6_AKFNWHkkAf-21QzN9x1XNWHCrk0X4oyW6OR4hbsxETIWi90d7RGfXcYk0taM_NZWbcH0C8N2sjuXvClh3QRSmdearvyyzbQjyjkkCnC5RIVP8XqWc7fzbhmPj1xj4Fyjeoszq4ZR0YQeZ5pg-RAwVbTEwL-eF2K1WkJnvU4MBiNmu3ux4NT0tKnnvYhuXjrFKXolla_TIRJ1A', '2021-11-14 03:00:02.861324+00', '2021-11-13 04:07:21.726061+00');
INSERT INTO "public"."asf_security_token" VALUES (4, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2NzcyNDAyLCJleHAiOjE2MzY5MDIwMDIsImlhdCI6MTYzNjc3MjQwMiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.KfsOcrip0roMb1ulLqQ9KSf6q9i-kXb8ZRnhB40NChL8qQph0vGYulkRGbj7ZsVdWH_tz_GaPabu9O_QrsBQCdi7wbN9gvjZnwpY1WSsua4eXme2_XAVym6NO_BfgTlY3P23-3d0GN3HzYG36RlggPI-EB6VnXAerdaeidSICYq9YkWWaotgxv2Ssxvlk8acKhJtiYeDLIRdKHxnPZSSzts_4ymX9UQzRJYECw2OIY1Vp3Vu_Mph4_sO8h3fpUx_Fe_YbgnvXn9QRDxr6qQbQJWvB0VmcGR48CNseU5HKjkZvmTximvIgUhTHH8QipHz3qON1eZ89T9g2ZvWBX3xOA', '2021-11-14 03:00:02.861324+00', '2021-11-13 04:07:21.732873+00');
INSERT INTO "public"."asf_security_token" VALUES (5, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2Nzc2NDQxLCJleHAiOjE2MzY4NjI4NDEsImlhdCI6MTYzNjc3NjQ0MSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Z3ujcauQDajzl6HMd3C_JUGnSnq7zJVJ4g3j9fTl7JyQDzpDOdZzL735QrjVIFezqsrW9zUYpQawrXQE-kEsQ9WoyIt7Apke_NzfcqgoOJXohq4K4ONLjGxFTiKQkY09YCuT0VucKEVPlw97SkBt3CBw89z5vU4nP6POzvcAz4oGcbM_qQiuHgTYUGobiX2jJp-W1nGz3FhCqI4rRUqRMqkI6olaFHHUWTPIFtAGqSjp4hLAHJZxb0n751EKk2pAqQzc3IMhrVrPcpM-SGpsxvwv_8xMt9tsFJ7AX7XkRuneRDizC3anumbMqmu-hKh2ZrdgiaG51OkBXDAkPhcoEQ', '2021-11-14 04:07:21.724229+00', '2021-11-15 06:26:30.820499+00');
INSERT INTO "public"."asf_security_token" VALUES (6, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2Nzc2NDQxLCJleHAiOjE2MzY5MDYwNDEsImlhdCI6MTYzNjc3NjQ0MSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Z4lrJ88DGqrPceOD7wb0hw2c6z4LLhxHOue8uC4g2wsVLlylrbWnuGLGOQSYqSjvWfTFR6saoQeLsrDib-6uxVCdBm6_-e9ZZ7R3EUdlUES_rr-I4YIGWzRE9n8uDy7o2DQqex3r5a6yN4ykFvH_9QWllYXLhEewksBG21N0yY0WZEeqCdAQ1QtSJ_Eiil3DBbhUXgYm4x0w1-bzYYIfyJN2b9HJI3_H8jt8j87QVh90Z5Th7dmp5AMwY-oaIkPTwBdYroszTsWSFtvWVbksYcREuefis0FhYLKoSgxgAi_-5kkfcvu5II-R8SxVDDymyKfQJ9ZQIXRGNx5EopAw1Q', '2021-11-14 04:07:21.724229+00', '2021-11-15 06:26:30.826588+00');
INSERT INTO "public"."asf_security_token" VALUES (7, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU3NTkwLCJleHAiOjE2MzcwNDM5OTAsImlhdCI6MTYzNjk1NzU5MCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.k-8tmE_vIqh0iySdQPtrP9a3nwsN8TpIZrc5fz6KMNfeq7Z2_U75oH4TVmLFuBgDNutuLir1TKy50_4NlspzyJcQID8bV5QcswXAXaG3R9cGhGApcVaCZvBvVS8rwabMJe91uw7ajerahBppz7jmMFXaFI25elF4xgsFkLv-NRrvnxPa-G0Sx06uJFbcA3cZvngex1UNPkTnjIsvbQO699mJmZP3cKxWs5a0ApBK4dHLGmCiRg5CJUmhTgDZKKqcePTBcekRV2q-kdN9E35j060XRHH_LdCEcU5AwjsoVNvfdNZnm5As3LTsxPfYe-IfL58duc32a2-ePQNNN-fi9A', '2021-11-16 06:26:30.819299+00', '2021-11-15 06:48:28.145679+00');
INSERT INTO "public"."asf_security_token" VALUES (8, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU3NTkwLCJleHAiOjE2MzcwODcxOTAsImlhdCI6MTYzNjk1NzU5MCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Uk4Ht51Uc-G8Z5hIrwyP2_NWa-3xTsZ-qOPbSeUc8W1_SoqFBuRtU9vPcZPnkxAESM9WO_YMwvy0gpXUbGiMI1segTLYoGFGA2gNJU8cnFBzHqPHySqy9TeAwa0YnL6uJm7GHP6PtUmqedHzgmuQtelg_NdXaevlA1myJrLgqJY23mhegTOvqeaFCIdfb47XwEjdQoppTUcH8izEURT_EW950uu6Czo75e2kO9wrFIShHHT9I-puZnZGf5sDaL8CGC1hgqHnmtt6noz67WIfKaVhSFhook0FVQC1Yq7_e5lKH6OvUWi209YYa1MSlM5TIWE_6HBDefmr0fhq-nqQrg', '2021-11-16 06:26:30.819299+00', '2021-11-15 06:48:28.150399+00');
INSERT INTO "public"."asf_security_token" VALUES (9, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU4OTA4LCJleHAiOjE2MzcwNDUzMDgsImlhdCI6MTYzNjk1ODkwOCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.XV_SOH9dkZi9twaUolHO_Nox6F1XN7qzDU81DdhLY5JrbuoTMyhzLH5G3FUHCPVf0MzX1W5PS32F0jYdy9b4HEbJDCJ5fahTgVDm-yvuKpC6ycBwqmSb_1jSXamIcqvU2on8RpjdakdlljZKNr6Vciw_2uNhqQeZlPTtfTqsJZ6epEfXQKuYXv5oaRBKsbi33TCe-VqN5oaAetsFbMsO_-0zNYpM0L7Z4LT60ZjtuiTpR5ZbTWGU5Oun4w-cJB-GFHuhbOpT6GbAl9Blc114Bmtsv-kTg6Gcc9zLKPDQ6JnAAdG-ymNAYiGKcTHEFBxBBcGc1l11zVbDOo-hmr9l9A', '2021-11-16 06:48:28.143994+00', '2021-11-19 09:06:08.14474+00');
INSERT INTO "public"."asf_security_token" VALUES (10, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU4OTA4LCJleHAiOjE2MzcwODg1MDgsImlhdCI6MTYzNjk1ODkwOCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.b9tYy5hRHNCtVcO2wrAMZhQyWCgM2a4mhz82vlBhCM6FhLwhIUQSeuwFcv61OgQojDSxgaCWK6r0dcRE41oDZx1LTAnXRBR7ld0_lKDjmUUOrRl5mZI836HoRI0lyk61puYIQ2R8zpl1iD9pUhsaJd6RTjIdNGfnwC3i9de8ANtDIcSKf52iQPCWhxfJ7VXuBt5rsZObBPK-52TpCCiPKZaYFJmbWGno18Ege1dj0lQkkwTUeQl9xEfHH7rQQ1kJXHBxZQ84IIsOI970RSjNjZFFdlz5bI6D5ZpDZq9vWD6jT99E9JnLTyOjFkDw_pWnlxAvJ4KcsJQlDuLUTSX2Kg', '2021-11-16 06:48:28.143994+00', '2021-11-19 09:06:08.149379+00');
INSERT INTO "public"."asf_security_token" VALUES (11, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3MzEyNzY4LCJleHAiOjE2MzczOTkxNjgsImlhdCI6MTYzNzMxMjc2OCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Cl6OKSJj_nuqyJkswmDD5l9teszLiX-tqSWGO1p0YXF8DIouq-XJ5Zeb3MDrEYeO_pekEWTRCoit4Vfin9YvAqT25v5GubeNdKa7XkAIBnalcjYY69qy0Y8gbWjEzy6B-AQFpIdcB357-V8pzxQdFDLaWDOAM08IJQ9ykkkHZnGlsjlSGC_KRywtl9PzRvn2PwQk4OfQnLymFiT2XpS_qeOeghjp4TrDotdGCRU89TGgj_RFhpjJRTChRno8uigBXKbTucwbZpL64XKdrclt1fmijBUPmA-sGSJO1VTxInDELLvyHjY0zNyFuyxHsPrA1d4OQNtRoIQeRGTTeBo5tg', '2021-11-20 09:06:08.143712+00', '2021-11-20 02:40:55.212509+00');
INSERT INTO "public"."asf_security_token" VALUES (12, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3MzEyNzY4LCJleHAiOjE2Mzc0NDIzNjgsImlhdCI6MTYzNzMxMjc2OCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.IwyvWPa2wiuiq_zahNaWdAH_fz1rEbkeZysoLjdEyOJiIKUPOOreSeqoVSMaOlI9mG9WVC8CwCLohof1Tl-3hx2BNHJ_P-UDc1qUtaPJvMtOHiBQZw6UsIlFrIHfV4pCn7eq4mp07RMkN2lViJcGvlNnNrizA5pI9f-lkmgNwxVSnJJiJfSOrrm0d2oF2G-JPYviUaV693jCGUp2BlQvcqHHVzgct5M2mcEmPPVLqgZ5xis2QveicLkYaN7KbV0be40zMmYMLjubHewRRZQk-PV58pfl01vKXajXAt4h83kjGvH4PACpj8alHnbFu_8HCNsxtLxWEaAM7zNk1qnmcQ', '2021-11-20 09:06:08.143712+00', '2021-11-20 02:40:55.215766+00');
INSERT INTO "public"."asf_security_token" VALUES (13, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3Mzc2MDU1LCJleHAiOjE2Mzc0NjI0NTUsImlhdCI6MTYzNzM3NjA1NSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.KAjIC5yoUjhxjEkxkUdIalG5wJpu36VTPpRG5hSuXiIdTop6WqDIeE76Xa16C-ca2p5lh4r-Zl1Me2aLbqz3KLqinOTZbnOJrPO-EMuL3dx1mQoiHFbS2SXwd-iIchJKNU8h2bDeKQL-YUpRvIsIEtjvkBdMTvwedyhb8DmHDE9jLutJPYG8RAHO7BTIvIXbRwCXYESl8MQR9R4EviTvKU-_5I44HdBw8bIW_Hzpq7fHb5qt7pZ7Hcz22nJ7-84S5dHCoRQUv5we-INPyWVH_gMcMwZnml1Obq18tGYuiRa1gjsB_FwWuW02i-_nxxXv8joMRkP6qxt8Vt_oCTyLCQ', '2021-11-21 02:40:55.211431+00', '2021-11-22 06:22:32.898373+00');
INSERT INTO "public"."asf_security_token" VALUES (14, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3Mzc2MDU1LCJleHAiOjE2Mzc1MDU2NTUsImlhdCI6MTYzNzM3NjA1NSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.jGEhnFyyxd7saZokuKO5mJiJfSUvA8y_cQWobbDHa9Tkxv0Q9lwLfufoB2STGURkb3n7btF1-yDZ8yEOnoPECx9uI3luhLOeY3Tjf2_CQ1a1pDhvlJgTqF4PxhgM71v55rbK0ve_tGLS-zYKSbI6bbrjd-_583luz-e6ofBWHiHPWh_Jdg6tqDJNN5yDRwCTBTP0j3BWLDv3ifVofQD0rgmzDChWBsrzZHfONf10DEDI89uNpnhMCaLCxFScn8-xaarjKI6ViqyKIHq3TugNtNUOjGJUmERZlqOPb9acZ6fUDDZvM1S7Hoaytv3nN3Vbz68ToA1WMINHvrgmkQUDvQ', '2021-11-21 02:40:55.211431+00', '2021-11-22 06:22:32.902632+00');
INSERT INTO "public"."asf_security_token" VALUES (15, 15, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNiVhMiU4MSVlNiViNiU5YiIsImxpYW5ndGFvIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTUiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NTgxODYsImV4cCI6MTYzNzA0NDU4NiwiaWF0IjoxNjM2OTU4MTg2LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.uH0Q916UfiZyF2tzfFh-x58clR8IrcloghuqBwxsQYkY8bGUSTdijV-f2J312E8_ewLQo0rZ-DpGc2548vTKrSqNuG7k3acb7ZqBHGRF4NUSrqkg_AUmOESP7OLeQ-mFPUCxFuoeLK4wLev0yvSDVWnHy61FjCDXNDIRMsqQZzYeyjQTX98yOaL3rB30u17sI9ZF8OKWYsASMQYQLPC9e_uNNP5XH3UdckBARsC-D_0d0szBbWrWeP68EODyuyE2AlS2Z7ZRi53Yr2iJLM8eVLKLwgChVeBKueQ1k4nE2BtKFoVd3yCMbXzaV5DxfCsfBfl8HveQFPnxUzt2tIwsTw', '2021-11-16 06:36:26.523686+00', '2021-11-22 06:23:05.846311+00');
INSERT INTO "public"."asf_security_token" VALUES (16, 15, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNiVhMiU4MSVlNiViNiU5YiIsImxpYW5ndGFvIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTUiLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NTgxODYsImV4cCI6MTYzNzA4Nzc4NiwiaWF0IjoxNjM2OTU4MTg2LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.PVz9Wf6fSI490JsLi66o4daUZ-8nF-es7z8uwkW9F83Kn6rAXfS5W_Ngkt2SIuEWwoGu6eU-J-Q-MKjhSXjcAm0yV4xc43Gr63LmlEfHcrvR-IAh7jm6_3pn7Po_A7_ufLAZzv4gVYzJxwwEXCmBdPK6IQDbLkP2qTcyzoW2IKGg-uySwJAzKG6okM4uzp301kIeaoE5xZcc2qlwuR2YbZnP5n2OoPa3rWYNCHMC5LmvXKdVDo0jdvzmFaLorzEla6nvDzoQYd4ma42Jwe8XKX6zXllqelD5BP3EDcVxHw7vQWTi_sRkhtXT79hZxHGNvfWPgNEiPewBtYq5oKY_YQ', '2021-11-16 06:36:26.523686+00', '2021-11-22 06:23:05.848124+00');
INSERT INTO "public"."asf_security_token" VALUES (17, 14, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNCViOCU4MSVlOSViMiU4MSVlNiVhYyVhMyIsImRpbmdsdXhpbiJdLCJyb2xlIjoidXNlciIsInN1YiI6IjE0IiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU4MzU5LCJleHAiOjE2MzcwNDQ3NTksImlhdCI6MTYzNjk1ODM1OSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.tqTngReziwhDDLKtOuGcejyPg8WdnnlaSFAwpBsBgWMjV9u4kD3SnfPRWd4K0CBr89vvJStvuEyzWv9rq4AKZuOfFmWjh7x3BEnEIo4NFKmMnuSqtK8CEJeqX8npo_al4SZ6cAYIuW2VvFODldTVo5xUrEfFPT1nkLs2TM8cNVdv-WhzChCyUZWlckkoNuqXiHoR97b_KPdN3ki-eA5u6TBQDyClE0fFDEpIhkGoQeDo2G-xJtSmKQCwqfe8RQyTGrTa7CsV3rGtJuaqeZyc3-ldxGteutA53aunzNRn1-LRg8V4-F9MVpVZBhCOGUwA22Au_WzVZOunhv5IQVO0Ww', '2021-11-16 06:39:19.728569+00', '2021-11-22 06:23:19.008473+00');
INSERT INTO "public"."asf_security_token" VALUES (18, 14, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNCViOCU4MSVlOSViMiU4MSVlNiVhYyVhMyIsImRpbmdsdXhpbiJdLCJyb2xlIjoidXNlciIsInN1YiI6IjE0IiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM2OTU4MzU5LCJleHAiOjE2MzcwODc5NTksImlhdCI6MTYzNjk1ODM1OSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Dl-3orLzjbeYSwDaSTzUAvF2Me9j9ZoxYpjxqd1za6QMaPQ92gyOBPtzfGA-_rPmukg7YOeLtk_iQ28kZDr1zlpXj3Se16WOk_fS9aq7iABvNrbg4WQ-XYZ8tlrRLSaia8OqD9CNXekcouH_T0PsKauN16dD6u4UXPXxgFQ8bkJSA-qlmWtGp7rlaI1reNfupANh0FD3C_NyRMnisxSXGl0mTuqBigJpjfZ8bhCzwi8DQS5uualKFjR-R_20NltNgl_3qo-vPjwEanW7fE1OJbLBsIkRPyOCRZi5etIbjmwg0utWNn2vSRH_w5KT9mj1rAzJZ292weeBGVNMmhZcxQ', '2021-11-16 06:39:19.728569+00', '2021-11-22 06:23:19.011455+00');
INSERT INTO "public"."asf_security_token" VALUES (19, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTYyMTUyLCJleHAiOjE2Mzc2NDg1NTIsImlhdCI6MTYzNzU2MjE1MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.p9EQ8YuZgz7D-6jYB5pRApwgyndJISC1h-26um5BfCWLlirdvKu7gtwAsqgNNit81mc_6Y73iRHd_u8WkBkkGEvtzJY9BP2ktxGoo95cFIuM4Ygs3M0t9Wf344jRpXCgteqaxu2VxfehZfmWPDbMCdq7BMADIdisWPQ-dOsZCIisTHHrgeaJllWvtXU1pb7UxD1ncxVaNPLFn8Go1vPxQBFdbLW-TKKDUvOKx-GcYtzIfxToYANIvw7ZqlwHeF14b9D15g3rd3CPmlCrYN5vZlBOrgdoTnCodfaVOrHlI-znejqgmOiZJrfx8Ms8cYqd2TlMdGubRhQSA4DNIOwE6g', '2021-11-23 06:22:32.896801+00', '2021-11-22 07:37:06.114832+00');
INSERT INTO "public"."asf_security_token" VALUES (20, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTYyMTUyLCJleHAiOjE2Mzc2OTE3NTIsImlhdCI6MTYzNzU2MjE1MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.dPcaRhCyHdsl7GDWuYh5eFIgjTHeESmQnEJ8TMsgcXxgDrH3EWU1zQ-o5XnSdVWxsyhINFwlRKd2jI0XMCwcSgy7BkeOIVEgEjgnt6ZTWUn9Ibk8H9eCSJ6WvazF8_sDhJaL2zacPgSxVt7dEzmLdDj2qs8UFTDd-W7zVt9kSxGen-Mj5cqEZKQCVCyrc_CHuBofCfTwxq8dSrU-GQ7s7Bbo9veAcS2n2rQETPLmofWcvIf0RKjPxPNx7v0H7Ghp1ukLE2hfMTTVdFglZvArf0C2FhZkrwb9e4UhleWhUAQ6B6pszLCCA6uzgb8aEDGdB3zYhvD3F_zR2IJOb7CMiA', '2021-11-23 06:22:32.896801+00', '2021-11-22 07:37:06.118142+00');
INSERT INTO "public"."asf_security_token" VALUES (21, 17, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNSViNCU5NCVlNSU4ZiU4YiVlNyVhOCU4MCIsImN1aXlvdXhpIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTciLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NjA5MTksImV4cCI6MTYzNzA0NzMxOSwiaWF0IjoxNjM2OTYwOTE5LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.Yvl6t17s-PvBuc_hpNm-fPHyjmDu5jvffe-FLcVukTEmYyI2DpuAZJTUsJUIOlbUNG0Ea8SMayjOS_64PoPGWPpSAfn6ZJ8t9KIQ7eeDc4WmMtds88mBQUNWVeq-Oq5BAjCF4wuqPoB5qe3yCBIlUlp7YsQy6CSzkVstbkL4L0Ga8_ib7h3-hcUYK4L_K4V76oyHWSunTW6oIMVsU8bUy7vfPaj2j_Zs1-ekOUztBUpdrwJ5jVnz7rrVnBnLjT2rtdYda9md8WhvCc8TZCQizitFa_37xuqJnkVugpaOEbGFTCIjUvRu4rlWGqPi4AKeunQfVZy8UE5OaEnNGOWNuQ', '2021-11-16 07:21:59.279103+00', '2021-11-22 07:55:48.46346+00');
INSERT INTO "public"."asf_security_token" VALUES (22, 17, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbIiVlNSViNCU5NCVlNSU4ZiU4YiVlNyVhOCU4MCIsImN1aXlvdXhpIl0sInJvbGUiOiJ1c2VyIiwic3ViIjoiMTciLCJhdXRoX21vZGUiOiJVc2VybmFtZUFuZFBhc3N3b3JkIiwidGVuYW5jeV9pZCI6IjEiLCJuYmYiOjE2MzY5NjA5MTksImV4cCI6MTYzNzA5MDUxOSwiaWF0IjoxNjM2OTYwOTE5LCJpc3MiOiJhc2YiLCJhdWQiOiJhc2YifQ.lErQfxkGYTIVJKukpaKRXejPQot-Sz7T71M_Zv92F6pNROqvcWCfeSn6byCm26amPZgimE-tY6Kf6EZ8UqsM7rgUCM3Cxj-f4dgY-3rFR4Cg4ZIVUxvA_7jAlreLuI6ufkFVaUS1vGyOt7-e7iqnxR2OxlISW9wZXsqs8gzt9pXLGTrXsWWQhKLTrKp9yC21kh7rN6EScZDNwb4EODZAcuEJCBLtU-q4_KdDlm5k4WVcizz_imVGxoFKu2TbpgyZypTgWcC5gOScBADWQB6577WU93u1iDg2LJ7s5Wtapj_j1iFzTTTqm9CSjFYMrUm3SlF_RpSI-cix23mAjTznBA', '2021-11-16 07:21:59.279103+00', '2021-11-22 07:55:48.46652+00');
INSERT INTO "public"."asf_security_token" VALUES (23, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTY2NjI2LCJleHAiOjE2Mzc2NTMwMjYsImlhdCI6MTYzNzU2NjYyNiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.U3ZX-mluufgQgtpcfixqe7ynQJQmaI4yst5Qpcet47cd1j3AJeYvs0bQBCgV2Vj-bWhuhiEIlSvuTiSDlM4AiMSiCIxJyjl394k5vqLdoYwmJOWMfZQffibUtAmlylIrZuzb_4N455Pavua8RhD0uIUApKoomk8zWaH2j8wKkvDg5k1OV7xjjop5W5GVczmrallYGiqVNWfQQOm3Bm_9fXlREV0-VfrbSpcVg1jcoKQg0bP-fUnC-unk1kWWvIwNtovAztD28wU1aUpw-7eqA1psFG-taHllLI2x8wrpnT2uju3nL2O8FcWfCMVlPouPQImNWQT5WZSXRFMspyS7-A', '2021-11-23 07:37:06.113099+00', '2021-11-22 08:18:04.897675+00');
INSERT INTO "public"."asf_security_token" VALUES (24, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTY2NjI2LCJleHAiOjE2Mzc2OTYyMjYsImlhdCI6MTYzNzU2NjYyNiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.z1pywD0np9ZYyWxQtQ882xEHzJ-0Rt-p8s99onPtrTLTm6x6mCGJ-HLCUdVBzI07fCyL9Azkp1m1OFRDZKmal-X4pQrUJdp7rMh-cOmeMx7AbFLUjVmxXAVMZxfe9MH0e8plpGW_KN0zKjRb92uwLjNiejtYlatvQ8Eweg0_NacMKXhn0C24r8-n9uTXVMy0Mr-tN5PK0vRNyYP9uG4X6S6AjaXV5ih5ToFwwdyFz24PyrhvhQ5n_KiS5L0oB5cjdszA6szZaSOIN3ggoFqkqs8R0UXH8-ys6z9auQTy33mh2FKELtOzp-3_VYhSBTZerX2Pc3tTZinRQ-6HyBzhQA', '2021-11-23 07:37:06.113099+00', '2021-11-22 08:18:04.906868+00');
INSERT INTO "public"."asf_security_token" VALUES (25, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTY5MDg0LCJleHAiOjE2Mzc2NTU0ODQsImlhdCI6MTYzNzU2OTA4NCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.tKJm641yaLt_FK1Tf0hS688FQRzk8_5VwcCpvZ0ek7eeIfIMbFkjil0u71zTbpyRu6V6k7aYtpiuSep7FKrupFfI1DXIlpgLfLYMn2RUjHxFtqezE7c4Qz0bbLuxL9p__U7JNqrDvifx4FzEiBktBKTYcQV-2rzqaBoTZZuV0S8sq1Dt21LiMsZ1xF4ycVaaG4ynAUgofg_oS3VmP8pbXWKvQMkQPwF8sr7svq711djU91LnVaqhXufPUzcX7JYLMjIc0E-tMZ17DXBLFL4RWPRutBL5qv5gET97SmDKWWIbP3wARZtTotxBEcHOrDJkYbXtgEhDQyIF3Qz_3uQrMw', '2021-11-23 08:18:04.896979+00', '2021-11-22 08:42:19.330579+00');
INSERT INTO "public"."asf_security_token" VALUES (26, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTY5MDg0LCJleHAiOjE2Mzc2OTg2ODQsImlhdCI6MTYzNzU2OTA4NCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.wIn-7UXR6tx97hQcD77cf2bnp9Dh4UFc0YUz8w6Pqrtbw-8Q9e3lUPgNB3kssEzP0BvFXbgrh_mHfeOx3if_vRAJjH0n8TPW6Dn7LlKXGU-lIcaW5UYgpndRCuiwNLUfh69fNZvGaU2qwlcNAI-0d3mRMGNE7uQvV2nz3oI4VQ6PoZNSQutFsRoTiqXSw3GSPOvCALYUuIL1Rbtk6SGMd_6RVc1rU9yxJjgsFjsBFfmfplwj-V-HpYq8qV-R01k3yFwCebUMIhuMan-drlGvD_aAcHtIJQEXD0SlHqeXySsGqcxfZxQgj1z5tHCzqI1R4Mhmw5638SK4an5u1UhTCQ', '2021-11-23 08:18:04.896979+00', '2021-11-22 08:42:19.333844+00');
INSERT INTO "public"."asf_security_token" VALUES (27, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcwNTM5LCJleHAiOjE2Mzc2NTY5MzksImlhdCI6MTYzNzU3MDUzOSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.alXWwRRT1lR3pIi7XW-gm8_mqHRtSJjEXR6r0U4HqJK3g9dwX3_8cMi6ZqI9v_N7_nv7YZh9uIpkKeH7xfigcdzgw8-CW51fgRyJHFr_I0SxKguET3W9k543T-V5U8YizgV8H6iCjIisWiAUE_apRsnQ37CW0fjwRrCKW688hPaXVbAG22MGngbKweMbnbVwFxQE7NqbfDQxvp6Bqppv-KMDTxMernA-mM1TZcGUddbIVV3PqHB2hzXCYG-4C2PlUk_bkWWQW39rJ3HanAzLMoa5zcKlyXBsqF7ZT_ablUbIZO2Jh06eIPPAOJldM9h_8Hh9sgDTCnSQPR-GLVL6vA', '2021-11-23 08:42:19.329996+00', '2021-11-22 08:50:20.86632+00');
INSERT INTO "public"."asf_security_token" VALUES (28, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcwNTM5LCJleHAiOjE2Mzc3MDAxMzksImlhdCI6MTYzNzU3MDUzOSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.wPWztTNg3K4NZjJHKzFe322JFKIaOn1ZQwlYRm4ID12G6ippkmFAmFd5BFLLUWcwW26MA9VRVthepH6lcwe3x2brqrCZaOfWsGOudQiFy5LGg_zCkY3L3Ggd83ES4r_kaiT1aVOKTXQDsC1aJSwBb8Fmzffk1GDHkMnOLMU8mVlEFnCugagrOn83T5Yh2x2Y0VAJKMyQq2WYjGBjRhyYns3pQOAKsewCJXF6NGrHbQBlyGw6FvYCfE5xjmo8sLWkB4ksoqrhhXKmjkAYyCVbSbPZaWxtA17azPH-QngfXpB5-75AAqEFCQWYH4v5j2IHtuKKewp7KRcIO3h1_K3Tww', '2021-11-23 08:42:19.329996+00', '2021-11-22 08:50:20.869697+00');
INSERT INTO "public"."asf_security_token" VALUES (29, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcxMDIwLCJleHAiOjE2Mzc2NTc0MjAsImlhdCI6MTYzNzU3MTAyMCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.iSoZl-zU6rr0Mp2uvey5A9fk2IoIBGbCENKaI5yiBiI5IKVrT5d2kBiyHVoa2lTHkOfwu3jXtf3DwwDCd9px5NenJ2tph5LjXslOcfx7NU2xURDz6yTenzJMyQTmgsxvliT5O26DlDKxBC7JO5CuCnynco3LHWgw76NHwhnU_1AXvhI-nuYOu7i3oWtSvrqskQaC3-4DVTzfRspSZt24ugGroOYd5Z1YkEdFfNU_JCb5Kflv29XSObNKdIoG0HtwSWy4Tc0Qqm2hCNiuJk-jm_N4Z-v20E8xVIg5QGEtRamUFoxNyuSCT-TkALCYocpLuXzcQRdMJKQdk5Kl8Rjabw', '2021-11-23 08:50:20.865816+00', '2021-11-22 09:21:32.189138+00');
INSERT INTO "public"."asf_security_token" VALUES (30, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcxMDIwLCJleHAiOjE2Mzc3MDA2MjAsImlhdCI6MTYzNzU3MTAyMCwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Kc1T6QEAREH_j05PNcWyV9id404CiWQtMZcFwE5iapzitGanQFmKVnTaa562YajNZXXb4SPKpz3ZyVfWC1h6H6SwwixSL7tFdh_OVLHWsjq9e_GTfPA6aGncZnGfRmRwvHCUmJgT6co15yV3LKVqyoUx-MahKrzQM6BITeC91A6xiMYybhIfrdXRDISD4OECh2NX1kxmW8d5h37ixSdcfDnFJrpfuXn9wSm_khpNuuCFEryXG--SHcvjbFlVO5fyikDWXmfEtqyrzOwFyEFFP4akWEo5I6oYM1tcWXWqtg_itpXzHekw00VWSq2xwG6Uomx74mAOSmElntTfd8nkHA', '2021-11-23 08:50:20.865816+00', '2021-11-22 09:21:32.192168+00');
INSERT INTO "public"."asf_security_token" VALUES (31, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcyODkyLCJleHAiOjE2Mzc2NTkyOTIsImlhdCI6MTYzNzU3Mjg5MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.guT1XccAGVtMkHuoIU6DBbl79n8-giWnvX1uI56JxVcoa-oqJaDuupeCPvsCURAUge-x9ZeMnYiWNO_Rg4fhXAAPfwHig5CtQ8NJ8b7Eo6esaPNqSgop7NaykkgOR2xrZUu5TFsYaYBMOh0SgQENe0aSP9ojVavT5TqLZ3K7pUfd7N7ROu4hiuKH0C6-lzi9T1dnxQFBaNytBFfXPt71y3VcfFs86H98NKWqyRe9hoK2dYB_bmbWtv-SCbFjGmdx35e71_MZ1MXSE3ukcMehZN6qvbs0-Y6khsm7aD3WRnLDhBrKg04f8xFrSOK-uDe8EXtw3FyJO7SdIOH5q1Ob0Q', '2021-11-23 09:21:32.188415+00', '2021-11-22 09:23:36.943527+00');
INSERT INTO "public"."asf_security_token" VALUES (32, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTcyODkyLCJleHAiOjE2Mzc3MDI0OTIsImlhdCI6MTYzNzU3Mjg5MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.ZsRGgosl0F-637Dk3mmxSRLkkJ4HXpjsrfGaUowwwGRJNweSq1vbsRET4Raitfb0SyexyxiEm30nB0pUZRSGyYuJf7q_uhxST3gxHJ7M8aUG_bfHBlyTRl2doffcoCOJuApP57hx4xOyDxG_5sWXfVLnL7E2pamAZMtm7UKzZpHweZO6MUiFLRK19sAUdzmRmoLnA49tcZZWrP3FCKuKhb7tC3u0WV3dRvyK71nKtmsNxNMiZ1QJZ7wri8xdjU7CCkHgMbCfDAyZwNCoT_bXFa5v_D__eSuXGNzl6TIJgUINpFMY96kVxewTrDqOffmC8SY4t0_7jvB5kDVL4LmCFA', '2021-11-23 09:21:32.188415+00', '2021-11-22 09:23:36.94619+00');
INSERT INTO "public"."asf_security_token" VALUES (33, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTczMDE2LCJleHAiOjE2Mzc2NTk0MTYsImlhdCI6MTYzNzU3MzAxNiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.zPlgdt_y0wEXZXdCgOCNyT03WBL7EY4j_L7rWDDt3Mai2453GUjRhKrbXA4LD1m9-SjypEsvw2SwI_gVvBTszmJ_FtPCK5620VkDJagNxGzuI2mmBb5uNDFjRQ-bZy6vzVpUKc1GJn6E5cU7qddV1BFyHeccHUOh4MgRjXglU0gKZvjM1Is6c7-W6_YmFrFxBiVkKIk8BFWzE5Qyi9XUzQWsUTmdpy5v48ehLPZfWQctFVqd4EC6UPvkXXIsA6TBTKvWmGkUTgVmRF4zmBSdf71p3hCaqoE_Cu2ANLEsRKoypYas6LHoGsz3uBhLA35k1cBQBgnsGrg9VR5MokmTcQ', '2021-11-23 09:23:36.943017+00', '2021-11-27 02:35:56.427971+00');
INSERT INTO "public"."asf_security_token" VALUES (34, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3NTczMDE2LCJleHAiOjE2Mzc3MDI2MTYsImlhdCI6MTYzNzU3MzAxNiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.ke7IFmjb8wX-HPWdHQ5Hc1eJUPOWeel9R2A7ZHLxh0MGjuaWT2AQC6vK_Oo8D6JjQMyVgFYmCkgVouGS6Ryo7oNqq3iOnYTOiDrz99am963H5tcTAB8QHdMIEsVp_v0v6PNYUqIskSOuwWQRvRDGJk7sMMuoZZTpCDYzma7Y2HiTg_9Nl3y7VGSGnePxcsWGrctDbxm2sghx68XkkdHrLRBt4ChEW3OdkU_xphFfYD4AfGo1dJzlWTJhurVEs-l1hsB3idx42qi10E-OspsExZUpceKXw3eeCau-fPW5OZycyarmIgKynzzV2KHyBC-tdeD3wX38ZKTgcSYhOVVdsA', '2021-11-23 09:23:36.943017+00', '2021-11-27 02:35:56.431238+00');
INSERT INTO "public"."asf_security_token" VALUES (35, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3OTgwNTU2LCJleHAiOjE2MzgwNjY5NTYsImlhdCI6MTYzNzk4MDU1NiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.OI-rZTzvn2VbX2GVdYZY3rCcjcgAcEu5v2q7uCk_bOx4Py56un4g6zZyheIjKZFBXXtu-ja9CJNldsOY70eNQtSaybkGNI4732Vvz5dcKf0j9WN_hYUjzamAGoqNJhmJRZ7nMnpT9P5Vi3lB5Mjm266GXbAmJKvy3Tq7PBVio_p1tFGVhGB75VwlMVLMF3x2ilQr0Ih29Qi04mPYZ7ajfp1Fw-dmOkXPTny599AhSX73YZMjYKvpl8zMYEIxlcFE2wyV8bYYbW-9exV6cT_GL-t_iHwokoP7aQRKvNEf71CojO66T_aeL6KK_7dWoTJD-6u98dLaaDXqq8utbk8LeQ', '2021-11-28 02:35:56.427152+00', '2021-12-18 04:16:01.868677+00');
INSERT INTO "public"."asf_security_token" VALUES (36, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM3OTgwNTU2LCJleHAiOjE2MzgxMTAxNTYsImlhdCI6MTYzNzk4MDU1NiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.W-VOEs2scRGcGuzcoJb8USXN8fhvu9mGgpe11WHGM5MpAaEJ9LgqXqFLwxP0ZGGhxUpcBc8cXpMrzQTFKnPkEq4-bq4CWARsGjGMQqQl_DH2gQ0E38s8KtBvhsVmkm0oy5UH7ic1XXoUB4Esd4yTNY9v4FDnfcRlo2rKzY8ZQu2N8gc4iPm1OCX_JJxq6FpFjTpaK1OJDPeBhNHOoAHaT9znTbH3Q3L0na-JDijpSQWLoewbwGOV1GOEpirTvF98En9O66KgdTHUbu7bi1qCG67bwt7SHepVQFCYJGqiQ9BzdgmvnMS7R7Qu3ZWm5kg16QMRsHp4rf_mfYbPoOchfA', '2021-11-28 02:35:56.427152+00', '2021-12-18 04:16:01.920362+00');
INSERT INTO "public"."asf_security_token" VALUES (37, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAwOTYxLCJleHAiOjE2Mzk4ODczNjEsImlhdCI6MTYzOTgwMDk2MSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.TmvL57ZGUyrbdLXPAgTPWiReyJ7ulkaALjq09KmQ8K1fegSQ8PhqKBzT-KEi22jhYHIlSFi_-_0JoVg1Q2eoUsAvgsnFPPDFxC3dTF42gy0k-GP76sGIusMV_vCaE6tZ7N-kuddyN87C2uoWyobJ2k0EbKJgZup9NIpQC42-DOoLCluWFzLb9eoBwapuKGBzHLO-0iqnAADofciwXlHrmv6mWF6GoC2PudSHtpSDg3Xcasz7AdhvkZn0ygkyU2oPqton87rLWiN2jWLBnuODObFgEbyaPLCXHApMZyNeofKhKY76ju8enSVoLZppUCPwwyDPVEQhki7ZkCN1ojPNsA', '2021-12-19 04:16:01.719364+00', '2021-12-18 04:16:22.436909+00');
INSERT INTO "public"."asf_security_token" VALUES (38, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAwOTYxLCJleHAiOjE2Mzk5MzA1NjEsImlhdCI6MTYzOTgwMDk2MSwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Upbyo2dGqk3xXw71F1h0X0w96A-Kqrvgl8e5x1gHNHacmXwi2Fm28cPoV9zPGF2NZmw_xbnn8lrkYGEs7kllfxmSjCsWdlsyxj6Hwk5VS3ReFnNQDIaApLsxyjc9WaCR0mSm3Tc95MUP__SsKvwhDXQ1S_cJGhvqlcqm2AuUn0rs9ield2uJhIpliwdWp1Vtgpci7LEsY7pmQzA_RlyHBLdgoWzrkNNfgiIdxS2cakARogabYuqb6Mt8PTgfZeSSCXaAEFbxnNNcKcsYm9luIFptqE_A2wjATZlUH4g8xoRmSSbxqBia1abVQHR7sat5i1zrGmqyyzEnJbBD9PY6eA', '2021-12-19 04:16:01.719364+00', '2021-12-18 04:16:22.480446+00');
INSERT INTO "public"."asf_security_token" VALUES (39, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAwOTgyLCJleHAiOjE2Mzk4ODczODIsImlhdCI6MTYzOTgwMDk4MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.Pzi6_e2cqo9VUvUmtBCZma7EkLeBuOb9BkqK9wr1lX-VzWFFzw2Mi6cGKfze3I0OmwLomB5UxTmekXje6SeJXY200UzJLmxBeVCIBZNfNl2ZRQeaKJ5AlrCiSHHG1S-HHPeMhzCj9P2tTwZABWHnjFHtz-tgeIrgtf3UG0ljOHpFy6_l_JFW92rGUrfzR7w3S5r_UGQnYejkDQDUXXZfavYqer7ogtLlN54LmsMGdhnxCaOK_YVA6SkkW5C9toHg3ywPM9vsjaeDAncBeu4WpjWRFiBrJdiHAXQqJv6vWv9nmkv7xNdJWHUEYIDz0Ov8hOXLVhsZXKfAhnhlcK53-A', '2021-12-19 04:16:22.426684+00', '2021-12-18 04:23:02.63445+00');
INSERT INTO "public"."asf_security_token" VALUES (40, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAwOTgyLCJleHAiOjE2Mzk5MzA1ODIsImlhdCI6MTYzOTgwMDk4MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.JvK5rFWTESNOPsmaG6XIBGKG9EzQC0Ui3LQDriUNUT9ZUCDnniC04ILknUDDY3_sQVdzMCboNgza-7-C09x7DzV6auwd-c_tE87yAcvFpOwUlsPmP4wYgRWBFjpbXRN31UvJD0BPV6pRj24LHdOV89uMqQmFG-aV9QBDeTkdIaJ1ygIbXqxfeMgUqjMbQDvf6xMhSqrRFnnxhYzvAe3YALj2scJ3jfN8v17ZM9RXPT1kdPKz87Y4xblPcohxwpwAPYSySGphG7hsdkX4OmGr5nfNwz8LJBHSudRKulNJF4m87sdBZp4YMt10-YyWqLt6ksIBIr-vmpZAXGNx9ykBbA', '2021-12-19 04:16:22.426684+00', '2021-12-18 04:23:02.705933+00');
INSERT INTO "public"."asf_security_token" VALUES (41, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAxMzgyLCJleHAiOjE2Mzk4ODc3ODIsImlhdCI6MTYzOTgwMTM4MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.BDkmlyr7J2BIvEoPYfdUjUDJWElYgScXKxIiNPj23-Kj_4BaDoNs0dkiTukrfy8Rj2qGRN6I1f4gEWUYdtKr-sm73K4b0fyuXWhs9kDYl0_ryo4p-lFEddREAF0icRG3Tke3p5a5X758iJ3sQXJjm9MxeWH4hG65BTvbNU2owmSqJnow9d5RdI7UcQ0xNgVa7wiNDLMR10QPi8s-RLy0dtfwWoY6BqLB2VBO7IhUeWWahuQ0Qg8-pVVj_sEMmdw-yS0dGLcwCUKCq4LWoq4zlYcsp2WAQLIjuk3sVnU_AXaC2AG__Qz4U-QUNWh_-qfAU4a47I8-ZCAEdxqnkoE02A', '2021-12-19 04:23:02.47912+00', '2021-12-18 04:24:52.01669+00');
INSERT INTO "public"."asf_security_token" VALUES (42, 1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjpbImtlZXBfd2FuIiwiYWRtaW4iXSwicm9sZSI6WyJzdXBlcmFkbWluIiwidXNlciJdLCJzdWIiOiIxIiwiYXV0aF9tb2RlIjoiVXNlcm5hbWVBbmRQYXNzd29yZCIsInRlbmFuY3lfaWQiOiIxIiwibmJmIjoxNjM5ODAxMzgyLCJleHAiOjE2Mzk5MzA5ODIsImlhdCI6MTYzOTgwMTM4MiwiaXNzIjoiYXNmIiwiYXVkIjoiYXNmIn0.ks3i9WadBi_XSJsTsYh7Ta56LHt2oV15ZiKAp2hnO8KWshBxCU0oBw7O8SeOAmW8tfEUO97gHksb3u5BSUpSz_VImtI2mZb1VTsX2GmFG5n93P0pRIb84AyTmcNfvZsr4mgBy0h_ywJvSVzaVRSsmhs1hq9NblVcBIXOM7F4_vbTpbdRWXkI3rH0E8DvRX6PLKej-NVcemjcq29FhfEHeK4z8fDNIvfTODyI86WGZEKsH4oioc9vX8Qjt_FpuUe8_bUf27TzrNY8g36igIv6485U_BnVuPaH8R41ys-nDA1-kD20B_yn4ppo00K_BNA_xWs_JlohWWnjnanLnLrvYg', '2021-12-19 04:23:02.47912+00', '2021-12-18 04:24:52.123399+00');


--
-- Data for Name: asf_tenancy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."asf_tenancy" VALUES (1, '总部集团', 0, 0, 1, 1, 0, '2021-11-12 07:06:30.76408+00');
INSERT INTO "public"."asf_tenancy" VALUES (2, '公司A', 0, 0, 1, 1, 0, '2021-11-12 07:06:30.76408+00');


--
-- Data for Name: asf_translate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: asf_account_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_account_post_id_seq"', 2, true);


--
-- Name: asf_account_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_account_role_id_seq"', 1, true);


--
-- Name: asf_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_accounts_id_seq"', 17, true);


--
-- Name: asf_apis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_apis_id_seq"', 82, true);


--
-- Name: asf_concat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_concat_id_seq"', 1, false);


--
-- Name: asf_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_department_id_seq"', 32, true);


--
-- Name: asf_department_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_department_role_id_seq"', 32, true);


--
-- Name: asf_dictionary_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_dictionary_Id_seq"', 1, false);


--
-- Name: asf_editor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_editor_id_seq"', 36, true);


--
-- Name: asf_loginfos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_loginfos_id_seq"', 38, true);


--
-- Name: asf_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_permission_id_seq"', 15, true);


--
-- Name: asf_permission_menu_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_permission_menu_Id_seq"', 15, true);


--
-- Name: asf_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_post_id_seq"', 14, true);


--
-- Name: asf_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_role_id_seq"', 3, true);


--
-- Name: asf_role_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_role_permission_id_seq"', 33, true);


--
-- Name: asf_scheduled_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_scheduled_task_id_seq"', 1, false);


--
-- Name: asf_security_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_security_token_id_seq"', 42, true);


--
-- Name: asf_tenancy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."asf_tenancy_id_seq"', 2, true);


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
-- Name: asf_concat PK_asf_concat; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_concat"
    ADD CONSTRAINT "PK_asf_concat" PRIMARY KEY ("id");


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
    ADD CONSTRAINT "PK_asf_dictionary" PRIMARY KEY ("id");


--
-- Name: asf_editor PK_asf_editor; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."asf_editor"
    ADD CONSTRAINT "PK_asf_editor" PRIMARY KEY ("id");


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
    ADD CONSTRAINT "PK_asf_permission_menu" PRIMARY KEY ("id");


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
    ADD CONSTRAINT "PK_asf_translate" PRIMARY KEY ("id");


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

CREATE INDEX "IX_asf_apis_path" ON "public"."asf_apis" USING "btree" ("path");


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

