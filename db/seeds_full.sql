--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.17
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1.pgdg16.04+1)

-- Started on 2019-06-28 15:54:35 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 1898088)
-- Name: annotations; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.annotations (
    id integer NOT NULL,
    question_id integer,
    org_id integer,
    text text,
    type integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    versionable_id character varying(36)
);


ALTER TABLE public.annotations OWNER TO thomas;

--
-- TOC entry 182 (class 1259 OID 1898086)
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.annotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotations_id_seq OWNER TO thomas;

--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 182
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.annotations_id_seq OWNED BY public.annotations.id;


--
-- TOC entry 185 (class 1259 OID 1898102)
-- Name: answers; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    text text,
    plan_id integer,
    user_id integer,
    question_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    lock_version integer DEFAULT 0
);


ALTER TABLE public.answers OWNER TO thomas;

--
-- TOC entry 184 (class 1259 OID 1898100)
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO thomas;

--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 184
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- TOC entry 186 (class 1259 OID 1898114)
-- Name: answers_question_options; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.answers_question_options (
    answer_id integer NOT NULL,
    question_option_id integer NOT NULL
);


ALTER TABLE public.answers_question_options OWNER TO thomas;

--
-- TOC entry 188 (class 1259 OID 1898120)
-- Name: exported_plans; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.exported_plans (
    id integer NOT NULL,
    plan_id integer,
    user_id integer,
    format character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phase_id integer
);


ALTER TABLE public.exported_plans OWNER TO thomas;

--
-- TOC entry 187 (class 1259 OID 1898118)
-- Name: exported_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.exported_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exported_plans_id_seq OWNER TO thomas;

--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 187
-- Name: exported_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.exported_plans_id_seq OWNED BY public.exported_plans.id;


--
-- TOC entry 190 (class 1259 OID 1898131)
-- Name: guidance_groups; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.guidance_groups (
    id integer NOT NULL,
    name character varying,
    org_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    optional_subset boolean DEFAULT false NOT NULL,
    published boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guidance_groups OWNER TO thomas;

--
-- TOC entry 189 (class 1259 OID 1898129)
-- Name: guidance_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.guidance_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guidance_groups_id_seq OWNER TO thomas;

--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 189
-- Name: guidance_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.guidance_groups_id_seq OWNED BY public.guidance_groups.id;


--
-- TOC entry 192 (class 1259 OID 1898145)
-- Name: guidances; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.guidances (
    id integer NOT NULL,
    text text,
    guidance_group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published boolean
);


ALTER TABLE public.guidances OWNER TO thomas;

--
-- TOC entry 191 (class 1259 OID 1898143)
-- Name: guidances_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.guidances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guidances_id_seq OWNER TO thomas;

--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 191
-- Name: guidances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.guidances_id_seq OWNED BY public.guidances.id;


--
-- TOC entry 194 (class 1259 OID 1898157)
-- Name: identifier_schemes; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.identifier_schemes (
    id integer NOT NULL,
    name character varying,
    description character varying,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    logo_url text,
    user_landing_url text
);


ALTER TABLE public.identifier_schemes OWNER TO thomas;

--
-- TOC entry 193 (class 1259 OID 1898155)
-- Name: identifier_schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.identifier_schemes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identifier_schemes_id_seq OWNER TO thomas;

--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 193
-- Name: identifier_schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.identifier_schemes_id_seq OWNED BY public.identifier_schemes.id;


--
-- TOC entry 196 (class 1259 OID 1898168)
-- Name: languages; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    abbreviation character varying,
    description character varying,
    name character varying,
    default_language boolean
);


ALTER TABLE public.languages OWNER TO thomas;

--
-- TOC entry 195 (class 1259 OID 1898166)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO thomas;

--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 195
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- TOC entry 198 (class 1259 OID 1898179)
-- Name: notes; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    user_id integer,
    text text,
    archived boolean DEFAULT false NOT NULL,
    answer_id integer,
    archived_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.notes OWNER TO thomas;

--
-- TOC entry 197 (class 1259 OID 1898177)
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO thomas;

--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 197
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- TOC entry 200 (class 1259 OID 1898192)
-- Name: notification_acknowledgements; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.notification_acknowledgements (
    id integer NOT NULL,
    user_id integer,
    notification_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.notification_acknowledgements OWNER TO thomas;

--
-- TOC entry 199 (class 1259 OID 1898190)
-- Name: notification_acknowledgements_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.notification_acknowledgements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_acknowledgements_id_seq OWNER TO thomas;

--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 199
-- Name: notification_acknowledgements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.notification_acknowledgements_id_seq OWNED BY public.notification_acknowledgements.id;


--
-- TOC entry 202 (class 1259 OID 1898202)
-- Name: notifications; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    notification_type integer,
    title character varying,
    level integer,
    body text,
    dismissable boolean,
    starts_at date,
    expires_at date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO thomas;

--
-- TOC entry 201 (class 1259 OID 1898200)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO thomas;

--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 201
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 204 (class 1259 OID 1898213)
-- Name: org_identifiers; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.org_identifiers (
    id integer NOT NULL,
    identifier character varying,
    attrs character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    org_id integer,
    identifier_scheme_id integer
);


ALTER TABLE public.org_identifiers OWNER TO thomas;

--
-- TOC entry 203 (class 1259 OID 1898211)
-- Name: org_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.org_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_identifiers_id_seq OWNER TO thomas;

--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 203
-- Name: org_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.org_identifiers_id_seq OWNED BY public.org_identifiers.id;


--
-- TOC entry 206 (class 1259 OID 1898224)
-- Name: org_token_permissions; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.org_token_permissions (
    id integer NOT NULL,
    org_id integer,
    token_permission_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.org_token_permissions OWNER TO thomas;

--
-- TOC entry 205 (class 1259 OID 1898222)
-- Name: org_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.org_token_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_token_permissions_id_seq OWNER TO thomas;

--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 205
-- Name: org_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.org_token_permissions_id_seq OWNED BY public.org_token_permissions.id;


--
-- TOC entry 208 (class 1259 OID 1898233)
-- Name: orgs; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.orgs (
    id integer NOT NULL,
    name character varying,
    abbreviation character varying,
    target_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_other boolean DEFAULT false NOT NULL,
    sort_name character varying,
    region_id integer,
    language_id integer,
    logo_uid character varying,
    logo_name character varying,
    contact_email character varying,
    org_type integer DEFAULT 0 NOT NULL,
    links text,
    contact_name character varying,
    feedback_enabled boolean DEFAULT false,
    feedback_email_subject character varying,
    feedback_email_msg text
);


ALTER TABLE public.orgs OWNER TO thomas;

--
-- TOC entry 207 (class 1259 OID 1898231)
-- Name: orgs_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.orgs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orgs_id_seq OWNER TO thomas;

--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 207
-- Name: orgs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.orgs_id_seq OWNED BY public.orgs.id;


--
-- TOC entry 210 (class 1259 OID 1898247)
-- Name: perms; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.perms (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.perms OWNER TO thomas;

--
-- TOC entry 209 (class 1259 OID 1898245)
-- Name: perms_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.perms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perms_id_seq OWNER TO thomas;

--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 209
-- Name: perms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.perms_id_seq OWNED BY public.perms.id;


--
-- TOC entry 212 (class 1259 OID 1898258)
-- Name: phases; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.phases (
    id integer NOT NULL,
    title character varying,
    description text,
    number integer,
    template_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    modifiable boolean,
    versionable_id character varying(36)
);


ALTER TABLE public.phases OWNER TO thomas;

--
-- TOC entry 211 (class 1259 OID 1898256)
-- Name: phases_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.phases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phases_id_seq OWNER TO thomas;

--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 211
-- Name: phases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.phases_id_seq OWNED BY public.phases.id;


--
-- TOC entry 214 (class 1259 OID 1898271)
-- Name: plans; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    title character varying,
    template_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    grant_number character varying,
    identifier character varying,
    description text,
    principal_investigator character varying,
    principal_investigator_identifier character varying,
    data_contact character varying,
    funder_name character varying,
    visibility integer DEFAULT 3 NOT NULL,
    data_contact_email character varying,
    data_contact_phone character varying,
    principal_investigator_email character varying,
    principal_investigator_phone character varying,
    feedback_requested boolean DEFAULT false,
    complete boolean DEFAULT false
);


ALTER TABLE public.plans OWNER TO thomas;

--
-- TOC entry 216 (class 1259 OID 1898286)
-- Name: plans_guidance_groups; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.plans_guidance_groups (
    id integer NOT NULL,
    guidance_group_id integer,
    plan_id integer
);


ALTER TABLE public.plans_guidance_groups OWNER TO thomas;

--
-- TOC entry 215 (class 1259 OID 1898284)
-- Name: plans_guidance_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.plans_guidance_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_guidance_groups_id_seq OWNER TO thomas;

--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 215
-- Name: plans_guidance_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.plans_guidance_groups_id_seq OWNED BY public.plans_guidance_groups.id;


--
-- TOC entry 213 (class 1259 OID 1898269)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO thomas;

--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 213
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- TOC entry 218 (class 1259 OID 1898295)
-- Name: prefs; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.prefs (
    id integer NOT NULL,
    settings text,
    user_id integer
);


ALTER TABLE public.prefs OWNER TO thomas;

--
-- TOC entry 217 (class 1259 OID 1898293)
-- Name: prefs_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.prefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prefs_id_seq OWNER TO thomas;

--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 217
-- Name: prefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.prefs_id_seq OWNED BY public.prefs.id;


--
-- TOC entry 220 (class 1259 OID 1898306)
-- Name: question_formats; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.question_formats (
    id integer NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    option_based boolean DEFAULT false,
    formattype integer DEFAULT 0
);


ALTER TABLE public.question_formats OWNER TO thomas;

--
-- TOC entry 219 (class 1259 OID 1898304)
-- Name: question_formats_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.question_formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_formats_id_seq OWNER TO thomas;

--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 219
-- Name: question_formats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.question_formats_id_seq OWNED BY public.question_formats.id;


--
-- TOC entry 222 (class 1259 OID 1898319)
-- Name: question_options; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.question_options (
    id integer NOT NULL,
    question_id integer,
    text character varying,
    number integer,
    is_default boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.question_options OWNER TO thomas;

--
-- TOC entry 221 (class 1259 OID 1898317)
-- Name: question_options_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.question_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_options_id_seq OWNER TO thomas;

--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 221
-- Name: question_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.question_options_id_seq OWNED BY public.question_options.id;


--
-- TOC entry 224 (class 1259 OID 1898331)
-- Name: questions; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    text text,
    default_value text,
    number integer,
    section_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    question_format_id integer,
    option_comment_display boolean DEFAULT true,
    modifiable boolean,
    versionable_id character varying(36)
);


ALTER TABLE public.questions OWNER TO thomas;

--
-- TOC entry 223 (class 1259 OID 1898329)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO thomas;

--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 223
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- TOC entry 225 (class 1259 OID 1898343)
-- Name: questions_themes; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.questions_themes (
    question_id integer NOT NULL,
    theme_id integer NOT NULL
);


ALTER TABLE public.questions_themes OWNER TO thomas;

--
-- TOC entry 227 (class 1259 OID 1898349)
-- Name: regions; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    abbreviation character varying,
    description character varying,
    name character varying,
    super_region_id integer
);


ALTER TABLE public.regions OWNER TO thomas;

--
-- TOC entry 226 (class 1259 OID 1898347)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO thomas;

--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 226
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- TOC entry 229 (class 1259 OID 1898360)
-- Name: roles; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    user_id integer,
    plan_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    access integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE public.roles OWNER TO thomas;

--
-- TOC entry 228 (class 1259 OID 1898358)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO thomas;

--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 228
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 181 (class 1259 OID 1898078)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO thomas;

--
-- TOC entry 231 (class 1259 OID 1898372)
-- Name: sections; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    title character varying,
    description text,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    phase_id integer,
    modifiable boolean,
    versionable_id character varying(36)
);


ALTER TABLE public.sections OWNER TO thomas;

--
-- TOC entry 230 (class 1259 OID 1898370)
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO thomas;

--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 230
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- TOC entry 233 (class 1259 OID 1898385)
-- Name: sessions; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id character varying(64) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO thomas;

--
-- TOC entry 232 (class 1259 OID 1898383)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO thomas;

--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 232
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 235 (class 1259 OID 1898398)
-- Name: settings; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    var character varying NOT NULL,
    value text,
    target_id integer NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.settings OWNER TO thomas;

--
-- TOC entry 234 (class 1259 OID 1898396)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO thomas;

--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 234
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 237 (class 1259 OID 1898409)
-- Name: stats; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.stats (
    id integer NOT NULL,
    count bigint DEFAULT 0,
    date date NOT NULL,
    type character varying NOT NULL,
    org_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    details text
);


ALTER TABLE public.stats OWNER TO thomas;

--
-- TOC entry 236 (class 1259 OID 1898407)
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO thomas;

--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 236
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- TOC entry 239 (class 1259 OID 1898421)
-- Name: templates; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.templates (
    id integer NOT NULL,
    title character varying,
    description text,
    published boolean,
    org_id integer,
    locale character varying,
    is_default boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer,
    visibility integer,
    customization_of integer,
    family_id integer,
    archived boolean,
    links text
);


ALTER TABLE public.templates OWNER TO thomas;

--
-- TOC entry 238 (class 1259 OID 1898419)
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.templates_id_seq OWNER TO thomas;

--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 238
-- Name: templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;


--
-- TOC entry 241 (class 1259 OID 1898436)
-- Name: themes; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    locale character varying
);


ALTER TABLE public.themes OWNER TO thomas;

--
-- TOC entry 240 (class 1259 OID 1898434)
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO thomas;

--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 240
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- TOC entry 242 (class 1259 OID 1898445)
-- Name: themes_in_guidance; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.themes_in_guidance (
    theme_id integer,
    guidance_id integer
);


ALTER TABLE public.themes_in_guidance OWNER TO thomas;

--
-- TOC entry 244 (class 1259 OID 1898452)
-- Name: token_permission_types; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.token_permission_types (
    id integer NOT NULL,
    token_type character varying,
    text_description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.token_permission_types OWNER TO thomas;

--
-- TOC entry 243 (class 1259 OID 1898450)
-- Name: token_permission_types_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.token_permission_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_permission_types_id_seq OWNER TO thomas;

--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 243
-- Name: token_permission_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.token_permission_types_id_seq OWNED BY public.token_permission_types.id;


--
-- TOC entry 246 (class 1259 OID 1898463)
-- Name: user_identifiers; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.user_identifiers (
    id integer NOT NULL,
    identifier character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    identifier_scheme_id integer
);


ALTER TABLE public.user_identifiers OWNER TO thomas;

--
-- TOC entry 245 (class 1259 OID 1898461)
-- Name: user_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.user_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_identifiers_id_seq OWNER TO thomas;

--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 245
-- Name: user_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.user_identifiers_id_seq OWNED BY public.user_identifiers.id;


--
-- TOC entry 248 (class 1259 OID 1898475)
-- Name: users; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character varying,
    surname character varying,
    email character varying(80) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    other_organisation character varying,
    accept_terms boolean,
    org_id integer,
    api_token character varying,
    invited_by_id integer,
    invited_by_type character varying,
    language_id integer,
    recovery_email character varying,
    active boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO thomas;

--
-- TOC entry 247 (class 1259 OID 1898473)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: thomas
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO thomas;

--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 247
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomas
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 249 (class 1259 OID 1898490)
-- Name: users_perms; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE public.users_perms (
    user_id integer,
    perm_id integer
);


ALTER TABLE public.users_perms OWNER TO thomas;

--
-- TOC entry 2254 (class 2604 OID 1898091)
-- Name: annotations id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.annotations ALTER COLUMN id SET DEFAULT nextval('public.annotations_id_seq'::regclass);


--
-- TOC entry 2256 (class 2604 OID 1898105)
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- TOC entry 2258 (class 2604 OID 1898123)
-- Name: exported_plans id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.exported_plans ALTER COLUMN id SET DEFAULT nextval('public.exported_plans_id_seq'::regclass);


--
-- TOC entry 2259 (class 2604 OID 1898134)
-- Name: guidance_groups id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidance_groups ALTER COLUMN id SET DEFAULT nextval('public.guidance_groups_id_seq'::regclass);


--
-- TOC entry 2262 (class 2604 OID 1898148)
-- Name: guidances id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidances ALTER COLUMN id SET DEFAULT nextval('public.guidances_id_seq'::regclass);


--
-- TOC entry 2263 (class 2604 OID 1898160)
-- Name: identifier_schemes id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.identifier_schemes ALTER COLUMN id SET DEFAULT nextval('public.identifier_schemes_id_seq'::regclass);


--
-- TOC entry 2264 (class 2604 OID 1898171)
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- TOC entry 2265 (class 2604 OID 1898182)
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- TOC entry 2267 (class 2604 OID 1898195)
-- Name: notification_acknowledgements id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notification_acknowledgements ALTER COLUMN id SET DEFAULT nextval('public.notification_acknowledgements_id_seq'::regclass);


--
-- TOC entry 2268 (class 2604 OID 1898205)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 2269 (class 2604 OID 1898216)
-- Name: org_identifiers id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_identifiers ALTER COLUMN id SET DEFAULT nextval('public.org_identifiers_id_seq'::regclass);


--
-- TOC entry 2270 (class 2604 OID 1898227)
-- Name: org_token_permissions id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.org_token_permissions_id_seq'::regclass);


--
-- TOC entry 2271 (class 2604 OID 1898236)
-- Name: orgs id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.orgs ALTER COLUMN id SET DEFAULT nextval('public.orgs_id_seq'::regclass);


--
-- TOC entry 2275 (class 2604 OID 1898250)
-- Name: perms id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.perms ALTER COLUMN id SET DEFAULT nextval('public.perms_id_seq'::regclass);


--
-- TOC entry 2276 (class 2604 OID 1898261)
-- Name: phases id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.phases ALTER COLUMN id SET DEFAULT nextval('public.phases_id_seq'::regclass);


--
-- TOC entry 2277 (class 2604 OID 1898274)
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- TOC entry 2281 (class 2604 OID 1898289)
-- Name: plans_guidance_groups id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans_guidance_groups ALTER COLUMN id SET DEFAULT nextval('public.plans_guidance_groups_id_seq'::regclass);


--
-- TOC entry 2282 (class 2604 OID 1898298)
-- Name: prefs id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.prefs ALTER COLUMN id SET DEFAULT nextval('public.prefs_id_seq'::regclass);


--
-- TOC entry 2283 (class 2604 OID 1898309)
-- Name: question_formats id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.question_formats ALTER COLUMN id SET DEFAULT nextval('public.question_formats_id_seq'::regclass);


--
-- TOC entry 2286 (class 2604 OID 1898322)
-- Name: question_options id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.question_options ALTER COLUMN id SET DEFAULT nextval('public.question_options_id_seq'::regclass);


--
-- TOC entry 2287 (class 2604 OID 1898334)
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- TOC entry 2289 (class 2604 OID 1898352)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- TOC entry 2290 (class 2604 OID 1898363)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 2293 (class 2604 OID 1898375)
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 1898388)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 2295 (class 2604 OID 1898401)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 2297 (class 2604 OID 1898412)
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- TOC entry 2298 (class 2604 OID 1898424)
-- Name: templates id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);


--
-- TOC entry 2299 (class 2604 OID 1898439)
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- TOC entry 2300 (class 2604 OID 1898455)
-- Name: token_permission_types id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.token_permission_types ALTER COLUMN id SET DEFAULT nextval('public.token_permission_types_id_seq'::regclass);


--
-- TOC entry 2301 (class 2604 OID 1898466)
-- Name: user_identifiers id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.user_identifiers ALTER COLUMN id SET DEFAULT nextval('public.user_identifiers_id_seq'::regclass);


--
-- TOC entry 2302 (class 2604 OID 1898478)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2563 (class 0 OID 1898088)
-- Dependencies: 183
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.annotations VALUES (3, 36, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-04-18 09:33:04.640922', '2019-04-18 09:33:04.640922', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (4, 42, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-04-18 10:06:25.249528', '2019-04-18 10:06:25.249528', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (5, 51, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-04-18 10:38:02.518261', '2019-04-18 10:38:02.518261', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (6, 57, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-04-18 10:38:02.657025', '2019-04-18 10:38:02.657025', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (7, 62, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-04-18 13:17:49.625136', '2019-04-18 13:17:49.625136', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (8, 67, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-04-18 13:17:49.740075', '2019-04-18 13:17:49.740075', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (25, 211, 7, 'b', 0, '2019-05-03 13:33:24.546113', '2019-05-03 13:33:24.546113', 'bd7a8665-685e-4b53-a8fb-dc1b21664120');
INSERT INTO public.annotations VALUES (26, 211, 7, 'c', 1, '2019-05-03 13:33:24.547783', '2019-05-03 13:33:24.547783', '0843b26b-b38e-48e9-a92d-30060eafa858');
INSERT INTO public.annotations VALUES (10, 81, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 10:09:15.485053', '2019-05-03 10:09:15.485053', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (9, 76, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 10:09:15.406267', '2019-05-03 10:09:15.406267', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (11, 98, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Title</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Abstract</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Lineage: </span></em></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by other users (e.g. statistical analyses, subsetting, geographical reprojection,,...): global origin, simple categorization of sampling methods, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Language(s) used in the data</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Format(s): file formats</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Creation date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Latest revision date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Author of the dataset</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Full name of the organization</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Name of the responsible person</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Email address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">City</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal code</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Country</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Website</span></em></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Geographic area: named area </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Conditions for data sharing: licen</span></em></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">ses, embargoes</span></em></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 10:20:35.879153', '2019-05-03 10:20:35.879153', '104d702d-d7c2-4c57-9f4c-5eb400cf761d');
INSERT INTO public.annotations VALUES (12, 109, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.<br /><br /></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, we want to highlight that EurofleetsPlus data must be as open as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 10:31:59.766236', '2019-05-03 10:31:59.766236', '5ed6f018-6e0f-4275-8dc0-57201e06d66a');
INSERT INTO public.annotations VALUES (13, 119, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 12:17:19.596851', '2019-05-03 12:17:19.596851', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (14, 122, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 12:17:19.653921', '2019-05-03 12:17:19.653921', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (15, 140, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Title</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Abstract</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Lineage: </span></em></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by other users (e.g. statistical analyses, subsetting, geographical reprojection,,...): global origin, simple categorization of sampling methods, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Language(s) used in the data</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Format(s): file formats</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Creation date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Latest revision date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Author of the dataset</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Full name of the organization</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Name of the responsible person</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Email address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">City</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal code</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Country</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Website</span></em></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Geographic area: named area </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Conditions for data sharing: licen</span></em></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">ses, embargoes</span></em></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 12:17:19.987041', '2019-05-03 12:17:19.987041', '104d702d-d7c2-4c57-9f4c-5eb400cf761d');
INSERT INTO public.annotations VALUES (16, 151, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.<br /><br /></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, we want to highlight that EurofleetsPlus data must be as open as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 12:17:20.142577', '2019-05-03 12:17:20.142577', '5ed6f018-6e0f-4275-8dc0-57201e06d66a');
INSERT INTO public.annotations VALUES (17, 161, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 12:21:05.234878', '2019-05-03 12:21:05.234878', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (18, 164, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 12:21:05.297039', '2019-05-03 12:21:05.297039', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (19, 182, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Title</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Abstract</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Lineage: </span></em></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by other users (e.g. statistical analyses, subsetting, geographical reprojection,,...): global origin, simple categorization of sampling methods, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Language(s) used in the data</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Format(s): file formats</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Creation date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Latest revision date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Author of the dataset</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Full name of the organization</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Name of the responsible person</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Email address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">City</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal code</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Country</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Website</span></em></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Geographic area: named area </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Conditions for data sharing: licen</span></em></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">ses, embargoes</span></em></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 12:21:05.601547', '2019-05-03 12:21:05.601547', '104d702d-d7c2-4c57-9f4c-5eb400cf761d');
INSERT INTO public.annotations VALUES (20, 193, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.<br /><br /></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, we want to highlight that EurofleetsPlus data must be as open as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 12:21:05.758236', '2019-05-03 12:21:05.758236', '5ed6f018-6e0f-4275-8dc0-57201e06d66a');
INSERT INTO public.annotations VALUES (21, 205, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 13:33:23.807062', '2019-05-03 13:33:23.807062', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (22, 208, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 13:33:23.870221', '2019-05-03 13:33:23.870221', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (23, 226, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Title</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Abstract</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Lineage: </span></em></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by other users (e.g. statistical analyses, subsetting, geographical reprojection,,...): global origin, simple categorization of sampling methods, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Language(s) used in the data</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Format(s): file formats</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Creation date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Latest revision date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Author of the dataset</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Full name of the organization</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Name of the responsible person</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Email address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">City</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal code</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Country</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Website</span></em></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Geographic area: named area </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Conditions for data sharing: licen</span></em></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">ses, embargoes</span></em></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 13:33:24.183316', '2019-05-03 13:33:24.183316', '104d702d-d7c2-4c57-9f4c-5eb400cf761d');
INSERT INTO public.annotations VALUES (24, 237, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.<br /><br /></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, we want to highlight that EurofleetsPlus data must be as open as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 13:33:24.334601', '2019-05-03 13:33:24.334601', '5ed6f018-6e0f-4275-8dc0-57201e06d66a');
INSERT INTO public.annotations VALUES (27, 248, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Title</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Abstract</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Lineage: </span></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by others users (e.g. statistical analysis, geographical modification,...): global origin, simple categorization of sampling devices, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Language(s) used in the data</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Format(s): file formats</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Creation date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Latest revision date of the dataset</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Author of the dataset</span></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Full name of the organization</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Name of the responsible person</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Email address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal address</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">City</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Postal code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Country</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Website</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Geographic area: named area </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">Conditions for data sharing: licen</span></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">ses, embargoes</span></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 13:37:28.32939', '2019-05-03 13:37:28.32939', '8f3e9857-1624-4f08-a544-a646a651f863');
INSERT INTO public.annotations VALUES (28, 251, 7, '<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.</span></span></span></p>
<p lang="en-GB" style="margin-left: 1cm; margin-bottom: 0.26cm; font-weight: normal; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, w</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">e want to highlight that EurofleetsPlus </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">must be </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">open </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 13:37:28.397703', '2019-05-03 13:37:28.397703', 'a7d726be-b485-43e5-b94c-139bb721002d');
INSERT INTO public.annotations VALUES (31, 269, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">''Metadata'' is considered ''data about data''. In this context it represents ''information about datasets''. Metadata should take into account the following elements:</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Title</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Abstract</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Lineage: </span></em></span></span></span></span><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Different basic steps that have been performed to the raw data in order to help the interpretation by other users (e.g. statistical analyses, subsetting, geographical reprojection,,...): global origin, simple categorization of sampling methods, previous file formats the data had, specific steps and transformations taken to clean, compile and present the data. Relations with other data sets.</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Language(s) used in the data</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Format(s): file formats</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Creation date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Latest revision date of the dataset</span></em></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Author of the dataset</span></em></span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Full name of the organization</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Name of the responsible person</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Email address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal address</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">City</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Postal code</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Country</span></em></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><em><span style="font-weight: normal;">Website</span></em></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Geographic area: named area </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Coordinate Reference System (CRS): WGS 84, ETRS89,...</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Spatial Extent (Bounding Box): The spatial coordinates of the widest geographical extent (westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude)</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Temporal Extent: start and stop date of the collection points</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Taxonomic coverage: The taxa (use appropriate levels like families, orders or classes) this dataset contains </span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Limitations for data using: E.g. not for navigation purposes, provided without liability, sensitive information withheld&hellip;</span></em></span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="text-decoration: none;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">Conditions for data sharing: licen</span></em></span></span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><em><span style="font-weight: normal;">ses, embargoes</span></em></span></span></span></span></p>
</li>
</ul>', 1, '2019-05-03 13:37:28.767598', '2019-05-03 13:37:28.767598', '104d702d-d7c2-4c57-9f4c-5eb400cf761d');
INSERT INTO public.annotations VALUES (32, 280, 7, '<p class="western" lang="en-GB" style="margin-bottom: 0.35cm; line-height: 115%;"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Horizon 2020 wants to stimulate openly accessible data, with maximal reusability. In order to facilitate this, open, up-front and machine readable licenses are preferred, such as those on https://</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">creativecommons.org</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">/licenses.<br /><br /></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Furthermore, we want to highlight that EurofleetsPlus data must be as open as possible, which means that the CC0 (public domain) license is the most appropriate.</span></span></span></p>', 1, '2019-05-03 13:37:28.94764', '2019-05-03 13:37:28.94764', '5ed6f018-6e0f-4275-8dc0-57201e06d66a');


--
-- TOC entry 2565 (class 0 OID 1898102)
-- Dependencies: 185
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.answers VALUES (5, 'The data will be collected in the framework of...', 22, 5, 167, '2019-05-03 12:34:57.352648', '2019-05-03 12:34:57.352648', 1);
INSERT INTO public.answers VALUES (6, 'NetCDF, Excel for the metadata, some ODV,...', 22, 5, 168, '2019-05-03 12:35:19.624533', '2019-05-03 13:20:18.049907', 4);
INSERT INTO public.answers VALUES (7, 'I don"t want to answer!', 22, 5, 160, '2019-05-03 13:31:06.638987', '2019-05-03 13:31:22.436245', 1);
INSERT INTO public.answers VALUES (8, 'I don''t know', 21, 5, 167, '2019-05-03 13:35:07.645624', '2019-05-03 13:35:07.645624', 1);
INSERT INTO public.answers VALUES (9, 'a', 24, 5, 211, '2019-05-03 13:35:50.290688', '2019-05-03 13:35:50.290688', 1);


--
-- TOC entry 2566 (class 0 OID 1898114)
-- Dependencies: 186
-- Data for Name: answers_question_options; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2568 (class 0 OID 1898120)
-- Dependencies: 188
-- Data for Name: exported_plans; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.exported_plans VALUES (1, 18, NULL, 'pdf', '2019-05-03 10:59:10.83139', '2019-05-03 10:59:10.83139', 15);


--
-- TOC entry 2570 (class 0 OID 1898131)
-- Dependencies: 190
-- Data for Name: guidance_groups; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.guidance_groups VALUES (7, 'YRI', 8, '2019-04-11 15:05:09.955702', '2019-04-11 15:05:09.955702', false, false);
INSERT INTO public.guidance_groups VALUES (6, 'EurofleetsPlus DMP Guidance', 7, '2019-04-11 15:00:35.231253', '2019-04-18 14:03:23.273456', false, false);


--
-- TOC entry 2572 (class 0 OID 1898145)
-- Dependencies: 192
-- Data for Name: guidances; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2574 (class 0 OID 1898157)
-- Dependencies: 194
-- Data for Name: identifier_schemes; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.identifier_schemes VALUES (1, 'orcid', 'ORCID', true, '2019-04-11 13:04:56.916464', '2019-04-11 13:04:56.916464', 'http://orcid.org/sites/default/files/images/orcid_16x16.png', 'https://orcid.org');
INSERT INTO public.identifier_schemes VALUES (2, 'shibboleth', 'Your institutional credentials', true, '2019-04-11 13:04:56.926111', '2019-04-11 13:04:56.926111', 'http://newsite.shibboleth.net/wp-content/uploads/2017/01/Shibboleth-logo_2000x1200-1.png', 'https://example.com');


--
-- TOC entry 2576 (class 0 OID 1898168)
-- Dependencies: 196
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.languages VALUES (1, 'en-GB', '', 'English (GB)', true);
INSERT INTO public.languages VALUES (2, 'en-US', '', 'English (US)', false);
INSERT INTO public.languages VALUES (3, 'fr', '', 'Français', false);
INSERT INTO public.languages VALUES (4, 'de', '', 'Deutsch', false);
INSERT INTO public.languages VALUES (5, 'es', '', 'Español', false);
INSERT INTO public.languages VALUES (6, 'fr-FR', 'fr-FR', 'fr-FR', false);
INSERT INTO public.languages VALUES (7, 'fi', 'fi', 'fi', false);
INSERT INTO public.languages VALUES (8, 'fr-CA', 'fr-CA', 'fr-CA', false);
INSERT INTO public.languages VALUES (9, 'ja', 'ja', 'ja', false);
INSERT INTO public.languages VALUES (10, 'ro', 'ro', 'ro', false);
INSERT INTO public.languages VALUES (11, 'el', 'el', 'el', false);
INSERT INTO public.languages VALUES (12, 'pt-BR', 'pt-BR', 'pt-BR', false);
INSERT INTO public.languages VALUES (13, 'sv-FI', 'sv-FI', 'sv-FI', false);


--
-- TOC entry 2578 (class 0 OID 1898179)
-- Dependencies: 198
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.notes VALUES (1, 5, '<p>This is a stupid Q</p>', true, 7, 5, '2019-05-03 13:31:06.668668', '2019-05-03 13:32:04.6049');


--
-- TOC entry 2580 (class 0 OID 1898192)
-- Dependencies: 200
-- Data for Name: notification_acknowledgements; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2582 (class 0 OID 1898202)
-- Dependencies: 202
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2584 (class 0 OID 1898213)
-- Dependencies: 204
-- Data for Name: org_identifiers; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2586 (class 0 OID 1898224)
-- Dependencies: 206
-- Data for Name: org_token_permissions; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2588 (class 0 OID 1898233)
-- Dependencies: 208
-- Data for Name: orgs; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.orgs VALUES (7, 'EurofleetsPlus', 'EF+', NULL, '2019-04-11 15:00:35.227437', '2019-04-11 15:08:53.559924', false, NULL, NULL, 1, NULL, NULL, 'tvandenberghe@naturalsciences.be', 7, '{"org":[{"link":"www.eurofleets.eu","text":"Eurofleets website"}]}', 'tvandenberghe@naturalsciences.be', false, NULL, NULL);
INSERT INTO public.orgs VALUES (8, 'Your Research Institute', 'YRI', NULL, '2019-04-11 15:05:09.952545', '2019-04-11 15:09:34.175685', false, NULL, NULL, 1, NULL, NULL, 'blurb@inst.ac.com', 5, '{"org":[]}', '', false, NULL, NULL);


--
-- TOC entry 2590 (class 0 OID 1898247)
-- Dependencies: 210
-- Data for Name: perms; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.perms VALUES (1, 'add_organisations', '2019-04-11 13:04:57.962827', '2019-04-11 13:04:57.962827');
INSERT INTO public.perms VALUES (2, 'change_org_affiliation', '2019-04-11 13:04:57.971448', '2019-04-11 13:04:57.971448');
INSERT INTO public.perms VALUES (3, 'grant_permissions', '2019-04-11 13:04:57.976814', '2019-04-11 13:04:57.976814');
INSERT INTO public.perms VALUES (4, 'modify_templates', '2019-04-11 13:04:57.981008', '2019-04-11 13:04:57.981008');
INSERT INTO public.perms VALUES (5, 'modify_guidance', '2019-04-11 13:04:57.984669', '2019-04-11 13:04:57.984669');
INSERT INTO public.perms VALUES (6, 'use_api', '2019-04-11 13:04:57.988093', '2019-04-11 13:04:57.988093');
INSERT INTO public.perms VALUES (7, 'change_org_details', '2019-04-11 13:04:57.991147', '2019-04-11 13:04:57.991147');
INSERT INTO public.perms VALUES (8, 'grant_api_to_orgs', '2019-04-11 13:04:57.994099', '2019-04-11 13:04:57.994099');


--
-- TOC entry 2592 (class 0 OID 1898258)
-- Dependencies: 212
-- Data for Name: phases; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.phases VALUES (7, 'Preparatory DMP', '', 1, 7, '2019-04-11 15:55:46.797324', '2019-04-11 15:56:37.033103', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (8, 'Preparatory DMP', '', 1, 8, '2019-04-18 09:29:04.362129', '2019-04-18 09:29:04.362129', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (9, 'Full DMP', '', 2, 8, '2019-04-18 10:26:53.090145', '2019-04-18 10:26:53.090145', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (10, 'Phase 1: Preparatory DMP', '', 1, 9, '2019-04-18 10:38:02.427409', '2019-04-18 10:38:42.026055', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (11, 'Phase 2: Full DMP', '', 2, 9, '2019-04-18 10:38:02.745651', '2019-04-18 10:38:53.330219', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (13, 'Phase 2: Full DMP', '', 3, 10, '2019-04-18 13:17:49.888968', '2019-04-18 13:52:25.192648', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (12, 'Phase 1: Preliminary DMP', '', 2, 10, '2019-04-18 13:17:49.578549', '2019-04-18 13:52:30.092486', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (14, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 10, '2019-04-18 13:48:01.196825', '2019-04-18 14:02:55.564715', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (15, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 11, '2019-05-03 10:09:15.361589', '2019-05-03 10:09:15.361589', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (16, 'Phase 1: Preliminary DMP', '', 2, 11, '2019-05-03 10:09:15.374984', '2019-05-03 10:09:15.374984', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (17, 'Phase 2: Full DMP', '<p class="western" lang="en-GB"><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">These questions should only be addressed for the final DMP, after your cruise has been granted. Please recover and extend the answers from the preliminary DMP.<br /></span></span></span></span></span></p>', 3, 11, '2019-05-03 10:09:15.603889', '2019-05-03 10:16:22.93842', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (19, 'Phase 1: Preliminary DMP', '', 2, 12, '2019-05-03 12:17:19.562359', '2019-05-03 12:17:19.562359', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (20, 'Phase 2: Full DMP', '<p class="western" lang="en-GB"><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">These questions should only be addressed for the final DMP, after your cruise has been granted. Please recover and extend the answers from the preliminary DMP.<br /></span></span></span></span></span></p>', 3, 12, '2019-05-03 12:17:19.872899', '2019-05-03 12:17:19.872899', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (18, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 12, '2019-05-03 12:17:19.553085', '2019-05-03 12:17:19.553085', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (21, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 13, '2019-05-03 12:21:05.17491', '2019-05-03 12:21:05.17491', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (22, 'Phase 1: Preliminary DMP', '', 2, 13, '2019-05-03 12:21:05.195698', '2019-05-03 12:21:05.195698', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (23, 'Phase 2: Full DMP', '<p class="western" lang="en-GB"><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">These questions should only be addressed for the final DMP, after your cruise has been granted. Please recover and extend the answers from the preliminary DMP.<br /></span></span></span></span></span></p>', 3, 13, '2019-05-03 12:21:05.460705', '2019-05-03 12:21:05.460705', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (24, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 14, '2019-05-03 13:33:23.72005', '2019-05-03 13:33:23.72005', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (25, 'Phase 1: Preliminary DMP', '', 2, 14, '2019-05-03 13:33:23.758291', '2019-05-03 13:33:23.758291', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (26, 'Phase 2: Full DMP', '<p class="western" lang="en-GB"><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">These questions should only be addressed for the final DMP, after your cruise has been granted. Please recover and extend the answers from the preliminary DMP.<br /></span></span></span></span></span></p>', 3, 14, '2019-05-03 13:33:24.032862', '2019-05-03 13:33:24.032862', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');
INSERT INTO public.phases VALUES (27, 'Guidance', '<p><strong>General guidelines</strong></p>
<p>The Horizon 2020 Programme asks that the research output of its beneficiaries adheres to the FAIR principle and furthermore, that open access to research data is ensured to a maximal extent. Open access refers to the practice of providing online access to scientific information (publications and research data) that is free of charge to the end-user and reusable. FAIR data is findable, accessible, interoperable and readable.</p>
<p>FAIR data may still be (partially) private, eg. when it is only shared under certain conditions. Open research data is freely available to anyone to access, use and share. Since 2017, open research data is the default option for H2020, while it is still possible to opt-out and select a more closed data model. For general H2020 projects, this may be because you want to protect your data before any publication has taken place, keep intellectual property rights for commercial purposes, or have privacy or security concerns. In summary, any EurofleetsPlus research data must be Findable, Accessible, Interoperable and Reusable for the group of users you as a research cruise principal investigator have defined; this may be anyone, with unrestricted access, in which case your data is considered open data.</p>
<p>Within open data there are gradations, going from fully open (public domain), to legally obliging attribution, to barring commercial re-use etc. A good overview of open licenses can be found on CreativeCommons, <a title="https://creativecommons.org/licenses" href="https://creativecommons.org/licenses">https://creativecommons.org/licenses</a>. A further benefit is that these licenses are ready-for-use, unambiguous (as they already have a legal description), and are machine readable.</p>
<p><strong>The default EurofleetsPlus license for cruise data is the public domain CC0-license, <a title="https://creativecommons.org/publicdomain/zero/1.0" href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a>, as re-using data should not be made unnecessarily complex.</strong></p>
<p><strong>The metadata of your dataset(s) must be made available as soon as possible after the cruise ends. For the data, a default embargo period of 3 months is granted; you may waive this default period and provide the data earlier. You may extend this period, which must be reported in the DMP. The data should be provided before the end of your specified embargo period and before the next cruise call or the end of the whole EurofleetsPlus project, whichever comes first.</strong></p>
<p>EurofleetsPlus applies the FAIR and Open principles of the H2020 framework on three levels: the EF+ project itself, the JRA research output and the TNA funded cruises. For this reason there will be two Data Management Plan (DMP) types in use: a general one for EurofleetsPlus, and one for each funded cruise, which must use the current document as a template. The DMP for cruises comes in two forms, a preliminary DMP at submission time and a final DMP after the cruise funding has been granted.</p>
<p>We have based ourselves on the Guidelines on FAIR Data Management in Horizon 2020 (<a title="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf" href="http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf">http://ec.europa.eu/research/participants/data/ref/h2020/grants_manual/hi/oa_pilot/h2020-hi-oa-data-mgt_en.pdf</a>) to define the template for the DMP. Some of the specifics, for instance those on the timing of any opt-out (see p. 3), make less sense in the EurofleetsPlus context, and are not applicable. Project data may be considered fully open from the start or the grantee may start out with open datasets, and later opt-out some datasets, for a good reason. The only way to opt-in a dataset is by having selected an embargo period (that must be specified at the time of writing the DMP).</p>
<p><strong>For EurofleetsPlus, opting out of open data is possible at the time the preliminary DMP is created or after the project has been granted, at the time the final DMP is submitted, but only for data with a distinct commercialibility, or by extending the embargo period.</strong></p>
<p>Project proposals will be judged on the completeness of the Data Management Plan and on what basis they enable their datasets to become FAIR. The DMP is a living document that follows the research lifecycle and should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your procedures. A data management plan prerecords the procedures you plan to follow with regards to data management, to ensure that they are actually followed.</p>
<p><strong>Crucial elements like embargoes, opting-out data and licensing must be included as soon as possible in the DMP for the different types of datasets.</strong></p>
<p><em>This document is a Data Management Plan in paper form, and contains a set of guidelines and the actual data management plan in textual form.</em> This document may be used to draft your Data Management Plan. However, as creating a data management plan is a dynamic process and as versioning is difficult to manage using word documents, we use an online DMP tool, called DMP Roadmap. This also facilitates managing a multitude of submissions.</p>
<p><strong>The Data Management Plan (both the preliminary and full DMP) of a cruise proposal MUST be created with DMP Roadmap on the website <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a> and kept up-to-date after funding.</strong><br /><br />A preliminary DMP is created at the time of the project proposal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage. After the proposal is granted, the Data Management Plan will have to be completed in full. For this, you need to answer additional questions and extend your existing answers to cover the issues more in-depth. Three reference data management centres, assigned to a funded project, will review your DMP and provide feedback at that stage. The Data Management partners are the Hellenic Centre for Marine Research (HCMR) in Greece, the Istituto Nazionale di Oceanografia e di Geofisica Sperimentale (OGS) in Italy and the Belgian Marine Data Centre (BMDC).</p>
<p>The EurofleetsPlus project will in due time provide the necessary infrastructure to make the data that is gathered during the funded cruises FAIR without any extra infrastructural work on your Institute''s part being necessary. The EurofleetsPlus infrastructure takes care of manual data (data originating from specific manual operations like sampling and deployments) and en-route data acquisition (salinity, temperature, depth etc. that are continuously measured). The Data Management Plan should detail the steps you will take to fill in the gaps in between the possibilities offered by the Eurofleets infrastructuren and how you will make use of them. The EurofleetsPlus infrastructure comprises:</p>
<ul style="list-style-type: circle;">
<li>An EurofleetsPlus data sets catalogue (hosted on the EVIOR portal) will be ready around the beginning of July, which should be used to make your datasets findable, upon provision of adequate metadata. This system also provides the possibility to upload your data (data accessibility) after the cruise.</li>
<li>However, this data is not yet ready for interoperability with existing datasets. The reference data centres will make your data available on European oceanographic data repositories (such as SeaDataCloud and EMODNet). This makes them interoperable with the other datasets there, ensuring your dataset''s reusablility.</li>
<li>En-route data from your cruise will be standardised by using the Eurofleets Automatic Reporting System (EARS), which also makes en-route data available on the EVIOR portal.</li>
</ul>
<p><strong>Steps</strong></p>
<ol>
<li>Follow the webinar on FAIR, DMPs and DMP Roadmap via <a title="http://www.eurofleets.eu" href="http://www.eurofleets.eu">http://www.eurofleets.eu</a></li>
<li>Prepare your proposal</li>
<li>Create an account on the EF+ DMP Roadmap (<a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a>) and complete the preliminary DMP</li>
<li>Submit your proposal on the official EurofleetsPlus submission website, together with a pdf of the DMP generated from DMP Roadmap</li>
<li>Await confirmation that you are awarded the project</li>
<li>Complete the final DMP on <a title="http://dmp.ef-ears.eu" href="http://dmp.ef-ears.eu">http://dmp.ef-ears.eu</a></li>
<li>Receive additional feedback from the reference data centres on improving the DMP</li>
<li>Participate in the cruise</li>
<li>Provide the metadata of the dataset(s) on the EurofleetsPlus data repository as soon as possible after the cruise</li>
<li>Upload the data to the metadata record within 3 months after the cruise, unless you have specified an embargo period</li>
</ol>', 1, 15, '2019-05-03 13:37:28.249283', '2019-05-03 13:37:28.249283', true, '5474e2ed-42b3-401c-ae63-d7a43173d072');
INSERT INTO public.phases VALUES (28, 'Phase 1: Preliminary DMP', '', 2, 15, '2019-05-03 13:37:28.284446', '2019-05-03 13:37:28.284446', true, 'a8e3661e-29bf-431f-b238-4234cd87b057');
INSERT INTO public.phases VALUES (29, 'Phase 2: Full DMP', '<p class="western" lang="en-GB"><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">These questions should only be addressed for the final DMP, after your cruise has been granted. Please recover and extend the answers from the preliminary DMP.<br /></span></span></span></span></span></p>', 3, 15, '2019-05-03 13:37:28.610496', '2019-05-03 13:37:28.610496', true, 'ed4cd2c7-e8a2-4af3-ac38-3877f2ab2ef3');


--
-- TOC entry 2594 (class 0 OID 1898271)
-- Dependencies: 214
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.plans VALUES (17, 'Thomas''s Plan', 10, '2019-05-03 10:56:58.179365', '2019-05-03 10:56:58.179365', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (18, 'Thomas''s Plan', 11, '2019-05-03 10:58:23.311293', '2019-05-03 10:58:23.311293', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (19, 'pLAN', 11, '2019-05-03 12:18:15.767452', '2019-05-03 12:18:15.767452', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (20, 'Thomas''s Plan', 12, '2019-05-03 12:19:26.258772', '2019-05-03 12:19:26.258772', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (22, 'EF cruise subarctic krill', 13, '2019-05-03 12:33:34.299439', '2019-05-03 13:31:35.664862', 'B-6546-2S/FF', '', 'This proposal tries to... and will... and then...', 'Thomas Vandenberghe', '', '', 'EurofleetsPlus', 3, '', '', 'tvandenberghe@naturalsciences.be', '', false, false);
INSERT INTO public.plans VALUES (23, 'Thomas''s Plan', 13, '2019-05-03 13:33:44.318121', '2019-05-03 13:33:44.318121', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (21, 'MyPlan', 13, '2019-05-03 12:22:14.635412', '2019-05-03 13:35:07.654377', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);
INSERT INTO public.plans VALUES (24, 'Latest test', 14, '2019-05-03 13:35:25.911585', '2019-05-03 13:35:50.300532', NULL, NULL, NULL, 'Thomas Vandenberghe', NULL, NULL, 'EurofleetsPlus', 3, NULL, NULL, 'tvandenberghe@naturalsciences.be', NULL, false, false);


--
-- TOC entry 2596 (class 0 OID 1898286)
-- Dependencies: 216
-- Data for Name: plans_guidance_groups; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2598 (class 0 OID 1898295)
-- Dependencies: 218
-- Data for Name: prefs; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2600 (class 0 OID 1898306)
-- Dependencies: 220
-- Data for Name: question_formats; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.question_formats VALUES (1, 'Text area', 'http://test.host', '2019-04-11 13:04:57.759594', '2019-04-11 13:04:57.759594', false, 0);
INSERT INTO public.question_formats VALUES (2, 'Text field', 'http://test.host', '2019-04-11 13:04:57.766077', '2019-04-11 13:04:57.766077', false, 1);
INSERT INTO public.question_formats VALUES (3, 'Radio buttons', 'http://test.host', '2019-04-11 13:04:57.772622', '2019-04-11 13:04:57.772622', true, 2);
INSERT INTO public.question_formats VALUES (4, 'Check box', 'http://test.host', '2019-04-11 13:04:57.779437', '2019-04-11 13:04:57.779437', true, 3);
INSERT INTO public.question_formats VALUES (5, 'Dropdown', 'http://test.host', '2019-04-11 13:04:57.785811', '2019-04-11 13:04:57.785811', true, 4);
INSERT INTO public.question_formats VALUES (6, 'Multi select box', 'http://test.host', '2019-04-11 13:04:57.79209', '2019-04-11 13:04:57.79209', true, 5);
INSERT INTO public.question_formats VALUES (7, 'Date', 'http://test.host', '2019-04-11 13:04:57.7981', '2019-04-11 13:04:57.7981', false, 6);


--
-- TOC entry 2602 (class 0 OID 1898319)
-- Dependencies: 222
-- Data for Name: question_options; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2604 (class 0 OID 1898331)
-- Dependencies: 224
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.questions VALUES (29, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 18, '2019-04-11 15:57:21.434669', '2019-04-11 15:57:21.434669', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (30, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be the principal users of the data? </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></p>', '', 2, 18, '2019-04-11 16:00:42.529639', '2019-04-11 16:00:42.529639', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (31, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 19, '2019-04-18 09:29:04.374205', '2019-04-18 09:29:04.374205', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (32, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 19, '2019-04-18 09:29:04.384106', '2019-04-18 09:29:04.384106', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (33, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 19, '2019-04-18 09:29:26.098602', '2019-04-18 09:29:26.098602', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (34, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 19, '2019-04-18 09:29:41.14206', '2019-04-18 09:29:41.14206', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (35, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 20, '2019-04-18 09:32:12.419744', '2019-04-18 09:32:12.419744', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (36, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to create the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 20, '2019-04-18 09:33:04.639339', '2019-04-18 09:33:04.639339', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (37, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 21, '2019-04-18 09:33:46.153314', '2019-04-18 09:33:46.153314', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (38, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positive to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 21, '2019-04-18 09:34:22.243828', '2019-04-18 09:34:22.243828', 1, true, NULL, '81c81ed7-d0bb-4a25-8cba-a3dfcf2597ea');
INSERT INTO public.questions VALUES (39, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How many months after the cruise will you provide the data?</span></span></span></p>', '', 3, 21, '2019-04-18 09:34:36.60034', '2019-04-18 09:34:36.60034', 1, true, NULL, '243484bf-751d-411b-9b7c-81990c96e0d8');
INSERT INTO public.questions VALUES (40, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the Eurofleets data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 4, 21, '2019-04-18 09:34:45.080973', '2019-04-18 09:34:45.080973', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (41, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 22, '2019-04-18 09:39:55.522946', '2019-04-18 09:39:55.522946', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (42, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 23, '2019-04-18 10:06:25.248098', '2019-04-18 10:06:25.248098', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (57, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 32, '2019-04-18 10:38:02.646527', '2019-04-18 10:38:02.646527', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (43, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 23, '2019-04-18 10:10:22.467218', '2019-04-18 10:10:22.467218', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (44, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 25, '2019-04-18 10:12:31.131928', '2019-04-18 10:12:31.131928', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (45, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 27, '2019-04-18 10:13:28.673218', '2019-04-18 10:13:28.673218', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (46, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 28, '2019-04-18 10:38:02.440961', '2019-04-18 10:38:02.440961', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (47, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 28, '2019-04-18 10:38:02.451517', '2019-04-18 10:38:02.451517', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (48, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 28, '2019-04-18 10:38:02.460547', '2019-04-18 10:38:02.460547', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (49, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 28, '2019-04-18 10:38:02.470957', '2019-04-18 10:38:02.470957', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (50, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 29, '2019-04-18 10:38:02.494059', '2019-04-18 10:38:02.494059', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (51, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to create the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 29, '2019-04-18 10:38:02.508429', '2019-04-18 10:38:02.508429', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (52, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 30, '2019-04-18 10:38:02.537781', '2019-04-18 10:38:02.537781', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (53, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positive to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 30, '2019-04-18 10:38:02.567888', '2019-04-18 10:38:02.567888', 1, true, NULL, '81c81ed7-d0bb-4a25-8cba-a3dfcf2597ea');
INSERT INTO public.questions VALUES (56, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 31, '2019-04-18 10:38:02.621171', '2019-04-18 10:38:02.621171', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (55, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the Eurofleets data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 30, '2019-04-18 10:38:02.59872', '2019-04-18 10:39:34.010797', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (58, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 32, '2019-04-18 10:38:02.668645', '2019-04-18 10:38:02.668645', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (59, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 34, '2019-04-18 10:38:02.701662', '2019-04-18 10:38:02.701662', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (60, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 36, '2019-04-18 10:38:02.728925', '2019-04-18 10:38:02.728925', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (61, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 37, '2019-04-18 13:17:49.592795', '2019-04-18 13:17:49.592795', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (62, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to create the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 37, '2019-04-18 13:17:49.609891', '2019-04-18 13:17:49.609891', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (63, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 38, '2019-04-18 13:17:49.652882', '2019-04-18 13:17:49.652882', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (64, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positive to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 38, '2019-04-18 13:17:49.66443', '2019-04-18 13:17:49.66443', 1, true, NULL, '81c81ed7-d0bb-4a25-8cba-a3dfcf2597ea');
INSERT INTO public.questions VALUES (65, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the Eurofleets data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 38, '2019-04-18 13:17:49.677081', '2019-04-18 13:17:49.677081', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (66, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 39, '2019-04-18 13:17:49.697922', '2019-04-18 13:17:49.697922', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (67, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 40, '2019-04-18 13:17:49.726282', '2019-04-18 13:17:49.726282', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (68, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 40, '2019-04-18 13:17:49.755177', '2019-04-18 13:17:49.755177', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (69, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 43, '2019-04-18 13:17:49.794518', '2019-04-18 13:17:49.794518', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (70, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 44, '2019-04-18 13:17:49.82294', '2019-04-18 13:17:49.82294', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (71, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 44, '2019-04-18 13:17:49.835214', '2019-04-18 13:17:49.835214', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (72, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 44, '2019-04-18 13:17:49.844673', '2019-04-18 13:17:49.844673', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (73, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 44, '2019-04-18 13:17:49.855354', '2019-04-18 13:17:49.855354', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (74, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 45, '2019-04-18 13:17:49.873424', '2019-04-18 13:17:49.873424', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (75, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 46, '2019-05-03 10:09:15.387762', '2019-05-03 10:09:15.387762', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (77, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 47, '2019-05-03 10:09:15.422271', '2019-05-03 10:09:15.422271', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (80, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 48, '2019-05-03 10:09:15.458104', '2019-05-03 10:09:15.458104', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (81, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 49, '2019-05-03 10:09:15.477307', '2019-05-03 10:09:15.477307', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (82, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 49, '2019-05-03 10:09:15.494304', '2019-05-03 10:09:15.494304', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (83, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 52, '2019-05-03 10:09:15.523511', '2019-05-03 10:09:15.523511', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (84, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 53, '2019-05-03 10:09:15.540448', '2019-05-03 10:09:15.540448', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (85, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 53, '2019-05-03 10:09:15.551008', '2019-05-03 10:09:15.551008', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (86, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 53, '2019-05-03 10:09:15.560953', '2019-05-03 10:09:15.560953', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (87, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 53, '2019-05-03 10:09:15.57149', '2019-05-03 10:09:15.57149', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (88, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 54, '2019-05-03 10:09:15.589278', '2019-05-03 10:09:15.589278', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (76, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to adapt the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 46, '2019-05-03 10:09:15.398553', '2019-05-03 10:09:15.398553', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (79, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EuroFleets/SeaDataNet </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 47, '2019-05-03 10:09:15.440511', '2019-05-03 10:11:43.331818', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (89, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 56, '2019-05-03 10:16:49.983253', '2019-05-03 10:17:01.368447', 1, true, NULL, '0cec5c71-8e32-4940-87dc-3afed0d6778f');
INSERT INTO public.questions VALUES (90, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect </span></span></span></p>', '', 2, 56, '2019-05-03 10:17:16.96821', '2019-05-03 10:17:16.96821', 1, true, NULL, '78e199c1-1893-497c-b4a1-65d4f247e9a7');
INSERT INTO public.questions VALUES (91, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 56, '2019-05-03 10:17:31.141963', '2019-05-03 10:17:31.141963', 1, true, NULL, 'af0d3d86-28e6-4806-990d-8854032609ec');
INSERT INTO public.questions VALUES (92, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 56, '2019-05-03 10:17:44.597625', '2019-05-03 10:17:44.597625', 1, true, NULL, 'a8a80ed4-2684-4a53-ac0b-1b58b8ea0141');
INSERT INTO public.questions VALUES (93, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">What is the expected size (Megabyte to Terabyte range) of the data? </span></span></span></span></p>', '', 5, 56, '2019-05-03 10:17:59.552138', '2019-05-03 10:17:59.552138', 1, true, NULL, '344ffa73-e7cc-4eb8-942d-6c45a5edb91d');
INSERT INTO public.questions VALUES (94, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Who will be the principal users of the data? Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></span></p>', '', 6, 56, '2019-05-03 10:18:11.12795', '2019-05-03 10:18:11.12795', 1, true, NULL, '6a4bf93d-6e48-490f-96e4-17a5d4096d2f');
INSERT INTO public.questions VALUES (95, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What naming conventions for your data files will you follow? </span></span></span></p>', '', 1, 57, '2019-05-03 10:19:40.004814', '2019-05-03 10:19:40.004814', 1, true, NULL, 'b9ac412d-dad4-4cbb-8e30-fa6b9e8115dd');
INSERT INTO public.questions VALUES (96, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 2, 57, '2019-05-03 10:19:52.246287', '2019-05-03 10:19:52.246287', 1, true, NULL, '488c18b9-4f67-4b88-b3e8-bc0d05922add');
INSERT INTO public.questions VALUES (97, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you foresee a need for different versions of the data? Both for your own internal use and when publishing the data? E.g. for some analyses the data might need reorganisation from a common ancestor. Which versioning scheme do you have in mind?</span></span></span></p>', '', 3, 57, '2019-05-03 10:20:04.14238', '2019-05-03 10:20:04.14238', 1, true, NULL, 'd60057f2-9f61-461b-ba33-7117bd607694');
INSERT INTO public.questions VALUES (112, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How long is it intended that the data remains re-usable?</span></span></span></p>', '', 4, 60, '2019-05-03 10:32:34.232591', '2019-05-03 10:32:34.232591', 1, true, NULL, '04cd7b66-439e-4119-8e38-f5a9311f3cb7');
INSERT INTO public.questions VALUES (98, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">adapt</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 4, 57, '2019-05-03 10:20:35.877376', '2019-05-03 10:20:35.877376', 1, true, NULL, 'cbcdae3c-ab2a-4f1b-99ae-4c8c4e0cb0f8');
INSERT INTO public.questions VALUES (99, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 58, '2019-05-03 10:24:12.565127', '2019-05-03 10:24:12.565127', 1, true, NULL, '9503897c-b0c1-4e36-a845-4eb229387f82');
INSERT INTO public.questions VALUES (100, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positively to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 58, '2019-05-03 10:24:29.510399', '2019-05-03 10:24:29.510399', 1, true, NULL, '420c199c-88ae-4bca-a3b2-f5570963a7b9');
INSERT INTO public.questions VALUES (101, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the EuroFleets/SeaDataNet data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 58, '2019-05-03 10:24:40.012713', '2019-05-03 10:24:40.012713', 1, true, NULL, 'bd7ce45c-66e7-40ea-9aa6-bb248fbd9f16');
INSERT INTO public.questions VALUES (102, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What methods or software tools are needed to access the data? </span></span></span></p>', '', 4, 58, '2019-05-03 10:24:57.774176', '2019-05-03 10:24:57.774176', 1, true, NULL, 'dc0b191a-baee-4127-95fa-3e3b6f16bb51');
INSERT INTO public.questions VALUES (103, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is documentation about the software needed to access the data included?</span></span></span></p>', '', 5, 58, '2019-05-03 10:25:07.423658', '2019-05-03 10:25:07.423658', 1, true, NULL, 'f6217eb3-2b53-4ef1-bce6-2bf7833544ca');
INSERT INTO public.questions VALUES (104, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is it possible to include the relevant software (e.g. in open source code)?</span></span></span></p>', '', 6, 58, '2019-05-03 10:25:24.734055', '2019-05-03 10:25:24.734055', 1, true, NULL, '80131cc4-cb82-4f10-8a62-bf61f6b9ce65');
INSERT INTO public.questions VALUES (105, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Where will the documentation and code be deposited? Preference should be given to certified repositories which support open access where possible.</span></span></span></p>', '', 7, 58, '2019-05-03 10:25:45.341339', '2019-05-03 10:25:45.341339', 1, true, NULL, '1e724f4b-0adf-4d27-9604-6c2313ce7ee3');
INSERT INTO public.questions VALUES (106, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 59, '2019-05-03 10:27:52.465151', '2019-05-03 10:27:52.465151', 1, true, NULL, '7b19686d-121e-4222-9d48-38fc45c16984');
INSERT INTO public.questions VALUES (107, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Notwithstanding the work the reference data centres will perform, do you plan to already make use of standardized definitions (stored in vocabularies) to store the above meta-information?</span></span></span></p>', '', 2, 59, '2019-05-03 10:28:03.120372', '2019-05-03 10:28:03.120372', 1, true, NULL, '956bb601-9eee-468c-82a4-e3046824aca4');
INSERT INTO public.questions VALUES (108, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">In case it is unavoidable that you use uncommon or generate novel or project specific scientific terminology, do you plan to provide mappings to more commonly used terminology? How will you cope with information loss? How will you embed this information in the above meta-information and make sure they are seen as novel?</span></span></span></p>', '', 3, 59, '2019-05-03 10:28:31.606881', '2019-05-03 10:28:31.606881', 1, true, NULL, '71cf5475-1616-4f17-92e0-3b34f97da9cc');
INSERT INTO public.questions VALUES (109, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 60, '2019-05-03 10:31:43.011065', '2019-05-03 10:31:43.011065', 1, true, NULL, '62d165eb-0533-4e54-8b2d-e6fd32c662e5');
INSERT INTO public.questions VALUES (110, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 60, '2019-05-03 10:32:11.316708', '2019-05-03 10:32:11.316708', 1, true, NULL, 'c880f837-5b2f-480e-bf56-5d7b7f22d237');
INSERT INTO public.questions VALUES (111, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are the data produced and/or used in the project usable by third parties, in particular after the end of the project? If the re-use of some data is restricted, explain why.</span></span></span></p>', '', 3, 60, '2019-05-03 10:32:22.336495', '2019-05-03 10:32:22.336495', 1, true, NULL, '2a5b258d-4984-40fc-b659-53dee5be4992');
INSERT INTO public.questions VALUES (113, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">During the dataset lifecycle, do you plan to note down the data harmonisation, data quality assurance and data curation processes to ensure they are correctly described in the metadata?</span></span></span></p>', '', 5, 60, '2019-05-03 10:32:46.061215', '2019-05-03 10:32:46.061215', 1, true, NULL, 'df1ee059-dd5a-4bf8-aa78-b16326981a3a');
INSERT INTO public.questions VALUES (114, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be responsible for data management in your project? </span></span></span></p>', '', 1, 61, '2019-05-03 10:33:08.139835', '2019-05-03 10:33:08.139835', 1, true, NULL, '7c520f43-0cf4-47fa-85ac-6175adbf646d');
INSERT INTO public.questions VALUES (115, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', '', 1, 62, '2019-05-03 10:33:29.417258', '2019-05-03 10:33:29.417258', 1, true, NULL, '6fce8c64-c504-4d4c-b524-e9c1314cc980');
INSERT INTO public.questions VALUES (116, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are there any ethical or legal issues that can have an impact on data sharing?</span></span></span></p>', '', 1, 63, '2019-05-03 10:34:16.327934', '2019-05-03 10:34:16.327934', 1, true, NULL, '3260758f-1656-4a84-9dd0-b88a3c2e873d');
INSERT INTO public.questions VALUES (117, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 64, '2019-05-03 10:34:53.799901', '2019-05-03 10:34:53.799901', 1, true, NULL, '751112db-dd4d-4e07-9bae-365db86a54f9');
INSERT INTO public.questions VALUES (118, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 66, '2019-05-03 12:17:19.575374', '2019-05-03 12:17:19.575374', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (119, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to adapt the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 66, '2019-05-03 12:17:19.588482', '2019-05-03 12:17:19.588482', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (120, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 67, '2019-05-03 12:17:19.615565', '2019-05-03 12:17:19.615565', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (121, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EuroFleets/SeaDataNet </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 67, '2019-05-03 12:17:19.627542', '2019-05-03 12:17:19.627542', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (122, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 68, '2019-05-03 12:17:19.645741', '2019-05-03 12:17:19.645741', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (123, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 68, '2019-05-03 12:17:19.673281', '2019-05-03 12:17:19.673281', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (124, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 71, '2019-05-03 12:17:19.70541', '2019-05-03 12:17:19.70541', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (125, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 72, '2019-05-03 12:17:19.723347', '2019-05-03 12:17:19.723347', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (126, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 72, '2019-05-03 12:17:19.734016', '2019-05-03 12:17:19.734016', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (127, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 72, '2019-05-03 12:17:19.75786', '2019-05-03 12:17:19.75786', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (128, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 72, '2019-05-03 12:17:19.779865', '2019-05-03 12:17:19.779865', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (129, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 73, '2019-05-03 12:17:19.7981', '2019-05-03 12:17:19.7981', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (130, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 75, '2019-05-03 12:17:19.833896', '2019-05-03 12:17:19.833896', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (131, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 76, '2019-05-03 12:17:19.88679', '2019-05-03 12:17:19.88679', 1, true, NULL, '0cec5c71-8e32-4940-87dc-3afed0d6778f');
INSERT INTO public.questions VALUES (132, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect </span></span></span></p>', '', 2, 76, '2019-05-03 12:17:19.897706', '2019-05-03 12:17:19.897706', 1, true, NULL, '78e199c1-1893-497c-b4a1-65d4f247e9a7');
INSERT INTO public.questions VALUES (133, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 76, '2019-05-03 12:17:19.907408', '2019-05-03 12:17:19.907408', 1, true, NULL, 'af0d3d86-28e6-4806-990d-8854032609ec');
INSERT INTO public.questions VALUES (134, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 76, '2019-05-03 12:17:19.917361', '2019-05-03 12:17:19.917361', 1, true, NULL, 'a8a80ed4-2684-4a53-ac0b-1b58b8ea0141');
INSERT INTO public.questions VALUES (135, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">What is the expected size (Megabyte to Terabyte range) of the data? </span></span></span></span></p>', '', 5, 76, '2019-05-03 12:17:19.927185', '2019-05-03 12:17:19.927185', 1, true, NULL, '344ffa73-e7cc-4eb8-942d-6c45a5edb91d');
INSERT INTO public.questions VALUES (136, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Who will be the principal users of the data? Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></span></p>', '', 6, 76, '2019-05-03 12:17:19.935891', '2019-05-03 12:17:19.935891', 1, true, NULL, '6a4bf93d-6e48-490f-96e4-17a5d4096d2f');
INSERT INTO public.questions VALUES (137, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What naming conventions for your data files will you follow? </span></span></span></p>', '', 1, 77, '2019-05-03 12:17:19.95255', '2019-05-03 12:17:19.95255', 1, true, NULL, 'b9ac412d-dad4-4cbb-8e30-fa6b9e8115dd');
INSERT INTO public.questions VALUES (138, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 2, 77, '2019-05-03 12:17:19.962216', '2019-05-03 12:17:19.962216', 1, true, NULL, '488c18b9-4f67-4b88-b3e8-bc0d05922add');
INSERT INTO public.questions VALUES (139, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you foresee a need for different versions of the data? Both for your own internal use and when publishing the data? E.g. for some analyses the data might need reorganisation from a common ancestor. Which versioning scheme do you have in mind?</span></span></span></p>', '', 3, 77, '2019-05-03 12:17:19.971418', '2019-05-03 12:17:19.971418', 1, true, NULL, 'd60057f2-9f61-461b-ba33-7117bd607694');
INSERT INTO public.questions VALUES (140, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">adapt</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 4, 77, '2019-05-03 12:17:19.980378', '2019-05-03 12:17:19.980378', 1, true, NULL, 'cbcdae3c-ab2a-4f1b-99ae-4c8c4e0cb0f8');
INSERT INTO public.questions VALUES (141, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 78, '2019-05-03 12:17:20.00217', '2019-05-03 12:17:20.00217', 1, true, NULL, '9503897c-b0c1-4e36-a845-4eb229387f82');
INSERT INTO public.questions VALUES (142, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positively to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 78, '2019-05-03 12:17:20.011259', '2019-05-03 12:17:20.011259', 1, true, NULL, '420c199c-88ae-4bca-a3b2-f5570963a7b9');
INSERT INTO public.questions VALUES (143, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the EuroFleets/SeaDataNet data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 78, '2019-05-03 12:17:20.019898', '2019-05-03 12:17:20.019898', 1, true, NULL, 'bd7ce45c-66e7-40ea-9aa6-bb248fbd9f16');
INSERT INTO public.questions VALUES (144, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What methods or software tools are needed to access the data? </span></span></span></p>', '', 4, 78, '2019-05-03 12:17:20.029156', '2019-05-03 12:17:20.029156', 1, true, NULL, 'dc0b191a-baee-4127-95fa-3e3b6f16bb51');
INSERT INTO public.questions VALUES (145, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is documentation about the software needed to access the data included?</span></span></span></p>', '', 5, 78, '2019-05-03 12:17:20.038947', '2019-05-03 12:17:20.038947', 1, true, NULL, 'f6217eb3-2b53-4ef1-bce6-2bf7833544ca');
INSERT INTO public.questions VALUES (146, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is it possible to include the relevant software (e.g. in open source code)?</span></span></span></p>', '', 6, 78, '2019-05-03 12:17:20.05524', '2019-05-03 12:17:20.05524', 1, true, NULL, '80131cc4-cb82-4f10-8a62-bf61f6b9ce65');
INSERT INTO public.questions VALUES (147, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Where will the documentation and code be deposited? Preference should be given to certified repositories which support open access where possible.</span></span></span></p>', '', 7, 78, '2019-05-03 12:17:20.07115', '2019-05-03 12:17:20.07115', 1, true, NULL, '1e724f4b-0adf-4d27-9604-6c2313ce7ee3');
INSERT INTO public.questions VALUES (148, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 79, '2019-05-03 12:17:20.095948', '2019-05-03 12:17:20.095948', 1, true, NULL, '7b19686d-121e-4222-9d48-38fc45c16984');
INSERT INTO public.questions VALUES (149, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Notwithstanding the work the reference data centres will perform, do you plan to already make use of standardized definitions (stored in vocabularies) to store the above meta-information?</span></span></span></p>', '', 2, 79, '2019-05-03 12:17:20.106135', '2019-05-03 12:17:20.106135', 1, true, NULL, '956bb601-9eee-468c-82a4-e3046824aca4');
INSERT INTO public.questions VALUES (150, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">In case it is unavoidable that you use uncommon or generate novel or project specific scientific terminology, do you plan to provide mappings to more commonly used terminology? How will you cope with information loss? How will you embed this information in the above meta-information and make sure they are seen as novel?</span></span></span></p>', '', 3, 79, '2019-05-03 12:17:20.116432', '2019-05-03 12:17:20.116432', 1, true, NULL, '71cf5475-1616-4f17-92e0-3b34f97da9cc');
INSERT INTO public.questions VALUES (151, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 80, '2019-05-03 12:17:20.134739', '2019-05-03 12:17:20.134739', 1, true, NULL, '62d165eb-0533-4e54-8b2d-e6fd32c662e5');
INSERT INTO public.questions VALUES (152, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 80, '2019-05-03 12:17:20.151989', '2019-05-03 12:17:20.151989', 1, true, NULL, 'c880f837-5b2f-480e-bf56-5d7b7f22d237');
INSERT INTO public.questions VALUES (153, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are the data produced and/or used in the project usable by third parties, in particular after the end of the project? If the re-use of some data is restricted, explain why.</span></span></span></p>', '', 3, 80, '2019-05-03 12:17:20.161861', '2019-05-03 12:17:20.161861', 1, true, NULL, '2a5b258d-4984-40fc-b659-53dee5be4992');
INSERT INTO public.questions VALUES (154, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How long is it intended that the data remains re-usable?</span></span></span></p>', '', 4, 80, '2019-05-03 12:17:20.171247', '2019-05-03 12:17:20.171247', 1, true, NULL, '04cd7b66-439e-4119-8e38-f5a9311f3cb7');
INSERT INTO public.questions VALUES (155, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">During the dataset lifecycle, do you plan to note down the data harmonisation, data quality assurance and data curation processes to ensure they are correctly described in the metadata?</span></span></span></p>', '', 5, 80, '2019-05-03 12:17:20.180331', '2019-05-03 12:17:20.180331', 1, true, NULL, 'df1ee059-dd5a-4bf8-aa78-b16326981a3a');
INSERT INTO public.questions VALUES (156, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be responsible for data management in your project? </span></span></span></p>', '', 1, 81, '2019-05-03 12:17:20.198324', '2019-05-03 12:17:20.198324', 1, true, NULL, '7c520f43-0cf4-47fa-85ac-6175adbf646d');
INSERT INTO public.questions VALUES (157, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', '', 1, 82, '2019-05-03 12:17:20.215513', '2019-05-03 12:17:20.215513', 1, true, NULL, '6fce8c64-c504-4d4c-b524-e9c1314cc980');
INSERT INTO public.questions VALUES (158, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are there any ethical or legal issues that can have an impact on data sharing?</span></span></span></p>', '', 1, 83, '2019-05-03 12:17:20.242851', '2019-05-03 12:17:20.242851', 1, true, NULL, '3260758f-1656-4a84-9dd0-b88a3c2e873d');
INSERT INTO public.questions VALUES (159, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 84, '2019-05-03 12:17:20.260417', '2019-05-03 12:17:20.260417', 1, true, NULL, '751112db-dd4d-4e07-9bae-365db86a54f9');
INSERT INTO public.questions VALUES (160, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 86, '2019-05-03 12:21:05.21317', '2019-05-03 12:21:05.21317', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (161, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to adapt the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 86, '2019-05-03 12:21:05.227127', '2019-05-03 12:21:05.227127', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (162, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 87, '2019-05-03 12:21:05.254422', '2019-05-03 12:21:05.254422', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (163, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EuroFleets/SeaDataNet </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 87, '2019-05-03 12:21:05.266391', '2019-05-03 12:21:05.266391', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (164, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 88, '2019-05-03 12:21:05.288719', '2019-05-03 12:21:05.288719', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (165, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 88, '2019-05-03 12:21:05.307217', '2019-05-03 12:21:05.307217', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (166, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 91, '2019-05-03 12:21:05.33851', '2019-05-03 12:21:05.33851', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (167, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 92, '2019-05-03 12:21:05.364731', '2019-05-03 12:21:05.364731', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (168, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 92, '2019-05-03 12:21:05.375474', '2019-05-03 12:21:05.375474', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (169, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 92, '2019-05-03 12:21:05.386101', '2019-05-03 12:21:05.386101', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (170, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 92, '2019-05-03 12:21:05.396347', '2019-05-03 12:21:05.396347', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (171, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 93, '2019-05-03 12:21:05.415899', '2019-05-03 12:21:05.415899', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (172, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 95, '2019-05-03 12:21:05.443903', '2019-05-03 12:21:05.443903', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (173, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 96, '2019-05-03 12:21:05.479238', '2019-05-03 12:21:05.479238', 1, true, NULL, '0cec5c71-8e32-4940-87dc-3afed0d6778f');
INSERT INTO public.questions VALUES (174, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect </span></span></span></p>', '', 2, 96, '2019-05-03 12:21:05.49428', '2019-05-03 12:21:05.49428', 1, true, NULL, '78e199c1-1893-497c-b4a1-65d4f247e9a7');
INSERT INTO public.questions VALUES (175, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 96, '2019-05-03 12:21:05.506193', '2019-05-03 12:21:05.506193', 1, true, NULL, 'af0d3d86-28e6-4806-990d-8854032609ec');
INSERT INTO public.questions VALUES (176, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 96, '2019-05-03 12:21:05.517958', '2019-05-03 12:21:05.517958', 1, true, NULL, 'a8a80ed4-2684-4a53-ac0b-1b58b8ea0141');
INSERT INTO public.questions VALUES (177, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">What is the expected size (Megabyte to Terabyte range) of the data? </span></span></span></span></p>', '', 5, 96, '2019-05-03 12:21:05.530087', '2019-05-03 12:21:05.530087', 1, true, NULL, '344ffa73-e7cc-4eb8-942d-6c45a5edb91d');
INSERT INTO public.questions VALUES (178, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Who will be the principal users of the data? Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></span></p>', '', 6, 96, '2019-05-03 12:21:05.541004', '2019-05-03 12:21:05.541004', 1, true, NULL, '6a4bf93d-6e48-490f-96e4-17a5d4096d2f');
INSERT INTO public.questions VALUES (179, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What naming conventions for your data files will you follow? </span></span></span></p>', '', 1, 97, '2019-05-03 12:21:05.560024', '2019-05-03 12:21:05.560024', 1, true, NULL, 'b9ac412d-dad4-4cbb-8e30-fa6b9e8115dd');
INSERT INTO public.questions VALUES (180, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 2, 97, '2019-05-03 12:21:05.570463', '2019-05-03 12:21:05.570463', 1, true, NULL, '488c18b9-4f67-4b88-b3e8-bc0d05922add');
INSERT INTO public.questions VALUES (181, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you foresee a need for different versions of the data? Both for your own internal use and when publishing the data? E.g. for some analyses the data might need reorganisation from a common ancestor. Which versioning scheme do you have in mind?</span></span></span></p>', '', 3, 97, '2019-05-03 12:21:05.582611', '2019-05-03 12:21:05.582611', 1, true, NULL, 'd60057f2-9f61-461b-ba33-7117bd607694');
INSERT INTO public.questions VALUES (182, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">adapt</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 4, 97, '2019-05-03 12:21:05.593871', '2019-05-03 12:21:05.593871', 1, true, NULL, 'cbcdae3c-ab2a-4f1b-99ae-4c8c4e0cb0f8');
INSERT INTO public.questions VALUES (183, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 98, '2019-05-03 12:21:05.618517', '2019-05-03 12:21:05.618517', 1, true, NULL, '9503897c-b0c1-4e36-a845-4eb229387f82');
INSERT INTO public.questions VALUES (184, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positively to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 98, '2019-05-03 12:21:05.635918', '2019-05-03 12:21:05.635918', 1, true, NULL, '420c199c-88ae-4bca-a3b2-f5570963a7b9');
INSERT INTO public.questions VALUES (185, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the EuroFleets/SeaDataNet data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 98, '2019-05-03 12:21:05.649575', '2019-05-03 12:21:05.649575', 1, true, NULL, 'bd7ce45c-66e7-40ea-9aa6-bb248fbd9f16');
INSERT INTO public.questions VALUES (186, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What methods or software tools are needed to access the data? </span></span></span></p>', '', 4, 98, '2019-05-03 12:21:05.661291', '2019-05-03 12:21:05.661291', 1, true, NULL, 'dc0b191a-baee-4127-95fa-3e3b6f16bb51');
INSERT INTO public.questions VALUES (187, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is documentation about the software needed to access the data included?</span></span></span></p>', '', 5, 98, '2019-05-03 12:21:05.671321', '2019-05-03 12:21:05.671321', 1, true, NULL, 'f6217eb3-2b53-4ef1-bce6-2bf7833544ca');
INSERT INTO public.questions VALUES (188, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is it possible to include the relevant software (e.g. in open source code)?</span></span></span></p>', '', 6, 98, '2019-05-03 12:21:05.681908', '2019-05-03 12:21:05.681908', 1, true, NULL, '80131cc4-cb82-4f10-8a62-bf61f6b9ce65');
INSERT INTO public.questions VALUES (189, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Where will the documentation and code be deposited? Preference should be given to certified repositories which support open access where possible.</span></span></span></p>', '', 7, 98, '2019-05-03 12:21:05.692598', '2019-05-03 12:21:05.692598', 1, true, NULL, '1e724f4b-0adf-4d27-9604-6c2313ce7ee3');
INSERT INTO public.questions VALUES (190, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 99, '2019-05-03 12:21:05.71125', '2019-05-03 12:21:05.71125', 1, true, NULL, '7b19686d-121e-4222-9d48-38fc45c16984');
INSERT INTO public.questions VALUES (191, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Notwithstanding the work the reference data centres will perform, do you plan to already make use of standardized definitions (stored in vocabularies) to store the above meta-information?</span></span></span></p>', '', 2, 99, '2019-05-03 12:21:05.721983', '2019-05-03 12:21:05.721983', 1, true, NULL, '956bb601-9eee-468c-82a4-e3046824aca4');
INSERT INTO public.questions VALUES (192, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">In case it is unavoidable that you use uncommon or generate novel or project specific scientific terminology, do you plan to provide mappings to more commonly used terminology? How will you cope with information loss? How will you embed this information in the above meta-information and make sure they are seen as novel?</span></span></span></p>', '', 3, 99, '2019-05-03 12:21:05.732687', '2019-05-03 12:21:05.732687', 1, true, NULL, '71cf5475-1616-4f17-92e0-3b34f97da9cc');
INSERT INTO public.questions VALUES (193, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 100, '2019-05-03 12:21:05.750787', '2019-05-03 12:21:05.750787', 1, true, NULL, '62d165eb-0533-4e54-8b2d-e6fd32c662e5');
INSERT INTO public.questions VALUES (194, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 100, '2019-05-03 12:21:05.76646', '2019-05-03 12:21:05.76646', 1, true, NULL, 'c880f837-5b2f-480e-bf56-5d7b7f22d237');
INSERT INTO public.questions VALUES (195, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are the data produced and/or used in the project usable by third parties, in particular after the end of the project? If the re-use of some data is restricted, explain why.</span></span></span></p>', '', 3, 100, '2019-05-03 12:21:05.777682', '2019-05-03 12:21:05.777682', 1, true, NULL, '2a5b258d-4984-40fc-b659-53dee5be4992');
INSERT INTO public.questions VALUES (196, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How long is it intended that the data remains re-usable?</span></span></span></p>', '', 4, 100, '2019-05-03 12:21:05.788917', '2019-05-03 12:21:05.788917', 1, true, NULL, '04cd7b66-439e-4119-8e38-f5a9311f3cb7');
INSERT INTO public.questions VALUES (197, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">During the dataset lifecycle, do you plan to note down the data harmonisation, data quality assurance and data curation processes to ensure they are correctly described in the metadata?</span></span></span></p>', '', 5, 100, '2019-05-03 12:21:05.799054', '2019-05-03 12:21:05.799054', 1, true, NULL, 'df1ee059-dd5a-4bf8-aa78-b16326981a3a');
INSERT INTO public.questions VALUES (198, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be responsible for data management in your project? </span></span></span></p>', '', 1, 101, '2019-05-03 12:21:05.818389', '2019-05-03 12:21:05.818389', 1, true, NULL, '7c520f43-0cf4-47fa-85ac-6175adbf646d');
INSERT INTO public.questions VALUES (244, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are there any ethical or legal issues that can have an impact on data sharing?</span></span></span></p>', '', 1, 125, '2019-05-03 13:33:24.426193', '2019-05-03 13:33:24.426193', 1, true, NULL, '3260758f-1656-4a84-9dd0-b88a3c2e873d');
INSERT INTO public.questions VALUES (199, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', '', 1, 102, '2019-05-03 12:21:05.847468', '2019-05-03 12:21:05.847468', 1, true, NULL, '6fce8c64-c504-4d4c-b524-e9c1314cc980');
INSERT INTO public.questions VALUES (200, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are there any ethical or legal issues that can have an impact on data sharing?</span></span></span></p>', '', 1, 103, '2019-05-03 12:21:05.877279', '2019-05-03 12:21:05.877279', 1, true, NULL, '3260758f-1656-4a84-9dd0-b88a3c2e873d');
INSERT INTO public.questions VALUES (201, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 104, '2019-05-03 12:21:05.89573', '2019-05-03 12:21:05.89573', 1, true, NULL, '751112db-dd4d-4e07-9bae-365db86a54f9');
INSERT INTO public.questions VALUES (202, 'No question', '', 1, 106, '2019-05-03 12:21:19.351957', '2019-05-03 12:21:19.351957', 1, true, NULL, '623794a4-0b1a-4ef9-ad60-e9f6b0d1f4a4');
INSERT INTO public.questions VALUES (203, 'No question', '', 1, 107, '2019-05-03 13:33:23.736799', '2019-05-03 13:33:23.736799', 1, true, NULL, '623794a4-0b1a-4ef9-ad60-e9f6b0d1f4a4');
INSERT INTO public.questions VALUES (204, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 108, '2019-05-03 13:33:23.77985', '2019-05-03 13:33:23.77985', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (205, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to adapt the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 108, '2019-05-03 13:33:23.794635', '2019-05-03 13:33:23.794635', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (206, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 109, '2019-05-03 13:33:23.827795', '2019-05-03 13:33:23.827795', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (207, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EuroFleets/SeaDataNet </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 109, '2019-05-03 13:33:23.840592', '2019-05-03 13:33:23.840592', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (208, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 110, '2019-05-03 13:33:23.861039', '2019-05-03 13:33:23.861039', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (209, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 110, '2019-05-03 13:33:23.880607', '2019-05-03 13:33:23.880607', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (210, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 113, '2019-05-03 13:33:23.922556', '2019-05-03 13:33:23.922556', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (212, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 114, '2019-05-03 13:33:23.952221', '2019-05-03 13:33:23.952221', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (213, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 114, '2019-05-03 13:33:23.962395', '2019-05-03 13:33:23.962395', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (228, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positively to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 120, '2019-05-03 13:33:24.211085', '2019-05-03 13:33:24.211085', 1, true, NULL, '420c199c-88ae-4bca-a3b2-f5570963a7b9');
INSERT INTO public.questions VALUES (214, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 114, '2019-05-03 13:33:23.97245', '2019-05-03 13:33:23.97245', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (215, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 115, '2019-05-03 13:33:23.991288', '2019-05-03 13:33:23.991288', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (216, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 117, '2019-05-03 13:33:24.017288', '2019-05-03 13:33:24.017288', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (217, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 118, '2019-05-03 13:33:24.046931', '2019-05-03 13:33:24.046931', 1, true, NULL, '0cec5c71-8e32-4940-87dc-3afed0d6778f');
INSERT INTO public.questions VALUES (218, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect </span></span></span></p>', '', 2, 118, '2019-05-03 13:33:24.060118', '2019-05-03 13:33:24.060118', 1, true, NULL, '78e199c1-1893-497c-b4a1-65d4f247e9a7');
INSERT INTO public.questions VALUES (219, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 118, '2019-05-03 13:33:24.093376', '2019-05-03 13:33:24.093376', 1, true, NULL, 'af0d3d86-28e6-4806-990d-8854032609ec');
INSERT INTO public.questions VALUES (220, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 118, '2019-05-03 13:33:24.10685', '2019-05-03 13:33:24.10685', 1, true, NULL, 'a8a80ed4-2684-4a53-ac0b-1b58b8ea0141');
INSERT INTO public.questions VALUES (221, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">What is the expected size (Megabyte to Terabyte range) of the data? </span></span></span></span></p>', '', 5, 118, '2019-05-03 13:33:24.117693', '2019-05-03 13:33:24.117693', 1, true, NULL, '344ffa73-e7cc-4eb8-942d-6c45a5edb91d');
INSERT INTO public.questions VALUES (222, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Who will be the principal users of the data? Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></span></p>', '', 6, 118, '2019-05-03 13:33:24.128842', '2019-05-03 13:33:24.128842', 1, true, NULL, '6a4bf93d-6e48-490f-96e4-17a5d4096d2f');
INSERT INTO public.questions VALUES (223, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What naming conventions for your data files will you follow? </span></span></span></p>', '', 1, 119, '2019-05-03 13:33:24.145838', '2019-05-03 13:33:24.145838', 1, true, NULL, 'b9ac412d-dad4-4cbb-8e30-fa6b9e8115dd');
INSERT INTO public.questions VALUES (224, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 2, 119, '2019-05-03 13:33:24.155889', '2019-05-03 13:33:24.155889', 1, true, NULL, '488c18b9-4f67-4b88-b3e8-bc0d05922add');
INSERT INTO public.questions VALUES (225, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you foresee a need for different versions of the data? Both for your own internal use and when publishing the data? E.g. for some analyses the data might need reorganisation from a common ancestor. Which versioning scheme do you have in mind?</span></span></span></p>', '', 3, 119, '2019-05-03 13:33:24.166788', '2019-05-03 13:33:24.166788', 1, true, NULL, 'd60057f2-9f61-461b-ba33-7117bd607694');
INSERT INTO public.questions VALUES (226, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">adapt</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 4, 119, '2019-05-03 13:33:24.1765', '2019-05-03 13:33:24.1765', 1, true, NULL, 'cbcdae3c-ab2a-4f1b-99ae-4c8c4e0cb0f8');
INSERT INTO public.questions VALUES (227, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 120, '2019-05-03 13:33:24.200309', '2019-05-03 13:33:24.200309', 1, true, NULL, '9503897c-b0c1-4e36-a845-4eb229387f82');
INSERT INTO public.questions VALUES (229, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the EuroFleets/SeaDataNet data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 120, '2019-05-03 13:33:24.221524', '2019-05-03 13:33:24.221524', 1, true, NULL, 'bd7ce45c-66e7-40ea-9aa6-bb248fbd9f16');
INSERT INTO public.questions VALUES (230, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What methods or software tools are needed to access the data? </span></span></span></p>', '', 4, 120, '2019-05-03 13:33:24.231145', '2019-05-03 13:33:24.231145', 1, true, NULL, 'dc0b191a-baee-4127-95fa-3e3b6f16bb51');
INSERT INTO public.questions VALUES (231, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is documentation about the software needed to access the data included?</span></span></span></p>', '', 5, 120, '2019-05-03 13:33:24.242538', '2019-05-03 13:33:24.242538', 1, true, NULL, 'f6217eb3-2b53-4ef1-bce6-2bf7833544ca');
INSERT INTO public.questions VALUES (232, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is it possible to include the relevant software (e.g. in open source code)?</span></span></span></p>', '', 6, 120, '2019-05-03 13:33:24.253386', '2019-05-03 13:33:24.253386', 1, true, NULL, '80131cc4-cb82-4f10-8a62-bf61f6b9ce65');
INSERT INTO public.questions VALUES (233, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Where will the documentation and code be deposited? Preference should be given to certified repositories which support open access where possible.</span></span></span></p>', '', 7, 120, '2019-05-03 13:33:24.263716', '2019-05-03 13:33:24.263716', 1, true, NULL, '1e724f4b-0adf-4d27-9604-6c2313ce7ee3');
INSERT INTO public.questions VALUES (234, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 121, '2019-05-03 13:33:24.283635', '2019-05-03 13:33:24.283635', 1, true, NULL, '7b19686d-121e-4222-9d48-38fc45c16984');
INSERT INTO public.questions VALUES (235, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Notwithstanding the work the reference data centres will perform, do you plan to already make use of standardized definitions (stored in vocabularies) to store the above meta-information?</span></span></span></p>', '', 2, 121, '2019-05-03 13:33:24.294321', '2019-05-03 13:33:24.294321', 1, true, NULL, '956bb601-9eee-468c-82a4-e3046824aca4');
INSERT INTO public.questions VALUES (236, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">In case it is unavoidable that you use uncommon or generate novel or project specific scientific terminology, do you plan to provide mappings to more commonly used terminology? How will you cope with information loss? How will you embed this information in the above meta-information and make sure they are seen as novel?</span></span></span></p>', '', 3, 121, '2019-05-03 13:33:24.304888', '2019-05-03 13:33:24.304888', 1, true, NULL, '71cf5475-1616-4f17-92e0-3b34f97da9cc');
INSERT INTO public.questions VALUES (237, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 122, '2019-05-03 13:33:24.322721', '2019-05-03 13:33:24.322721', 1, true, NULL, '62d165eb-0533-4e54-8b2d-e6fd32c662e5');
INSERT INTO public.questions VALUES (238, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 122, '2019-05-03 13:33:24.343809', '2019-05-03 13:33:24.343809', 1, true, NULL, 'c880f837-5b2f-480e-bf56-5d7b7f22d237');
INSERT INTO public.questions VALUES (239, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are the data produced and/or used in the project usable by third parties, in particular after the end of the project? If the re-use of some data is restricted, explain why.</span></span></span></p>', '', 3, 122, '2019-05-03 13:33:24.354375', '2019-05-03 13:33:24.354375', 1, true, NULL, '2a5b258d-4984-40fc-b659-53dee5be4992');
INSERT INTO public.questions VALUES (240, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How long is it intended that the data remains re-usable?</span></span></span></p>', '', 4, 122, '2019-05-03 13:33:24.364871', '2019-05-03 13:33:24.364871', 1, true, NULL, '04cd7b66-439e-4119-8e38-f5a9311f3cb7');
INSERT INTO public.questions VALUES (241, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">During the dataset lifecycle, do you plan to note down the data harmonisation, data quality assurance and data curation processes to ensure they are correctly described in the metadata?</span></span></span></p>', '', 5, 122, '2019-05-03 13:33:24.374714', '2019-05-03 13:33:24.374714', 1, true, NULL, 'df1ee059-dd5a-4bf8-aa78-b16326981a3a');
INSERT INTO public.questions VALUES (242, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be responsible for data management in your project? </span></span></span></p>', '', 1, 123, '2019-05-03 13:33:24.392212', '2019-05-03 13:33:24.392212', 1, true, NULL, '7c520f43-0cf4-47fa-85ac-6175adbf646d');
INSERT INTO public.questions VALUES (243, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', '', 1, 124, '2019-05-03 13:33:24.409041', '2019-05-03 13:33:24.409041', 1, true, NULL, '6fce8c64-c504-4d4c-b524-e9c1314cc980');
INSERT INTO public.questions VALUES (245, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 126, '2019-05-03 13:33:24.445147', '2019-05-03 13:33:24.445147', 1, true, NULL, '751112db-dd4d-4e07-9bae-365db86a54f9');
INSERT INTO public.questions VALUES (211, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', 'a', 1, 114, '2019-05-03 13:33:23.941546', '2019-05-03 13:33:23.941546', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');
INSERT INTO public.questions VALUES (246, 'No question', '', 1, 128, '2019-05-03 13:37:28.266183', '2019-05-03 13:37:28.266183', 1, true, NULL, '623794a4-0b1a-4ef9-ad60-e9f6b0d1f4a4');
INSERT INTO public.questions VALUES (247, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 1, 129, '2019-05-03 13:37:28.302311', '2019-05-03 13:37:28.302311', 1, true, NULL, '81d48392-fc3f-49d6-8380-48efe968c7e5');
INSERT INTO public.questions VALUES (248, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to adapt the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 2, 129, '2019-05-03 13:37:28.317884', '2019-05-03 13:37:28.317884', 1, true, NULL, 'cd5a3843-266a-4425-afc4-bd2f7af6ca9f');
INSERT INTO public.questions VALUES (249, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 130, '2019-05-03 13:37:28.355373', '2019-05-03 13:37:28.355373', 1, true, NULL, 'd80837b6-624d-4785-a594-372ba810dfe4');
INSERT INTO public.questions VALUES (250, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EuroFleets/SeaDataNet </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 130, '2019-05-03 13:37:28.367524', '2019-05-03 13:37:28.367524', 1, true, NULL, '0fbc1cd0-0d74-4127-851e-f08625457ca1');
INSERT INTO public.questions VALUES (251, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 131, '2019-05-03 13:37:28.38921', '2019-05-03 13:37:28.38921', 1, true, NULL, '53618692-30d5-484f-bf51-308c65c23d95');
INSERT INTO public.questions VALUES (252, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 131, '2019-05-03 13:37:28.411868', '2019-05-03 13:37:28.411868', 1, true, NULL, 'b64a316c-c65e-494a-8b0a-c30488f88eed');
INSERT INTO public.questions VALUES (253, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 134, '2019-05-03 13:37:28.457151', '2019-05-03 13:37:28.457151', 1, true, NULL, 'c8f71703-21e7-470a-a363-b34ffef7573f');
INSERT INTO public.questions VALUES (255, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect? </span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">&nbsp;</span></span></span></p>', '', 2, 135, '2019-05-03 13:37:28.510069', '2019-05-03 13:37:28.510069', 1, true, NULL, '0051cded-1bc8-4c07-bbbe-dbc35d6c3575');
INSERT INTO public.questions VALUES (256, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 135, '2019-05-03 13:37:28.522786', '2019-05-03 13:37:28.522786', 1, true, NULL, 'd0c7c85b-a19d-43a7-827c-3e4c3bb3f6ed');
INSERT INTO public.questions VALUES (257, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 135, '2019-05-03 13:37:28.535976', '2019-05-03 13:37:28.535976', 1, true, NULL, '522e917b-4f55-4bea-850c-18dfdfd47499');
INSERT INTO public.questions VALUES (258, '<span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span>', '', 1, 136, '2019-05-03 13:37:28.562775', '2019-05-03 13:37:28.562775', 1, true, NULL, '5af24208-136a-483c-8f7a-4a051f3b07c4');
INSERT INTO public.questions VALUES (259, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 138, '2019-05-03 13:37:28.592413', '2019-05-03 13:37:28.592413', 1, true, NULL, '58d1e144-d323-40de-a811-b1427c81dce8');
INSERT INTO public.questions VALUES (260, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 139, '2019-05-03 13:37:28.628946', '2019-05-03 13:37:28.628946', 1, true, NULL, '0cec5c71-8e32-4940-87dc-3afed0d6778f');
INSERT INTO public.questions VALUES (261, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What types and formats of data will the project generate/collect </span></span></span></p>', '', 2, 139, '2019-05-03 13:37:28.643562', '2019-05-03 13:37:28.643562', 1, true, NULL, '78e199c1-1893-497c-b4a1-65d4f247e9a7');
INSERT INTO public.questions VALUES (262, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Will you re-use any existing data and how? Is this hosted on any data repository? Which ones?</span></span></span></p>', '', 3, 139, '2019-05-03 13:37:28.659386', '2019-05-03 13:37:28.659386', 1, true, NULL, 'af0d3d86-28e6-4806-990d-8854032609ec');
INSERT INTO public.questions VALUES (263, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How is the original data gathered on board and how do you transfer it to shore? What processing on the raw data do you plan? What will be the end state of the data when it is ready for uptake into a data repository?</span></span></span></p>', '', 4, 139, '2019-05-03 13:37:28.672723', '2019-05-03 13:37:28.672723', 1, true, NULL, 'a8a80ed4-2684-4a53-ac0b-1b58b8ea0141');
INSERT INTO public.questions VALUES (264, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">What is the expected size (Megabyte to Terabyte range) of the data? </span></span></span></span></p>', '', 5, 139, '2019-05-03 13:37:28.684848', '2019-05-03 13:37:28.684848', 1, true, NULL, '344ffa73-e7cc-4eb8-942d-6c45a5edb91d');
INSERT INTO public.questions VALUES (265, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span style="font-weight: normal;">Who will be the principal users of the data? Users are both active (those that clean up or analyse the data) and passive (those that read or assess the data).</span></span></span></span></p>', '', 6, 139, '2019-05-03 13:37:28.697562', '2019-05-03 13:37:28.697562', 1, true, NULL, '6a4bf93d-6e48-490f-96e4-17a5d4096d2f');
INSERT INTO public.questions VALUES (266, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What naming conventions for your data files will you follow? </span></span></span></p>', '', 1, 140, '2019-05-03 13:37:28.719636', '2019-05-03 13:37:28.719636', 1, true, NULL, 'b9ac412d-dad4-4cbb-8e30-fa6b9e8115dd');
INSERT INTO public.questions VALUES (267, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Can you list some search keywords? The purpose of keywords is to optimize the findability of the datasets. Best practice is to refer to definitions in standard vocabularies.</span></span></span></p>', '', 2, 140, '2019-05-03 13:37:28.734093', '2019-05-03 13:37:28.734093', 1, true, NULL, '488c18b9-4f67-4b88-b3e8-bc0d05922add');
INSERT INTO public.questions VALUES (268, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you foresee a need for different versions of the data? Both for your own internal use and when publishing the data? E.g. for some analyses the data might need reorganisation from a common ancestor. Which versioning scheme do you have in mind?</span></span></span></p>', '', 3, 140, '2019-05-03 13:37:28.746404', '2019-05-03 13:37:28.746404', 1, true, NULL, 'd60057f2-9f61-461b-ba33-7117bd607694');
INSERT INTO public.questions VALUES (269, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus data repository will allow you to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">adapt</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> the metadata when uploading the data. What metadata elements will be most relevant for other scientists active in the same field as you to assess the fitness of your datasets for their own use? Can you outline them?</span></span></span></p>', '', 4, 140, '2019-05-03 13:37:28.758647', '2019-05-03 13:37:28.758647', 1, true, NULL, 'cbcdae3c-ab2a-4f1b-99ae-4c8c4e0cb0f8');
INSERT INTO public.questions VALUES (270, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Which data produced and/or used in the project will be made openly available as the default? If certain datasets cannot be shared (or need to be shared under restrictions or embargo), explain why, clearly separating legal and contractual reasons from voluntary restrictions. Do this for each type of dataset you will create.</span></span></span></p>', '', 1, 141, '2019-05-03 13:37:28.791444', '2019-05-03 13:37:28.791444', 1, true, NULL, '9503897c-b0c1-4e36-a845-4eb229387f82');
INSERT INTO public.questions VALUES (271, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">If you answered positively to the previous question, will data access be granted on a user-by-user basis? How will the identity of the person accessing the data be ascertained?</span></span></span></p>', '', 2, 141, '2019-05-03 13:37:28.808872', '2019-05-03 13:37:28.808872', 1, true, NULL, '420c199c-88ae-4bca-a3b2-f5570963a7b9');
INSERT INTO public.questions VALUES (272, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Do you plan to make the data and metadata available on another repository than the EuroFleets/SeaDataNet data repository, for instance an institutional, a thematic or a geographic repository?</span></span></span></p>', '', 3, 141, '2019-05-03 13:37:28.82495', '2019-05-03 13:37:28.82495', 1, true, NULL, 'bd7ce45c-66e7-40ea-9aa6-bb248fbd9f16');
INSERT INTO public.questions VALUES (273, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What methods or software tools are needed to access the data? </span></span></span></p>', '', 4, 141, '2019-05-03 13:37:28.835779', '2019-05-03 13:37:28.835779', 1, true, NULL, 'dc0b191a-baee-4127-95fa-3e3b6f16bb51');
INSERT INTO public.questions VALUES (274, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is documentation about the software needed to access the data included?</span></span></span></p>', '', 5, 141, '2019-05-03 13:37:28.848678', '2019-05-03 13:37:28.848678', 1, true, NULL, 'f6217eb3-2b53-4ef1-bce6-2bf7833544ca');
INSERT INTO public.questions VALUES (275, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Is it possible to include the relevant software (e.g. in open source code)?</span></span></span></p>', '', 6, 141, '2019-05-03 13:37:28.861658', '2019-05-03 13:37:28.861658', 1, true, NULL, '80131cc4-cb82-4f10-8a62-bf61f6b9ce65');
INSERT INTO public.questions VALUES (276, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Where will the documentation and code be deposited? Preference should be given to certified repositories which support open access where possible.</span></span></span></p>', '', 7, 141, '2019-05-03 13:37:28.877719', '2019-05-03 13:37:28.877719', 1, true, NULL, '1e724f4b-0adf-4d27-9604-6c2313ce7ee3');
INSERT INTO public.questions VALUES (277, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Please specify how you plan to unambiguously capture and store the specified individual meta-information elements to facilitate </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> reference data centres to connect your information to the definitions in vocabularies in an efficient way.</span></span></span></p>', '', 1, 142, '2019-05-03 13:37:28.897458', '2019-05-03 13:37:28.897458', 1, true, NULL, '7b19686d-121e-4222-9d48-38fc45c16984');
INSERT INTO public.questions VALUES (278, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Notwithstanding the work the reference data centres will perform, do you plan to already make use of standardized definitions (stored in vocabularies) to store the above meta-information?</span></span></span></p>', '', 2, 142, '2019-05-03 13:37:28.907822', '2019-05-03 13:37:28.907822', 1, true, NULL, '956bb601-9eee-468c-82a4-e3046824aca4');
INSERT INTO public.questions VALUES (279, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">In case it is unavoidable that you use uncommon or generate novel or project specific scientific terminology, do you plan to provide mappings to more commonly used terminology? How will you cope with information loss? How will you embed this information in the above meta-information and make sure they are seen as novel?</span></span></span></p>', '', 3, 142, '2019-05-03 13:37:28.91738', '2019-05-03 13:37:28.91738', 1, true, NULL, '71cf5475-1616-4f17-92e0-3b34f97da9cc');
INSERT INTO public.questions VALUES (280, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How will the data be licensed to permit the widest re-use possible? </span></span></span></p>', '', 1, 143, '2019-05-03 13:37:28.935255', '2019-05-03 13:37:28.935255', 1, true, NULL, '62d165eb-0533-4e54-8b2d-e6fd32c662e5');
INSERT INTO public.questions VALUES (281, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">When will the data be made available for re-use? If an embargo is sought to give time to publish or seek patents, specify why and how long this will apply, bearing in mind that research data should be made available as soon as possible.</span></span></span></p>', '', 2, 143, '2019-05-03 13:37:28.958035', '2019-05-03 13:37:28.958035', 1, true, NULL, 'c880f837-5b2f-480e-bf56-5d7b7f22d237');
INSERT INTO public.questions VALUES (282, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are the data produced and/or used in the project usable by third parties, in particular after the end of the project? If the re-use of some data is restricted, explain why.</span></span></span></p>', '', 3, 143, '2019-05-03 13:37:28.970309', '2019-05-03 13:37:28.970309', 1, true, NULL, '2a5b258d-4984-40fc-b659-53dee5be4992');
INSERT INTO public.questions VALUES (283, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">How long is it intended that the data remains re-usable?</span></span></span></p>', '', 4, 143, '2019-05-03 13:37:28.987439', '2019-05-03 13:37:28.987439', 1, true, NULL, '04cd7b66-439e-4119-8e38-f5a9311f3cb7');
INSERT INTO public.questions VALUES (284, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">During the dataset lifecycle, do you plan to note down the data harmonisation, data quality assurance and data curation processes to ensure they are correctly described in the metadata?</span></span></span></p>', '', 5, 143, '2019-05-03 13:37:28.999006', '2019-05-03 13:37:28.999006', 1, true, NULL, 'df1ee059-dd5a-4bf8-aa78-b16326981a3a');
INSERT INTO public.questions VALUES (285, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Who will be responsible for data management in your project? </span></span></span></p>', '', 1, 144, '2019-05-03 13:37:29.019707', '2019-05-03 13:37:29.019707', 1, true, NULL, '7c520f43-0cf4-47fa-85ac-6175adbf646d');
INSERT INTO public.questions VALUES (286, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', '', 1, 145, '2019-05-03 13:37:29.037954', '2019-05-03 13:37:29.037954', 1, true, NULL, '6fce8c64-c504-4d4c-b524-e9c1314cc980');
INSERT INTO public.questions VALUES (287, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Are there any ethical or legal issues that can have an impact on data sharing?</span></span></span></p>', '', 1, 146, '2019-05-03 13:37:29.057975', '2019-05-03 13:37:29.057975', 1, true, NULL, '3260758f-1656-4a84-9dd0-b88a3c2e873d');
INSERT INTO public.questions VALUES (288, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">On top of the infrastructure and procedures that EurofleetsPlus provides, which national/sectorial/ departmental procedures for data management are you following?</span></span></span></p>', '', 1, 147, '2019-05-03 13:37:29.078707', '2019-05-03 13:37:29.078707', 1, true, NULL, '751112db-dd4d-4e07-9bae-365db86a54f9');
INSERT INTO public.questions VALUES (254, '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">What is the purpose of the data collection/generation and its relation to the objectives of the project? </span></span></span></p>', '', 1, 135, '2019-05-03 13:37:28.477923', '2019-05-03 13:37:28.477923', 1, true, NULL, '4381d4f6-e318-4ab8-8330-47b6d9adafe4');


--
-- TOC entry 2605 (class 0 OID 1898343)
-- Dependencies: 225
-- Data for Name: questions_themes; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.questions_themes VALUES (211, 4);


--
-- TOC entry 2607 (class 0 OID 1898349)
-- Dependencies: 227
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.regions VALUES (1, 'horizon', 'European super region', 'Horizon2020', NULL);
INSERT INTO public.regions VALUES (2, 'uk', 'United Kingdom', 'UK', 1);
INSERT INTO public.regions VALUES (3, 'de', 'Germany', 'DE', 1);
INSERT INTO public.regions VALUES (4, 'fr', 'France', 'FR', 1);
INSERT INTO public.regions VALUES (5, 'es', 'Spain', 'ES', 1);
INSERT INTO public.regions VALUES (6, 'us', 'United States of America', 'US', NULL);


--
-- TOC entry 2609 (class 0 OID 1898360)
-- Dependencies: 229
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.roles VALUES (17, 5, 17, '2019-05-03 10:56:58.199607', '2019-05-03 10:57:30.84454', 15, false);
INSERT INTO public.roles VALUES (18, 5, 18, '2019-05-03 10:58:23.342257', '2019-05-03 12:21:58.631862', 15, false);
INSERT INTO public.roles VALUES (20, 5, 20, '2019-05-03 12:19:26.279982', '2019-05-03 12:22:01.905856', 15, false);
INSERT INTO public.roles VALUES (19, 5, 19, '2019-05-03 12:18:15.787156', '2019-05-03 12:22:05.404853', 15, false);
INSERT INTO public.roles VALUES (21, 5, 21, '2019-05-03 12:22:14.655853', '2019-05-03 12:22:14.655853', 15, true);
INSERT INTO public.roles VALUES (22, 5, 22, '2019-05-03 12:33:34.331907', '2019-05-03 12:33:34.331907', 15, true);
INSERT INTO public.roles VALUES (23, 5, 23, '2019-05-03 13:33:44.355187', '2019-05-03 13:33:44.355187', 15, true);
INSERT INTO public.roles VALUES (24, 5, 24, '2019-05-03 13:35:25.933721', '2019-05-03 13:35:25.933721', 15, true);


--
-- TOC entry 2561 (class 0 OID 1898078)
-- Dependencies: 181
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.schema_migrations VALUES ('20181025220743');
INSERT INTO public.schema_migrations VALUES ('20130611151704');
INSERT INTO public.schema_migrations VALUES ('20130903123015');
INSERT INTO public.schema_migrations VALUES ('20130902141025');
INSERT INTO public.schema_migrations VALUES ('20130717125748');
INSERT INTO public.schema_migrations VALUES ('20170428083711');
INSERT INTO public.schema_migrations VALUES ('20171102185518');
INSERT INTO public.schema_migrations VALUES ('20150430135839');
INSERT INTO public.schema_migrations VALUES ('20170427110141');
INSERT INTO public.schema_migrations VALUES ('20150416120233');
INSERT INTO public.schema_migrations VALUES ('20130724112909');
INSERT INTO public.schema_migrations VALUES ('20180405152454');
INSERT INTO public.schema_migrations VALUES ('20161115123658');
INSERT INTO public.schema_migrations VALUES ('20170712084314');
INSERT INTO public.schema_migrations VALUES ('20130717130107');
INSERT INTO public.schema_migrations VALUES ('20130918130838');
INSERT INTO public.schema_migrations VALUES ('20170607154433');
INSERT INTO public.schema_migrations VALUES ('20130611111359');
INSERT INTO public.schema_migrations VALUES ('20171024214257');
INSERT INTO public.schema_migrations VALUES ('20130611135155');
INSERT INTO public.schema_migrations VALUES ('20180903104704');
INSERT INTO public.schema_migrations VALUES ('20130708092900');
INSERT INTO public.schema_migrations VALUES ('20150416113232');
INSERT INTO public.schema_migrations VALUES ('20130611113325');
INSERT INTO public.schema_migrations VALUES ('20180807114052');
INSERT INTO public.schema_migrations VALUES ('20180405151713');
INSERT INTO public.schema_migrations VALUES ('20160719140055');
INSERT INTO public.schema_migrations VALUES ('20170130173049');
INSERT INTO public.schema_migrations VALUES ('20161205095624');
INSERT INTO public.schema_migrations VALUES ('20170606215136');
INSERT INTO public.schema_migrations VALUES ('20130918154825');
INSERT INTO public.schema_migrations VALUES ('20170619173045');
INSERT INTO public.schema_migrations VALUES ('20180813114525');
INSERT INTO public.schema_migrations VALUES ('20160805103912');
INSERT INTO public.schema_migrations VALUES ('20131126133804');
INSERT INTO public.schema_migrations VALUES ('20130717115239');
INSERT INTO public.schema_migrations VALUES ('20171024220146');
INSERT INTO public.schema_migrations VALUES ('20171122195828');
INSERT INTO public.schema_migrations VALUES ('20150809210811');
INSERT INTO public.schema_migrations VALUES ('20131212111049');
INSERT INTO public.schema_migrations VALUES ('20170516184429');
INSERT INTO public.schema_migrations VALUES ('20161115105808');
INSERT INTO public.schema_migrations VALUES ('20180813114348');
INSERT INTO public.schema_migrations VALUES ('20131126135301');
INSERT INTO public.schema_migrations VALUES ('20180813114813');
INSERT INTO public.schema_migrations VALUES ('20130611132258');
INSERT INTO public.schema_migrations VALUES ('20140707143840');
INSERT INTO public.schema_migrations VALUES ('20180313120831');
INSERT INTO public.schema_migrations VALUES ('20180813114216');
INSERT INTO public.schema_migrations VALUES ('20150501150321');
INSERT INTO public.schema_migrations VALUES ('20160822130601');
INSERT INTO public.schema_migrations VALUES ('20130611140229');
INSERT INTO public.schema_migrations VALUES ('20130913134657');
INSERT INTO public.schema_migrations VALUES ('20161024163920');
INSERT INTO public.schema_migrations VALUES ('20161115124634');
INSERT INTO public.schema_migrations VALUES ('20130717125231');
INSERT INTO public.schema_migrations VALUES ('20181024120747');
INSERT INTO public.schema_migrations VALUES ('20170201194502');
INSERT INTO public.schema_migrations VALUES ('20171013152425');
INSERT INTO public.schema_migrations VALUES ('20130902141150');
INSERT INTO public.schema_migrations VALUES ('20160105114044');
INSERT INTO public.schema_migrations VALUES ('20150416133602');
INSERT INTO public.schema_migrations VALUES ('20130717093814');
INSERT INTO public.schema_migrations VALUES ('20130731132153');
INSERT INTO public.schema_migrations VALUES ('20180713164120');
INSERT INTO public.schema_migrations VALUES ('20161205095623');
INSERT INTO public.schema_migrations VALUES ('20150416105712');
INSERT INTO public.schema_migrations VALUES ('20140214120652');
INSERT INTO public.schema_migrations VALUES ('20130731130811');
INSERT INTO public.schema_migrations VALUES ('20180328115455');
INSERT INTO public.schema_migrations VALUES ('20150427145433');
INSERT INTO public.schema_migrations VALUES ('20130611111340');
INSERT INTO public.schema_migrations VALUES ('20160805103704');
INSERT INTO public.schema_migrations VALUES ('20180412092647');
INSERT INTO public.schema_migrations VALUES ('20160805101216');
INSERT INTO public.schema_migrations VALUES ('20140407153318');
INSERT INTO public.schema_migrations VALUES ('20180713161007');
INSERT INTO public.schema_migrations VALUES ('20180813114234');
INSERT INTO public.schema_migrations VALUES ('20161122152339');
INSERT INTO public.schema_migrations VALUES ('20161206122926');
INSERT INTO public.schema_migrations VALUES ('20170421170849');
INSERT INTO public.schema_migrations VALUES ('20130731131354');
INSERT INTO public.schema_migrations VALUES ('20130611153921');
INSERT INTO public.schema_migrations VALUES ('20150518153927');
INSERT INTO public.schema_migrations VALUES ('20151208142836');
INSERT INTO public.schema_migrations VALUES ('20140331162130');
INSERT INTO public.schema_migrations VALUES ('20130611151750');
INSERT INTO public.schema_migrations VALUES ('20161115132137');
INSERT INTO public.schema_migrations VALUES ('20130731133039');
INSERT INTO public.schema_migrations VALUES ('20140604092907');
INSERT INTO public.schema_migrations VALUES ('20131111090129');
INSERT INTO public.schema_migrations VALUES ('20180807120926');
INSERT INTO public.schema_migrations VALUES ('20180713145319');
INSERT INTO public.schema_migrations VALUES ('20130625125419');
INSERT INTO public.schema_migrations VALUES ('20160603124621');
INSERT INTO public.schema_migrations VALUES ('20130611151644');
INSERT INTO public.schema_migrations VALUES ('20130621101824');
INSERT INTO public.schema_migrations VALUES ('20180405151942');
INSERT INTO public.schema_migrations VALUES ('20180508151824');
INSERT INTO public.schema_migrations VALUES ('20180417124026');
INSERT INTO public.schema_migrations VALUES ('20171102164156');
INSERT INTO public.schema_migrations VALUES ('20170124235829');
INSERT INTO public.schema_migrations VALUES ('20161102221313');
INSERT INTO public.schema_migrations VALUES ('20161024163546');
INSERT INTO public.schema_migrations VALUES ('20160810193149');
INSERT INTO public.schema_migrations VALUES ('20180813114649');
INSERT INTO public.schema_migrations VALUES ('20131128150644');
INSERT INTO public.schema_migrations VALUES ('20130612113321');
INSERT INTO public.schema_migrations VALUES ('20180212124444');
INSERT INTO public.schema_migrations VALUES ('20150416103652');
INSERT INTO public.schema_migrations VALUES ('20130705151214');
INSERT INTO public.schema_migrations VALUES ('20130724123043');
INSERT INTO public.schema_migrations VALUES ('20180901095920');
INSERT INTO public.schema_migrations VALUES ('20161115114309');
INSERT INTO public.schema_migrations VALUES ('20130913161023');
INSERT INTO public.schema_migrations VALUES ('20140214155629');
INSERT INTO public.schema_migrations VALUES ('20180813114719');
INSERT INTO public.schema_migrations VALUES ('20140423200913');
INSERT INTO public.schema_migrations VALUES ('20130611133033');
INSERT INTO public.schema_migrations VALUES ('20130812100100');
INSERT INTO public.schema_migrations VALUES ('20130731124011');
INSERT INTO public.schema_migrations VALUES ('20130612133938');
INSERT INTO public.schema_migrations VALUES ('20130903084409');
INSERT INTO public.schema_migrations VALUES ('20180813114550');
INSERT INTO public.schema_migrations VALUES ('20150416131657');
INSERT INTO public.schema_migrations VALUES ('20150416092404');
INSERT INTO public.schema_migrations VALUES ('20140210121753');
INSERT INTO public.schema_migrations VALUES ('20130611135806');
INSERT INTO public.schema_migrations VALUES ('20180813114614');
INSERT INTO public.schema_migrations VALUES ('20150415150436');
INSERT INTO public.schema_migrations VALUES ('20130927091932');
INSERT INTO public.schema_migrations VALUES ('20180803105147');
INSERT INTO public.schema_migrations VALUES ('20170302111544');
INSERT INTO public.schema_migrations VALUES ('20161208122123');
INSERT INTO public.schema_migrations VALUES ('20180312135238');
INSERT INTO public.schema_migrations VALUES ('20180312141558');
INSERT INTO public.schema_migrations VALUES ('20131118094629');
INSERT INTO public.schema_migrations VALUES ('20130730102219');
INSERT INTO public.schema_migrations VALUES ('20150416101954');
INSERT INTO public.schema_migrations VALUES ('20140331160554');
INSERT INTO public.schema_migrations VALUES ('20180813114622');
INSERT INTO public.schema_migrations VALUES ('20131127100520');
INSERT INTO public.schema_migrations VALUES ('20130611141026');
INSERT INTO public.schema_migrations VALUES ('20170719114516');
INSERT INTO public.schema_migrations VALUES ('20171124133802');
INSERT INTO public.schema_migrations VALUES ('20140218113637');
INSERT INTO public.schema_migrations VALUES ('20150416112327');
INSERT INTO public.schema_migrations VALUES ('20170227122226');
INSERT INTO public.schema_migrations VALUES ('20180815180221');
INSERT INTO public.schema_migrations VALUES ('20130705145146');
INSERT INTO public.schema_migrations VALUES ('20130926121718');
INSERT INTO public.schema_migrations VALUES ('20130731124532');
INSERT INTO public.schema_migrations VALUES ('20150416113625');
INSERT INTO public.schema_migrations VALUES ('20160615095101');
INSERT INTO public.schema_migrations VALUES ('20160729091510');
INSERT INTO public.schema_migrations VALUES ('20180123161959');
INSERT INTO public.schema_migrations VALUES ('20150416114743');
INSERT INTO public.schema_migrations VALUES ('20130611152208');
INSERT INTO public.schema_migrations VALUES ('20180807121126');
INSERT INTO public.schema_migrations VALUES ('20130611153828');
INSERT INTO public.schema_migrations VALUES ('20160805105928');
INSERT INTO public.schema_migrations VALUES ('20130611154109');
INSERT INTO public.schema_migrations VALUES ('20130611151729');
INSERT INTO public.schema_migrations VALUES ('20161021100420');
INSERT INTO public.schema_migrations VALUES ('20170702012742');
INSERT INTO public.schema_migrations VALUES ('20161115143222');
INSERT INTO public.schema_migrations VALUES ('20130611154055');
INSERT INTO public.schema_migrations VALUES ('20180713145547');
INSERT INTO public.schema_migrations VALUES ('20160609081745');
INSERT INTO public.schema_migrations VALUES ('20130731131846');
INSERT INTO public.schema_migrations VALUES ('20171025200301');
INSERT INTO public.schema_migrations VALUES ('20150427110644');
INSERT INTO public.schema_migrations VALUES ('20130603143109');
INSERT INTO public.schema_migrations VALUES ('20170412143945');
INSERT INTO public.schema_migrations VALUES ('20130902142403');
INSERT INTO public.schema_migrations VALUES ('20150805105542');
INSERT INTO public.schema_migrations VALUES ('20161115121831');
INSERT INTO public.schema_migrations VALUES ('20180813114801');
INSERT INTO public.schema_migrations VALUES ('20131129143550');
INSERT INTO public.schema_migrations VALUES ('20180813114157');
INSERT INTO public.schema_migrations VALUES ('20130603140800');
INSERT INTO public.schema_migrations VALUES ('20180315161757');
INSERT INTO public.schema_migrations VALUES ('20161205095625');
INSERT INTO public.schema_migrations VALUES ('20151208142029');
INSERT INTO public.schema_migrations VALUES ('20180813114628');
INSERT INTO public.schema_migrations VALUES ('20160822130701');
INSERT INTO public.schema_migrations VALUES ('20160719102542');
INSERT INTO public.schema_migrations VALUES ('20130717093801');
INSERT INTO public.schema_migrations VALUES ('20180807114035');
INSERT INTO public.schema_migrations VALUES ('20130903072531');
INSERT INTO public.schema_migrations VALUES ('20160805105941');
INSERT INTO public.schema_migrations VALUES ('20131108151505');
INSERT INTO public.schema_migrations VALUES ('20140407105254');
INSERT INTO public.schema_migrations VALUES ('20130612133806');
INSERT INTO public.schema_migrations VALUES ('20130927092206');
INSERT INTO public.schema_migrations VALUES ('20140429114226');
INSERT INTO public.schema_migrations VALUES ('20130705113828');
INSERT INTO public.schema_migrations VALUES ('20170710182442');


--
-- TOC entry 2611 (class 0 OID 1898372)
-- Dependencies: 231
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.sections VALUES (18, 'Data Summary', '', 1, '2019-04-11 15:56:47.967854', '2019-04-11 15:56:47.967854', 7, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (19, 'Data Summary', '', 1, '2019-04-18 09:29:04.368679', '2019-04-18 09:29:04.368679', 8, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (20, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-04-18 09:31:50.417522', '2019-04-18 09:31:50.417522', 8, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (21, '2.2. Making data openly accessible', '', 3, '2019-04-18 09:33:34.407282', '2019-04-18 09:33:34.407282', 8, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (22, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-04-18 09:34:55.89308', '2019-04-18 09:38:40.656521', 8, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (23, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-04-18 09:40:10.805423', '2019-04-18 09:40:10.805423', 8, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (24, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-04-18 10:11:59.249179', '2019-04-18 10:11:59.249179', 8, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (25, '4. Data security', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Before the data is transferred to </span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">the</span></span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> EurofleetsPlus data repository, what provisions are in place for data security (including data recovery, secure storage and transfer)? </span></span></span></p>', 7, '2019-04-18 10:12:15.411379', '2019-04-18 10:12:15.411379', 8, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (26, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-04-18 10:12:48.09794', '2019-04-18 10:12:48.09794', 8, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (27, '6. Other issues', '', 9, '2019-04-18 10:12:58.8721', '2019-04-18 10:12:58.8721', 8, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (29, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-04-18 10:38:02.483643', '2019-04-18 10:38:02.483643', 10, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (30, '2.2. Making data openly accessible', '', 3, '2019-04-18 10:38:02.53111', '2019-04-18 10:38:02.53111', 10, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (31, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-04-18 10:38:02.614214', '2019-04-18 10:38:02.614214', 10, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (32, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-04-18 10:38:02.635964', '2019-04-18 10:38:02.635964', 10, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (33, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-04-18 10:38:02.688224', '2019-04-18 10:38:02.688224', 10, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (35, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-04-18 10:38:02.715593', '2019-04-18 10:38:02.715593', 10, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (36, '6. Other issues', '', 9, '2019-04-18 10:38:02.723134', '2019-04-18 10:38:02.723134', 10, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (28, '1. Data Summary', '', 1, '2019-04-18 10:38:02.435448', '2019-04-18 10:38:02.435448', 10, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (34, '4. Data security', '', 7, '2019-04-18 10:38:02.695514', '2019-04-18 10:38:29.603936', 10, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (37, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-04-18 13:17:49.587258', '2019-04-18 13:17:49.587258', 12, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (38, '2.2. Making data openly accessible', '', 3, '2019-04-18 13:17:49.643123', '2019-04-18 13:17:49.643123', 12, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (39, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-04-18 13:17:49.692105', '2019-04-18 13:17:49.692105', 12, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (40, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-04-18 13:17:49.720474', '2019-04-18 13:17:49.720474', 12, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (41, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-04-18 13:17:49.771539', '2019-04-18 13:17:49.771539', 12, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (42, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-04-18 13:17:49.7799', '2019-04-18 13:17:49.7799', 12, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (43, '6. Other issues', '', 9, '2019-04-18 13:17:49.788369', '2019-04-18 13:17:49.788369', 12, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (44, '1. Data Summary', '', 1, '2019-04-18 13:17:49.814514', '2019-04-18 13:17:49.814514', 12, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (45, '4. Data security', '', 7, '2019-04-18 13:17:49.867982', '2019-04-18 13:17:49.867982', 12, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (46, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-05-03 10:09:15.382121', '2019-05-03 10:09:15.382121', 16, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (47, '2.2. Making data openly accessible', '', 3, '2019-05-03 10:09:15.417393', '2019-05-03 10:09:15.417393', 16, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (49, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 10:09:15.471318', '2019-05-03 10:09:15.471318', 16, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (50, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-05-03 10:09:15.506553', '2019-05-03 10:09:15.506553', 16, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (51, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-05-03 10:09:15.51314', '2019-05-03 10:09:15.51314', 16, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (52, '6. Other issues', '', 9, '2019-05-03 10:09:15.518991', '2019-05-03 10:09:15.518991', 16, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (53, '1. Data Summary', '', 1, '2019-05-03 10:09:15.535528', '2019-05-03 10:09:15.535528', 16, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (54, '4. Data security', '', 7, '2019-05-03 10:09:15.58443', '2019-05-03 10:09:15.58443', 16, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (55, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 10:14:00.686827', '2019-05-03 10:14:00.686827', 16, true, '382d47b1-11aa-4d5e-90b7-5089fb4d0c91');
INSERT INTO public.sections VALUES (56, '1. Data Summary', '', 1, '2019-05-03 10:16:35.573038', '2019-05-03 10:16:35.573038', 17, true, 'c465ed2c-0d48-4803-8e41-d8130bd13b48');
INSERT INTO public.sections VALUES (57, '2. 1. Making data findable, including provisions for metadata', '', 2, '2019-05-03 10:18:27.552326', '2019-05-03 10:18:27.552326', 17, true, 'dbb94741-5bd8-4aa0-a62f-daa8e3178d35');
INSERT INTO public.sections VALUES (58, '2.2. Making data openly accessible', '', 3, '2019-05-03 10:24:02.865263', '2019-05-03 10:24:02.865263', 17, true, '6681d876-60f6-41d8-aff6-231d48e14fe1');
INSERT INTO public.sections VALUES (48, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: <br /><br />Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-05-03 10:09:15.452535', '2019-05-03 10:27:32.383516', 16, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (59, '2.3. Making data interoperable', '<p>Guidance:</p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,&hellip;) of each individual measurement.</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is performed on the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">The scientific purpose of the measurement or observation operation</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">An indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data (''values''), the rest can be considered meta-information. Also, don''t worry too much about structuring this information, a tabular format, repeating shared meta-information elements for values, is in most cases just fine.)</span></span></span></p>', 4, '2019-05-03 10:25:56.605522', '2019-05-03 10:27:17.564797', 17, true, 'ad9fab86-b6ed-47c0-bce4-3304165ad104');
INSERT INTO public.sections VALUES (60, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 10:31:31.897968', '2019-05-03 10:31:31.897968', 17, true, 'c086f434-8e57-4010-8185-6a82fc59a1ec');
INSERT INTO public.sections VALUES (61, '3. Allocation of resources', '', 6, '2019-05-03 10:32:59.160289', '2019-05-03 10:32:59.160289', 17, true, '1ca95ec1-2143-4dd9-b30f-93b8dd11f6c3');
INSERT INTO public.sections VALUES (62, '4. Data security', '', 7, '2019-05-03 10:33:18.084451', '2019-05-03 10:33:18.084451', 17, true, '479e38c4-f44f-4aa2-b3c3-2a3e99fa72e7');
INSERT INTO public.sections VALUES (63, '5. Ethical aspects', '', 8, '2019-05-03 10:34:06.713663', '2019-05-03 10:34:06.713663', 17, true, '1337bd77-8a6e-4a7b-8fd7-3965f587fc4e');
INSERT INTO public.sections VALUES (64, '6. Other issues', '', 9, '2019-05-03 10:34:29.162167', '2019-05-03 10:34:41.931327', 17, true, 'a89f956b-6143-42cd-a9db-658c2596a56a');
INSERT INTO public.sections VALUES (65, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 10:35:12.569193', '2019-05-03 10:35:20.82805', 17, true, '6c0514a3-31ff-4200-8253-8b39d49e8c2a');
INSERT INTO public.sections VALUES (66, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-05-03 12:17:19.569973', '2019-05-03 12:17:19.569973', 19, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (67, '2.2. Making data openly accessible', '', 3, '2019-05-03 12:17:19.609678', '2019-05-03 12:17:19.609678', 19, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (68, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 12:17:19.639997', '2019-05-03 12:17:19.639997', 19, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (69, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-05-03 12:17:19.686993', '2019-05-03 12:17:19.686993', 19, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (70, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-05-03 12:17:19.693727', '2019-05-03 12:17:19.693727', 19, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (71, '6. Other issues', '', 9, '2019-05-03 12:17:19.700718', '2019-05-03 12:17:19.700718', 19, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (72, '1. Data Summary', '', 1, '2019-05-03 12:17:19.71868', '2019-05-03 12:17:19.71868', 19, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (73, '4. Data security', '', 7, '2019-05-03 12:17:19.792535', '2019-05-03 12:17:19.792535', 19, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (74, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 12:17:19.811378', '2019-05-03 12:17:19.811378', 19, true, '382d47b1-11aa-4d5e-90b7-5089fb4d0c91');
INSERT INTO public.sections VALUES (75, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: <br /><br />Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-05-03 12:17:19.818481', '2019-05-03 12:17:19.818481', 19, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (76, '1. Data Summary', '', 1, '2019-05-03 12:17:19.881252', '2019-05-03 12:17:19.881252', 20, true, 'c465ed2c-0d48-4803-8e41-d8130bd13b48');
INSERT INTO public.sections VALUES (77, '2. 1. Making data findable, including provisions for metadata', '', 2, '2019-05-03 12:17:19.947971', '2019-05-03 12:17:19.947971', 20, true, 'dbb94741-5bd8-4aa0-a62f-daa8e3178d35');
INSERT INTO public.sections VALUES (78, '2.2. Making data openly accessible', '', 3, '2019-05-03 12:17:19.997493', '2019-05-03 12:17:19.997493', 20, true, '6681d876-60f6-41d8-aff6-231d48e14fe1');
INSERT INTO public.sections VALUES (79, '2.3. Making data interoperable', '<p>Guidance:</p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,&hellip;) of each individual measurement.</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is performed on the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">The scientific purpose of the measurement or observation operation</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">An indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data (''values''), the rest can be considered meta-information. Also, don''t worry too much about structuring this information, a tabular format, repeating shared meta-information elements for values, is in most cases just fine.)</span></span></span></p>', 4, '2019-05-03 12:17:20.089792', '2019-05-03 12:17:20.089792', 20, true, 'ad9fab86-b6ed-47c0-bce4-3304165ad104');
INSERT INTO public.sections VALUES (80, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 12:17:20.128976', '2019-05-03 12:17:20.128976', 20, true, 'c086f434-8e57-4010-8185-6a82fc59a1ec');
INSERT INTO public.sections VALUES (81, '3. Allocation of resources', '', 6, '2019-05-03 12:17:20.192738', '2019-05-03 12:17:20.192738', 20, true, '1ca95ec1-2143-4dd9-b30f-93b8dd11f6c3');
INSERT INTO public.sections VALUES (82, '4. Data security', '', 7, '2019-05-03 12:17:20.210871', '2019-05-03 12:17:20.210871', 20, true, '479e38c4-f44f-4aa2-b3c3-2a3e99fa72e7');
INSERT INTO public.sections VALUES (83, '5. Ethical aspects', '', 8, '2019-05-03 12:17:20.237616', '2019-05-03 12:17:20.237616', 20, true, '1337bd77-8a6e-4a7b-8fd7-3965f587fc4e');
INSERT INTO public.sections VALUES (84, '6. Other issues', '', 9, '2019-05-03 12:17:20.255366', '2019-05-03 12:17:20.255366', 20, true, 'a89f956b-6143-42cd-a9db-658c2596a56a');
INSERT INTO public.sections VALUES (85, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 12:17:20.27316', '2019-05-03 12:17:20.27316', 20, true, '6c0514a3-31ff-4200-8253-8b39d49e8c2a');
INSERT INTO public.sections VALUES (86, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-05-03 12:21:05.205752', '2019-05-03 12:21:05.205752', 22, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (87, '2.2. Making data openly accessible', '', 3, '2019-05-03 12:21:05.249098', '2019-05-03 12:21:05.249098', 22, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (88, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 12:21:05.282653', '2019-05-03 12:21:05.282653', 22, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (89, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-05-03 12:21:05.319008', '2019-05-03 12:21:05.319008', 22, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (90, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-05-03 12:21:05.326234', '2019-05-03 12:21:05.326234', 22, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (91, '6. Other issues', '', 9, '2019-05-03 12:21:05.333147', '2019-05-03 12:21:05.333147', 22, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (92, '1. Data Summary', '', 1, '2019-05-03 12:21:05.359108', '2019-05-03 12:21:05.359108', 22, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (93, '4. Data security', '', 7, '2019-05-03 12:21:05.410436', '2019-05-03 12:21:05.410436', 22, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (94, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 12:21:05.430391', '2019-05-03 12:21:05.430391', 22, true, '382d47b1-11aa-4d5e-90b7-5089fb4d0c91');
INSERT INTO public.sections VALUES (95, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: <br /><br />Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-05-03 12:21:05.437379', '2019-05-03 12:21:05.437379', 22, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (96, '1. Data Summary', '', 1, '2019-05-03 12:21:05.468325', '2019-05-03 12:21:05.468325', 23, true, 'c465ed2c-0d48-4803-8e41-d8130bd13b48');
INSERT INTO public.sections VALUES (97, '2. 1. Making data findable, including provisions for metadata', '', 2, '2019-05-03 12:21:05.554162', '2019-05-03 12:21:05.554162', 23, true, 'dbb94741-5bd8-4aa0-a62f-daa8e3178d35');
INSERT INTO public.sections VALUES (98, '2.2. Making data openly accessible', '', 3, '2019-05-03 12:21:05.613347', '2019-05-03 12:21:05.613347', 23, true, '6681d876-60f6-41d8-aff6-231d48e14fe1');
INSERT INTO public.sections VALUES (99, '2.3. Making data interoperable', '<p>Guidance:</p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,&hellip;) of each individual measurement.</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is performed on the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">The scientific purpose of the measurement or observation operation</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">An indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data (''values''), the rest can be considered meta-information. Also, don''t worry too much about structuring this information, a tabular format, repeating shared meta-information elements for values, is in most cases just fine.)</span></span></span></p>', 4, '2019-05-03 12:21:05.705303', '2019-05-03 12:21:05.705303', 23, true, 'ad9fab86-b6ed-47c0-bce4-3304165ad104');
INSERT INTO public.sections VALUES (100, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 12:21:05.746084', '2019-05-03 12:21:05.746084', 23, true, 'c086f434-8e57-4010-8185-6a82fc59a1ec');
INSERT INTO public.sections VALUES (101, '3. Allocation of resources', '', 6, '2019-05-03 12:21:05.813164', '2019-05-03 12:21:05.813164', 23, true, '1ca95ec1-2143-4dd9-b30f-93b8dd11f6c3');
INSERT INTO public.sections VALUES (102, '4. Data security', '', 7, '2019-05-03 12:21:05.842179', '2019-05-03 12:21:05.842179', 23, true, '479e38c4-f44f-4aa2-b3c3-2a3e99fa72e7');
INSERT INTO public.sections VALUES (103, '5. Ethical aspects', '', 8, '2019-05-03 12:21:05.871192', '2019-05-03 12:21:05.871192', 23, true, '1337bd77-8a6e-4a7b-8fd7-3965f587fc4e');
INSERT INTO public.sections VALUES (104, '6. Other issues', '', 9, '2019-05-03 12:21:05.890712', '2019-05-03 12:21:05.890712', 23, true, 'a89f956b-6143-42cd-a9db-658c2596a56a');
INSERT INTO public.sections VALUES (105, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 12:21:05.908542', '2019-05-03 12:21:05.908542', 23, true, '6c0514a3-31ff-4200-8253-8b39d49e8c2a');
INSERT INTO public.sections VALUES (106, 'Empty section', '', 1, '2019-05-03 12:21:05.923065', '2019-05-03 12:21:05.923065', 21, true, '1738c7dc-fc30-4d30-b80c-f909bbd97d5d');
INSERT INTO public.sections VALUES (107, 'Empty section', '', 1, '2019-05-03 13:33:23.729918', '2019-05-03 13:33:23.729918', 24, true, '1738c7dc-fc30-4d30-b80c-f909bbd97d5d');
INSERT INTO public.sections VALUES (108, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-05-03 13:33:23.773097', '2019-05-03 13:33:23.773097', 25, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (109, '2.2. Making data openly accessible', '', 3, '2019-05-03 13:33:23.822066', '2019-05-03 13:33:23.822066', 25, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (110, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 13:33:23.85511', '2019-05-03 13:33:23.85511', 25, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (111, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-05-03 13:33:23.902187', '2019-05-03 13:33:23.902187', 25, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (112, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-05-03 13:33:23.909779', '2019-05-03 13:33:23.909779', 25, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (113, '6. Other issues', '', 9, '2019-05-03 13:33:23.917225', '2019-05-03 13:33:23.917225', 25, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (114, '1. Data Summary', '', 1, '2019-05-03 13:33:23.936235', '2019-05-03 13:33:23.936235', 25, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (115, '4. Data security', '', 7, '2019-05-03 13:33:23.985587', '2019-05-03 13:33:23.985587', 25, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (116, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 13:33:24.004478', '2019-05-03 13:33:24.004478', 25, true, '382d47b1-11aa-4d5e-90b7-5089fb4d0c91');
INSERT INTO public.sections VALUES (117, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: <br /><br />Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-05-03 13:33:24.011569', '2019-05-03 13:33:24.011569', 25, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (118, '1. Data Summary', '', 1, '2019-05-03 13:33:24.041433', '2019-05-03 13:33:24.041433', 26, true, 'c465ed2c-0d48-4803-8e41-d8130bd13b48');
INSERT INTO public.sections VALUES (119, '2. 1. Making data findable, including provisions for metadata', '', 2, '2019-05-03 13:33:24.141234', '2019-05-03 13:33:24.141234', 26, true, 'dbb94741-5bd8-4aa0-a62f-daa8e3178d35');
INSERT INTO public.sections VALUES (120, '2.2. Making data openly accessible', '', 3, '2019-05-03 13:33:24.195277', '2019-05-03 13:33:24.195277', 26, true, '6681d876-60f6-41d8-aff6-231d48e14fe1');
INSERT INTO public.sections VALUES (121, '2.3. Making data interoperable', '<p>Guidance:</p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,&hellip;) of each individual measurement.</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is performed on the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">The scientific purpose of the measurement or observation operation</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">An indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data (''values''), the rest can be considered meta-information. Also, don''t worry too much about structuring this information, a tabular format, repeating shared meta-information elements for values, is in most cases just fine.)</span></span></span></p>', 4, '2019-05-03 13:33:24.277664', '2019-05-03 13:33:24.277664', 26, true, 'ad9fab86-b6ed-47c0-bce4-3304165ad104');
INSERT INTO public.sections VALUES (122, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 13:33:24.31788', '2019-05-03 13:33:24.31788', 26, true, 'c086f434-8e57-4010-8185-6a82fc59a1ec');
INSERT INTO public.sections VALUES (123, '3. Allocation of resources', '', 6, '2019-05-03 13:33:24.387208', '2019-05-03 13:33:24.387208', 26, true, '1ca95ec1-2143-4dd9-b30f-93b8dd11f6c3');
INSERT INTO public.sections VALUES (124, '4. Data security', '', 7, '2019-05-03 13:33:24.404197', '2019-05-03 13:33:24.404197', 26, true, '479e38c4-f44f-4aa2-b3c3-2a3e99fa72e7');
INSERT INTO public.sections VALUES (125, '5. Ethical aspects', '', 8, '2019-05-03 13:33:24.420987', '2019-05-03 13:33:24.420987', 26, true, '1337bd77-8a6e-4a7b-8fd7-3965f587fc4e');
INSERT INTO public.sections VALUES (126, '6. Other issues', '', 9, '2019-05-03 13:33:24.439813', '2019-05-03 13:33:24.439813', 26, true, 'a89f956b-6143-42cd-a9db-658c2596a56a');
INSERT INTO public.sections VALUES (127, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 13:33:24.494929', '2019-05-03 13:33:24.494929', 26, true, '6c0514a3-31ff-4200-8253-8b39d49e8c2a');
INSERT INTO public.sections VALUES (128, 'Empty section', '', 1, '2019-05-03 13:37:28.260296', '2019-05-03 13:37:28.260296', 27, true, '1738c7dc-fc30-4d30-b80c-f909bbd97d5d');
INSERT INTO public.sections VALUES (129, '2.1 Making data findable, including provisions for metadata', '', 2, '2019-05-03 13:37:28.296441', '2019-05-03 13:37:28.296441', 28, true, '5b41b5e8-057c-4a43-976a-873dbcf957f4');
INSERT INTO public.sections VALUES (130, '2.2. Making data openly accessible', '', 3, '2019-05-03 13:37:28.348764', '2019-05-03 13:37:28.348764', 28, true, '323b1673-12b6-47a3-9534-ffcb04c470c4');
INSERT INTO public.sections VALUES (131, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 13:37:28.383127', '2019-05-03 13:37:28.383127', 28, true, '7b34b916-2c41-4885-9f53-f4428e743de5');
INSERT INTO public.sections VALUES (132, '3. Allocation of resources', '<p>This section does not need to be completed for the preliminary DMP.</p>', 6, '2019-05-03 13:37:28.42873', '2019-05-03 13:37:28.42873', 28, true, 'd498f1f3-8683-4594-8523-403878a03ce6');
INSERT INTO public.sections VALUES (133, '5. Ethical aspects', '<p>This section does not need to be completed for the preliminary DMP.</p>', 8, '2019-05-03 13:37:28.436517', '2019-05-03 13:37:28.436517', 28, true, 'eb2f69cc-4fcf-441d-926b-3d2d3ae53263');
INSERT INTO public.sections VALUES (134, '6. Other issues', '', 9, '2019-05-03 13:37:28.449489', '2019-05-03 13:37:28.449489', 28, true, '5e52e594-3ea9-48c9-97f0-e9f55f55536c');
INSERT INTO public.sections VALUES (135, '1. Data Summary', '', 1, '2019-05-03 13:37:28.471707', '2019-05-03 13:37:28.471707', 28, true, 'd9a8ce8d-3c53-47fb-b30b-735e4166265f');
INSERT INTO public.sections VALUES (136, '4. Data security', '', 7, '2019-05-03 13:37:28.555692', '2019-05-03 13:37:28.555692', 28, true, '8f5f0f50-8036-433b-b34c-79d074f5ae43');
INSERT INTO public.sections VALUES (137, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 13:37:28.577066', '2019-05-03 13:37:28.577066', 28, true, '382d47b1-11aa-4d5e-90b7-5089fb4d0c91');
INSERT INTO public.sections VALUES (138, '2.3. Making data interoperable ', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Guidance: <br /><br />Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is taken from the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The scientific purpose of the sampling operation</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">an indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data, the rest can be considered meta-information.)</span></span></span></p>', 4, '2019-05-03 13:37:28.584855', '2019-05-03 13:37:28.584855', 28, true, '208a5743-2125-4831-92df-66196178a7d8');
INSERT INTO public.sections VALUES (139, '1. Data Summary', '', 1, '2019-05-03 13:37:28.621223', '2019-05-03 13:37:28.621223', 29, true, 'c465ed2c-0d48-4803-8e41-d8130bd13b48');
INSERT INTO public.sections VALUES (140, '2. 1. Making data findable, including provisions for metadata', '', 2, '2019-05-03 13:37:28.713821', '2019-05-03 13:37:28.713821', 29, true, 'dbb94741-5bd8-4aa0-a62f-daa8e3178d35');
INSERT INTO public.sections VALUES (141, '2.2. Making data openly accessible', '', 3, '2019-05-03 13:37:28.783734', '2019-05-03 13:37:28.783734', 29, true, '6681d876-60f6-41d8-aff6-231d48e14fe1');
INSERT INTO public.sections VALUES (142, '2.3. Making data interoperable', '<p>Guidance:</p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Reference data centres will make your data interoperable with the standards used in European marine research. A large part of this work is to connect the information surrounding the data in the original datasets to standardized definitions (stored in vocabularies). Therefore it is important that the operations during a scientific cruise are noted down in a detailed way, so that they can be interpreted correctly.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">This meta-information should be provided for different elements:</span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">Provide the vessel name, and any platform on that vessel (</span></span></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">i.e. ROV, AUVs, RIBs,&hellip;) used for sampling</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Campaign:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The code as used by the vessel operator</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the campaign if any</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The ports of departure and arrival</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea areas visited</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">A description of the different features of interest (e.g. sea water column at depth range x, sediment layer at depth range y, benthos communities of gravel beds,&hellip;) of each individual measurement.</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sampling in the case when an ex-situ measurement is performed on the feature of interest:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The sampling location coordinates and their Coordinate Reference System</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The name of the location, and in case of a station, the station code</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, sampling depths and locations at the beginning of the sampling, and if applicable also at the end</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Sea bottom depth at sampling location if relevant</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Vertical datum: depth reference system (mean sea level,...)</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time, length, swath and width over which sampling took place</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact sampling device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Subsamples for chemistry, biology or geology: the extent of the subsample, from which part/depth/organ it was taken,&hellip;</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The observed property you have observed or measured:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-weight: normal;">The scientific purpose of the measurement or observation operation</span></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The parameter</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>Statistical modifiers (time-averaged, percentile, standard error,...)</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time at which the measurement was taken</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The time reference at which the measurement was taken (UTC, time offset to UTC)</strong></span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The procedure you applied to take the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">Any preparatory steps: sieving, filtration, mixing,,&hellip; </span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">An indication on the fraction (matrix) or combined sample these steps resulted in (e.g. dissolved, particles (180-300um), wet weight/dry weight,&hellip; )</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">For chemistry, a description of all analytical steps taken</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The algorithm you have applied to the raw device output if applicable</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The exact measurement device: type, model and make, characteristics, calibration information,...</span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The time (plus time reference) at which the result of the procedure was known (if it is different from the time at which the measurement was taken)</span></span></span></span></p>
</li>
</ul>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB">The result of the measurement:</span></span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The value</strong></span></span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><strong>The unit of the value, expressed in units that are considered a community standard</strong></span></span></span></span></p>
</li>
</ul>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">(Please note that in the strictest sense, only the elements in bold are considered the data (''values''), the rest can be considered meta-information. Also, don''t worry too much about structuring this information, a tabular format, repeating shared meta-information elements for values, is in most cases just fine.)</span></span></span></p>', 4, '2019-05-03 13:37:28.891663', '2019-05-03 13:37:28.891663', 29, true, 'ad9fab86-b6ed-47c0-bce4-3304165ad104');
INSERT INTO public.sections VALUES (143, '2.4. Increase data re-use (through clarifying licences)', '', 5, '2019-05-03 13:37:28.929605', '2019-05-03 13:37:28.929605', 29, true, 'c086f434-8e57-4010-8185-6a82fc59a1ec');
INSERT INTO public.sections VALUES (144, '3. Allocation of resources', '', 6, '2019-05-03 13:37:29.01386', '2019-05-03 13:37:29.01386', 29, true, '1ca95ec1-2143-4dd9-b30f-93b8dd11f6c3');
INSERT INTO public.sections VALUES (145, '4. Data security', '', 7, '2019-05-03 13:37:29.032582', '2019-05-03 13:37:29.032582', 29, true, '479e38c4-f44f-4aa2-b3c3-2a3e99fa72e7');
INSERT INTO public.sections VALUES (146, '5. Ethical aspects', '', 8, '2019-05-03 13:37:29.05207', '2019-05-03 13:37:29.05207', 29, true, '1337bd77-8a6e-4a7b-8fd7-3965f587fc4e');
INSERT INTO public.sections VALUES (147, '6. Other issues', '', 9, '2019-05-03 13:37:29.073111', '2019-05-03 13:37:29.073111', 29, true, 'a89f956b-6143-42cd-a9db-658c2596a56a');
INSERT INTO public.sections VALUES (148, '7. Further support in developing your DMP', '<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The following organisations are supporting FAIR data management for European marine research: </span></span></span></p>
<ul>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">SeaDataNet extended the ISO 19115 geographic metadata standard, and, by using standard vocabularies, provides data access services covering many different fields.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The European Marine Observation and Data Network (EMODNet) provides access</span></span></span> <span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">to data and data products and strengthens and makes extensive use of the SeaDataNet infrastructure.</span></span></span></p>
</li>
<li>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EurofleetsPlus provides the necessary data management frameworks to connect the on-board science to the data repositories.</span></span></span></p>
</li>
</ul>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The </span></span></span><span style="color: #0000ff;"><u><a href="https://b2share.eudat.eu/"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">EUDAT B2SHARE</span></span></span></a></u></span><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;"> tool includes a built-in license wizard that facilitates the selection of an adequate license for research data.</span></span></span></p>
<p class="western" lang="en-GB" style="margin-bottom: 0.26cm; line-height: 100%;" align="justify"><span style="color: #0088cc;"><span style="font-family: Arial, serif;"><span style="font-size: small;">The EurofleetsPlus Data Management Plan must be completed using the DMP Roadmap tool provided on http://dmp.ef-ears.eu.</span></span></span></p>', 10, '2019-05-03 13:37:29.092961', '2019-05-03 13:37:29.092961', 29, true, '6c0514a3-31ff-4200-8253-8b39d49e8c2a');


--
-- TOC entry 2613 (class 0 OID 1898385)
-- Dependencies: 233
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.sessions VALUES (19, '102065c41286f4048be1c87339239355', 'BAh7CEkiEXByZXZpb3VzX3VybAY6BkVGIisvb3JnX2FkbWluL3RlbXBsYXRl
cy8xNS9waGFzZXMvMjcvZWRpdEkiC2xvY2FsZQY7AEZJIgplbi1HQgY7AFRJ
Ihl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQpJIiIkMmEkMDQkY2lV
akJuQnJiNkpudHhtTnhDeWtVZQY7AFQ=
', '2019-05-15 09:25:35.708142', '2019-05-15 09:26:02.896113');
INSERT INTO public.sessions VALUES (3, '3da3dac0bf7f18db40913d7ae7758e13', 'BAh7CUkiEXByZXZpb3VzX3VybAY6BkVGIjQvb3JnX2FkbWluL3RlbXBsYXRl
cy83L3BoYXNlcy83L2VkaXQ/c2VjdGlvbj0xOEkiC2xvY2FsZQY7AEZJIgpl
bi1HQgY7AFRJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQpJIiIk
MmEkMDQkY2lVakJuQnJiNkpudHhtTnhDeWtVZQY7AFRJIgpmbGFzaAY7AFR7
B0kiDGRpc2NhcmQGOwBUWwZJIgtub3RpY2UGOwBGSSIMZmxhc2hlcwY7AFR7
BkASSSInU3VjY2Vzc2Z1bGx5IGNyZWF0ZWQgdGhlIHF1ZXN0aW9uLgY7AFQ=
', '2019-04-11 14:48:12.543695', '2019-04-11 16:00:42.632009');
INSERT INTO public.sessions VALUES (22, 'a396619fcc84c4b6ef8f011a265860f0', 'BAh7BkkiEXByZXZpb3VzX3VybAY6BkVGIhYvcHVibGljX3RlbXBsYXRlcw==
', '2019-06-17 13:30:07.137543', '2019-06-17 13:30:12.723151');
INSERT INTO public.sessions VALUES (23, 'e9a5749d13a8d41ae9a1bcbcbd52544b', 'BAh7BkkiEXByZXZpb3VzX3VybAY6BkVGIgYv
', '2019-06-27 10:54:38.907554', '2019-06-27 10:55:18.111687');
INSERT INTO public.sessions VALUES (6, '7737b2bb9bb93530f7d5d5b70a78e6cf', 'BAh7BkkiEXByZXZpb3VzX3VybAY6BkVGIgYv
', '2019-04-18 15:02:52.007594', '2019-04-18 15:11:12.2134');
INSERT INTO public.sessions VALUES (7, 'a6680c077c9dc62477398bb20e2460e9', 'BAh7BkkiEXByZXZpb3VzX3VybAY6BkVGIg4vYWJvdXRfdXM=
', '2019-04-18 15:16:48.876072', '2019-04-18 15:28:16.698945');
INSERT INTO public.sessions VALUES (9, 'f524ed0d84e22762686cb6173524cb20', 'BAh7CEkiEXByZXZpb3VzX3VybAY6BkVGIisvb3JnX2FkbWluL3RlbXBsYXRl
cy8xMC9waGFzZXMvMTQvZWRpdEkiC2xvY2FsZQY7AEZJIgplbi1HQgY7AFRJ
Ihl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQpJIiIkMmEkMDQkY2lV
akJuQnJiNkpudHhtTnhDeWtVZQY7AFQ=
', '2019-05-02 10:16:59.899557', '2019-05-02 10:17:24.796527');
INSERT INTO public.sessions VALUES (17, 'a4ffcda86e2a2e7d7b1b9929e9cee907', 'BAh7CUkiEXByZXZpb3VzX3VybAY6BkVGIigvb3JnX2FkbWluL3RlbXBsYXRl
cy9vcmdhbmlzYXRpb25hbEkiC2xvY2FsZQY7AEZJIgplbi1HQgY7AFRJIhl3
YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQpJIiIkMmEkMDQkY2lVakJu
QnJiNkpudHhtTnhDeWtVZQY7AFRJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQG
OwBUWwZJIgtub3RpY2UGOwBGSSIMZmxhc2hlcwY7AFR7BkASSSJEWW91ciB0
ZW1wbGF0ZSBoYXMgYmVlbiBwdWJsaXNoZWQgYW5kIGlzIG5vdyBhdmFpbGFi
bGUgdG8gdXNlcnMuBjsAVA==
', '2019-05-03 12:33:14.381125', '2019-05-03 13:37:48.136592');


--
-- TOC entry 2615 (class 0 OID 1898398)
-- Dependencies: 235
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.settings VALUES (1, 'export', '---
formatting:
  :margin:
    :top: 25
    :bottom: 20
    :left: 12
    :right: 12
  :font_face: Arial, Helvetica, Sans-Serif
  :font_size: 10
max_pages: 3
fields:
  :admin:
  - project_name
  - project_identifier
  - grant_title
  - principal_investigator
  - project_data_contact
  - project_description
  - funder
  - institution
  - orcid
  :questions: :all
title: ''''
', 1, 'ExportedPlan', '2019-05-03 10:59:10.834308', '2019-05-03 10:59:10.834308');


--
-- TOC entry 2617 (class 0 OID 1898409)
-- Dependencies: 237
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2619 (class 0 OID 1898421)
-- Dependencies: 239
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.templates VALUES (9, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus application portal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>', false, 7, 'en-GB', true, '2019-04-18 10:38:02.420904', '2019-04-18 10:41:06.344084', 3, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (7, 'EurofleetsPlus cruise preliminary DMP Template', '<p>This is the template for the preliminary Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus application portal. This preliminary DMP contains a more limited set of questions. After the funing for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers. This final DMP makes use of another template, which means you will have to copy-paste your existing answers from the preliminary DMP to the full DMP.</p>', false, 7, 'en-GB', true, '2019-04-11 15:55:46.790188', '2019-04-18 09:27:56.053628', 1, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (6, 'Yet another template', '', true, 8, 'en-GB', false, '2019-04-11 15:28:46.974091', '2019-04-11 15:30:17.336101', 0, 1, NULL, NULL, false, '{"funder":[],"sample_plan":[]}');
INSERT INTO public.templates VALUES (8, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus application portal. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>', false, 7, 'en-GB', true, '2019-04-18 09:29:04.354373', '2019-04-18 10:27:52.1357', 2, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (5, 'EurofleetsPlus cruise proposal DMP Template', '<p>The Data Management Plan template used for Eurofleets Plus proposal cruises. </p>', false, 7, 'en-GB', true, '2019-04-11 15:03:11.565275', '2019-04-11 15:55:09.718042', 0, 0, NULL, 54713870, false, '{"funder":[],"sample_plan":[]}');
INSERT INTO public.templates VALUES (10, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', false, 7, 'en-GB', true, '2019-04-18 13:17:49.56775', '2019-04-18 14:04:37.719616', 4, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (13, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', false, 7, 'en-GB', true, '2019-05-03 12:21:05.167776', '2019-05-03 13:34:03.272344', 7, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (11, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', false, 7, 'en-GB', true, '2019-05-03 10:09:15.348575', '2019-05-03 10:58:08.91445', 5, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (12, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', false, 7, 'en-GB', true, '2019-05-03 12:17:19.547403', '2019-05-03 12:19:05.711547', 6, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (15, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', true, 7, 'en-GB', true, '2019-05-03 13:37:28.233641', '2019-05-03 13:37:48.058313', 9, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');
INSERT INTO public.templates VALUES (14, 'EurofleetsPlus cruise DMP Template', '<p>This is the template for both the preliminary (phase 1) and the full (phase 2) Data Management Plan of EurofleetsPlus cruises. You have to complete a preliminary DMP before you create your application in the official EurofleetsPlus submission website. This preliminary DMP contains a more limited set of questions. You can leave out details at this stage.</p>
<p>After the funding for the Eurofleets campaign has been granted to you, you need to complete the final&nbsp; DMP. For this, you need to asnwer additional questions and extend your existing answers to cover the issues more in-depth. This final DMP is a new ''phase'', which means you will have to copy-paste your existing answers from the preliminary DMP phase to the full DMP phase and extend them.</p>
<p>The three reference data centres will review your DMP and provide feedback at that stage. It should be updated during the project lifetime, especially after the cruise ended, to reflect any changes to your data management procedures.</p>
<p><em><span style="color: #00000a;"><span style="font-family: Arial, serif;"><span style="font-size: small;"><span lang="en-GB"><span style="font-style: normal;"><span style="font-weight: normal;">&nbsp;</span></span></span></span></span></span></em></p>
<p>&nbsp;</p>', false, 7, 'en-GB', true, '2019-05-03 13:33:23.710211', '2019-05-03 13:34:08.255019', 8, 1, NULL, 54713870, false, '{"funder":[{"link":"http://www.eurofleets.eu","text":""}],"sample_plan":[]}');


--
-- TOC entry 2621 (class 0 OID 1898436)
-- Dependencies: 241
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.themes VALUES (1, 'Data Description', 'Incidunt aliquam quasi. Doloribus laudantium rerum. Voluptas dignissimos nobis.', '2019-04-11 13:04:58.012861', '2019-04-11 13:04:58.012861', 'en_GB');
INSERT INTO public.themes VALUES (2, 'Data Format', 'Nostrum natus similique. Error sed dignissimos. Ipsam veniam iusto.', '2019-04-11 13:04:58.01664', '2019-04-11 13:04:58.01664', 'en_GB');
INSERT INTO public.themes VALUES (3, 'Data Volume', 'Dicta omnis omnis. Illum laborum explicabo. Voluptatum numquam doloremque.', '2019-04-11 13:04:58.019758', '2019-04-11 13:04:58.019758', 'en_GB');
INSERT INTO public.themes VALUES (4, 'Data Collection', 'Sit qui aut. Nam dolore tempora. Veritatis consequatur debitis.', '2019-04-11 13:04:58.022834', '2019-04-11 13:04:58.022834', 'en_GB');
INSERT INTO public.themes VALUES (5, 'Metadata & Documentation', 'Aut maxime minus. Ut dolorem molestiae. Et aut exercitationem.', '2019-04-11 13:04:58.025924', '2019-04-11 13:04:58.025924', 'en_GB');
INSERT INTO public.themes VALUES (6, 'Ethics & Privacy', 'Sed sed a. Cum ut laboriosam. Assumenda et molestiae.', '2019-04-11 13:04:58.02908', '2019-04-11 13:04:58.02908', 'en_GB');
INSERT INTO public.themes VALUES (7, 'Intellectual Property Rights', 'Non consectetur aut. Accusamus eos et. Pariatur dolorem qui.', '2019-04-11 13:04:58.032308', '2019-04-11 13:04:58.032308', 'en_GB');
INSERT INTO public.themes VALUES (8, 'Storage & Security', 'Eveniet qui dolores. Quas officiis deleniti. Sit molestias et.', '2019-04-11 13:04:58.035444', '2019-04-11 13:04:58.035444', 'en_GB');
INSERT INTO public.themes VALUES (9, 'Data Sharing', 'Corporis qui voluptas. Sapiente ex sed. Sunt nihil sit.', '2019-04-11 13:04:58.038611', '2019-04-11 13:04:58.038611', 'en_GB');
INSERT INTO public.themes VALUES (10, 'Data Repository', 'Officia quis laboriosam. Nemo autem qui. Asperiores in optio.', '2019-04-11 13:04:58.041519', '2019-04-11 13:04:58.041519', 'en_GB');
INSERT INTO public.themes VALUES (11, 'Preservation', 'Odio modi velit. Quia fugiat autem. Et laudantium ipsa.', '2019-04-11 13:04:58.046192', '2019-04-11 13:04:58.046192', 'en_GB');
INSERT INTO public.themes VALUES (12, 'Roles & Responsibilities', 'Maiores sint a. Repellendus veniam et. Neque aut asperiores.', '2019-04-11 13:04:58.052743', '2019-04-11 13:04:58.052743', 'en_GB');
INSERT INTO public.themes VALUES (13, 'Budget', 'Modi eos dolores. Dolore vitae ratione. Non laudantium est.', '2019-04-11 13:04:58.059271', '2019-04-11 13:04:58.059271', 'en_GB');
INSERT INTO public.themes VALUES (14, 'Related Policies', 'Fuga deserunt tempora. Sit accusantium earum. Consequatur et incidunt.', '2019-04-11 13:04:58.065985', '2019-04-11 13:04:58.065985', 'en_GB');


--
-- TOC entry 2622 (class 0 OID 1898445)
-- Dependencies: 242
-- Data for Name: themes_in_guidance; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2624 (class 0 OID 1898452)
-- Dependencies: 244
-- Data for Name: token_permission_types; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.token_permission_types VALUES (1, 'guidances', 'allows a user access to the guidances api endpoint', '2019-04-11 13:04:58.109803', '2019-04-11 13:04:58.109803');
INSERT INTO public.token_permission_types VALUES (2, 'plans', 'allows a user access to the plans api endpoint', '2019-04-11 13:04:58.117621', '2019-04-11 13:04:58.117621');
INSERT INTO public.token_permission_types VALUES (3, 'templates', 'allows a user access to the templates api endpoint', '2019-04-11 13:04:58.123384', '2019-04-11 13:04:58.123384');
INSERT INTO public.token_permission_types VALUES (4, 'statistics', 'allows a user access to the statistics api endpoint', '2019-04-11 13:04:58.129107', '2019-04-11 13:04:58.129107');


--
-- TOC entry 2626 (class 0 OID 1898463)
-- Dependencies: 246
-- Data for Name: user_identifiers; Type: TABLE DATA; Schema: public; Owner: thomas
--



--
-- TOC entry 2628 (class 0 OID 1898475)
-- Dependencies: 248
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.users VALUES (5, 'Thomas', 'Vandenberghe', 'tvandenberghe@naturalsciences.be', '2019-04-11 14:48:12.135599', '2019-06-17 13:30:00.402422', '$2a$04$ciUjBnBrb6JntxmNxCykUeBKv36.iW7nKR34MuUaVvSf9Dbf8x31y', NULL, NULL, NULL, 9, '2019-06-17 13:30:00.401547', '2019-05-15 09:25:34.877073', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 7, NULL, NULL, NULL, 1, NULL, true);


--
-- TOC entry 2629 (class 0 OID 1898490)
-- Dependencies: 249
-- Data for Name: users_perms; Type: TABLE DATA; Schema: public; Owner: thomas
--

INSERT INTO public.users_perms VALUES (5, 1);
INSERT INTO public.users_perms VALUES (5, 2);
INSERT INTO public.users_perms VALUES (5, 3);
INSERT INTO public.users_perms VALUES (5, 4);
INSERT INTO public.users_perms VALUES (5, 5);
INSERT INTO public.users_perms VALUES (5, 6);
INSERT INTO public.users_perms VALUES (5, 7);
INSERT INTO public.users_perms VALUES (5, 8);


--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 182
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.annotations_id_seq', 32, true);


--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 184
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.answers_id_seq', 9, true);


--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 187
-- Name: exported_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.exported_plans_id_seq', 1, true);


--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 189
-- Name: guidance_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.guidance_groups_id_seq', 7, true);


--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 191
-- Name: guidances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.guidances_id_seq', 16, true);


--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 193
-- Name: identifier_schemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.identifier_schemes_id_seq', 2, true);


--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 195
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.languages_id_seq', 13, true);


--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 197
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, true);


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 199
-- Name: notification_acknowledgements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.notification_acknowledgements_id_seq', 1, false);


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 201
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 203
-- Name: org_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.org_identifiers_id_seq', 1, false);


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 205
-- Name: org_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.org_token_permissions_id_seq', 4, true);


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 207
-- Name: orgs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.orgs_id_seq', 8, true);


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 209
-- Name: perms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.perms_id_seq', 8, true);


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 211
-- Name: phases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.phases_id_seq', 29, true);


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 215
-- Name: plans_guidance_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.plans_guidance_groups_id_seq', 4, true);


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 213
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.plans_id_seq', 24, true);


--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 217
-- Name: prefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.prefs_id_seq', 1, false);


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 219
-- Name: question_formats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.question_formats_id_seq', 7, true);


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 221
-- Name: question_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.question_options_id_seq', 12, true);


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 223
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.questions_id_seq', 288, true);


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 226
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.regions_id_seq', 6, true);


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 228
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.roles_id_seq', 24, true);


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 230
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.sections_id_seq', 148, true);


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 232
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.sessions_id_seq', 23, true);


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 234
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 236
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.stats_id_seq', 1, false);


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 238
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.templates_id_seq', 15, true);


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 240
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.themes_id_seq', 44, true);


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 243
-- Name: token_permission_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.token_permission_types_id_seq', 4, true);


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 245
-- Name: user_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.user_identifiers_id_seq', 1, false);


--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 247
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomas
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 2309 (class 2606 OID 1898097)
-- Name: annotations annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 1898111)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 1898128)
-- Name: exported_plans exported_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.exported_plans
    ADD CONSTRAINT exported_plans_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1898141)
-- Name: guidance_groups guidance_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidance_groups
    ADD CONSTRAINT guidance_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1898153)
-- Name: guidances guidances_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidances
    ADD CONSTRAINT guidances_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1898165)
-- Name: identifier_schemes identifier_schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.identifier_schemes
    ADD CONSTRAINT identifier_schemes_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1898176)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 1898188)
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 1898197)
-- Name: notification_acknowledgements notification_acknowledgements_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notification_acknowledgements
    ADD CONSTRAINT notification_acknowledgements_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 1898210)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1898221)
-- Name: org_identifiers org_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_identifiers
    ADD CONSTRAINT org_identifiers_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1898229)
-- Name: org_token_permissions org_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_token_permissions
    ADD CONSTRAINT org_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1898244)
-- Name: orgs orgs_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.orgs
    ADD CONSTRAINT orgs_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1898255)
-- Name: perms perms_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.perms
    ADD CONSTRAINT perms_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 1898266)
-- Name: phases phases_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.phases
    ADD CONSTRAINT phases_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 1898291)
-- Name: plans_guidance_groups plans_guidance_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans_guidance_groups
    ADD CONSTRAINT plans_guidance_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 1898282)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1898303)
-- Name: prefs prefs_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.prefs
    ADD CONSTRAINT prefs_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 1898316)
-- Name: question_formats question_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.question_formats
    ADD CONSTRAINT question_formats_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1898327)
-- Name: question_options question_options_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.question_options
    ADD CONSTRAINT question_options_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 1898340)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1898357)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 1898367)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1898380)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 1898393)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1898406)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1898418)
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1898429)
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 1898444)
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1898460)
-- Name: token_permission_types token_permission_types_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.token_permission_types
    ADD CONSTRAINT token_permission_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 1898471)
-- Name: user_identifiers user_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.user_identifiers
    ADD CONSTRAINT user_identifiers_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 1898487)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 1259 OID 1898098)
-- Name: index_annotations_on_question_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_annotations_on_question_id ON public.annotations USING btree (question_id);


--
-- TOC entry 2311 (class 1259 OID 1898099)
-- Name: index_annotations_on_versionable_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_annotations_on_versionable_id ON public.annotations USING btree (versionable_id);


--
-- TOC entry 2314 (class 1259 OID 1898112)
-- Name: index_answers_on_plan_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_answers_on_plan_id ON public.answers USING btree (plan_id);


--
-- TOC entry 2315 (class 1259 OID 1898113)
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- TOC entry 2316 (class 1259 OID 1898117)
-- Name: index_answers_question_options_on_answer_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_answers_question_options_on_answer_id ON public.answers_question_options USING btree (answer_id);


--
-- TOC entry 2321 (class 1259 OID 1898142)
-- Name: index_guidance_groups_on_org_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_guidance_groups_on_org_id ON public.guidance_groups USING btree (org_id);


--
-- TOC entry 2324 (class 1259 OID 1898154)
-- Name: index_guidances_on_guidance_group_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_guidances_on_guidance_group_id ON public.guidances USING btree (guidance_group_id);


--
-- TOC entry 2329 (class 1259 OID 1898189)
-- Name: index_notes_on_answer_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_notes_on_answer_id ON public.notes USING btree (answer_id);


--
-- TOC entry 2332 (class 1259 OID 1898198)
-- Name: index_notification_acknowledgements_on_notification_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_notification_acknowledgements_on_notification_id ON public.notification_acknowledgements USING btree (notification_id);


--
-- TOC entry 2333 (class 1259 OID 1898199)
-- Name: index_notification_acknowledgements_on_user_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_notification_acknowledgements_on_user_id ON public.notification_acknowledgements USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 1898230)
-- Name: index_org_token_permissions_on_org_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_org_token_permissions_on_org_id ON public.org_token_permissions USING btree (org_id);


--
-- TOC entry 2347 (class 1259 OID 1898267)
-- Name: index_phases_on_template_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_phases_on_template_id ON public.phases USING btree (template_id);


--
-- TOC entry 2348 (class 1259 OID 1898268)
-- Name: index_phases_on_versionable_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_phases_on_versionable_id ON public.phases USING btree (versionable_id);


--
-- TOC entry 2354 (class 1259 OID 1898292)
-- Name: index_plans_guidance_groups_on_guidance_group_id_and_plan_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_plans_guidance_groups_on_guidance_group_id_and_plan_id ON public.plans_guidance_groups USING btree (guidance_group_id, plan_id);


--
-- TOC entry 2351 (class 1259 OID 1898283)
-- Name: index_plans_on_template_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_plans_on_template_id ON public.plans USING btree (template_id);


--
-- TOC entry 2361 (class 1259 OID 1898328)
-- Name: index_question_options_on_question_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_question_options_on_question_id ON public.question_options USING btree (question_id);


--
-- TOC entry 2364 (class 1259 OID 1898341)
-- Name: index_questions_on_section_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_questions_on_section_id ON public.questions USING btree (section_id);


--
-- TOC entry 2365 (class 1259 OID 1898342)
-- Name: index_questions_on_versionable_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_questions_on_versionable_id ON public.questions USING btree (versionable_id);


--
-- TOC entry 2368 (class 1259 OID 1898346)
-- Name: index_questions_themes_on_question_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_questions_themes_on_question_id ON public.questions_themes USING btree (question_id);


--
-- TOC entry 2371 (class 1259 OID 1898368)
-- Name: index_roles_on_plan_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_roles_on_plan_id ON public.roles USING btree (plan_id);


--
-- TOC entry 2372 (class 1259 OID 1898369)
-- Name: index_roles_on_user_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_roles_on_user_id ON public.roles USING btree (user_id);


--
-- TOC entry 2375 (class 1259 OID 1898381)
-- Name: index_sections_on_phase_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_sections_on_phase_id ON public.sections USING btree (phase_id);


--
-- TOC entry 2376 (class 1259 OID 1898382)
-- Name: index_sections_on_versionable_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_sections_on_versionable_id ON public.sections USING btree (versionable_id);


--
-- TOC entry 2379 (class 1259 OID 1898394)
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE UNIQUE INDEX index_sessions_on_session_id ON public.sessions USING btree (session_id);


--
-- TOC entry 2380 (class 1259 OID 1898395)
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_sessions_on_updated_at ON public.sessions USING btree (updated_at);


--
-- TOC entry 2387 (class 1259 OID 1898431)
-- Name: index_templates_on_family_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_templates_on_family_id ON public.templates USING btree (family_id);


--
-- TOC entry 2388 (class 1259 OID 1898430)
-- Name: index_templates_on_family_id_and_version; Type: INDEX; Schema: public; Owner: thomas
--

CREATE UNIQUE INDEX index_templates_on_family_id_and_version ON public.templates USING btree (family_id, version);


--
-- TOC entry 2389 (class 1259 OID 1898433)
-- Name: index_templates_on_org_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_templates_on_org_id ON public.templates USING btree (org_id);


--
-- TOC entry 2395 (class 1259 OID 1898448)
-- Name: index_themes_in_guidance_on_guidance_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_themes_in_guidance_on_guidance_id ON public.themes_in_guidance USING btree (guidance_id);


--
-- TOC entry 2396 (class 1259 OID 1898449)
-- Name: index_themes_in_guidance_on_theme_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_themes_in_guidance_on_theme_id ON public.themes_in_guidance USING btree (theme_id);


--
-- TOC entry 2399 (class 1259 OID 1898472)
-- Name: index_user_identifiers_on_user_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_user_identifiers_on_user_id ON public.user_identifiers USING btree (user_id);


--
-- TOC entry 2402 (class 1259 OID 1898488)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: thomas
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 2403 (class 1259 OID 1898489)
-- Name: index_users_on_org_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_users_on_org_id ON public.users USING btree (org_id);


--
-- TOC entry 2406 (class 1259 OID 1898493)
-- Name: index_users_perms_on_user_id; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX index_users_perms_on_user_id ON public.users_perms USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 1898432)
-- Name: template_organisation_dmptemplate_index; Type: INDEX; Schema: public; Owner: thomas
--

CREATE INDEX template_organisation_dmptemplate_index ON public.templates USING btree (org_id, family_id);


--
-- TOC entry 2307 (class 1259 OID 1898084)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: thomas
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- TOC entry 2413 (class 2606 OID 1898524)
-- Name: answers_question_options fk_rails_01ba00b569; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers_question_options
    ADD CONSTRAINT fk_rails_01ba00b569 FOREIGN KEY (question_option_id) REFERENCES public.question_options(id);


--
-- TOC entry 2434 (class 2606 OID 1898629)
-- Name: questions_themes fk_rails_0489d5eeba; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions_themes
    ADD CONSTRAINT fk_rails_0489d5eeba FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- TOC entry 2408 (class 2606 OID 1898499)
-- Name: annotations fk_rails_0e08e753b6; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_0e08e753b6 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 2426 (class 2606 OID 1898589)
-- Name: phases fk_rails_0f8036cb2e; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.phases
    ADD CONSTRAINT fk_rails_0f8036cb2e FOREIGN KEY (template_id) REFERENCES public.templates(id);


--
-- TOC entry 2429 (class 2606 OID 1898604)
-- Name: plans_guidance_groups fk_rails_13d0671430; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans_guidance_groups
    ADD CONSTRAINT fk_rails_13d0671430 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 2437 (class 2606 OID 1898644)
-- Name: sections fk_rails_1853581585; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT fk_rails_1853581585 FOREIGN KEY (phase_id) REFERENCES public.phases(id);


--
-- TOC entry 2420 (class 2606 OID 1898559)
-- Name: org_identifiers fk_rails_189ad2e573; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_identifiers
    ADD CONSTRAINT fk_rails_189ad2e573 FOREIGN KEY (identifier_scheme_id) REFERENCES public.identifier_schemes(id);


--
-- TOC entry 2415 (class 2606 OID 1898534)
-- Name: guidances fk_rails_20d29da787; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidances
    ADD CONSTRAINT fk_rails_20d29da787 FOREIGN KEY (guidance_group_id) REFERENCES public.guidance_groups(id);


--
-- TOC entry 2419 (class 2606 OID 1898554)
-- Name: notification_acknowledgements fk_rails_20e998dafd; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notification_acknowledgements
    ADD CONSTRAINT fk_rails_20e998dafd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2423 (class 2606 OID 1898574)
-- Name: org_token_permissions fk_rails_2aa265f538; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_token_permissions
    ADD CONSTRAINT fk_rails_2aa265f538 FOREIGN KEY (token_permission_type_id) REFERENCES public.token_permission_types(id);


--
-- TOC entry 2427 (class 2606 OID 1898594)
-- Name: plans fk_rails_3424ca281f; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT fk_rails_3424ca281f FOREIGN KEY (template_id) REFERENCES public.templates(id);


--
-- TOC entry 2421 (class 2606 OID 1898564)
-- Name: org_identifiers fk_rails_36323c0674; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_identifiers
    ADD CONSTRAINT fk_rails_36323c0674 FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2410 (class 2606 OID 1898509)
-- Name: answers fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 2445 (class 2606 OID 1898684)
-- Name: users_perms fk_rails_457217c31c; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users_perms
    ADD CONSTRAINT fk_rails_457217c31c FOREIGN KEY (perm_id) REFERENCES public.perms(id);


--
-- TOC entry 2443 (class 2606 OID 1898674)
-- Name: users fk_rails_45f4f12508; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_45f4f12508 FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- TOC entry 2438 (class 2606 OID 1898649)
-- Name: templates fk_rails_481431e1bd; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT fk_rails_481431e1bd FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2431 (class 2606 OID 1898614)
-- Name: questions fk_rails_4fbc38c8c7; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_4fbc38c8c7 FOREIGN KEY (question_format_id) REFERENCES public.question_formats(id);


--
-- TOC entry 2424 (class 2606 OID 1898579)
-- Name: orgs fk_rails_5640112cab; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.orgs
    ADD CONSTRAINT fk_rails_5640112cab FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- TOC entry 2411 (class 2606 OID 1898514)
-- Name: answers fk_rails_584be190c2; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_584be190c2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2425 (class 2606 OID 1898584)
-- Name: orgs fk_rails_5a6adf6bab; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.orgs
    ADD CONSTRAINT fk_rails_5a6adf6bab FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- TOC entry 2442 (class 2606 OID 1898669)
-- Name: user_identifiers fk_rails_65c9a98cdb; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.user_identifiers
    ADD CONSTRAINT fk_rails_65c9a98cdb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2440 (class 2606 OID 1898659)
-- Name: themes_in_guidance fk_rails_7d708f6f1e; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.themes_in_guidance
    ADD CONSTRAINT fk_rails_7d708f6f1e FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- TOC entry 2417 (class 2606 OID 1898544)
-- Name: notes fk_rails_7f2323ad43; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_rails_7f2323ad43 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2414 (class 2606 OID 1898529)
-- Name: guidance_groups fk_rails_819c1dbbc7; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.guidance_groups
    ADD CONSTRAINT fk_rails_819c1dbbc7 FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2409 (class 2606 OID 1898504)
-- Name: answers fk_rails_84a6005a3e; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_84a6005a3e FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 2416 (class 2606 OID 1898539)
-- Name: notes fk_rails_907f8d48bf; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_rails_907f8d48bf FOREIGN KEY (answer_id) REFERENCES public.answers(id);


--
-- TOC entry 2435 (class 2606 OID 1898634)
-- Name: roles fk_rails_a1ce6c2772; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_rails_a1ce6c2772 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 2439 (class 2606 OID 1898654)
-- Name: themes_in_guidance fk_rails_a5ab9402df; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.themes_in_guidance
    ADD CONSTRAINT fk_rails_a5ab9402df FOREIGN KEY (guidance_id) REFERENCES public.guidances(id);


--
-- TOC entry 2436 (class 2606 OID 1898639)
-- Name: roles fk_rails_ab35d699f0; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_rails_ab35d699f0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2407 (class 2606 OID 1898494)
-- Name: annotations fk_rails_aca7521f72; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_aca7521f72 FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2446 (class 2606 OID 1898689)
-- Name: users_perms fk_rails_b46072b3a6; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users_perms
    ADD CONSTRAINT fk_rails_b46072b3a6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2430 (class 2606 OID 1898609)
-- Name: question_options fk_rails_b9c5f61cf9; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.question_options
    ADD CONSTRAINT fk_rails_b9c5f61cf9 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 2432 (class 2606 OID 1898619)
-- Name: questions fk_rails_c50eadc3e3; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_c50eadc3e3 FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 2418 (class 2606 OID 1898549)
-- Name: notification_acknowledgements fk_rails_c7a0a8115a; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.notification_acknowledgements
    ADD CONSTRAINT fk_rails_c7a0a8115a FOREIGN KEY (notification_id) REFERENCES public.notifications(id);


--
-- TOC entry 2412 (class 2606 OID 1898519)
-- Name: answers_question_options fk_rails_da7e58cf37; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.answers_question_options
    ADD CONSTRAINT fk_rails_da7e58cf37 FOREIGN KEY (answer_id) REFERENCES public.answers(id);


--
-- TOC entry 2422 (class 2606 OID 1898569)
-- Name: org_token_permissions fk_rails_e1db1b22c5; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.org_token_permissions
    ADD CONSTRAINT fk_rails_e1db1b22c5 FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2444 (class 2606 OID 1898679)
-- Name: users fk_rails_e73753bccb; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_e73753bccb FOREIGN KEY (org_id) REFERENCES public.orgs(id);


--
-- TOC entry 2428 (class 2606 OID 1898599)
-- Name: plans_guidance_groups fk_rails_ec1c5524d7; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.plans_guidance_groups
    ADD CONSTRAINT fk_rails_ec1c5524d7 FOREIGN KEY (guidance_group_id) REFERENCES public.guidance_groups(id);


--
-- TOC entry 2433 (class 2606 OID 1898624)
-- Name: questions_themes fk_rails_f1d033040c; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.questions_themes
    ADD CONSTRAINT fk_rails_f1d033040c FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 2441 (class 2606 OID 1898664)
-- Name: user_identifiers fk_rails_fe95df7db0; Type: FK CONSTRAINT; Schema: public; Owner: thomas
--

ALTER TABLE ONLY public.user_identifiers
    ADD CONSTRAINT fk_rails_fe95df7db0 FOREIGN KEY (identifier_scheme_id) REFERENCES public.identifier_schemes(id);


--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-06-28 15:54:36 CEST

--
-- PostgreSQL database dump complete
--

