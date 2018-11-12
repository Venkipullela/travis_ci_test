--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: rules_changed(); Type: FUNCTION; Schema: public; Owner: venkatesh
--

CREATE FUNCTION public.rules_changed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                            BEGIN
                                NOTIFY rules_changed;
                                RETURN NEW;
                            END;
                        $$;


ALTER FUNCTION public.rules_changed() OWNER TO venkatesh;

--
-- Name: validators_changed(); Type: FUNCTION; Schema: public; Owner: venkatesh
--

CREATE FUNCTION public.validators_changed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                            BEGIN
                                NOTIFY validators_changed;
                                RETURN NEW;
                            END;
                        $$;


ALTER FUNCTION public.validators_changed() OWNER TO venkatesh;

--
-- Name: xspecs_changed(); Type: FUNCTION; Schema: public; Owner: venkatesh
--

CREATE FUNCTION public.xspecs_changed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                            BEGIN
                                NOTIFY xspecs_changed;
                                RETURN NEW;
                            END;
                        $$;


ALTER FUNCTION public.xspecs_changed() OWNER TO venkatesh;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acko_asset; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_asset (
    id integer NOT NULL,
    kind character varying(100) NOT NULL,
    aid character varying(100) NOT NULL,
    json jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    tracker_id integer,
    user_id integer,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.acko_asset OWNER TO venkatesh;

--
-- Name: acko_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_asset_id_seq OWNER TO venkatesh;

--
-- Name: acko_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_asset_id_seq OWNED BY public.acko_asset.id;


--
-- Name: acko_bankaccount; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_bankaccount (
    id integer NOT NULL,
    account_type character varying(255) NOT NULL,
    account_number character varying(255) NOT NULL,
    account_holder character varying(255) NOT NULL,
    bank_name character varying(255) NOT NULL,
    is_primary boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    account_branch_id integer,
    legal_entity_id integer,
    cheque_image character varying(255) NOT NULL
);


ALTER TABLE public.acko_bankaccount OWNER TO venkatesh;

--
-- Name: acko_bankaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_bankaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_bankaccount_id_seq OWNER TO venkatesh;

--
-- Name: acko_bankaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_bankaccount_id_seq OWNED BY public.acko_bankaccount.id;


--
-- Name: acko_bankbranch; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_bankbranch (
    id integer NOT NULL,
    ifsc character varying(15) NOT NULL,
    micr character varying(15) NOT NULL,
    swift character varying(15) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.acko_bankbranch OWNER TO venkatesh;

--
-- Name: acko_bankbranch_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_bankbranch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_bankbranch_id_seq OWNER TO venkatesh;

--
-- Name: acko_bankbranch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_bankbranch_id_seq OWNED BY public.acko_bankbranch.id;


--
-- Name: acko_contact; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_contact (
    id integer NOT NULL,
    core_id character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.acko_contact OWNER TO venkatesh;

--
-- Name: acko_corecontact_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_corecontact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_corecontact_id_seq OWNER TO venkatesh;

--
-- Name: acko_corecontact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_corecontact_id_seq OWNED BY public.acko_contact.id;


--
-- Name: acko_usercontact; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_usercontact (
    id integer NOT NULL,
    relationship character varying(31) NOT NULL,
    contact_id integer NOT NULL,
    user_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.acko_usercontact OWNER TO venkatesh;

--
-- Name: acko_corecontactusers_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_corecontactusers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_corecontactusers_id_seq OWNER TO venkatesh;

--
-- Name: acko_corecontactusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_corecontactusers_id_seq OWNED BY public.acko_usercontact.id;


--
-- Name: acko_floataccount; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_floataccount (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    balance double precision NOT NULL,
    intermediary_id integer
);


ALTER TABLE public.acko_floataccount OWNER TO venkatesh;

--
-- Name: acko_floataccount_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_floataccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_floataccount_id_seq OWNER TO venkatesh;

--
-- Name: acko_floataccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_floataccount_id_seq OWNED BY public.acko_floataccount.id;


--
-- Name: acko_floatdeposit; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_floatdeposit (
    id integer NOT NULL,
    amount integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    account_id integer NOT NULL,
    added_by_id integer NOT NULL,
    utr_number character varying(255) NOT NULL,
    account_number character varying(16) NOT NULL,
    acko_account_name character varying(255) NOT NULL
);


ALTER TABLE public.acko_floatdeposit OWNER TO venkatesh;

--
-- Name: acko_floatdeposit_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_floatdeposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_floatdeposit_id_seq OWNER TO venkatesh;

--
-- Name: acko_floatdeposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_floatdeposit_id_seq OWNED BY public.acko_floatdeposit.id;


--
-- Name: acko_grouppolicy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_grouppolicy (
    id integer NOT NULL,
    policy_number character varying(100) NOT NULL,
    status character varying(31) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    premium integer,
    premium_breakup jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    account_id integer,
    version integer NOT NULL
);


ALTER TABLE public.acko_grouppolicy OWNER TO venkatesh;

--
-- Name: acko_grouppolicy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_grouppolicy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_grouppolicy_id_seq OWNER TO venkatesh;

--
-- Name: acko_grouppolicy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_grouppolicy_id_seq OWNED BY public.acko_grouppolicy.id;


--
-- Name: acko_gstinvoice; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_gstinvoice (
    id integer NOT NULL,
    sequence bigint NOT NULL,
    invoice_number character varying(16) NOT NULL,
    invoice_date date NOT NULL,
    gstin character varying(31) NOT NULL,
    name character varying(255) NOT NULL,
    address text NOT NULL,
    amount numeric(20,2) NOT NULL,
    cgst numeric(20,2) NOT NULL,
    sgst numeric(20,2) NOT NULL,
    igst numeric(20,2) NOT NULL,
    content_type_id integer,
    object_id integer,
    tax numeric(20,2) NOT NULL,
    total_amount numeric(20,2) NOT NULL,
    CONSTRAINT acko_gstinvoice_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.acko_gstinvoice OWNER TO venkatesh;

--
-- Name: acko_gstinvoice_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_gstinvoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_gstinvoice_id_seq OWNER TO venkatesh;

--
-- Name: acko_gstinvoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_gstinvoice_id_seq OWNED BY public.acko_gstinvoice.id;


--
-- Name: acko_legalentity; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_legalentity (
    id integer NOT NULL,
    pan character varying(15) NOT NULL,
    tan character varying(15) NOT NULL,
    aadhaar character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    object_id integer NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    gst character varying(25) NOT NULL,
    date_of_birth date,
    aadhaar_image character varying(256) NOT NULL,
    gst_image character varying(256) NOT NULL,
    pan_image character varying(256) NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT acko_legalentity_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.acko_legalentity OWNER TO venkatesh;

--
-- Name: acko_legalentity_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_legalentity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_legalentity_id_seq OWNER TO venkatesh;

--
-- Name: acko_legalentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_legalentity_id_seq OWNED BY public.acko_legalentity.id;


--
-- Name: acko_policy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_policy (
    id integer NOT NULL,
    policy_number character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    policy_holder_id integer NOT NULL,
    quote_id integer NOT NULL,
    status character varying(31) NOT NULL,
    payment_id integer NOT NULL,
    document text,
    end_date date NOT NULL,
    start_date date NOT NULL,
    idit_policy_number character varying(100),
    cancelled_on timestamp with time zone
);


ALTER TABLE public.acko_policy OWNER TO venkatesh;

--
-- Name: acko_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_policy_id_seq OWNER TO venkatesh;

--
-- Name: acko_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_policy_id_seq OWNED BY public.acko_policy.id;


--
-- Name: acko_product; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_product (
    id character varying(100) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.acko_product OWNER TO venkatesh;

--
-- Name: acko_publickey; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_publickey (
    id integer NOT NULL,
    object_id integer NOT NULL,
    public_key bytea NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    created_by_id integer NOT NULL,
    CONSTRAINT acko_publickey_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.acko_publickey OWNER TO venkatesh;

--
-- Name: acko_publickey_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_publickey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_publickey_id_seq OWNER TO venkatesh;

--
-- Name: acko_publickey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_publickey_id_seq OWNED BY public.acko_publickey.id;


--
-- Name: acko_quote; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_quote (
    id integer NOT NULL,
    core_id character varying(100) NOT NULL,
    premium numeric(15,2),
    premium_breakup jsonb NOT NULL,
    policy_id character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    parent_id integer,
    asset_dump jsonb NOT NULL,
    endorsement_kind character varying(31) NOT NULL,
    kind character varying(31) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    status character varying(63) NOT NULL,
    payment_id integer,
    token_payment_id integer,
    plans jsonb NOT NULL,
    endorsed_policy_id integer,
    created_by_advisor boolean NOT NULL,
    last_action character varying(31) NOT NULL,
    policy_data jsonb NOT NULL,
    flow character varying(31) NOT NULL,
    furthest_action character varying(31) NOT NULL,
    product character varying(31) NOT NULL,
    uw_discretion_version integer
);


ALTER TABLE public.acko_quote OWNER TO venkatesh;

--
-- Name: acko_quote_assets; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_quote_assets (
    id integer NOT NULL,
    quote_id integer NOT NULL,
    asset_id integer NOT NULL
);


ALTER TABLE public.acko_quote_assets OWNER TO venkatesh;

--
-- Name: acko_quote_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_quote_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_quote_assets_id_seq OWNER TO venkatesh;

--
-- Name: acko_quote_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_quote_assets_id_seq OWNED BY public.acko_quote_assets.id;


--
-- Name: acko_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_quote_id_seq OWNER TO venkatesh;

--
-- Name: acko_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_quote_id_seq OWNED BY public.acko_quote.id;


--
-- Name: acko_skipquestions; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_skipquestions (
    id integer NOT NULL,
    questions jsonb NOT NULL,
    user_id integer,
    tracker_id integer
);


ALTER TABLE public.acko_skipquestions OWNER TO venkatesh;

--
-- Name: acko_skipquestions_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_skipquestions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_skipquestions_id_seq OWNER TO venkatesh;

--
-- Name: acko_skipquestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_skipquestions_id_seq OWNED BY public.acko_skipquestions.id;


--
-- Name: acko_tracker; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_tracker (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    user_id integer,
    browser character varying(255) NOT NULL,
    browser_version character varying(255) NOT NULL,
    code_version character varying(63) NOT NULL,
    device character varying(255) NOT NULL,
    initial_ip inet NOT NULL,
    is_app boolean NOT NULL,
    is_mobile boolean NOT NULL,
    landing_page text NOT NULL,
    os character varying(255) NOT NULL,
    referer text NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    user_agent character varying(500),
    objectionable_pincode boolean,
    extra jsonb
);


ALTER TABLE public.acko_tracker OWNER TO venkatesh;

--
-- Name: acko_tracker_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_tracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_tracker_id_seq OWNER TO venkatesh;

--
-- Name: acko_tracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_tracker_id_seq OWNED BY public.acko_tracker.id;


--
-- Name: acko_vehicle; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_vehicle (
    id integer NOT NULL,
    registration character varying(255) NOT NULL,
    owner_id integer,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.acko_vehicle OWNER TO venkatesh;

--
-- Name: acko_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_vehicle_id_seq OWNER TO venkatesh;

--
-- Name: acko_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_vehicle_id_seq OWNED BY public.acko_vehicle.id;


--
-- Name: acko_visit; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.acko_visit (
    id integer NOT NULL,
    ip inet NOT NULL,
    landing_url text NOT NULL,
    referer text NOT NULL,
    bounce_url text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    tracker_id integer NOT NULL,
    category character varying(255) NOT NULL,
    gclid character varying(255) NOT NULL,
    utm_campaign character varying(255) NOT NULL,
    utm_content character varying(255) NOT NULL,
    utm_medium character varying(255) NOT NULL,
    utm_source character varying(255) NOT NULL,
    utm_term character varying(255) NOT NULL
);


ALTER TABLE public.acko_visit OWNER TO venkatesh;

--
-- Name: acko_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.acko_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acko_visit_id_seq OWNER TO venkatesh;

--
-- Name: acko_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.acko_visit_id_seq OWNED BY public.acko_visit.id;


--
-- Name: ackore_ackoagentlicense; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_ackoagentlicense (
    id integer NOT NULL,
    granted_on timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ackore_ackoagentlicense OWNER TO venkatesh;

--
-- Name: ackore_ackoagentlicense_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_ackoagentlicense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_ackoagentlicense_id_seq OWNER TO venkatesh;

--
-- Name: ackore_ackoagentlicense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_ackoagentlicense_id_seq OWNED BY public.ackore_ackoagentlicense.id;


--
-- Name: ackore_asset; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_asset (
    id integer NOT NULL,
    kind character varying(20) NOT NULL,
    aid character varying(20) NOT NULL,
    data jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.ackore_asset OWNER TO venkatesh;

--
-- Name: ackore_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_asset_id_seq OWNER TO venkatesh;

--
-- Name: ackore_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_asset_id_seq OWNED BY public.ackore_asset.id;


--
-- Name: ackore_ckind; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_ckind (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    schema jsonb NOT NULL
);


ALTER TABLE public.ackore_ckind OWNER TO venkatesh;

--
-- Name: ackore_claim; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_claim (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    policy_id integer NOT NULL,
    claim_kind_id character varying(255) NOT NULL,
    work_id integer NOT NULL
);


ALTER TABLE public.ackore_claim OWNER TO venkatesh;

--
-- Name: ackore_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_claim_id_seq OWNER TO venkatesh;

--
-- Name: ackore_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_claim_id_seq OWNED BY public.ackore_claim.id;


--
-- Name: ackore_coverage; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_coverage (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    kind character varying(20) NOT NULL,
    schema jsonb NOT NULL,
    ckind_id character varying(255),
    data jsonb NOT NULL
);


ALTER TABLE public.ackore_coverage OWNER TO venkatesh;

--
-- Name: ackore_coverage_ekinds; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_coverage_ekinds (
    id integer NOT NULL,
    coverage_id character varying(20) NOT NULL,
    ekind_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_coverage_ekinds OWNER TO venkatesh;

--
-- Name: ackore_coverage_ekinds_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_coverage_ekinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_coverage_ekinds_id_seq OWNER TO venkatesh;

--
-- Name: ackore_coverage_ekinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_coverage_ekinds_id_seq OWNED BY public.ackore_coverage_ekinds.id;


--
-- Name: ackore_ekind; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_ekind (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    schema jsonb NOT NULL
);


ALTER TABLE public.ackore_ekind OWNER TO venkatesh;

--
-- Name: ackore_endorsement; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_endorsement (
    id integer NOT NULL,
    data jsonb NOT NULL,
    status character varying(20) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    ekind_id character varying(20) NOT NULL,
    policy_id integer NOT NULL,
    work_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.ackore_endorsement OWNER TO venkatesh;

--
-- Name: ackore_endorsement_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_endorsement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_endorsement_id_seq OWNER TO venkatesh;

--
-- Name: ackore_endorsement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_endorsement_id_seq OWNED BY public.ackore_endorsement.id;


--
-- Name: ackore_lead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_lead (
    id integer NOT NULL,
    aid character varying(255),
    state character varying(20) NOT NULL,
    asset_id integer,
    user_id integer NOT NULL,
    CONSTRAINT asset_or_aid CHECK ((((asset_id IS NULL) OR (aid IS NULL)) AND ((asset_id IS NOT NULL) OR (aid IS NOT NULL))))
);


ALTER TABLE public.ackore_lead OWNER TO venkatesh;

--
-- Name: ackore_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_lead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_lead_id_seq OWNER TO venkatesh;

--
-- Name: ackore_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_lead_id_seq OWNED BY public.ackore_lead.id;


--
-- Name: ackore_leadsource; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_leadsource (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    lead_id integer NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.ackore_leadsource OWNER TO venkatesh;

--
-- Name: ackore_leadsource_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_leadsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_leadsource_id_seq OWNER TO venkatesh;

--
-- Name: ackore_leadsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_leadsource_id_seq OWNED BY public.ackore_leadsource.id;


--
-- Name: ackore_lob; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_lob (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.ackore_lob OWNER TO venkatesh;

--
-- Name: ackore_plan; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_plan (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    schema jsonb NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE public.ackore_plan OWNER TO venkatesh;

--
-- Name: ackore_plan_addons; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_plan_addons (
    id integer NOT NULL,
    plan_id character varying(20) NOT NULL,
    coverage_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_plan_addons OWNER TO venkatesh;

--
-- Name: ackore_plan_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_plan_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_plan_addons_id_seq OWNER TO venkatesh;

--
-- Name: ackore_plan_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_plan_addons_id_seq OWNED BY public.ackore_plan_addons.id;


--
-- Name: ackore_plan_included; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_plan_included (
    id integer NOT NULL,
    plan_id character varying(20) NOT NULL,
    coverage_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_plan_included OWNER TO venkatesh;

--
-- Name: ackore_plan_included_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_plan_included_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_plan_included_id_seq OWNER TO venkatesh;

--
-- Name: ackore_plan_included_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_plan_included_id_seq OWNED BY public.ackore_plan_included.id;


--
-- Name: ackore_policy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_policy (
    id integer NOT NULL,
    data jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    plan_id character varying(20) NOT NULL,
    user_id integer,
    output jsonb,
    sort_on timestamp with time zone NOT NULL,
    payment_id integer,
    CONSTRAINT validate_amazon_mobile_data CHECK ((((data ? 'plan_order_id'::text) AND ((plan_id)::text = 'amazon_mobile'::text)) OR ((plan_id)::text <> 'amazon_mobile'::text))),
    CONSTRAINT validate_ola_trip_data CHECK ((((data ? 'trip_id'::text) AND ((plan_id)::text = 'ola_trip'::text)) OR ((plan_id)::text <> 'ola_trip'::text)))
);


ALTER TABLE public.ackore_policy OWNER TO venkatesh;

--
-- Name: ackore_policy_addons; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_policy_addons (
    id integer NOT NULL,
    policy_id integer NOT NULL,
    coverage_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_policy_addons OWNER TO venkatesh;

--
-- Name: ackore_policy_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_policy_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_policy_addons_id_seq OWNER TO venkatesh;

--
-- Name: ackore_policy_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_policy_addons_id_seq OWNED BY public.ackore_policy_addons.id;


--
-- Name: ackore_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_policy_id_seq OWNER TO venkatesh;

--
-- Name: ackore_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_policy_id_seq OWNED BY public.ackore_policy.id;


--
-- Name: ackore_product; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_product (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    lob_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_product OWNER TO venkatesh;

--
-- Name: ackore_quote; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_quote (
    id integer NOT NULL,
    data jsonb NOT NULL,
    output jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    session_end timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    payment_id integer,
    plan_id character varying(20) NOT NULL,
    ut_lead_id integer
);


ALTER TABLE public.ackore_quote OWNER TO venkatesh;

--
-- Name: ackore_quote_addons; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_quote_addons (
    id integer NOT NULL,
    quote_id integer NOT NULL,
    coverage_id character varying(20) NOT NULL
);


ALTER TABLE public.ackore_quote_addons OWNER TO venkatesh;

--
-- Name: ackore_quote_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_quote_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_quote_addons_id_seq OWNER TO venkatesh;

--
-- Name: ackore_quote_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_quote_addons_id_seq OWNED BY public.ackore_quote_addons.id;


--
-- Name: ackore_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_quote_id_seq OWNER TO venkatesh;

--
-- Name: ackore_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_quote_id_seq OWNED BY public.ackore_quote.id;


--
-- Name: ackore_relative; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_relative (
    id integer NOT NULL,
    relation character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    relative_id integer,
    user_id integer NOT NULL,
    dob date
);


ALTER TABLE public.ackore_relative OWNER TO venkatesh;

--
-- Name: ackore_relative_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_relative_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_relative_id_seq OWNER TO venkatesh;

--
-- Name: ackore_relative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_relative_id_seq OWNED BY public.ackore_relative.id;


--
-- Name: ackore_userclaimrelation; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_userclaimrelation (
    id integer NOT NULL,
    relation character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    claim_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ackore_userclaimrelation OWNER TO venkatesh;

--
-- Name: ackore_userclaimrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_userclaimrelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_userclaimrelation_id_seq OWNER TO venkatesh;

--
-- Name: ackore_userclaimrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_userclaimrelation_id_seq OWNED BY public.ackore_userclaimrelation.id;


--
-- Name: ackore_userpolicyrelation; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_userpolicyrelation (
    id integer NOT NULL,
    relation character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    nominee_id integer,
    policy_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ackore_userpolicyrelation OWNER TO venkatesh;

--
-- Name: ackore_userpolicyrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_userpolicyrelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_userpolicyrelation_id_seq OWNER TO venkatesh;

--
-- Name: ackore_userpolicyrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_userpolicyrelation_id_seq OWNED BY public.ackore_userpolicyrelation.id;


--
-- Name: ackore_utlead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ackore_utlead (
    id integer NOT NULL,
    aid character varying(255),
    asset_id integer,
    lead_id integer,
    tracker_id integer,
    user_id integer,
    CONSTRAINT asset_or_aid CHECK ((((asset_id IS NULL) OR (aid IS NULL)) AND ((asset_id IS NOT NULL) OR (aid IS NOT NULL)))),
    CONSTRAINT user_or_tracker CHECK ((((user_id IS NULL) OR (tracker_id IS NULL)) AND ((user_id IS NOT NULL) OR (tracker_id IS NOT NULL))))
);


ALTER TABLE public.ackore_utlead OWNER TO venkatesh;

--
-- Name: ackore_utlead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ackore_utlead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ackore_utlead_id_seq OWNER TO venkatesh;

--
-- Name: ackore_utlead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ackore_utlead_id_seq OWNED BY public.ackore_utlead.id;


--
-- Name: activation_campaign; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.activation_campaign (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    agency_id integer NOT NULL
);


ALTER TABLE public.activation_campaign OWNER TO venkatesh;

--
-- Name: activation_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.activation_campaign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activation_campaign_id_seq OWNER TO venkatesh;

--
-- Name: activation_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.activation_campaign_id_seq OWNED BY public.activation_campaign.id;


--
-- Name: activation_lead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.activation_lead (
    id integer NOT NULL,
    registration_number character varying(20) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    agent_id integer NOT NULL,
    campaign_id integer NOT NULL,
    user_id integer NOT NULL,
    age integer,
    vehicle_type character varying(100) NOT NULL
);


ALTER TABLE public.activation_lead OWNER TO venkatesh;

--
-- Name: activation_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.activation_lead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activation_lead_id_seq OWNER TO venkatesh;

--
-- Name: activation_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.activation_lead_id_seq OWNED BY public.activation_lead.id;


--
-- Name: akin_brand; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_brand (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.akin_brand OWNER TO venkatesh;

--
-- Name: akin_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_brand_id_seq OWNER TO venkatesh;

--
-- Name: akin_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_brand_id_seq OWNED BY public.akin_brand.id;


--
-- Name: akin_brandmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_brandmapping (
    id integer NOT NULL,
    string character varying(100) NOT NULL,
    brand_id integer,
    intermediary_id integer
);


ALTER TABLE public.akin_brandmapping OWNER TO venkatesh;

--
-- Name: akin_brandmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_brandmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_brandmapping_id_seq OWNER TO venkatesh;

--
-- Name: akin_brandmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_brandmapping_id_seq OWNED BY public.akin_brandmapping.id;


--
-- Name: akin_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_model (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.akin_model OWNER TO venkatesh;

--
-- Name: akin_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_model_id_seq OWNER TO venkatesh;

--
-- Name: akin_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_model_id_seq OWNED BY public.akin_model.id;


--
-- Name: akin_modelmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_modelmapping (
    id integer NOT NULL,
    string character varying(100) NOT NULL,
    intermediary_id integer,
    model_id integer
);


ALTER TABLE public.akin_modelmapping OWNER TO venkatesh;

--
-- Name: akin_modelmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_modelmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_modelmapping_id_seq OWNER TO venkatesh;

--
-- Name: akin_modelmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_modelmapping_id_seq OWNED BY public.akin_modelmapping.id;


--
-- Name: akin_modelnumber; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_modelnumber (
    id integer NOT NULL,
    model_number character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    data jsonb,
    model_id integer
);


ALTER TABLE public.akin_modelnumber OWNER TO venkatesh;

--
-- Name: akin_modelnumber_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_modelnumber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_modelnumber_id_seq OWNER TO venkatesh;

--
-- Name: akin_modelnumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_modelnumber_id_seq OWNED BY public.akin_modelnumber.id;


--
-- Name: akin_modelnumbermapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_modelnumbermapping (
    id integer NOT NULL,
    string character varying(100) NOT NULL,
    intermediary_id integer,
    model_number_id integer
);


ALTER TABLE public.akin_modelnumbermapping OWNER TO venkatesh;

--
-- Name: akin_modelnumbermapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_modelnumbermapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_modelnumbermapping_id_seq OWNER TO venkatesh;

--
-- Name: akin_modelnumbermapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_modelnumbermapping_id_seq OWNED BY public.akin_modelnumbermapping.id;


--
-- Name: akin_product; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.akin_product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    brand_id integer
);


ALTER TABLE public.akin_product OWNER TO venkatesh;

--
-- Name: akin_product_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.akin_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akin_product_id_seq OWNER TO venkatesh;

--
-- Name: akin_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.akin_product_id_seq OWNED BY public.akin_product.id;


--
-- Name: amazon_mobile_audit; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_mobile_audit (
    id integer NOT NULL,
    plan_order_id character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    log character varying(500),
    record_type character varying(100)
);


ALTER TABLE public.amazon_mobile_audit OWNER TO venkatesh;

--
-- Name: amazon_mobile_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_mobile_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_mobile_audit_id_seq OWNER TO venkatesh;

--
-- Name: amazon_mobile_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_mobile_audit_id_seq OWNED BY public.amazon_mobile_audit.id;


--
-- Name: amazon_mobile_deprecation; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_mobile_deprecation (
    id integer NOT NULL,
    percentage numeric(20,2) NOT NULL,
    ages int4range NOT NULL
);


ALTER TABLE public.amazon_mobile_deprecation OWNER TO venkatesh;

--
-- Name: amazon_mobile_deprecation_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_mobile_deprecation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_mobile_deprecation_id_seq OWNER TO venkatesh;

--
-- Name: amazon_mobile_deprecation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_mobile_deprecation_id_seq OWNED BY public.amazon_mobile_deprecation.id;


--
-- Name: amazon_mobile_phoneowner; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_mobile_phoneowner (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    policy_id integer NOT NULL,
    user_id integer NOT NULL,
    relation_with_owner character varying(255) NOT NULL
);


ALTER TABLE public.amazon_mobile_phoneowner OWNER TO venkatesh;

--
-- Name: amazon_mobile_phoneowner_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_mobile_phoneowner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_mobile_phoneowner_id_seq OWNER TO venkatesh;

--
-- Name: amazon_mobile_phoneowner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_mobile_phoneowner_id_seq OWNED BY public.amazon_mobile_phoneowner.id;


--
-- Name: amazon_mobile_plan; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_mobile_plan (
    id integer NOT NULL,
    plan_name character varying(255) NOT NULL,
    premium numeric(9,2) NOT NULL,
    asin character varying(255) NOT NULL,
    plan_type character varying(100) NOT NULL,
    calculation_type character varying(100) NOT NULL,
    premium_percentage numeric(9,3),
    coverage_duration integer NOT NULL,
    launch_end_date date,
    launch_start_date date,
    purchase_type character varying(100) NOT NULL
);


ALTER TABLE public.amazon_mobile_plan OWNER TO venkatesh;

--
-- Name: amazon_mobile_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_mobile_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_mobile_plan_id_seq OWNER TO venkatesh;

--
-- Name: amazon_mobile_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_mobile_plan_id_seq OWNED BY public.amazon_mobile_plan.id;


--
-- Name: amazon_mobile_policy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_mobile_policy (
    id integer NOT NULL,
    customer_name character varying(255),
    customer_purchase_id character varying(255),
    address text,
    city character varying(255),
    state character varying(255),
    sale_price numeric(20,2),
    status character varying(255),
    email public.citext,
    purchased_on timestamp with time zone,
    dispatched_on timestamp with time zone,
    invoiced_on timestamp with time zone,
    payment_mode character varying(255),
    imei character varying(255),
    delivered_on timestamp with time zone,
    customer_id character varying(255),
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    cancelled_on timestamp with time zone,
    pincode_id integer,
    user_id integer,
    item_name text,
    phone_order_id character varying(255),
    plan_order_id character varying(255),
    plan_id integer,
    subscription_end timestamp with time zone,
    subscription_start timestamp with time zone,
    is_policy_complete boolean,
    document text,
    policy_number character varying(15),
    sequence integer,
    plan_price numeric(20,2),
    insurance_cancellation_date timestamp with time zone,
    insurance_delivery_date timestamp with time zone,
    mobile_cancellation_date timestamp with time zone,
    mobile_delivery_date timestamp with time zone
);


ALTER TABLE public.amazon_mobile_policy OWNER TO venkatesh;

--
-- Name: amazon_mobile_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_mobile_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_mobile_policy_id_seq OWNER TO venkatesh;

--
-- Name: amazon_mobile_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_mobile_policy_id_seq OWNED BY public.amazon_mobile_policy.id;


--
-- Name: amazon_seller_category; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_category (
    id integer NOT NULL,
    category_id character varying(63) NOT NULL,
    name character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.amazon_seller_category OWNER TO venkatesh;

--
-- Name: amazon_seller_category_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_category_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_category_id_seq OWNED BY public.amazon_seller_category.id;


--
-- Name: amazon_seller_claim; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_claim (
    id integer NOT NULL,
    quantity integer NOT NULL,
    location character varying(255) NOT NULL,
    raised_on timestamp with time zone NOT NULL,
    received_on timestamp with time zone NOT NULL,
    settled_on timestamp with time zone,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    questionnaire_response character varying(255) NOT NULL,
    grade character varying(255) NOT NULL,
    seller_id integer NOT NULL,
    shipment_id integer NOT NULL,
    claim_amount_paid numeric(9,2) NOT NULL,
    claim_amount_requested numeric(9,2) NOT NULL,
    outstanding_value numeric(9,2) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.amazon_seller_claim OWNER TO venkatesh;

--
-- Name: amazon_seller_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_claim_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_claim_id_seq OWNED BY public.amazon_seller_claim.id;


--
-- Name: amazon_seller_claimcsv; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_claimcsv (
    id integer NOT NULL,
    path_to_s3 character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    received_on timestamp with time zone NOT NULL,
    processed_on timestamp with time zone NOT NULL,
    no_of_records integer NOT NULL,
    records_successful integer NOT NULL,
    records_failed integer NOT NULL
);


ALTER TABLE public.amazon_seller_claimcsv OWNER TO venkatesh;

--
-- Name: amazon_seller_claimcsv_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_claimcsv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_claimcsv_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_claimcsv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_claimcsv_id_seq OWNED BY public.amazon_seller_claimcsv.id;


--
-- Name: amazon_seller_cohort; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_cohort (
    id integer NOT NULL,
    policy_amount double precision NOT NULL,
    no_of_claims integer NOT NULL,
    claim_amount double precision NOT NULL,
    shipment_csv_id integer NOT NULL,
    balance double precision NOT NULL,
    created_on date NOT NULL,
    updated_on date NOT NULL
);


ALTER TABLE public.amazon_seller_cohort OWNER TO venkatesh;

--
-- Name: amazon_seller_cohert_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_cohert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_cohert_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_cohert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_cohert_id_seq OWNED BY public.amazon_seller_cohort.id;


--
-- Name: amazon_seller_premiumparam; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_premiumparam (
    id integer NOT NULL,
    premium double precision NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.amazon_seller_premiumparam OWNER TO venkatesh;

--
-- Name: amazon_seller_premiumparam_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_premiumparam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_premiumparam_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_premiumparam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_premiumparam_id_seq OWNED BY public.amazon_seller_premiumparam.id;


--
-- Name: amazon_seller_seller; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_seller (
    id integer NOT NULL,
    seller_id character varying(63) NOT NULL,
    name character varying(255) NOT NULL,
    email public.citext,
    gstin character varying(31) NOT NULL,
    received_on timestamp with time zone NOT NULL,
    enrolled_on timestamp with time zone,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    acko_poc_id integer,
    poc_id integer,
    user_id integer
);


ALTER TABLE public.amazon_seller_seller OWNER TO venkatesh;

--
-- Name: amazon_seller_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_seller_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_seller_id_seq OWNED BY public.amazon_seller_seller.id;


--
-- Name: amazon_seller_sellercsv; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_sellercsv (
    id integer NOT NULL,
    path_to_s3 character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    received_on timestamp with time zone NOT NULL,
    processed_on timestamp with time zone NOT NULL,
    no_of_records integer NOT NULL,
    records_successful integer NOT NULL,
    records_failed integer NOT NULL
);


ALTER TABLE public.amazon_seller_sellercsv OWNER TO venkatesh;

--
-- Name: amazon_seller_sellercsv_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_sellercsv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_sellercsv_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_sellercsv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_sellercsv_id_seq OWNED BY public.amazon_seller_sellercsv.id;


--
-- Name: amazon_seller_settlement; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_settlement (
    id integer NOT NULL,
    settlement_date timestamp with time zone NOT NULL,
    utr_number character varying(255) NOT NULL,
    amount numeric(20,2) NOT NULL,
    status character varying(255) NOT NULL,
    created_on date NOT NULL,
    updated_on date NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.amazon_seller_settlement OWNER TO venkatesh;

--
-- Name: amazon_seller_settlement_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_settlement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_settlement_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_settlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_settlement_id_seq OWNED BY public.amazon_seller_settlement.id;


--
-- Name: amazon_seller_shipment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_shipment (
    id integer NOT NULL,
    sub_category_name character varying(255) NOT NULL,
    shipment_item_id character varying(31) NOT NULL,
    quantity integer NOT NULL,
    ordered_on timestamp with time zone NOT NULL,
    slam_date timestamp with time zone NOT NULL,
    sale_price numeric(9,2) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    category_id integer NOT NULL,
    seller_id integer NOT NULL,
    premium numeric(9,2) NOT NULL,
    cohort_id integer NOT NULL
);


ALTER TABLE public.amazon_seller_shipment OWNER TO venkatesh;

--
-- Name: amazon_seller_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_shipment_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_shipment_id_seq OWNED BY public.amazon_seller_shipment.id;


--
-- Name: amazon_seller_shipmentcsv; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_shipmentcsv (
    id integer NOT NULL,
    path_to_s3 character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    received_on timestamp with time zone NOT NULL,
    processed_on timestamp with time zone NOT NULL,
    no_of_records integer NOT NULL,
    records_successful integer NOT NULL,
    records_failed integer NOT NULL
);


ALTER TABLE public.amazon_seller_shipmentcsv OWNER TO venkatesh;

--
-- Name: amazon_seller_shipmentcsv_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_shipmentcsv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_shipmentcsv_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_shipmentcsv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_shipmentcsv_id_seq OWNED BY public.amazon_seller_shipmentcsv.id;


--
-- Name: amazon_seller_subscription; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.amazon_seller_subscription (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_on date NOT NULL,
    updated_on date NOT NULL,
    seller_id integer NOT NULL,
    status character varying(255) NOT NULL,
    auto_renew boolean NOT NULL,
    cancellation_reason character varying(255),
    cancelled_on date
);


ALTER TABLE public.amazon_seller_subscription OWNER TO venkatesh;

--
-- Name: amazon_seller_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.amazon_seller_subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amazon_seller_subscription_id_seq OWNER TO venkatesh;

--
-- Name: amazon_seller_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.amazon_seller_subscription_id_seq OWNED BY public.amazon_seller_subscription.id;


--
-- Name: analytics_attributedsource; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.analytics_attributedsource (
    id integer NOT NULL,
    tracker_id character varying(255) NOT NULL,
    visit_id integer NOT NULL,
    source character varying(255) NOT NULL,
    attributed_source character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    current_visit_id integer NOT NULL
);


ALTER TABLE public.analytics_attributedsource OWNER TO venkatesh;

--
-- Name: analytics_attributedsource_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.analytics_attributedsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_attributedsource_id_seq OWNER TO venkatesh;

--
-- Name: analytics_attributedsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.analytics_attributedsource_id_seq OWNED BY public.analytics_attributedsource.id;


--
-- Name: analytics_sources; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.analytics_sources (
    id integer NOT NULL,
    source_identifier character varying(255) NOT NULL,
    source_type character varying(255) NOT NULL
);


ALTER TABLE public.analytics_sources OWNER TO venkatesh;

--
-- Name: analytics_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.analytics_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_sources_id_seq OWNER TO venkatesh;

--
-- Name: analytics_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.analytics_sources_id_seq OWNED BY public.analytics_sources.id;


--
-- Name: audatex_bill; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_bill (
    id integer NOT NULL,
    aduatex_task_id character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    token_created_on timestamp with time zone,
    field_id integer NOT NULL,
    work_id integer NOT NULL,
    task_id integer
);


ALTER TABLE public.audatex_bill OWNER TO venkatesh;

--
-- Name: audatex_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_bill_id_seq OWNER TO venkatesh;

--
-- Name: audatex_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_bill_id_seq OWNED BY public.audatex_bill.id;


--
-- Name: audatex_make; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_make (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);


ALTER TABLE public.audatex_make OWNER TO venkatesh;

--
-- Name: audatex_make_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_make_id_seq OWNER TO venkatesh;

--
-- Name: audatex_make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_make_id_seq OWNED BY public.audatex_make.id;


--
-- Name: audatex_make_makes; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_make_makes (
    id integer NOT NULL,
    from_make_id integer NOT NULL,
    to_make_id integer NOT NULL
);


ALTER TABLE public.audatex_make_makes OWNER TO venkatesh;

--
-- Name: audatex_make_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_make_makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_make_makes_id_seq OWNER TO venkatesh;

--
-- Name: audatex_make_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_make_makes_id_seq OWNED BY public.audatex_make_makes.id;


--
-- Name: audatex_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_model (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    make_id integer NOT NULL
);


ALTER TABLE public.audatex_model OWNER TO venkatesh;

--
-- Name: audatex_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_model_id_seq OWNER TO venkatesh;

--
-- Name: audatex_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_model_id_seq OWNED BY public.audatex_model.id;


--
-- Name: audatex_model_models; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_model_models (
    id integer NOT NULL,
    from_model_id integer NOT NULL,
    to_model_id integer NOT NULL
);


ALTER TABLE public.audatex_model_models OWNER TO venkatesh;

--
-- Name: audatex_model_models_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_model_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_model_models_id_seq OWNER TO venkatesh;

--
-- Name: audatex_model_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_model_models_id_seq OWNED BY public.audatex_model_models.id;


--
-- Name: audatex_variant; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_variant (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.audatex_variant OWNER TO venkatesh;

--
-- Name: audatex_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_variant_id_seq OWNER TO venkatesh;

--
-- Name: audatex_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_variant_id_seq OWNED BY public.audatex_variant.id;


--
-- Name: audatex_variantmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.audatex_variantmapping (
    id integer NOT NULL,
    acko_variant_id integer NOT NULL,
    audatex_variant_id integer NOT NULL
);


ALTER TABLE public.audatex_variantmapping OWNER TO venkatesh;

--
-- Name: audatex_variantmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.audatex_variantmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audatex_variantmapping_id_seq OWNER TO venkatesh;

--
-- Name: audatex_variantmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.audatex_variantmapping_id_seq OWNED BY public.audatex_variantmapping.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO venkatesh;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO venkatesh;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO venkatesh;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO venkatesh;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO venkatesh;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO venkatesh;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO venkatesh;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO venkatesh;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email public.citext,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    joined_on timestamp with time zone NOT NULL,
    phone character varying(20),
    available boolean NOT NULL,
    idle boolean NOT NULL,
    latlong public.geography(Point,4326),
    company_id integer,
    is_online boolean NOT NULL,
    on_call boolean NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    classification character varying(10) NOT NULL
);


ALTER TABLE public.users_user OWNER TO venkatesh;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO venkatesh;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO venkatesh;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO venkatesh;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: bike_quote; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.bike_quote (
    id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    chasis_number character varying(50) NOT NULL,
    engine_number character varying(50) NOT NULL,
    registration_year character varying(4) NOT NULL,
    cc integer,
    color_code character varying(31) NOT NULL,
    premiums jsonb NOT NULL,
    rto_id integer,
    state_id integer NOT NULL,
    variant_id integer,
    CONSTRAINT bike_quote_cc_check CHECK ((cc >= 0)),
    CONSTRAINT bike_quote_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.bike_quote OWNER TO venkatesh;

--
-- Name: bike_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.bike_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bike_quote_id_seq OWNER TO venkatesh;

--
-- Name: bike_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.bike_quote_id_seq OWNED BY public.bike_quote.id;


--
-- Name: bitly_link; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.bitly_link (
    id bigint NOT NULL,
    short character varying(200) NOT NULL,
    url text NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.bitly_link OWNER TO venkatesh;

--
-- Name: bitly_link_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.bitly_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitly_link_id_seq OWNER TO venkatesh;

--
-- Name: bitly_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.bitly_link_id_seq OWNED BY public.bitly_link.id;


--
-- Name: c3po_data; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_data (
    id integer NOT NULL,
    key character varying(200) NOT NULL,
    value text NOT NULL,
    "order" integer NOT NULL,
    segment_id integer NOT NULL
);


ALTER TABLE public.c3po_data OWNER TO venkatesh;

--
-- Name: c3po_data_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_data_id_seq OWNER TO venkatesh;

--
-- Name: c3po_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_data_id_seq OWNED BY public.c3po_data.id;


--
-- Name: c3po_dimension; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_dimension (
    id integer NOT NULL,
    dimension character varying(200) NOT NULL,
    value character varying(200) NOT NULL,
    okind_id character varying(200) NOT NULL
);


ALTER TABLE public.c3po_dimension OWNER TO venkatesh;

--
-- Name: c3po_dimension_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_dimension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_dimension_id_seq OWNER TO venkatesh;

--
-- Name: c3po_dimension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_dimension_id_seq OWNED BY public.c3po_dimension.id;


--
-- Name: c3po_field; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_field (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    kind character varying(20) NOT NULL,
    okind_id character varying(200) NOT NULL
);


ALTER TABLE public.c3po_field OWNER TO venkatesh;

--
-- Name: c3po_field_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_field_id_seq OWNER TO venkatesh;

--
-- Name: c3po_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_field_id_seq OWNED BY public.c3po_field.id;


--
-- Name: c3po_filter; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_filter (
    id integer NOT NULL,
    kind character varying(20) NOT NULL,
    value text NOT NULL,
    segment_id integer NOT NULL
);


ALTER TABLE public.c3po_filter OWNER TO venkatesh;

--
-- Name: c3po_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_filter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_filter_id_seq OWNER TO venkatesh;

--
-- Name: c3po_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_filter_id_seq OWNED BY public.c3po_filter.id;


--
-- Name: c3po_okind; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_okind (
    name character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.c3po_okind OWNER TO venkatesh;

--
-- Name: c3po_relation; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_relation (
    id integer NOT NULL,
    many_id character varying(200) NOT NULL,
    one_id character varying(200) NOT NULL
);


ALTER TABLE public.c3po_relation OWNER TO venkatesh;

--
-- Name: c3po_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_relation_id_seq OWNER TO venkatesh;

--
-- Name: c3po_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_relation_id_seq OWNED BY public.c3po_relation.id;


--
-- Name: c3po_segment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.c3po_segment (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    operator character varying(1) NOT NULL,
    okind_id character varying(200) NOT NULL
);


ALTER TABLE public.c3po_segment OWNER TO venkatesh;

--
-- Name: c3po_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.c3po_segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c3po_segment_id_seq OWNER TO venkatesh;

--
-- Name: c3po_segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.c3po_segment_id_seq OWNED BY public.c3po_segment.id;


--
-- Name: cardekho_make; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_make (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    extra jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    update_on timestamp with time zone NOT NULL
);


ALTER TABLE public.cardekho_make OWNER TO venkatesh;

--
-- Name: cardekho_make_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_make_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_make_id_seq OWNED BY public.cardekho_make.id;


--
-- Name: cardekho_makemapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_makemapping (
    id integer NOT NULL,
    acko_make_id integer NOT NULL,
    cardekho_make_id integer NOT NULL
);


ALTER TABLE public.cardekho_makemapping OWNER TO venkatesh;

--
-- Name: cardekho_makemapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_makemapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_makemapping_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_makemapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_makemapping_id_seq OWNED BY public.cardekho_makemapping.id;


--
-- Name: cardekho_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_model (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    extra jsonb NOT NULL,
    url character varying(200) NOT NULL,
    dump text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    update_on timestamp with time zone NOT NULL,
    make_id integer NOT NULL
);


ALTER TABLE public.cardekho_model OWNER TO venkatesh;

--
-- Name: cardekho_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_model_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_model_id_seq OWNED BY public.cardekho_model.id;


--
-- Name: cardekho_modelcolor; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_modelcolor (
    id integer NOT NULL,
    name character varying(31) NOT NULL,
    code character varying(31) NOT NULL,
    hex character varying(7) NOT NULL,
    image character varying(100) NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.cardekho_modelcolor OWNER TO venkatesh;

--
-- Name: cardekho_modelcolor_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_modelcolor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_modelcolor_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_modelcolor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_modelcolor_id_seq OWNED BY public.cardekho_modelcolor.id;


--
-- Name: cardekho_modelmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_modelmapping (
    id integer NOT NULL,
    acko_model_id integer NOT NULL,
    cardekho_model_id integer NOT NULL
);


ALTER TABLE public.cardekho_modelmapping OWNER TO venkatesh;

--
-- Name: cardekho_modelmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_modelmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_modelmapping_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_modelmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_modelmapping_id_seq OWNED BY public.cardekho_modelmapping.id;


--
-- Name: cardekho_variant; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_variant (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    extra jsonb NOT NULL,
    ex_showroom_price character varying(31) NOT NULL,
    cc smallint,
    seating_capacity smallint,
    fuel_type character varying(255) NOT NULL,
    length smallint,
    width smallint,
    height smallint,
    wheel_base smallint,
    discontinued boolean NOT NULL,
    url character varying(200) NOT NULL,
    dump text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    update_on timestamp with time zone NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.cardekho_variant OWNER TO venkatesh;

--
-- Name: cardekho_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_variant_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_variant_id_seq OWNED BY public.cardekho_variant.id;


--
-- Name: cardekho_variantmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cardekho_variantmapping (
    id integer NOT NULL,
    acko_variant_id integer NOT NULL,
    cardekho_variant_id integer NOT NULL
);


ALTER TABLE public.cardekho_variantmapping OWNER TO venkatesh;

--
-- Name: cardekho_variantmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cardekho_variantmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardekho_variantmapping_id_seq OWNER TO venkatesh;

--
-- Name: cardekho_variantmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cardekho_variantmapping_id_seq OWNED BY public.cardekho_variantmapping.id;


--
-- Name: commercialtp_commercialtppolicy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.commercialtp_commercialtppolicy (
    id integer NOT NULL,
    policy_number character varying(100) NOT NULL,
    policy_start_date date NOT NULL,
    policy_end_date date NOT NULL,
    intermediary_name character varying(100) NOT NULL,
    intermediary_code character varying(100) NOT NULL,
    intermidiary_license_number character varying(100) NOT NULL,
    pos_name character varying(100) NOT NULL,
    pos_contact character varying(100) NOT NULL,
    is_new boolean NOT NULL,
    previous_policy_number character varying(100) NOT NULL,
    previous_policy_type character varying(100) NOT NULL,
    vehicle_type character varying(100) NOT NULL,
    vehicle_sub_type character varying(100) NOT NULL,
    vehicle_usage character varying(100) NOT NULL,
    make character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    variant character varying(100) NOT NULL,
    cc integer NOT NULL,
    fuel_type character varying(100) NOT NULL,
    licensed_capacity integer NOT NULL,
    registation_number character varying(20) NOT NULL,
    manufacturing_year character varying(100) NOT NULL,
    registration_year character varying(100) NOT NULL,
    engine_number character varying(100) NOT NULL,
    chassis_number character varying(100) NOT NULL,
    registration_place character varying(100) NOT NULL,
    insured_name character varying(100) NOT NULL,
    insured_type character varying(100) NOT NULL,
    communication_address text NOT NULL,
    communication_state character varying(100) NOT NULL,
    communication_city character varying(100) NOT NULL,
    communication_pincode character varying(100) NOT NULL,
    registration_address text NOT NULL,
    registation_state character varying(100) NOT NULL,
    registation_city character varying(100) NOT NULL,
    registation_pincode character varying(100) NOT NULL,
    contact_landline character varying(100) NOT NULL,
    contact_mobile character varying(100) NOT NULL,
    insured_bank_account_number character varying(100) NOT NULL,
    insured_bank character varying(100) NOT NULL,
    ifsc_code character varying(100) NOT NULL,
    payment_mode character varying(100) NOT NULL,
    pa_owner_driver_nominee character varying(100) NOT NULL,
    pa_owner_driver_nominee_age integer,
    pa_owner_driver_nominee_relationship character varying(100) NOT NULL,
    pa_staff boolean NOT NULL,
    pa_staff_number integer NOT NULL,
    pa_staff_sum_assured numeric(20,2) NOT NULL,
    pa_unnamed boolean NOT NULL,
    pa_unnamed_number integer NOT NULL,
    pa_unnamed_sum_assured numeric(20,2) NOT NULL,
    legal_liability_staff boolean NOT NULL,
    legal_liability_staff_number integer NOT NULL,
    base_premium numeric(20,2) NOT NULL,
    extra_covers_premium numeric(20,2) NOT NULL,
    gst numeric(20,2) NOT NULL,
    total_premium numeric(20,2) NOT NULL,
    transaction_date date NOT NULL,
    file character varying(100) NOT NULL,
    policy_document text,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    pa_owner_driver boolean NOT NULL,
    policy_status character varying(100) NOT NULL,
    CONSTRAINT commercialtp_commercialtppol_legal_liability_staff_number_check CHECK ((legal_liability_staff_number >= 0)),
    CONSTRAINT commercialtp_commercialtppoli_pa_owner_driver_nominee_age_check CHECK ((pa_owner_driver_nominee_age >= 0)),
    CONSTRAINT commercialtp_commercialtppolicy_cc_check CHECK ((cc >= 0)),
    CONSTRAINT commercialtp_commercialtppolicy_licensed_capacity_check CHECK ((licensed_capacity >= 0)),
    CONSTRAINT commercialtp_commercialtppolicy_pa_staff_number_check CHECK ((pa_staff_number >= 0)),
    CONSTRAINT commercialtp_commercialtppolicy_pa_unnamed_number_check CHECK ((pa_unnamed_number >= 0))
);


ALTER TABLE public.commercialtp_commercialtppolicy OWNER TO venkatesh;

--
-- Name: commercialtp_commercialtppolicy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.commercialtp_commercialtppolicy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commercialtp_commercialtppolicy_id_seq OWNER TO venkatesh;

--
-- Name: commercialtp_commercialtppolicy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.commercialtp_commercialtppolicy_id_seq OWNED BY public.commercialtp_commercialtppolicy.id;


--
-- Name: computron_kdone; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.computron_kdone (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.computron_kdone OWNER TO venkatesh;

--
-- Name: computron_kdone_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.computron_kdone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computron_kdone_id_seq OWNER TO venkatesh;

--
-- Name: computron_kdone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.computron_kdone_id_seq OWNED BY public.computron_kdone.id;


--
-- Name: computron_kquery; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.computron_kquery (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.computron_kquery OWNER TO venkatesh;

--
-- Name: computron_kquery_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.computron_kquery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computron_kquery_id_seq OWNER TO venkatesh;

--
-- Name: computron_kquery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.computron_kquery_id_seq OWNED BY public.computron_kquery.id;


--
-- Name: computron_kvalidator; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.computron_kvalidator (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.computron_kvalidator OWNER TO venkatesh;

--
-- Name: computron_kvalidator_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.computron_kvalidator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computron_kvalidator_id_seq OWNER TO venkatesh;

--
-- Name: computron_kvalidator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.computron_kvalidator_id_seq OWNED BY public.computron_kvalidator.id;


--
-- Name: computron_raction; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.computron_raction (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.computron_raction OWNER TO venkatesh;

--
-- Name: computron_raction_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.computron_raction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computron_raction_id_seq OWNER TO venkatesh;

--
-- Name: computron_raction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.computron_raction_id_seq OWNED BY public.computron_raction.id;


--
-- Name: computron_rnotify; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.computron_rnotify (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.computron_rnotify OWNER TO venkatesh;

--
-- Name: computron_rnotify_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.computron_rnotify_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computron_rnotify_id_seq OWNER TO venkatesh;

--
-- Name: computron_rnotify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.computron_rnotify_id_seq OWNED BY public.computron_rnotify.id;


--
-- Name: coverfox_make; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.coverfox_make (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    acko_make_id integer,
    cf_id integer
);


ALTER TABLE public.coverfox_make OWNER TO venkatesh;

--
-- Name: coverfox_make_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.coverfox_make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coverfox_make_id_seq OWNER TO venkatesh;

--
-- Name: coverfox_make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.coverfox_make_id_seq OWNED BY public.coverfox_make.id;


--
-- Name: coverfox_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.coverfox_model (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    acko_model_id integer,
    make_id integer NOT NULL,
    cf_id integer
);


ALTER TABLE public.coverfox_model OWNER TO venkatesh;

--
-- Name: coverfox_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.coverfox_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coverfox_model_id_seq OWNER TO venkatesh;

--
-- Name: coverfox_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.coverfox_model_id_seq OWNED BY public.coverfox_model.id;


--
-- Name: coverfox_variant; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.coverfox_variant (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ex_showroom_price character varying(31) NOT NULL,
    cc smallint,
    seating_capacity smallint,
    fuel_type character varying(255) NOT NULL,
    vehicle_type character varying(25) NOT NULL,
    model_id integer NOT NULL,
    cf_id integer
);


ALTER TABLE public.coverfox_variant OWNER TO venkatesh;

--
-- Name: coverfox_variant_acko_variants; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.coverfox_variant_acko_variants (
    id integer NOT NULL,
    from_variant_id integer NOT NULL,
    to_variant_id integer NOT NULL
);


ALTER TABLE public.coverfox_variant_acko_variants OWNER TO venkatesh;

--
-- Name: coverfox_variant_acko_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.coverfox_variant_acko_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coverfox_variant_acko_variants_id_seq OWNER TO venkatesh;

--
-- Name: coverfox_variant_acko_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.coverfox_variant_acko_variants_id_seq OWNED BY public.coverfox_variant_acko_variants.id;


--
-- Name: coverfox_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.coverfox_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coverfox_variant_id_seq OWNER TO venkatesh;

--
-- Name: coverfox_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.coverfox_variant_id_seq OWNED BY public.coverfox_variant.id;


--
-- Name: cuvora_vehicledata; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.cuvora_vehicledata (
    id integer NOT NULL,
    registration_number character varying(20) NOT NULL,
    owner_name character varying(50),
    owner_address character varying(200),
    registration_date character varying(30),
    vehicle_class character varying(30),
    color character varying(20),
    meta character varying(100),
    cc character varying(15),
    owner_num character varying(20),
    engine_no character varying(30),
    chasis_no character varying(30),
    rto character varying(50),
    fuel_type character varying(20),
    car_image_url character varying(100),
    car_company_name character varying(30),
    car_key1 character varying(100),
    car_key2 character varying(100),
    car_variants character varying(100),
    car_variant_code character varying(30),
    car_model_name character varying(40),
    car_price character varying(50),
    car_id integer NOT NULL,
    response jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.cuvora_vehicledata OWNER TO venkatesh;

--
-- Name: cuvora_vehicledata_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.cuvora_vehicledata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuvora_vehicledata_id_seq OWNER TO venkatesh;

--
-- Name: cuvora_vehicledata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.cuvora_vehicledata_id_seq OWNED BY public.cuvora_vehicledata.id;


--
-- Name: devops_deployment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.devops_deployment (
    id integer NOT NULL,
    hash character varying(40) NOT NULL,
    server character varying(30) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.devops_deployment OWNER TO venkatesh;

--
-- Name: devops_deployment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.devops_deployment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devops_deployment_id_seq OWNER TO venkatesh;

--
-- Name: devops_deployment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.devops_deployment_id_seq OWNED BY public.devops_deployment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO venkatesh;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO venkatesh;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO venkatesh;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO venkatesh;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO venkatesh;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO venkatesh;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO venkatesh;

--
-- Name: explorer_query; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.explorer_query (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    sql text NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    last_run_date timestamp with time zone NOT NULL,
    created_by_user_id integer,
    snapshot boolean NOT NULL
);


ALTER TABLE public.explorer_query OWNER TO venkatesh;

--
-- Name: explorer_query_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.explorer_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.explorer_query_id_seq OWNER TO venkatesh;

--
-- Name: explorer_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.explorer_query_id_seq OWNED BY public.explorer_query.id;


--
-- Name: explorer_querylog; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.explorer_querylog (
    id integer NOT NULL,
    sql text,
    run_at timestamp with time zone NOT NULL,
    query_id integer,
    run_by_user_id integer,
    duration double precision
);


ALTER TABLE public.explorer_querylog OWNER TO venkatesh;

--
-- Name: explorer_querylog_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.explorer_querylog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.explorer_querylog_id_seq OWNER TO venkatesh;

--
-- Name: explorer_querylog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.explorer_querylog_id_seq OWNED BY public.explorer_querylog.id;


--
-- Name: fastlane_fastlane; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_fastlane (
    id integer NOT NULL,
    registration_number character varying(32) NOT NULL,
    data jsonb NOT NULL,
    status character varying(64) NOT NULL,
    fetched_on timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    variant_id integer
);


ALTER TABLE public.fastlane_fastlane OWNER TO venkatesh;

--
-- Name: fastlane_fastlane_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_fastlane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_fastlane_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_fastlane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_fastlane_id_seq OWNED BY public.fastlane_fastlane.id;


--
-- Name: fastlane_make; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_make (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.fastlane_make OWNER TO venkatesh;

--
-- Name: fastlane_make_acko_makes; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_make_acko_makes (
    id integer NOT NULL,
    from_make_id integer NOT NULL,
    to_make_id integer NOT NULL
);


ALTER TABLE public.fastlane_make_acko_makes OWNER TO venkatesh;

--
-- Name: fastlane_make_acko_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_make_acko_makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_make_acko_makes_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_make_acko_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_make_acko_makes_id_seq OWNED BY public.fastlane_make_acko_makes.id;


--
-- Name: fastlane_make_cf_makes; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_make_cf_makes (
    id integer NOT NULL,
    from_make_id integer NOT NULL,
    to_make_id integer NOT NULL
);


ALTER TABLE public.fastlane_make_cf_makes OWNER TO venkatesh;

--
-- Name: fastlane_make_cf_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_make_cf_makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_make_cf_makes_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_make_cf_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_make_cf_makes_id_seq OWNED BY public.fastlane_make_cf_makes.id;


--
-- Name: fastlane_make_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_make_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_make_id_seq OWNED BY public.fastlane_make.id;


--
-- Name: fastlane_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_model (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    make_id integer NOT NULL
);


ALTER TABLE public.fastlane_model OWNER TO venkatesh;

--
-- Name: fastlane_model_acko_models; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_model_acko_models (
    id integer NOT NULL,
    from_model_id integer NOT NULL,
    to_model_id integer NOT NULL
);


ALTER TABLE public.fastlane_model_acko_models OWNER TO venkatesh;

--
-- Name: fastlane_model_acko_models_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_model_acko_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_model_acko_models_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_model_acko_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_model_acko_models_id_seq OWNED BY public.fastlane_model_acko_models.id;


--
-- Name: fastlane_model_cf_models; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_model_cf_models (
    id integer NOT NULL,
    from_model_id integer NOT NULL,
    to_model_id integer NOT NULL
);


ALTER TABLE public.fastlane_model_cf_models OWNER TO venkatesh;

--
-- Name: fastlane_model_cf_models_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_model_cf_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_model_cf_models_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_model_cf_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_model_cf_models_id_seq OWNED BY public.fastlane_model_cf_models.id;


--
-- Name: fastlane_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_model_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_model_id_seq OWNED BY public.fastlane_model.id;


--
-- Name: fastlane_variant; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_variant (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ex_showroom_price double precision,
    cc smallint,
    seating_capacity smallint,
    fuel_type character varying(255) NOT NULL,
    vehicle_type character varying(25) NOT NULL,
    model_id integer NOT NULL,
    extra jsonb NOT NULL,
    sub_variant character varying(255) NOT NULL,
    transmission_type character varying(31) NOT NULL,
    master_id character varying(255) NOT NULL
);


ALTER TABLE public.fastlane_variant OWNER TO venkatesh;

--
-- Name: fastlane_variant_acko_variants; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_variant_acko_variants (
    id integer NOT NULL,
    from_variant_id integer NOT NULL,
    to_variant_id integer NOT NULL
);


ALTER TABLE public.fastlane_variant_acko_variants OWNER TO venkatesh;

--
-- Name: fastlane_variant_acko_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_variant_acko_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_variant_acko_variants_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_variant_acko_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_variant_acko_variants_id_seq OWNED BY public.fastlane_variant_acko_variants.id;


--
-- Name: fastlane_variant_cf_variants; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.fastlane_variant_cf_variants (
    id integer NOT NULL,
    from_variant_id integer NOT NULL,
    to_variant_id integer NOT NULL
);


ALTER TABLE public.fastlane_variant_cf_variants OWNER TO venkatesh;

--
-- Name: fastlane_variant_cf_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_variant_cf_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_variant_cf_variants_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_variant_cf_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_variant_cf_variants_id_seq OWNED BY public.fastlane_variant_cf_variants.id;


--
-- Name: fastlane_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.fastlane_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastlane_variant_id_seq OWNER TO venkatesh;

--
-- Name: fastlane_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.fastlane_variant_id_seq OWNED BY public.fastlane_variant.id;


--
-- Name: flightdb_airline; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_airline (
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    id character varying(10) NOT NULL,
    name character varying(255),
    is_domestic boolean NOT NULL
);


ALTER TABLE public.flightdb_airline OWNER TO venkatesh;

--
-- Name: flightdb_airport; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_airport (
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    id character varying(10) NOT NULL,
    city_id character varying(10)
);


ALTER TABLE public.flightdb_airport OWNER TO venkatesh;

--
-- Name: flightdb_city; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_city (
    id character varying(10) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    country_code character varying(10),
    name character varying(255) NOT NULL
);


ALTER TABLE public.flightdb_city OWNER TO venkatesh;

--
-- Name: flightdb_city_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.flightdb_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flightdb_city_id_seq OWNER TO venkatesh;

--
-- Name: flightdb_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.flightdb_city_id_seq OWNED BY public.flightdb_city.id;


--
-- Name: flightdb_flight; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_flight (
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    id character varying(20) NOT NULL,
    flight_number character varying(10) NOT NULL,
    scheduled_departure time without time zone NOT NULL,
    duration interval,
    airline_id character varying(10) NOT NULL,
    arrival_airport_id character varying(10) NOT NULL,
    departure_airport_id character varying(10) NOT NULL
);


ALTER TABLE public.flightdb_flight OWNER TO venkatesh;

--
-- Name: flightdb_flightinstance; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_flightinstance (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    scheduled_departure timestamp with time zone NOT NULL,
    scheduled_arrival timestamp with time zone NOT NULL,
    rescheduled_departure timestamp with time zone,
    rescheduled_arrival timestamp with time zone,
    flight_id character varying(20) NOT NULL
);


ALTER TABLE public.flightdb_flightinstance OWNER TO venkatesh;

--
-- Name: flightdb_flightinstance_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.flightdb_flightinstance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flightdb_flightinstance_id_seq OWNER TO venkatesh;

--
-- Name: flightdb_flightinstance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.flightdb_flightinstance_id_seq OWNED BY public.flightdb_flightinstance.id;


--
-- Name: flightdb_flightinstancehistory; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.flightdb_flightinstancehistory (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    event character varying(20) NOT NULL,
    event_sub_type character varying(20),
    data jsonb NOT NULL,
    flight_instance_id integer NOT NULL
);


ALTER TABLE public.flightdb_flightinstancehistory OWNER TO venkatesh;

--
-- Name: flightdb_flightinstancehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.flightdb_flightinstancehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flightdb_flightinstancehistory_id_seq OWNER TO venkatesh;

--
-- Name: flightdb_flightinstancehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.flightdb_flightinstancehistory_id_seq OWNED BY public.flightdb_flightinstancehistory.id;


--
-- Name: freshdesk_ticket; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.freshdesk_ticket (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    cc_emails character varying(255)[] NOT NULL,
    fwd_emails character varying(255)[] NOT NULL,
    reply_cc_emails character varying(255)[] NOT NULL,
    fr_escalated boolean,
    spam boolean,
    email_config_id character varying(255),
    group_id bigint,
    priority integer,
    requester_id bigint,
    responder_id bigint,
    source integer,
    company_id character varying(255),
    status integer NOT NULL,
    subject character varying(255),
    to_emails character varying(255)[] NOT NULL,
    product_id integer,
    type character varying(255),
    due_by timestamp with time zone,
    fr_due_by timestamp with time zone,
    is_escalated boolean,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    custom_fields jsonb NOT NULL,
    description text NOT NULL,
    description_text text NOT NULL,
    stats jsonb NOT NULL,
    tags character varying(255)[]
);


ALTER TABLE public.freshdesk_ticket OWNER TO venkatesh;

--
-- Name: freshdesk_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.freshdesk_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.freshdesk_ticket_id_seq OWNER TO venkatesh;

--
-- Name: freshdesk_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.freshdesk_ticket_id_seq OWNED BY public.freshdesk_ticket.id;


--
-- Name: iet_part; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.iet_part (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    part_number character varying(255) NOT NULL,
    kind character varying(255) NOT NULL,
    tax_kind character varying(255) NOT NULL,
    description text NOT NULL,
    price public.hstore NOT NULL,
    has_fixed_price boolean NOT NULL,
    is_verified boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    created_by_id integer NOT NULL,
    verified_by_id integer NOT NULL
);


ALTER TABLE public.iet_part OWNER TO venkatesh;

--
-- Name: iet_part_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.iet_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iet_part_id_seq OWNER TO venkatesh;

--
-- Name: iet_part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.iet_part_id_seq OWNED BY public.iet_part.id;


--
-- Name: iet_part_makes; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.iet_part_makes (
    id integer NOT NULL,
    part_id integer NOT NULL,
    make_id integer NOT NULL
);


ALTER TABLE public.iet_part_makes OWNER TO venkatesh;

--
-- Name: iet_part_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.iet_part_makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iet_part_makes_id_seq OWNER TO venkatesh;

--
-- Name: iet_part_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.iet_part_makes_id_seq OWNED BY public.iet_part_makes.id;


--
-- Name: iet_part_models; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.iet_part_models (
    id integer NOT NULL,
    part_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.iet_part_models OWNER TO venkatesh;

--
-- Name: iet_part_models_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.iet_part_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iet_part_models_id_seq OWNER TO venkatesh;

--
-- Name: iet_part_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.iet_part_models_id_seq OWNED BY public.iet_part_models.id;


--
-- Name: iet_part_variants; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.iet_part_variants (
    id integer NOT NULL,
    part_id integer NOT NULL,
    variant_id integer NOT NULL
);


ALTER TABLE public.iet_part_variants OWNER TO venkatesh;

--
-- Name: iet_part_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.iet_part_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iet_part_variants_id_seq OWNER TO venkatesh;

--
-- Name: iet_part_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.iet_part_variants_id_seq OWNED BY public.iet_part_variants.id;


--
-- Name: iib_claimshistory; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.iib_claimshistory (
    id integer NOT NULL,
    reg_no character varying(10) NOT NULL,
    claims_history character varying(3000) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.iib_claimshistory OWNER TO venkatesh;

--
-- Name: iib_claimshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.iib_claimshistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iib_claimshistory_id_seq OWNER TO venkatesh;

--
-- Name: iib_claimshistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.iib_claimshistory_id_seq OWNED BY public.iib_claimshistory.id;


--
-- Name: intranet_file; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_file (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.intranet_file OWNER TO venkatesh;

--
-- Name: intranet_file_downs; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_file_downs (
    id integer NOT NULL,
    file_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.intranet_file_downs OWNER TO venkatesh;

--
-- Name: intranet_file_downs_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_file_downs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_file_downs_id_seq OWNER TO venkatesh;

--
-- Name: intranet_file_downs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_file_downs_id_seq OWNED BY public.intranet_file_downs.id;


--
-- Name: intranet_file_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_file_id_seq OWNER TO venkatesh;

--
-- Name: intranet_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_file_id_seq OWNED BY public.intranet_file.id;


--
-- Name: intranet_file_selfs; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_file_selfs (
    id integer NOT NULL,
    file_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.intranet_file_selfs OWNER TO venkatesh;

--
-- Name: intranet_file_selfs_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_file_selfs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_file_selfs_id_seq OWNER TO venkatesh;

--
-- Name: intranet_file_selfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_file_selfs_id_seq OWNED BY public.intranet_file_selfs.id;


--
-- Name: intranet_file_ups; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_file_ups (
    id integer NOT NULL,
    file_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.intranet_file_ups OWNER TO venkatesh;

--
-- Name: intranet_file_ups_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_file_ups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_file_ups_id_seq OWNER TO venkatesh;

--
-- Name: intranet_file_ups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_file_ups_id_seq OWNED BY public.intranet_file_ups.id;


--
-- Name: intranet_room; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_room (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    capacity integer NOT NULL,
    has_tv boolean NOT NULL
);


ALTER TABLE public.intranet_room OWNER TO venkatesh;

--
-- Name: intranet_room_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_room_id_seq OWNER TO venkatesh;

--
-- Name: intranet_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_room_id_seq OWNED BY public.intranet_room.id;


--
-- Name: intranet_roomreservation; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.intranet_roomreservation (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    status character varying(100) NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.intranet_roomreservation OWNER TO venkatesh;

--
-- Name: intranet_roomreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.intranet_roomreservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intranet_roomreservation_id_seq OWNER TO venkatesh;

--
-- Name: intranet_roomreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.intranet_roomreservation_id_seq OWNED BY public.intranet_roomreservation.id;


--
-- Name: karmator_work; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_work (
    id integer NOT NULL,
    closed boolean NOT NULL,
    fields jsonb NOT NULL,
    kind_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.karmator_work OWNER TO venkatesh;

--
-- Name: karmator_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_claim_id_seq OWNER TO venkatesh;

--
-- Name: karmator_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_claim_id_seq OWNED BY public.karmator_work.id;


--
-- Name: karmator_workfield; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_workfield (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    type character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    is_primary boolean NOT NULL,
    widget jsonb,
    kind_id integer NOT NULL
);


ALTER TABLE public.karmator_workfield OWNER TO venkatesh;

--
-- Name: karmator_claimfield_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_claimfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_claimfield_id_seq OWNER TO venkatesh;

--
-- Name: karmator_claimfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_claimfield_id_seq OWNED BY public.karmator_workfield.id;


--
-- Name: karmator_workfield_validators; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_workfield_validators (
    id integer NOT NULL,
    workfield_id integer NOT NULL,
    kvalidator_id integer NOT NULL
);


ALTER TABLE public.karmator_workfield_validators OWNER TO venkatesh;

--
-- Name: karmator_claimfield_validators_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_claimfield_validators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_claimfield_validators_id_seq OWNER TO venkatesh;

--
-- Name: karmator_claimfield_validators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_claimfield_validators_id_seq OWNED BY public.karmator_workfield_validators.id;


--
-- Name: karmator_qtime; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_qtime (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_id integer,
    work_id integer NOT NULL,
    accepted boolean,
    destination jsonb,
    scheduled_on timestamp with time zone,
    phone character varying(255),
    skill_id integer NOT NULL,
    source jsonb,
    title character varying(100),
    task_active_on timestamp with time zone,
    stage character varying(255),
    last_assigned_on timestamp with time zone,
    accepted_on timestamp with time zone,
    CONSTRAINT accepted_never_false CHECK ((accepted IS NOT FALSE))
);


ALTER TABLE public.karmator_qtime OWNER TO venkatesh;

--
-- Name: karmator_qtime_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_qtime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_qtime_id_seq OWNER TO venkatesh;

--
-- Name: karmator_qtime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_qtime_id_seq OWNED BY public.karmator_qtime.id;


--
-- Name: karmator_task; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_task (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    subname character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    widget jsonb,
    fields text[] NOT NULL,
    done_id integer,
    kind_id integer NOT NULL,
    query_id integer NOT NULL,
    skill_id integer,
    active_before integer,
    completion_stages character varying(255)[],
    is_secondary_action boolean NOT NULL
);


ALTER TABLE public.karmator_task OWNER TO venkatesh;

--
-- Name: karmator_task_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_task_id_seq OWNER TO venkatesh;

--
-- Name: karmator_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_task_id_seq OWNED BY public.karmator_task.id;


--
-- Name: karmator_workhistory; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_workhistory (
    id integer NOT NULL,
    fields jsonb NOT NULL,
    delta jsonb NOT NULL,
    action character varying(255) NOT NULL,
    app character varying(255) NOT NULL,
    ip character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    tracker_id integer,
    user_id integer NOT NULL,
    work_id integer NOT NULL,
    task_id integer,
    stage character varying(255)
);


ALTER TABLE public.karmator_workhistory OWNER TO venkatesh;

--
-- Name: karmator_workhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_workhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_workhistory_id_seq OWNER TO venkatesh;

--
-- Name: karmator_workhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_workhistory_id_seq OWNED BY public.karmator_workhistory.id;


--
-- Name: karmator_workkind; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.karmator_workkind (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status_field_id integer
);


ALTER TABLE public.karmator_workkind OWNER TO venkatesh;

--
-- Name: karmator_workkind_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.karmator_workkind_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karmator_workkind_id_seq OWNER TO venkatesh;

--
-- Name: karmator_workkind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.karmator_workkind_id_seq OWNED BY public.karmator_workkind.id;


--
-- Name: lsq_activity; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.lsq_activity (
    id integer NOT NULL,
    prospect_activity_id character varying(255) NOT NULL,
    prospect_id character varying(255) NOT NULL,
    product_state character varying(255) NOT NULL,
    prospect_stage character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    activity_disposition character varying(255) NOT NULL,
    activity_owner character varying(255) NOT NULL,
    activity_sub_disposition character varying(255) NOT NULL,
    prospect_activity_name_max character varying(255) NOT NULL,
    prospect_activity_date_max timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    followup_date timestamp with time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    disposition_created_on timestamp with time zone
);


ALTER TABLE public.lsq_activity OWNER TO venkatesh;

--
-- Name: lsq_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.lsq_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lsq_activity_id_seq OWNER TO venkatesh;

--
-- Name: lsq_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.lsq_activity_id_seq OWNED BY public.lsq_activity.id;


--
-- Name: lsq_lead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.lsq_lead (
    id integer NOT NULL,
    prospect_id character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    lead_created_on timestamp with time zone NOT NULL,
    owner character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    raw_data jsonb
);


ALTER TABLE public.lsq_lead OWNER TO venkatesh;

--
-- Name: lsq_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.lsq_lead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lsq_lead_id_seq OWNER TO venkatesh;

--
-- Name: lsq_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.lsq_lead_id_seq OWNED BY public.lsq_lead.id;


--
-- Name: masters_address; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_address (
    id integer NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    latlong public.geography(Point,4326),
    tag character varying(10) NOT NULL,
    pincode_id integer NOT NULL,
    user_id integer NOT NULL,
    "default" boolean,
    CONSTRAINT masters_address_default_check CHECK (("default" <> false))
);


ALTER TABLE public.masters_address OWNER TO venkatesh;

--
-- Name: masters_address_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_address_id_seq OWNER TO venkatesh;

--
-- Name: masters_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_address_id_seq OWNED BY public.masters_address.id;


--
-- Name: masters_eduqual; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_eduqual (
    id character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.masters_eduqual OWNER TO venkatesh;

--
-- Name: masters_equipmentclip; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_equipmentclip (
    id integer NOT NULL,
    program_name character varying(255),
    program_number character varying(255),
    policy_name character varying(255),
    policy_number character varying(255),
    estimate_auto_approval_percentage double precision NOT NULL,
    invoice_auto_approval_percentage double precision NOT NULL,
    premium_percentage double precision NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    partner_id integer NOT NULL
);


ALTER TABLE public.masters_equipmentclip OWNER TO venkatesh;

--
-- Name: masters_equipmentclip_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_equipmentclip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_equipmentclip_id_seq OWNER TO venkatesh;

--
-- Name: masters_equipmentclip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_equipmentclip_id_seq OWNED BY public.masters_equipmentclip.id;


--
-- Name: masters_establishment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_establishment (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(255) NOT NULL,
    std_code character varying(10) NOT NULL,
    landline_number character varying(10) NOT NULL,
    alt_phone_1 character varying(20) NOT NULL,
    alt_phone_2 character varying(20) NOT NULL,
    address_line_1 character varying(255) NOT NULL,
    address_line_2 character varying(255) NOT NULL,
    address_line_3 character varying(255) NOT NULL,
    region character varying(100) NOT NULL,
    latlong public.geography(Point,4326),
    state character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    appointment_required boolean,
    google_place_id character varying(255) NOT NULL,
    short_address character varying(255) NOT NULL,
    permanently_closed boolean NOT NULL,
    legal_entity_id integer,
    poc_id integer,
    pincode_id integer,
    acko_poc_id integer
);


ALTER TABLE public.masters_establishment OWNER TO venkatesh;

--
-- Name: masters_establishment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_establishment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_establishment_id_seq OWNER TO venkatesh;

--
-- Name: masters_establishment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_establishment_id_seq OWNED BY public.masters_establishment.id;


--
-- Name: masters_externalbifueltype; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_externalbifueltype (
    id character varying(255) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.masters_externalbifueltype OWNER TO venkatesh;

--
-- Name: masters_financingtype; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_financingtype (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.masters_financingtype OWNER TO venkatesh;

--
-- Name: masters_garage; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_garage (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    product character varying(31)[] NOT NULL,
    value_added_services character varying(255)[] NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    star_rating character varying(100) NOT NULL,
    empanelment_date timestamp with time zone,
    mou character varying(50) NOT NULL,
    remarks text NOT NULL,
    email character varying(255) NOT NULL,
    created_by_id integer,
    all_makes boolean NOT NULL
);


ALTER TABLE public.masters_garage OWNER TO venkatesh;

--
-- Name: masters_garage_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_garage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_garage_id_seq OWNER TO venkatesh;

--
-- Name: masters_garage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_garage_id_seq OWNED BY public.masters_garage.id;


--
-- Name: masters_garage_makes; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_garage_makes (
    id integer NOT NULL,
    garage_id integer NOT NULL,
    make_id integer NOT NULL
);


ALTER TABLE public.masters_garage_makes OWNER TO venkatesh;

--
-- Name: masters_garage_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_garage_makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_garage_makes_id_seq OWNER TO venkatesh;

--
-- Name: masters_garage_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_garage_makes_id_seq OWNED BY public.masters_garage_makes.id;


--
-- Name: masters_garagetimings; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_garagetimings (
    id integer NOT NULL,
    day smallint,
    opens_at time without time zone NOT NULL,
    closes_at time without time zone NOT NULL,
    garage_id integer NOT NULL
);


ALTER TABLE public.masters_garagetimings OWNER TO venkatesh;

--
-- Name: masters_garagetimings_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_garagetimings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_garagetimings_id_seq OWNER TO venkatesh;

--
-- Name: masters_garagetimings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_garagetimings_id_seq OWNED BY public.masters_garagetimings.id;


--
-- Name: masters_gender; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_gender (
    id character varying(6) NOT NULL,
    name character varying(6) NOT NULL
);


ALTER TABLE public.masters_gender OWNER TO venkatesh;

--
-- Name: masters_goodsnature; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_goodsnature (
    id character varying(20) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.masters_goodsnature OWNER TO venkatesh;

--
-- Name: masters_intermediary; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_intermediary (
    id integer NOT NULL,
    intermediary_type character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    irda_registration_number character varying(100),
    acko_license_id integer,
    legal_entity_id integer,
    parent_id integer,
    key_id integer,
    pas_agent_id integer,
    return_url character varying(255),
    pas_contact_id integer,
    address character varying(255) NOT NULL,
    contact_number character varying(20),
    email public.citext,
    CONSTRAINT validate_intermediary CHECK ((('acko_license_id' IS NOT NULL) OR ('irda_registration_number' IS NOT NULL)))
);


ALTER TABLE public.masters_intermediary OWNER TO venkatesh;

--
-- Name: masters_intermediary_features; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_intermediary_features (
    id integer NOT NULL,
    intermediary_id integer NOT NULL,
    coverage_id character varying(20) NOT NULL
);


ALTER TABLE public.masters_intermediary_features OWNER TO venkatesh;

--
-- Name: masters_intermediary_features_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_intermediary_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_intermediary_features_id_seq OWNER TO venkatesh;

--
-- Name: masters_intermediary_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_intermediary_features_id_seq OWNED BY public.masters_intermediary_features.id;


--
-- Name: masters_intermediary_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_intermediary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_intermediary_id_seq OWNER TO venkatesh;

--
-- Name: masters_intermediary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_intermediary_id_seq OWNED BY public.masters_intermediary.id;


--
-- Name: masters_intermediary_plans; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_intermediary_plans (
    id integer NOT NULL,
    intermediary_id integer NOT NULL,
    plan_id character varying(20) NOT NULL
);


ALTER TABLE public.masters_intermediary_plans OWNER TO venkatesh;

--
-- Name: masters_intermediary_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_intermediary_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_intermediary_plans_id_seq OWNER TO venkatesh;

--
-- Name: masters_intermediary_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_intermediary_plans_id_seq OWNED BY public.masters_intermediary_plans.id;


--
-- Name: masters_intermediary_rtos; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_intermediary_rtos (
    id integer NOT NULL,
    intermediary_id integer NOT NULL,
    rto_id integer NOT NULL
);


ALTER TABLE public.masters_intermediary_rtos OWNER TO venkatesh;

--
-- Name: masters_intermediary_rtos_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_intermediary_rtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_intermediary_rtos_id_seq OWNER TO venkatesh;

--
-- Name: masters_intermediary_rtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_intermediary_rtos_id_seq OWNED BY public.masters_intermediary_rtos.id;


--
-- Name: masters_intermediaryrtoplanmapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_intermediaryrtoplanmapping (
    id integer NOT NULL,
    intermediary_id integer NOT NULL,
    plan_id character varying(20) NOT NULL,
    rto_id integer NOT NULL
);


ALTER TABLE public.masters_intermediaryrtoplanmapping OWNER TO venkatesh;

--
-- Name: masters_intermediaryrtoplanmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_intermediaryrtoplanmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_intermediaryrtoplanmapping_id_seq OWNER TO venkatesh;

--
-- Name: masters_intermediaryrtoplanmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_intermediaryrtoplanmapping_id_seq OWNED BY public.masters_intermediaryrtoplanmapping.id;


--
-- Name: masters_logistics; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_logistics (
    id integer NOT NULL,
    name text NOT NULL,
    acko_poc_id integer,
    poc_id integer
);


ALTER TABLE public.masters_logistics OWNER TO venkatesh;

--
-- Name: masters_logistics_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_logistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_logistics_id_seq OWNER TO venkatesh;

--
-- Name: masters_logistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_logistics_id_seq OWNED BY public.masters_logistics.id;


--
-- Name: masters_logistics_pincode; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_logistics_pincode (
    id integer NOT NULL,
    logistics_id integer NOT NULL,
    pincode_id integer NOT NULL
);


ALTER TABLE public.masters_logistics_pincode OWNER TO venkatesh;

--
-- Name: masters_logistics_pincode_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_logistics_pincode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_logistics_pincode_id_seq OWNER TO venkatesh;

--
-- Name: masters_logistics_pincode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_logistics_pincode_id_seq OWNED BY public.masters_logistics_pincode.id;


--
-- Name: masters_make; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_make (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_active_for_bike boolean NOT NULL,
    is_active_for_car boolean NOT NULL,
    is_popular boolean NOT NULL,
    premium_impact double precision,
    pas_id integer
);


ALTER TABLE public.masters_make OWNER TO venkatesh;

--
-- Name: masters_make_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_make_id_seq OWNER TO venkatesh;

--
-- Name: masters_make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_make_id_seq OWNED BY public.masters_make.id;


--
-- Name: masters_model; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_model (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    vehicle_type character varying(25) NOT NULL,
    is_popular boolean NOT NULL,
    priority integer,
    is_active_for_private boolean NOT NULL,
    is_active_for_commercial boolean NOT NULL,
    make_id integer,
    parent_id integer,
    premium_impact double precision,
    pas_id integer
);


ALTER TABLE public.masters_model OWNER TO venkatesh;

--
-- Name: masters_model_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_model_id_seq OWNER TO venkatesh;

--
-- Name: masters_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_model_id_seq OWNED BY public.masters_model.id;


--
-- Name: masters_modelcolor; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_modelcolor (
    id integer NOT NULL,
    "default" boolean,
    name character varying(63) NOT NULL,
    code character varying(31) NOT NULL,
    hex character varying(7) NOT NULL,
    image character varying(255),
    model_id integer NOT NULL,
    CONSTRAINT masters_modelcolor_default_check CHECK (("default" <> false))
);


ALTER TABLE public.masters_modelcolor OWNER TO venkatesh;

--
-- Name: masters_modelcolor_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_modelcolor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_modelcolor_id_seq OWNER TO venkatesh;

--
-- Name: masters_modelcolor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_modelcolor_id_seq OWNED BY public.masters_modelcolor.id;


--
-- Name: masters_phonemake; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_phonemake (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.masters_phonemake OWNER TO venkatesh;

--
-- Name: masters_phonemake_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_phonemake_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_phonemake_id_seq OWNER TO venkatesh;

--
-- Name: masters_phonemake_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_phonemake_id_seq OWNED BY public.masters_phonemake.id;


--
-- Name: masters_phonemodel; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_phonemodel (
    id integer NOT NULL,
    make_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    model character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.masters_phonemodel OWNER TO venkatesh;

--
-- Name: masters_phonemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_phonemodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_phonemodel_id_seq OWNER TO venkatesh;

--
-- Name: masters_phonemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_phonemodel_id_seq OWNED BY public.masters_phonemodel.id;


--
-- Name: masters_pincode; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_pincode (
    id integer NOT NULL,
    pincode integer NOT NULL,
    data jsonb NOT NULL,
    objectionable boolean NOT NULL
);


ALTER TABLE public.masters_pincode OWNER TO venkatesh;

--
-- Name: masters_pincode_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_pincode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_pincode_id_seq OWNER TO venkatesh;

--
-- Name: masters_pincode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_pincode_id_seq OWNED BY public.masters_pincode.id;


--
-- Name: masters_pincode_regions; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_pincode_regions (
    id integer NOT NULL,
    pincode_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.masters_pincode_regions OWNER TO venkatesh;

--
-- Name: masters_pincode_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_pincode_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_pincode_regions_id_seq OWNER TO venkatesh;

--
-- Name: masters_pincode_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_pincode_regions_id_seq OWNED BY public.masters_pincode_regions.id;


--
-- Name: masters_previouspolicytype; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_previouspolicytype (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.masters_previouspolicytype OWNER TO venkatesh;

--
-- Name: masters_profession; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_profession (
    id character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.masters_profession OWNER TO venkatesh;

--
-- Name: masters_region; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_region (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(50),
    data jsonb NOT NULL
);


ALTER TABLE public.masters_region OWNER TO venkatesh;

--
-- Name: masters_region_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_region_id_seq OWNER TO venkatesh;

--
-- Name: masters_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_region_id_seq OWNED BY public.masters_region.id;


--
-- Name: masters_region_parents; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_region_parents (
    id integer NOT NULL,
    from_region_id integer NOT NULL,
    to_region_id integer NOT NULL
);


ALTER TABLE public.masters_region_parents OWNER TO venkatesh;

--
-- Name: masters_region_parents_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_region_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_region_parents_id_seq OWNER TO venkatesh;

--
-- Name: masters_region_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_region_parents_id_seq OWNED BY public.masters_region_parents.id;


--
-- Name: masters_relationship; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_relationship (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.masters_relationship OWNER TO venkatesh;

--
-- Name: masters_rto; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_rto (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    raw jsonb NOT NULL,
    is_active_for_inspection boolean NOT NULL,
    pas_id integer,
    blacklist boolean NOT NULL,
    location_pincode_id integer
);


ALTER TABLE public.masters_rto OWNER TO venkatesh;

--
-- Name: masters_rto_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_rto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_rto_id_seq OWNER TO venkatesh;

--
-- Name: masters_rto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_rto_id_seq OWNED BY public.masters_rto.id;


--
-- Name: masters_rtocitymapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_rtocitymapping (
    id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.masters_rtocitymapping OWNER TO venkatesh;

--
-- Name: masters_rtocitymapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_rtocitymapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_rtocitymapping_id_seq OWNER TO venkatesh;

--
-- Name: masters_rtocitymapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_rtocitymapping_id_seq OWNED BY public.masters_rtocitymapping.id;


--
-- Name: masters_rtocitymapping_rtos; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_rtocitymapping_rtos (
    id integer NOT NULL,
    rtocitymapping_id integer NOT NULL,
    rto_id integer NOT NULL
);


ALTER TABLE public.masters_rtocitymapping_rtos OWNER TO venkatesh;

--
-- Name: masters_rtocitymapping_rtos_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_rtocitymapping_rtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_rtocitymapping_rtos_id_seq OWNER TO venkatesh;

--
-- Name: masters_rtocitymapping_rtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_rtocitymapping_rtos_id_seq OWNED BY public.masters_rtocitymapping_rtos.id;


--
-- Name: masters_rtopincodemapping; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_rtopincodemapping (
    id integer NOT NULL,
    pincode_id integer NOT NULL,
    rto_id integer NOT NULL
);


ALTER TABLE public.masters_rtopincodemapping OWNER TO venkatesh;

--
-- Name: masters_rtopincodemapping_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_rtopincodemapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_rtopincodemapping_id_seq OWNER TO venkatesh;

--
-- Name: masters_rtopincodemapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_rtopincodemapping_id_seq OWNED BY public.masters_rtopincodemapping.id;


--
-- Name: masters_servicecenter; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_servicecenter (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    status character varying(31) NOT NULL,
    poc_id integer,
    acko_poc_id integer,
    pincode_id integer
);


ALTER TABLE public.masters_servicecenter OWNER TO venkatesh;

--
-- Name: masters_servicecenter_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_servicecenter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_servicecenter_id_seq OWNER TO venkatesh;

--
-- Name: masters_servicecenter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_servicecenter_id_seq OWNED BY public.masters_servicecenter.id;


--
-- Name: masters_servicecenter_region; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_servicecenter_region (
    id integer NOT NULL,
    servicecenter_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.masters_servicecenter_region OWNER TO venkatesh;

--
-- Name: masters_servicecenter_region_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_servicecenter_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_servicecenter_region_id_seq OWNER TO venkatesh;

--
-- Name: masters_servicecenter_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_servicecenter_region_id_seq OWNED BY public.masters_servicecenter_region.id;


--
-- Name: masters_title; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_title (
    id character varying(6) NOT NULL,
    name character varying(6) NOT NULL
);


ALTER TABLE public.masters_title OWNER TO venkatesh;

--
-- Name: masters_variant; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_variant (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cc integer NOT NULL,
    seating_capacity integer NOT NULL,
    ex_showroom_price double precision,
    fuel_type character varying(50) NOT NULL,
    vehicle_segment character varying(250) NOT NULL,
    vehicle_type character varying(25) NOT NULL,
    category character varying(25) NOT NULL,
    model_id integer NOT NULL,
    breadth integer,
    height integer,
    launch_date timestamp with time zone,
    length integer,
    obsolete_date timestamp with time zone,
    premium_impact double precision,
    wheel_base integer,
    pas_id integer,
    extra jsonb NOT NULL,
    body_type character varying(50) NOT NULL,
    transmission_type character varying(20) NOT NULL,
    is_popular boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.masters_variant OWNER TO venkatesh;

--
-- Name: masters_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.masters_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.masters_variant_id_seq OWNER TO venkatesh;

--
-- Name: masters_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.masters_variant_id_seq OWNED BY public.masters_variant.id;


--
-- Name: masters_vehicletype; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.masters_vehicletype (
    id character varying(20) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.masters_vehicletype OWNER TO venkatesh;

--
-- Name: motor_lead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_lead (
    id integer NOT NULL,
    state character varying(20) NOT NULL,
    user_id integer NOT NULL,
    vehicle_id integer
);


ALTER TABLE public.motor_lead OWNER TO venkatesh;

--
-- Name: motor_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_lead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_lead_id_seq OWNER TO venkatesh;

--
-- Name: motor_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_lead_id_seq OWNED BY public.motor_lead.id;


--
-- Name: motor_leadsource; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_leadsource (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    lead_id integer NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.motor_leadsource OWNER TO venkatesh;

--
-- Name: motor_leadsource_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_leadsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_leadsource_id_seq OWNER TO venkatesh;

--
-- Name: motor_leadsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_leadsource_id_seq OWNED BY public.motor_leadsource.id;


--
-- Name: motor_policy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_policy (
    id integer NOT NULL,
    quote_id integer NOT NULL,
    cancelled_on timestamp with time zone,
    created_on timestamp with time zone NOT NULL,
    document text,
    idit_policy_number character varying(100),
    payment_id integer NOT NULL,
    policy_number character varying(100) NOT NULL,
    status character varying(31) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    end_date date NOT NULL,
    policy_holder_id integer NOT NULL,
    start_date date NOT NULL,
    partner_id integer NOT NULL
);


ALTER TABLE public.motor_policy OWNER TO venkatesh;

--
-- Name: motor_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_policy_id_seq OWNER TO venkatesh;

--
-- Name: motor_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_policy_id_seq OWNED BY public.motor_policy.id;


--
-- Name: motor_quote; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_quote (
    id integer NOT NULL,
    dob timestamp with time zone,
    inspection_date timestamp with time zone,
    policy_start_date timestamp with time zone,
    auto_membership_expiry_date timestamp with time zone,
    previous_policy_expiry_date timestamp with time zone,
    ph_details jsonb NOT NULL,
    policy_details jsonb NOT NULL,
    nominee_details jsonb NOT NULL,
    asset_details jsonb NOT NULL,
    user_details jsonb NOT NULL,
    tag jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    appointee_relationship_id character varying(20),
    color_code_id integer,
    edu_qualification_id character varying(50),
    external_bifuel_type_id character varying(255),
    financing_type_id character varying(20),
    gender_id character varying(6),
    nature_of_goods_id character varying(20),
    nominee_relationship_id character varying(20),
    partner_id integer NOT NULL,
    pincode_id integer NOT NULL,
    plan_recommended_id character varying(20),
    plan_selected_id character varying(20) NOT NULL,
    profession_id character varying(50),
    title_id character varying(6),
    utlead_id integer,
    variant_id integer NOT NULL,
    vehicle_id integer,
    quote_out jsonb NOT NULL,
    lead_source_id integer,
    product_id character varying(20) NOT NULL,
    addons_available jsonb,
    plans jsonb,
    payment_id integer,
    policy_end_date timestamp with time zone,
    status character varying(31) NOT NULL,
    invoice_date timestamp with time zone,
    rto_id integer NOT NULL,
    previous_policy_type_id character varying(20),
    addons_selected jsonb,
    broker_discount integer,
    CONSTRAINT validate_asset_details CHECK (((((asset_details ->> 'is_vehicle_owner_individual'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'current_odometer_reading'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_driver_covered'::text))::boolean = ANY (ARRAY[true, false])) AND ((asset_details ->> 'registration_number'::text) <> ''::text) AND ((asset_details ->> 'num_claims_in_last_claim_year'::text) <> ''::text) AND ((asset_details ->> 'previous_policy_number'::text) <> ''::text) AND ((asset_details ->> 'previous_insurer'::text) <> ''::text) AND ((asset_details ->> 'engine_number'::text) <> ''::text) AND ((asset_details ->> 'chassis_number'::text) <> ''::text) AND (((asset_details ->> 'carrying_capacity'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'number_of_tyres'::text))::integer > '-1'::integer) AND (((asset_details ->> 'carrying_weight'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_national_permit'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'cubic_capacity'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_vehicle_financed'::text))::boolean = ANY (ARRAY[true, false])) AND ((asset_details ->> 'financier_name'::text) <> ''::text) AND (((asset_details ->> 'is_ownership_transferred_last12months'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'registration_year'::text))::integer > '-1'::integer) AND (((asset_details ->> 'num_trailers'::text))::integer > '-1'::integer) AND ((asset_details ->> 'rto_code'::text) <> ''::text) AND (((asset_details ->> 'is_anti_theft'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_tp_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_od_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'od_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_zero_dep_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_pa_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'pa_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_invoice_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_rsa_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_engine_protector_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_key_lock_replacement_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_ncb_protect_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_consumable_protect_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_paid_driver_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_ll_driver_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_convenience_allowance_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'convenience_allowed_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_passenger_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'passenger_cover_amount'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'passenger_cover_number_of_persons'::text))::integer > '-1'::integer) AND (((asset_details ->> 'is_electrical_accessories_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'electrical_accessories_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_non_electrical_accessories_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'non_electrical_accessories_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_external_bifuel_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'external_bifuel_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'voluntary_excess_amount'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_windshield_protect_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_tyre_secure_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'tyre_secure_sum_assured'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_downtime_allowance_selected'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'downtime_allowance_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_outstation_emergency_cover_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'outstation_emergency_sum_assured'::text))::numeric > ('-1'::integer)::numeric) AND (((asset_details ->> 'is_qualified_garage_addon_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_loss_of_license_rc_addon_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_small_repair_claim_addon_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'is_good_driver_renewal_addon_selected'::text))::boolean = ANY (ARRAY[true, false])) AND (((asset_details ->> 'external_bio_fuel_kit_price'::text))::numeric > ('-1'::integer)::numeric))),
    CONSTRAINT validate_nominee_details CHECK ((((nominee_details ->> 'nominee_name'::text) <> ''::text) AND (((nominee_details ->> 'nominee_age'::text))::integer > '-1'::integer) AND ((nominee_details ->> 'appointee_name'::text) <> ''::text))),
    CONSTRAINT validate_ph_details CHECK ((((ph_details ->> 'full_name'::text) <> ''::text) AND ((ph_details ->> 'email'::text) <> ''::text) AND (((ph_details ->> 'is_married'::text))::boolean = ANY (ARRAY[true, false])) AND ((ph_details ->> 'phone'::text) <> ''::text) AND ((ph_details ->> 'address'::text) <> ''::text) AND (((ph_details ->> 'driving_license_year'::text))::integer > '-1'::integer) AND (((ph_details ->> 'is_driving_license_effective'::text))::boolean = ANY (ARRAY[true, false])) AND (((ph_details ->> 'years_driving_exp'::text))::integer > '-1'::integer) AND (((ph_details ->> 'is_auto_member'::text))::boolean = ANY (ARRAY[true, false])) AND ((ph_details ->> 'auto_membership_number'::text) <> ''::text) AND (((ph_details ->> 'is_policy_holder_individual'::text))::boolean = ANY (ARRAY[true, false])) AND (((ph_details ->> 'number_of_vehicles_ownership'::text))::integer > '-1'::integer) AND ((ph_details ->> 'pan_number'::text) <> ''::text))),
    CONSTRAINT validate_policy_details CHECK (((((policy_details ->> 'previous_ncb'::text))::numeric > ('-11'::integer)::numeric) AND (((policy_details ->> 'eligible_ncb'::text))::numeric > ('-1'::integer)::numeric) AND (((policy_details ->> 'is_driver_covered'::text))::boolean = ANY (ARRAY[true, false])) AND (((policy_details ->> 'last_claim_year'::text))::integer > '-1'::integer) AND (((policy_details ->> 'num_claims_in_last_claim_year'::text))::integer > '-1'::integer) AND (((policy_details ->> 'tenure'::text))::integer > '-1'::integer) AND (((policy_details ->> 'schedule_preinspection'::text))::boolean = ANY (ARRAY[true, false])))),
    CONSTRAINT verify_quote_out CHECK ((((quote_out ->> 'partner_name'::text) <> ''::text) AND (((quote_out ->> 'idv'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'min_idv'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'max_idv'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'is_plan_break_case'::text))::boolean = ANY (ARRAY[true, false])) AND (((quote_out ->> 'is_break_in_more_than_90'::text))::boolean = ANY (ARRAY[true, false])) AND (((quote_out ->> 'is_renewal_customer'::text))::boolean = ANY (ARRAY[true, false])) AND (((quote_out ->> 'basic_od_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'basic_od_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'basic_tp_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'basic_tp_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'pa_owner_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'pa_owner_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'pa_driver_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'pa_driver_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'll_driver_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'll_driver_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_basic_cover_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_basic_cover_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'zerodep_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'zerodep_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'electrical_accessories_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'electrical_accessories_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'nonelectrical_accessories_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'nonelectrical_accessories_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'consumable_cover_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'consumable_cover_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'engine_protector_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'engine_protector_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'rsa_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'rsa_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'passenger_cover_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'passenger_cover_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'invoice_cover_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'invoice_cover_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'windshield_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'windshield_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'paid_driver_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'paid_driver_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'ncb_protector_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'ncb_protector_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'convenience_allowance_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'convenience_allowance_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'key_replacement_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'key_replacement_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'bifuel_kit_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'bifuel_kit_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'bifuel_liability_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'bifuel_liability_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'windshield_protect_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'windshield_protect_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'tyre_secure_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'tyre_secure_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'downtime_allowance_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'downtime_allowance_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'outstation_emergency_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'outstation_emergency_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'qualified_garage_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'qualified_garage_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'loss_of_license_rc_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'loss_of_license_rc_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'small_repair_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'small_repair_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'good_driver_renewal_benefit_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'good_driver_renewal_benefit_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_addon_premium_original'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_addon_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'age_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'antitheft_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'insurer_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'ncb_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'professional_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'voluntary_deductible_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'automobile_association_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_discount'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'servicetax_at_10percent'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'servicetax_multiplier'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'net_servicetax'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'total_premium'::text))::numeric > ('-1'::integer)::numeric) AND (((quote_out ->> 'is_quote_requested_by_partner'::text))::boolean = ANY (ARRAY[true, false])) AND (((quote_out ->> 'is_inspection_pending'::text))::boolean = ANY (ARRAY[true, false])) AND ((quote_out ->> 'policy_brochure_path'::text) <> ''::text) AND ((quote_out ->> 'acko_logo_path1'::text) <> ''::text) AND ((quote_out ->> 'acko_logo_path2'::text) <> ''::text) AND (((quote_out ->> 'num_garages_in_city'::text))::integer > '-1'::integer) AND (((quote_out ->> 'is_repair_anywhere_available'::text))::boolean = ANY (ARRAY[true, false])) AND ((quote_out ->> 'usp_parameter1'::text) <> ''::text) AND ((quote_out ->> 'usp_parameter1_details'::text) <> ''::text) AND ((quote_out ->> 'usp_parameter2'::text) <> ''::text) AND ((quote_out ->> 'usp_parameter2_details'::text) <> ''::text) AND (((quote_out ->> 'is_policy_ready_for_payment'::text))::boolean = ANY (ARRAY[true, false])) AND ((quote_out ->> 'asset_image1_url'::text) <> ''::text) AND ((quote_out ->> 'asset_image2_url'::text) <> ''::text) AND ((quote_out ->> 'asset_image3_url'::text) <> ''::text) AND ((quote_out ->> 'asset_image4_url'::text) <> ''::text) AND ((quote_out ->> 'asset_image5_url'::text) <> ''::text))),
    CONSTRAINT verify_tag CHECK (((((tag ->> 'is_usage_only_office'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_usage_only_weekend_trips'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_usage_office_weekend_trips'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_usage_only_business_meetings'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_policyholder_drinker'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_parking_covered'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_parking_open_gated_compound'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_parking_roadside'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_driving_experience_under_1year'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_driving_experience_1_5_year'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_driving_experience_more_than_5years'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_policyholder_traffic_offence_last1year'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_vehicle_owner_defence_person'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_vehicle_used_in_driving_school'::text))::boolean = ANY (ARRAY[true, false])) AND (((tag ->> 'is_vehicle_used_in_sponsored_races'::text))::boolean = ANY (ARRAY[true, false])))),
    CONSTRAINT verify_user_details CHECK ((((user_details ->> 'user_latitude'::text) <> ''::text) AND (((user_details ->> 'user_longitude'::text))::integer > '-1'::integer) AND ((user_details ->> 'user_imei_number'::text) <> ''::text) AND ((user_details ->> 'user_ip_address'::text) <> ''::text)))
);


ALTER TABLE public.motor_quote OWNER TO venkatesh;

--
-- Name: motor_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_quote_id_seq OWNER TO venkatesh;

--
-- Name: motor_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_quote_id_seq OWNED BY public.motor_quote.id;


--
-- Name: motor_ratings_pincodezone; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_ratings_pincodezone (
    id integer NOT NULL,
    pincode_id integer NOT NULL,
    zone_id integer NOT NULL
);


ALTER TABLE public.motor_ratings_pincodezone OWNER TO venkatesh;

--
-- Name: motor_ratings_pincodezone_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_ratings_pincodezone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_ratings_pincodezone_id_seq OWNER TO venkatesh;

--
-- Name: motor_ratings_pincodezone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_ratings_pincodezone_id_seq OWNED BY public.motor_ratings_pincodezone.id;


--
-- Name: motor_ratings_uwdiscretion; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_ratings_uwdiscretion (
    id integer NOT NULL,
    fuel_type character varying(20) NOT NULL,
    age_bucket integer NOT NULL,
    rating numeric(7,5) NOT NULL,
    zone_id integer NOT NULL,
    amazon_rating numeric(7,5) NOT NULL,
    pos_rating numeric(7,5) NOT NULL,
    juxta_rating numeric(7,5) NOT NULL,
    make_id integer,
    model_id integer,
    cc_bucket character varying(20) NOT NULL,
    zero_dep_allowed character varying(2) NOT NULL,
    broker_discount double precision,
    version integer,
    amazon_discounting double precision,
    amazon_prime_discounting double precision,
    amazon_prime_rating numeric(7,5) NOT NULL,
    broker_discounting double precision,
    discounting double precision,
    CONSTRAINT motor_ratings_uwdiscretion_age_bucket_check CHECK ((age_bucket >= 0))
);


ALTER TABLE public.motor_ratings_uwdiscretion OWNER TO venkatesh;

--
-- Name: motor_ratings_uwdiscretion_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_ratings_uwdiscretion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_ratings_uwdiscretion_id_seq OWNER TO venkatesh;

--
-- Name: motor_ratings_uwdiscretion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_ratings_uwdiscretion_id_seq OWNED BY public.motor_ratings_uwdiscretion.id;


--
-- Name: motor_ratings_zone; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_ratings_zone (
    id integer NOT NULL,
    code integer NOT NULL,
    rating numeric(3,2) NOT NULL
);


ALTER TABLE public.motor_ratings_zone OWNER TO venkatesh;

--
-- Name: motor_ratings_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_ratings_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_ratings_zone_id_seq OWNER TO venkatesh;

--
-- Name: motor_ratings_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_ratings_zone_id_seq OWNED BY public.motor_ratings_zone.id;


--
-- Name: motor_utlead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_utlead (
    id integer NOT NULL,
    tracker_id integer,
    user_id integer,
    vehicle_id integer,
    CONSTRAINT validate_ut_lead CHECK ((('user_id' IS NOT NULL) OR ('tracker_id' IS NOT NULL)))
);


ALTER TABLE public.motor_utlead OWNER TO venkatesh;

--
-- Name: motor_utlead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_utlead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_utlead_id_seq OWNER TO venkatesh;

--
-- Name: motor_utlead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_utlead_id_seq OWNED BY public.motor_utlead.id;


--
-- Name: motor_vehicle; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.motor_vehicle (
    id integer NOT NULL,
    registration character varying(255) NOT NULL,
    data_verified boolean,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    variant_id integer,
    pre_inspection_status character varying(50),
    inspection_report jsonb,
    work_id integer,
    owner_email public.citext,
    owner_name character varying(200),
    owner_phone character varying(20),
    chassis_number character varying(255),
    engine_number character varying(255)
);


ALTER TABLE public.motor_vehicle OWNER TO venkatesh;

--
-- Name: motor_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.motor_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_vehicle_id_seq OWNER TO venkatesh;

--
-- Name: motor_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.motor_vehicle_id_seq OWNED BY public.motor_vehicle.id;


--
-- Name: ola_emailpreference; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ola_emailpreference (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    preference boolean NOT NULL
);


ALTER TABLE public.ola_emailpreference OWNER TO venkatesh;

--
-- Name: ola_emailpreferences_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ola_emailpreferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ola_emailpreferences_id_seq OWNER TO venkatesh;

--
-- Name: ola_emailpreferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ola_emailpreferences_id_seq OWNED BY public.ola_emailpreference.id;


--
-- Name: ola_invoice; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ola_invoice (
    id integer NOT NULL,
    ola_invoice_id character varying(31) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    gstin character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(31) NOT NULL,
    address text NOT NULL,
    document text,
    trip_summary text,
    created_on timestamp with time zone NOT NULL,
    invoice_id integer,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.ola_invoice OWNER TO venkatesh;

--
-- Name: ola_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ola_invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ola_invoice_id_seq OWNER TO venkatesh;

--
-- Name: ola_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ola_invoice_id_seq OWNED BY public.ola_invoice.id;


--
-- Name: ola_trip; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ola_trip (
    id integer NOT NULL,
    trip_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    cid character varying(255) NOT NULL,
    traveler_name character varying(255) NOT NULL,
    traveler_phone character varying(255) NOT NULL,
    booked_on timestamp with time zone,
    started_on timestamp with time zone,
    first_booked_on timestamp with time zone,
    eta timestamp with time zone,
    is_cancelled boolean NOT NULL,
    cancelled_on timestamp with time zone,
    cancelled_on_acko timestamp with time zone,
    ddd boolean,
    airport_ride boolean,
    extra jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    driver_id integer,
    policy_id integer,
    vehicle_id integer,
    cancelled_inserted_on timestamp with time zone,
    inserted_on timestamp with time zone,
    email character varying(255) NOT NULL,
    gstin character varying(255) NOT NULL,
    gstin_email character varying(255) NOT NULL,
    gstin_entity character varying(255) NOT NULL,
    nominee_dob date,
    nominee_name character varying(255) NOT NULL,
    nominee_relation character varying(255) NOT NULL,
    document text,
    company_name character varying(255) NOT NULL,
    claim_data jsonb NOT NULL,
    user_id integer,
    corporate_invoice_id integer,
    city character varying(255),
    state character varying(255),
    CONSTRAINT ola_trip_airport_ride_check CHECK ((airport_ride <> false)),
    CONSTRAINT ola_trip_ddd_check CHECK ((ddd <> false))
);


ALTER TABLE public.ola_trip OWNER TO venkatesh;

--
-- Name: ola_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ola_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ola_trip_id_seq OWNER TO venkatesh;

--
-- Name: ola_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ola_trip_id_seq OWNED BY public.ola_trip.id;


--
-- Name: ozonetel_agent; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ozonetel_agent (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ozonetel_id integer NOT NULL
);


ALTER TABLE public.ozonetel_agent OWNER TO venkatesh;

--
-- Name: ozonetel_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ozonetel_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ozonetel_agent_id_seq OWNER TO venkatesh;

--
-- Name: ozonetel_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ozonetel_agent_id_seq OWNED BY public.ozonetel_agent.id;


--
-- Name: ozonetel_agentlogin; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ozonetel_agentlogin (
    id integer NOT NULL,
    agent_id integer,
    agent_name character varying(255) NOT NULL,
    agent_mode character varying(255) NOT NULL,
    event character varying(255) NOT NULL,
    event_details character varying(255) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    report_date date NOT NULL
);


ALTER TABLE public.ozonetel_agentlogin OWNER TO venkatesh;

--
-- Name: ozonetel_agentlogin_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ozonetel_agentlogin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ozonetel_agentlogin_id_seq OWNER TO venkatesh;

--
-- Name: ozonetel_agentlogin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ozonetel_agentlogin_id_seq OWNED BY public.ozonetel_agentlogin.id;


--
-- Name: ozonetel_call; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ozonetel_call (
    id integer NOT NULL,
    user_name character varying(200) NOT NULL,
    start_time timestamp with time zone,
    call_duration character varying(200) NOT NULL,
    disposition character varying(200) NOT NULL,
    fall_back_rule character varying(200) NOT NULL,
    agent_name character varying(200) NOT NULL,
    caller_conf_audio_file character varying(200) NOT NULL,
    campaign_name character varying(200) NOT NULL,
    duration character varying(200) NOT NULL,
    status character varying(200) NOT NULL,
    transfer_type character varying(200) NOT NULL,
    transferred_to character varying(200) NOT NULL,
    time_to_answer character varying(200) NOT NULL,
    uui character varying(200) NOT NULL,
    phone_name character varying(20) NOT NULL,
    conf_duration character varying(200) NOT NULL,
    skill character varying(200) NOT NULL,
    agent_unique_id character varying(200) NOT NULL,
    end_time timestamp with time zone,
    customer_status character varying(200) NOT NULL,
    agent_phone_number character varying(20) NOT NULL,
    apikey character varying(50) NOT NULL,
    dial_status character varying(200) NOT NULL,
    comments character varying(200) NOT NULL,
    agent_status character varying(200) NOT NULL,
    agent_id character varying(200) NOT NULL,
    campaign_status character varying(200) NOT NULL,
    hangup_by character varying(200) NOT NULL,
    dialed_number character varying(200) NOT NULL,
    location character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    caller_id character varying(20) NOT NULL,
    audio_file character varying(200) NOT NULL,
    did character varying(20) NOT NULL,
    monitor_ucid character varying(50) NOT NULL,
    raw_body text NOT NULL
);


ALTER TABLE public.ozonetel_call OWNER TO venkatesh;

--
-- Name: ozonetel_call_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ozonetel_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ozonetel_call_id_seq OWNER TO venkatesh;

--
-- Name: ozonetel_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ozonetel_call_id_seq OWNED BY public.ozonetel_call.id;


--
-- Name: ozonetel_dailyagentbreak; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.ozonetel_dailyagentbreak (
    id integer NOT NULL,
    agent_id integer,
    agent_name character varying(255) NOT NULL,
    break_type character varying(255) NOT NULL,
    total_break_time time without time zone,
    report_date date NOT NULL
);


ALTER TABLE public.ozonetel_dailyagentbreak OWNER TO venkatesh;

--
-- Name: ozonetel_dailyagentbreak_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.ozonetel_dailyagentbreak_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ozonetel_dailyagentbreak_id_seq OWNER TO venkatesh;

--
-- Name: ozonetel_dailyagentbreak_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.ozonetel_dailyagentbreak_id_seq OWNED BY public.ozonetel_dailyagentbreak.id;


--
-- Name: payments_payment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.payments_payment (
    id integer NOT NULL,
    app character varying(100) NOT NULL,
    okind character varying(100) NOT NULL,
    oid integer NOT NULL,
    status character varying(100) NOT NULL,
    amount numeric(15,2) NOT NULL,
    form_data jsonb NOT NULL,
    pg character varying(100) NOT NULL,
    pg_token character varying(100) NOT NULL,
    pg_response jsonb NOT NULL,
    offline character varying(100) NOT NULL,
    cancel character varying(100) NOT NULL,
    user_id integer NOT NULL,
    failure character varying(100) NOT NULL,
    success character varying(100) NOT NULL,
    intent character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    payment_method character varying(15) NOT NULL,
    order_id character varying(255) NOT NULL,
    payment_on timestamp with time zone,
    mandate_id integer,
    CONSTRAINT payments_payment_oid_check CHECK ((oid >= 0))
);


ALTER TABLE public.payments_payment OWNER TO venkatesh;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_payment_id_seq OWNER TO venkatesh;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments_payment.id;


--
-- Name: payments_refund; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.payments_refund (
    id integer NOT NULL,
    app character varying(100) NOT NULL,
    status character varying(100) NOT NULL,
    pg_token character varying(100) NOT NULL,
    pg_response jsonb NOT NULL,
    amount numeric(15,2) NOT NULL,
    payment_id integer NOT NULL,
    intent character varying(100) NOT NULL,
    oid integer NOT NULL,
    okind character varying(100) NOT NULL,
    user_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    CONSTRAINT payments_refund_oid_check CHECK ((oid >= 0))
);


ALTER TABLE public.payments_refund OWNER TO venkatesh;

--
-- Name: payments_refund_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.payments_refund_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_refund_id_seq OWNER TO venkatesh;

--
-- Name: payments_refund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.payments_refund_id_seq OWNED BY public.payments_refund.id;


--
-- Name: payments_settlement; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.payments_settlement (
    id integer NOT NULL,
    utr character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    payment_type character varying(255) NOT NULL,
    transaction_date timestamp with time zone,
    customer_id character varying(255) NOT NULL,
    gateway character varying(255) NOT NULL,
    txn_id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    charges numeric(15,2),
    gst numeric(15,2),
    gross_amount numeric(15,2),
    net_amount numeric(15,2),
    refund_amount numeric(15,2),
    refund_date date,
    refund_id character varying(255),
    refund_status character varying(255),
    settlement_date timestamp with time zone,
    report_date date NOT NULL,
    payment_id integer
);


ALTER TABLE public.payments_settlement OWNER TO venkatesh;

--
-- Name: payments_settlement_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.payments_settlement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_settlement_id_seq OWNER TO venkatesh;

--
-- Name: payments_settlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.payments_settlement_id_seq OWNED BY public.payments_settlement.id;


--
-- Name: r2d2_allowance_reimbursement; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_allowance_reimbursement (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_allowance_reimbursement OWNER TO venkatesh;

--
-- Name: r2d2_allowance_reimbursement_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_allowance_reimbursement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_allowance_reimbursement_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_allowance_reimbursement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_allowance_reimbursement_id_seq OWNED BY public.r2d2_allowance_reimbursement.id;


--
-- Name: r2d2_amazon_mobile_repair; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_amazon_mobile_repair (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone,
    customer_id jsonb,
    customer_name character varying(255),
    product character varying(255),
    updated_on timestamp with time zone
);


ALTER TABLE public.r2d2_amazon_mobile_repair OWNER TO venkatesh;

--
-- Name: r2d2_amazonmobilerepair_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_amazonmobilerepair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_amazonmobilerepair_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_amazonmobilerepair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_amazonmobilerepair_id_seq OWNED BY public.r2d2_amazon_mobile_repair.id;


--
-- Name: r2d2_appliances_extended_warranty; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_appliances_extended_warranty (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    product character varying(255),
    customer_name character varying(255),
    customer_id jsonb,
    email character varying(255),
    serial_number character varying(255),
    sale_price double precision,
    pincode character varying(255),
    product_order_id character varying(255),
    address character varying(255),
    city character varying(255),
    state character varying(255),
    status character varying(255),
    purchased_on timestamp with time zone,
    delivered_on timestamp with time zone,
    created_on timestamp with time zone,
    updated_on timestamp with time zone
);


ALTER TABLE public.r2d2_appliances_extended_warranty OWNER TO venkatesh;

--
-- Name: r2d2_appliances_extended_warranty_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_appliances_extended_warranty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_appliances_extended_warranty_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_appliances_extended_warranty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_appliances_extended_warranty_id_seq OWNED BY public.r2d2_appliances_extended_warranty.id;


--
-- Name: r2d2_burglary_fire_damage; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_burglary_fire_damage (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_burglary_fire_damage OWNER TO venkatesh;

--
-- Name: r2d2_burglary_fire_damage_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_burglary_fire_damage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_burglary_fire_damage_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_burglary_fire_damage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_burglary_fire_damage_id_seq OWNED BY public.r2d2_burglary_fire_damage.id;


--
-- Name: r2d2_call; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_call (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    did character varying(100),
    location character varying(100),
    caller_id character varying(100),
    agent_desk_phone character varying(100),
    skill character varying(100),
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    duration character varying(100),
    fallback_rule character varying(100),
    dialed_number character varying(100),
    call_type character varying(100),
    agent_email character varying(100),
    agent_unique_id character varying(100),
    disposition character varying(100),
    hangup_by character varying(100),
    status character varying(100),
    audio_file character varying(1000),
    transfer_type character varying(100),
    transferred_to character varying(100),
    dial_status character varying(100),
    agent_name character varying(100),
    audio_file_s3 character varying(1000),
    comments text,
    skill_id character varying(100),
    talk_time integer,
    time_to_answer integer,
    uui character varying(100)
);


ALTER TABLE public.r2d2_call OWNER TO venkatesh;

--
-- Name: r2d2_call_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_call_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_call_id_seq OWNED BY public.r2d2_call.id;


--
-- Name: r2d2_cannedresponse; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_cannedresponse (
    id integer NOT NULL,
    canned_response_id character varying(63) NOT NULL,
    channel character varying(15) NOT NULL,
    context jsonb NOT NULL,
    email_id integer,
    phone_id integer,
    sender_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.r2d2_cannedresponse OWNER TO venkatesh;

--
-- Name: r2d2_cannedresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_cannedresponse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_cannedresponse_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_cannedresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_cannedresponse_id_seq OWNED BY public.r2d2_cannedresponse.id;


--
-- Name: r2d2_carlead; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_carlead (
    id integer NOT NULL,
    lead_id character varying(256) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    last_updated_on timestamp with time zone,
    previous_policy_expiry timestamp with time zone,
    to_be_called_on_date timestamp with time zone,
    phone character varying(256) NOT NULL,
    customer_id character varying(256),
    customer_name character varying(256),
    pincode character varying(10),
    city character varying(256),
    state character varying(256),
    zone character varying(256),
    registration_number character varying(256),
    make character varying(256),
    model character varying(256),
    variant character varying(256),
    cubic_capacity character varying(256),
    registration_year integer NOT NULL,
    idv double precision NOT NULL,
    mmv_or_registration_number_flow character varying(256),
    is_car_identification_started boolean NOT NULL,
    is_car_variant_identified boolean NOT NULL,
    is_fastlane_identified boolean NOT NULL,
    is_fastlane_response_incorrect boolean NOT NULL,
    is_mmv_initiated boolean NOT NULL,
    is_variant_confirmed boolean NOT NULL,
    is_pincode_screen_loaded boolean NOT NULL,
    is_pincode_confirmed boolean NOT NULL,
    is_pincode_non_serviceable boolean NOT NULL,
    is_pincode_objectionable boolean NOT NULL,
    is_previous_policy_expiry_screen_loaded boolean NOT NULL,
    is_previous_policy_expired_selected boolean NOT NULL,
    is_previous_policy_expiry_not_selected boolean NOT NULL,
    is_registration_year_screen_loaded boolean NOT NULL,
    is_last_claim_year_screen_loaded boolean NOT NULL,
    is_quote_screen_loaded boolean NOT NULL,
    is_idv_edited boolean NOT NULL,
    is_pre_inspection_case boolean NOT NULL,
    is_quote_screen_loaded_non_inspection boolean NOT NULL,
    is_quote_buy_now_clicked_non_inspection boolean NOT NULL,
    is_checkout_screen_loaded_non_inspection boolean NOT NULL,
    is_make_payment_clicked_non_inspection boolean NOT NULL,
    is_mobile_number_entered_non_inspection boolean NOT NULL,
    is_buy_later_cta_clicked_non_inspection boolean NOT NULL,
    is_buy_later_form_submitted boolean NOT NULL,
    is_login_screen_loaded boolean NOT NULL,
    is_mobile_number_entered_login_screen boolean NOT NULL,
    is_send_otp_clicked boolean NOT NULL,
    is_verify_otp_clicked boolean NOT NULL,
    is_inspection_required_screen_loaded_inspection boolean NOT NULL,
    is_scheduled_inspection_cta_clicked_inspection boolean NOT NULL,
    is_inspection_confirm_screen_loaded_inspection boolean NOT NULL,
    is_track_inspection_clicked_inspection boolean NOT NULL,
    is_inspection_scheduled_inspection boolean NOT NULL,
    is_inspection_approved_inspection boolean NOT NULL,
    is_pay_now_clicked boolean NOT NULL,
    is_pay_by_card boolean NOT NULL,
    is_pay_by_net_banking boolean NOT NULL,
    is_pay_by_wallet boolean NOT NULL,
    is_pay_by_amazon_pay boolean NOT NULL,
    is_payment_successful boolean NOT NULL,
    is_payment_try_again_clicked boolean NOT NULL,
    no_of_attempts integer NOT NULL,
    no_of_connects integer NOT NULL,
    first_call_date_time timestamp with time zone,
    first_call_duration integer NOT NULL,
    first_agent_id character varying(256),
    last_call_time timestamp with time zone,
    last_call_duration integer NOT NULL,
    last_agent_id character varying(256),
    is_follow_up_required boolean NOT NULL,
    follow_up_date_time timestamp with time zone,
    is_assisted_sale boolean NOT NULL,
    attributed_source character varying(256),
    attributed_campaign character varying(256),
    attributed_utm_term character varying(256),
    attributed_utm_content character varying(256),
    attributed_category character varying(256),
    attributed_device character varying(256),
    attributed_gclid character varying(256),
    attributed_ip character varying(256),
    visit_count integer NOT NULL,
    total_spent_time_on_site integer NOT NULL,
    time_since_drop_off_last_visit integer NOT NULL,
    is_existing_customer boolean NOT NULL,
    policy_number character varying(256),
    crm_state_id integer,
    first_call_disposition_id integer,
    fuel_type_id integer,
    last_call_disposition_id integer,
    last_call_sub_disposition_id integer,
    lead_creator_id integer,
    lead_type_id integer,
    product_state_id integer
);


ALTER TABLE public.r2d2_carlead OWNER TO venkatesh;

--
-- Name: r2d2_carlead_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_carlead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_carlead_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_carlead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_carlead_id_seq OWNED BY public.r2d2_carlead.id;


--
-- Name: r2d2_claim; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_claim (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    accident_date timestamp with time zone,
    accident_description character varying(200),
    accident_dl character varying(200),
    accident_place character varying(200),
    assessment_amount double precision,
    authorization_form jsonb,
    customer_approved boolean,
    customer_address character varying(200),
    customer_city character varying(200),
    customer_email character varying(200),
    customer_name character varying(200),
    customer_phone character varying(10),
    customer_pincode integer,
    customer_state character varying(200),
    damage_1 jsonb,
    damage_2 jsonb,
    damage_3 jsonb,
    damage_4 jsonb,
    damage_5 jsonb,
    damage_6 jsonb,
    damage_7 jsonb,
    damage_8 jsonb,
    damage_9 jsonb,
    damage_10 jsonb,
    damage_12 jsonb,
    damage_13 jsonb,
    damage_14 jsonb,
    damage_15 jsonb,
    driving_license jsonb,
    estimated_amount double precision,
    fir jsonb,
    fir_no character varying(200),
    fire_report jsonb,
    fire_report_no character varying(200),
    front_lh_view jsonb,
    front_rh_view jsonb,
    front_view jsonb,
    insurer character varying(200),
    job_card jsonb,
    lh_view jsonb,
    odometer_reading jsonb,
    pan_card jsonb,
    pickup_address character varying(200),
    pickup_time timestamp with time zone,
    policy_expiry timestamp with time zone,
    policy_number character varying(200),
    rcbook jsonb,
    rcs character varying(200),
    rcs_manager character varying(200),
    rear_lh_view jsonb,
    rear_rh_view jsonb,
    rh_view jsonb,
    status character varying(200),
    tp_injury character varying(200),
    vehicle_dropped_workshop boolean,
    vehicle_make character varying(200),
    vehicle_model character varying(200),
    vehicle_reg_date timestamp with time zone,
    vehicle_reg_no character varying(200),
    vehicle_rto character varying(200),
    vehicle_variant character varying(200),
    vin_plate jsonb,
    repaired_1 jsonb,
    repaired_2 jsonb,
    repaired_3 jsonb,
    repaired_4 jsonb,
    repaired_5 jsonb,
    repaired_6 jsonb,
    repaired_7 jsonb,
    repaired_8 jsonb,
    repaired_9 jsonb,
    repaired_10 jsonb,
    repaired_11 jsonb,
    repaired_12 jsonb,
    repaired_13 jsonb,
    repaired_14 jsonb,
    repaired_15 jsonb,
    invoice_copy jsonb,
    insurer_liability double precision,
    customer_liability double precision,
    vehicle_returned_to_customer boolean,
    policy_purchase_date timestamp with time zone,
    policy_age double precision,
    fnol_date timestamp with time zone,
    fnol_channel character varying(200),
    who_is_notifying character varying(200),
    amount_claimed double precision,
    amount_given double precision,
    metal_parts double precision,
    plastic_parts double precision,
    glass_parts double precision,
    fiber_parts double precision,
    total_labour double precision,
    pickup_delay_from_schedule character varying(200),
    drop_delay_from_schedule character varying(200),
    workshop character varying(200),
    earliest_expected timestamp with time zone,
    actual_work_started_on timestamp with time zone,
    workshop_promised_on timestamp with time zone,
    actual_finished_on timestamp with time zone,
    workshop_sla character varying(200),
    workshop_delay character varying(200),
    sla character varying(200),
    surveyor_delay character varying(200),
    surveyor_delay_reason character varying(200),
    survey_reduction_ratio double precision,
    surveyor_sla character varying(200),
    surveyor_earliest_possible_date timestamp with time zone,
    actual_survey_date timestamp with time zone,
    workshop_reason_for_delay character varying(200),
    loss_date timestamp with time zone,
    intimation_date timestamp with time zone,
    loss_type character varying(200),
    scheduled_pickup timestamp with time zone,
    actual_pickup timestamp with time zone,
    scheduled_survey timestamp with time zone,
    actual_survey timestamp with time zone,
    repairer_name character varying(200),
    investigator_name character varying(200),
    liability_issuance_date timestamp with time zone,
    closure_date timestamp with time zone,
    reserve_claim_amount double precision,
    advance_payment double precision,
    outstanding_amount double precision,
    depreciation_amount_paid double precision,
    salvage_charged double precision
);


ALTER TABLE public.r2d2_claim OWNER TO venkatesh;

--
-- Name: r2d2_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_claim_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_claim_id_seq OWNED BY public.r2d2_claim.id;


--
-- Name: r2d2_disability_death; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_disability_death (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_disability_death OWNER TO venkatesh;

--
-- Name: r2d2_disability_death_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_disability_death_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_disability_death_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_disability_death_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_disability_death_id_seq OWNED BY public.r2d2_disability_death.id;


--
-- Name: r2d2_edataspec; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_edataspec (
    id integer NOT NULL,
    ekind character varying(200) NOT NULL,
    okind character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    vkind character varying(200) NOT NULL,
    validations text[] NOT NULL
);


ALTER TABLE public.r2d2_edataspec OWNER TO venkatesh;

--
-- Name: r2d2_edataspec_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_edataspec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_edataspec_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_edataspec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_edataspec_id_seq OWNED BY public.r2d2_edataspec.id;


--
-- Name: r2d2_endorsement; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_endorsement (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL
);


ALTER TABLE public.r2d2_endorsement OWNER TO venkatesh;

--
-- Name: r2d2_endorsement_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_endorsement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_endorsement_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_endorsement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_endorsement_id_seq OWNED BY public.r2d2_endorsement.id;


--
-- Name: r2d2_event; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_event (
    id integer NOT NULL,
    app character varying(200) NOT NULL,
    okind character varying(200) NOT NULL,
    oid character varying(200),
    odata jsonb NOT NULL,
    ekind character varying(200) NOT NULL,
    edata jsonb NOT NULL,
    created_on timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    tracker character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    user_agent character varying(500) NOT NULL,
    visit_id integer
);


ALTER TABLE public.r2d2_event OWNER TO venkatesh;

--
-- Name: r2d2_event_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_event_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_event_id_seq OWNED BY public.r2d2_event.id;


--
-- Name: r2d2_hospitalization_ipd; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_hospitalization_ipd (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_hospitalization_ipd OWNER TO venkatesh;

--
-- Name: r2d2_hospitalization_ipd_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_hospitalization_ipd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_hospitalization_ipd_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_hospitalization_ipd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_hospitalization_ipd_id_seq OWNED BY public.r2d2_hospitalization_ipd.id;


--
-- Name: r2d2_hospitalization_opd; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_hospitalization_opd (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_hospitalization_opd OWNER TO venkatesh;

--
-- Name: r2d2_hospitalization_opd_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_hospitalization_opd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_hospitalization_opd_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_hospitalization_opd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_hospitalization_opd_id_seq OWNED BY public.r2d2_hospitalization_opd.id;


--
-- Name: r2d2_link; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_link (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    short character varying(200) NOT NULL,
    url text NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    created_by jsonb,
    ip inet,
    is_mobile boolean,
    is_app boolean,
    device character varying(31),
    os character varying(31),
    browser character varying(31),
    browser_version character varying(31)
);


ALTER TABLE public.r2d2_link OWNER TO venkatesh;

--
-- Name: r2d2_link_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_link_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_link_id_seq OWNED BY public.r2d2_link.id;


--
-- Name: r2d2_loss_theft_personal_belongings; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_loss_theft_personal_belongings (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_id character varying(255),
    claim_id character varying(255),
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.r2d2_loss_theft_personal_belongings OWNER TO venkatesh;

--
-- Name: r2d2_loss_theft_personal_belongings_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_loss_theft_personal_belongings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_loss_theft_personal_belongings_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_loss_theft_personal_belongings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_loss_theft_personal_belongings_id_seq OWNED BY public.r2d2_loss_theft_personal_belongings.id;


--
-- Name: r2d2_lp_visit; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_lp_visit (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    url character varying(255),
    variant character varying(255),
    product character varying(255),
    phone character varying(255),
    name character varying(255),
    registration_number character varying(255),
    tracker_id character varying(255)
);


ALTER TABLE public.r2d2_lp_visit OWNER TO venkatesh;

--
-- Name: r2d2_lp_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_lp_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_lp_visit_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_lp_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_lp_visit_id_seq OWNED BY public.r2d2_lp_visit.id;


--
-- Name: r2d2_lsq_activity; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_lsq_activity (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL
);


ALTER TABLE public.r2d2_lsq_activity OWNER TO venkatesh;

--
-- Name: r2d2_lsq_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_lsq_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_lsq_activity_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_lsq_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_lsq_activity_id_seq OWNED BY public.r2d2_lsq_activity.id;


--
-- Name: r2d2_mobile; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_mobile (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    product character varying(255),
    customer_name character varying(255),
    customer_id jsonb,
    email character varying(255),
    imei character varying(255),
    sale_price double precision,
    pincode character varying(255),
    phone_order_id character varying(255),
    address character varying(255),
    city character varying(255),
    state character varying(255),
    status character varying(255),
    purchased_on timestamp with time zone,
    delivered_on timestamp with time zone,
    subscription_start timestamp with time zone,
    subscription_end timestamp with time zone,
    created_on timestamp with time zone,
    updated_on timestamp with time zone
);


ALTER TABLE public.r2d2_mobile OWNER TO venkatesh;

--
-- Name: r2d2_mobile_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_mobile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_mobile_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_mobile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_mobile_id_seq OWNED BY public.r2d2_mobile.id;


--
-- Name: r2d2_notification; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_notification (
    id integer NOT NULL,
    sent_on timestamp with time zone,
    status character varying(50) NOT NULL,
    error text NOT NULL,
    event_id integer NOT NULL,
    data jsonb,
    created_on timestamp with time zone,
    raction_id integer
);


ALTER TABLE public.r2d2_notification OWNER TO venkatesh;

--
-- Name: r2d2_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_notification_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_notification_id_seq OWNED BY public.r2d2_notification.id;


--
-- Name: r2d2_odataspec; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_odataspec (
    id integer NOT NULL,
    ekind character varying(200) NOT NULL,
    okind character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    vkind character varying(200) NOT NULL,
    validations text[] NOT NULL,
    CONSTRAINT field_name CHECK (((name)::text <> 'oid'::text))
);


ALTER TABLE public.r2d2_odataspec OWNER TO venkatesh;

--
-- Name: r2d2_odataspec_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_odataspec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_odataspec_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_odataspec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_odataspec_id_seq OWNED BY public.r2d2_odataspec.id;


--
-- Name: r2d2_ola_trip; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_ola_trip (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    trip_id character varying(200)
);


ALTER TABLE public.r2d2_ola_trip OWNER TO venkatesh;

--
-- Name: r2d2_ola_trip_claim; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_ola_trip_claim (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    accident_subtype character varying(255),
    actual_deviation_time character varying(200),
    additional_document_required character varying(255),
    another_person_name character varying(255),
    bank_account_details_required character varying(255),
    booking_time timestamp with time zone,
    car_license_plate_number character varying(255),
    car_model character varying(255),
    category character varying(255),
    claim_amount_paid double precision,
    claim_amount_requested double precision,
    claim_generated_date_time timestamp with time zone,
    claim_id character varying(255),
    claim_type character varying(255),
    claimant character varying(255),
    co_rider_name character varying(255),
    co_rider_phone character varying(10),
    customer_email character varying(255),
    customer_name character varying(255),
    customer_phone character varying(10),
    date_of_loss timestamp with time zone,
    destination_address character varying(255),
    destination_lang character varying(255),
    destination_lat character varying(255),
    documents_uploaded_status character varying(255),
    driver_partner_name character varying(255),
    driver_partner_phone character varying(10),
    expected_deviation_time character varying(200),
    first_booking_time timestamp with time zone,
    first_eta_to_dest character varying(200),
    first_eta_to_pickup character varying(200),
    policy_end_date_time timestamp with time zone,
    policy_id character varying(255),
    policy_start_date_time timestamp with time zone,
    source_address character varying(255),
    status character varying(255),
    sum_insured double precision,
    theft_fire_subtype character varying(255),
    trip_end_time timestamp with time zone,
    trip_source_lang character varying(255),
    trip_source_lat character varying(255),
    trip_start_time timestamp with time zone,
    user_id character varying(255),
    withdraw_reason character varying(255)
);


ALTER TABLE public.r2d2_ola_trip_claim OWNER TO venkatesh;

--
-- Name: r2d2_ola_trip_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_ola_trip_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_ola_trip_claim_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_ola_trip_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_ola_trip_claim_id_seq OWNED BY public.r2d2_ola_trip_claim.id;


--
-- Name: r2d2_ola_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_ola_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_ola_trip_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_ola_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_ola_trip_id_seq OWNED BY public.r2d2_ola_trip.id;


--
-- Name: r2d2_payment; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_payment (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    payment_option character varying(100),
    net_banking_option character varying(100),
    payment_gateway character varying(100),
    amount numeric(15,2),
    app character varying(100),
    card_type character varying(100),
    intent character varying(100),
    object_id character varying(100),
    object_kind character varying(100),
    payment_on timestamp with time zone,
    product character varying(100),
    status character varying(100),
    user_id jsonb,
    wallet_option character varying(100)
);


ALTER TABLE public.r2d2_payment OWNER TO venkatesh;

--
-- Name: r2d2_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_payment_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_payment_id_seq OWNED BY public.r2d2_payment.id;


--
-- Name: r2d2_policy; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_policy (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    policy_number character varying(100),
    status character varying(31),
    created_on timestamp with time zone,
    updated_on timestamp with time zone,
    customer_id jsonb,
    end_date character varying(31),
    product character varying(100),
    quote_id jsonb,
    start_date character varying(31),
    payment_id jsonb
);


ALTER TABLE public.r2d2_policy OWNER TO venkatesh;

--
-- Name: r2d2_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_policy_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_policy_id_seq OWNED BY public.r2d2_policy.id;


--
-- Name: r2d2_pre_inspection; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_pre_inspection (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    registration_num character varying(255),
    pre_inspection_status character varying(255),
    customer_name character varying(255),
    pre_inspection_address character varying(255),
    customer_email character varying(255),
    color character varying(255)
);


ALTER TABLE public.r2d2_pre_inspection OWNER TO venkatesh;

--
-- Name: r2d2_pre_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_pre_inspection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_pre_inspection_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_pre_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_pre_inspection_id_seq OWNED BY public.r2d2_pre_inspection.id;


--
-- Name: r2d2_quote; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_quote (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    product character varying(200),
    registration_number character varying(200),
    variant_id character varying(200),
    previous_policy_expiry_date timestamp with time zone,
    last_claim_year character varying(200),
    idv character varying(200),
    pincode character varying(200),
    aadhar_number character varying(200),
    asset_id character varying(200),
    chassis_number character varying(200),
    color_id character varying(200),
    continue_search_quote character varying(200),
    created_on timestamp with time zone,
    email character varying(200),
    fuel_type character varying(200),
    generator character varying(200),
    make_id character varying(200),
    marketing_id character varying(200),
    model_id character varying(200),
    ncb_applicable character varying(200),
    net_banking_option character varying(200),
    payment_gateway character varying(200),
    payment_option character varying(200),
    payment_status character varying(200),
    plan_selected character varying(200),
    plans_displayed character varying(200),
    policy_similar_quote character varying(200),
    policy_start_date timestamp with time zone,
    pre_inspection_location character varying(200),
    pre_inspection_required character varying(200),
    pre_inspection_status character varying(200),
    pre_inspection_time character varying(200),
    premium character varying(200),
    quote_status character varying(200),
    registration_year character varying(200),
    token_money character varying(200),
    tracker_id character varying(200),
    user_id character varying(200),
    name character varying(200),
    phone character varying(200),
    wallet_option character varying(200),
    payment_id integer,
    pre_inspection_address character varying(200),
    previous_policy_expired boolean,
    previous_policy_expiry_range character varying(200)
);


ALTER TABLE public.r2d2_quote OWNER TO venkatesh;

--
-- Name: r2d2_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_quote_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_quote_id_seq OWNED BY public.r2d2_quote.id;


--
-- Name: r2d2_tracker; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_tracker (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    code_version character varying(63),
    landing_page text,
    referer text,
    initial_ip inet,
    is_mobile boolean,
    is_app boolean,
    device character varying(31),
    os character varying(31),
    browser character varying(31),
    browser_version character varying(31),
    user_id jsonb
);


ALTER TABLE public.r2d2_tracker OWNER TO venkatesh;

--
-- Name: r2d2_tracker_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_tracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_tracker_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_tracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_tracker_id_seq OWNED BY public.r2d2_tracker.id;


--
-- Name: r2d2_user; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_user (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    joined_on timestamp with time zone,
    registration_number character varying(20),
    user_name character varying(100),
    user_phone character varying(20)
);


ALTER TABLE public.r2d2_user OWNER TO venkatesh;

--
-- Name: r2d2_user_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_user_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_user_id_seq OWNED BY public.r2d2_user.id;


--
-- Name: r2d2_visit; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.r2d2_visit (
    id integer NOT NULL,
    oid character varying(200) NOT NULL,
    r2d2_last_modified_on timestamp with time zone NOT NULL,
    ip character varying(255),
    landing_url character varying(255),
    referer character varying(255),
    bounce_url character varying(255),
    created_on timestamp with time zone,
    updated_on timestamp with time zone,
    category character varying(255),
    gclid character varying(255),
    utm_campaign character varying(255),
    utm_content character varying(255),
    utm_medium character varying(255),
    utm_source character varying(255),
    utm_term character varying(255)
);


ALTER TABLE public.r2d2_visit OWNER TO venkatesh;

--
-- Name: r2d2_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.r2d2_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.r2d2_visit_id_seq OWNER TO venkatesh;

--
-- Name: r2d2_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.r2d2_visit_id_seq OWNED BY public.r2d2_visit.id;


--
-- Name: reports_keyreports; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.reports_keyreports (
    id integer NOT NULL,
    key timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE public.reports_keyreports OWNER TO venkatesh;

--
-- Name: reports_keyreports_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.reports_keyreports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_keyreports_id_seq OWNER TO venkatesh;

--
-- Name: reports_keyreports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.reports_keyreports_id_seq OWNED BY public.reports_keyreports.id;


--
-- Name: reports_report; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.reports_report (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    table_detail jsonb NOT NULL
);


ALTER TABLE public.reports_report OWNER TO venkatesh;

--
-- Name: reports_report_downs; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.reports_report_downs (
    id integer NOT NULL,
    report_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.reports_report_downs OWNER TO venkatesh;

--
-- Name: reports_report_downs_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.reports_report_downs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_report_downs_id_seq OWNER TO venkatesh;

--
-- Name: reports_report_downs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.reports_report_downs_id_seq OWNED BY public.reports_report_downs.id;


--
-- Name: reports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.reports_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_report_id_seq OWNER TO venkatesh;

--
-- Name: reports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.reports_report_id_seq OWNED BY public.reports_report.id;


--
-- Name: reports_report_selfs; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.reports_report_selfs (
    id integer NOT NULL,
    report_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.reports_report_selfs OWNER TO venkatesh;

--
-- Name: reports_report_selfs_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.reports_report_selfs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_report_selfs_id_seq OWNER TO venkatesh;

--
-- Name: reports_report_selfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.reports_report_selfs_id_seq OWNED BY public.reports_report_selfs.id;


--
-- Name: reports_report_ups; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.reports_report_ups (
    id integer NOT NULL,
    report_id integer NOT NULL,
    oentity_id integer NOT NULL
);


ALTER TABLE public.reports_report_ups OWNER TO venkatesh;

--
-- Name: reports_report_ups_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.reports_report_ups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_report_ups_id_seq OWNER TO venkatesh;

--
-- Name: reports_report_ups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.reports_report_ups_id_seq OWNED BY public.reports_report_ups.id;


--
-- Name: slots_slot; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.slots_slot (
    id integer NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    template_id integer
);


ALTER TABLE public.slots_slot OWNER TO venkatesh;

--
-- Name: slots_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.slots_slot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_slot_id_seq OWNER TO venkatesh;

--
-- Name: slots_slot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.slots_slot_id_seq OWNED BY public.slots_slot.id;


--
-- Name: slots_slottemplate; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.slots_slottemplate (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.slots_slottemplate OWNER TO venkatesh;

--
-- Name: slots_slottemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.slots_slottemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_slottemplate_id_seq OWNER TO venkatesh;

--
-- Name: slots_slottemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.slots_slottemplate_id_seq OWNED BY public.slots_slottemplate.id;


--
-- Name: slots_slottemplate_template_time_range; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.slots_slottemplate_template_time_range (
    id integer NOT NULL,
    slottemplate_id integer NOT NULL,
    slottime_id integer NOT NULL
);


ALTER TABLE public.slots_slottemplate_template_time_range OWNER TO venkatesh;

--
-- Name: slots_slottemplate_template_time_range_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.slots_slottemplate_template_time_range_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_slottemplate_template_time_range_id_seq OWNER TO venkatesh;

--
-- Name: slots_slottemplate_template_time_range_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.slots_slottemplate_template_time_range_id_seq OWNED BY public.slots_slottemplate_template_time_range.id;


--
-- Name: slots_slottime; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.slots_slottime (
    id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL
);


ALTER TABLE public.slots_slottime OWNER TO venkatesh;

--
-- Name: slots_slottime_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.slots_slottime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_slottime_id_seq OWNER TO venkatesh;

--
-- Name: slots_slottime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.slots_slottime_id_seq OWNED BY public.slots_slottime.id;


--
-- Name: socialleads_socialleads; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.socialleads_socialleads (
    id integer NOT NULL,
    csv_path character varying(256) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.socialleads_socialleads OWNER TO venkatesh;

--
-- Name: socialleads_socialleads_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.socialleads_socialleads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialleads_socialleads_id_seq OWNER TO venkatesh;

--
-- Name: socialleads_socialleads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.socialleads_socialleads_id_seq OWNED BY public.socialleads_socialleads.id;


--
-- Name: subscription_mandate; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.subscription_mandate (
    id integer NOT NULL,
    mandate_id character varying(50),
    order_id character varying(50) NOT NULL,
    amount character varying(10) NOT NULL,
    currency character varying(3) NOT NULL,
    customer_id character varying(32),
    customer_email character varying(32),
    customer_phone character varying(32),
    create_mandate character varying(16) NOT NULL,
    mandate_max_amount character varying(16),
    status character varying(16) NOT NULL,
    gateway_id character varying(5),
    pg_response jsonb NOT NULL,
    mandate_token character varying(32),
    user_id integer
);


ALTER TABLE public.subscription_mandate OWNER TO venkatesh;

--
-- Name: subscription_mandate_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.subscription_mandate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_mandate_id_seq OWNER TO venkatesh;

--
-- Name: subscription_mandate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.subscription_mandate_id_seq OWNED BY public.subscription_mandate.id;


--
-- Name: users_company; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_company (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.users_company OWNER TO venkatesh;

--
-- Name: users_company_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_company_id_seq OWNER TO venkatesh;

--
-- Name: users_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_company_id_seq OWNED BY public.users_company.id;


--
-- Name: users_device; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_device (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    last_active_on timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_device OWNER TO venkatesh;

--
-- Name: users_device_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_device_id_seq OWNER TO venkatesh;

--
-- Name: users_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_device_id_seq OWNED BY public.users_device.id;


--
-- Name: users_email; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_email (
    id integer NOT NULL,
    email public.citext NOT NULL,
    is_verified boolean,
    is_primary boolean,
    user_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT users_email_is_primary_check CHECK ((is_primary <> false)),
    CONSTRAINT users_email_is_verified_check CHECK ((is_verified <> false)),
    CONSTRAINT users_email_is_verified_is_primary_check CHECK (((is_verified IS NOT NULL) OR (is_primary IS NULL)))
);


ALTER TABLE public.users_email OWNER TO venkatesh;

--
-- Name: users_email_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_email_id_seq OWNER TO venkatesh;

--
-- Name: users_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_email_id_seq OWNED BY public.users_email.id;


--
-- Name: users_oentity; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_oentity (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    jd text NOT NULL,
    boss_id integer,
    user_id integer,
    skill_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    team character varying(255)
);


ALTER TABLE public.users_oentity OWNER TO venkatesh;

--
-- Name: users_oentity_dotted_line; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_oentity_dotted_line (
    id integer NOT NULL,
    from_oentity_id integer NOT NULL,
    to_oentity_id integer NOT NULL
);


ALTER TABLE public.users_oentity_dotted_line OWNER TO venkatesh;

--
-- Name: users_oentity_dotted_line_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_oentity_dotted_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_oentity_dotted_line_id_seq OWNER TO venkatesh;

--
-- Name: users_oentity_dotted_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_oentity_dotted_line_id_seq OWNED BY public.users_oentity_dotted_line.id;


--
-- Name: users_oentity_down; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_oentity_down (
    id integer NOT NULL,
    oentity_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_oentity_down OWNER TO venkatesh;

--
-- Name: users_oentity_down_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_oentity_down_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_oentity_down_id_seq OWNER TO venkatesh;

--
-- Name: users_oentity_down_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_oentity_down_id_seq OWNED BY public.users_oentity_down.id;


--
-- Name: users_oentity_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_oentity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_oentity_id_seq OWNER TO venkatesh;

--
-- Name: users_oentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_oentity_id_seq OWNED BY public.users_oentity.id;


--
-- Name: users_oentity_self; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_oentity_self (
    id integer NOT NULL,
    oentity_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_oentity_self OWNER TO venkatesh;

--
-- Name: users_oentity_self_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_oentity_self_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_oentity_self_id_seq OWNER TO venkatesh;

--
-- Name: users_oentity_self_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_oentity_self_id_seq OWNED BY public.users_oentity_self.id;


--
-- Name: users_oentity_up; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_oentity_up (
    id integer NOT NULL,
    oentity_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_oentity_up OWNER TO venkatesh;

--
-- Name: users_oentity_up_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_oentity_up_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_oentity_up_id_seq OWNER TO venkatesh;

--
-- Name: users_oentity_up_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_oentity_up_id_seq OWNED BY public.users_oentity_up.id;


--
-- Name: users_phone; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_phone (
    id integer NOT NULL,
    phone character varying(20) NOT NULL,
    is_verified boolean,
    is_primary boolean,
    user_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT users_phone_is_primary_check CHECK ((is_primary <> false)),
    CONSTRAINT users_phone_is_verified_check CHECK ((is_verified <> false)),
    CONSTRAINT users_phone_is_verified_is_primary_check CHECK (((is_verified IS NOT NULL) OR (is_primary IS NULL)))
);


ALTER TABLE public.users_phone OWNER TO venkatesh;

--
-- Name: users_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_phone_id_seq OWNER TO venkatesh;

--
-- Name: users_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_phone_id_seq OWNED BY public.users_phone.id;


--
-- Name: users_remoteuser; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_remoteuser (
    id integer NOT NULL,
    remote_id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    source character varying(100) NOT NULL
);


ALTER TABLE public.users_remoteuser OWNER TO venkatesh;

--
-- Name: users_remoteuser_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_remoteuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_remoteuser_id_seq OWNER TO venkatesh;

--
-- Name: users_remoteuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_remoteuser_id_seq OWNED BY public.users_remoteuser.id;


--
-- Name: users_reservedwork; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_reservedwork (
    id integer NOT NULL,
    user_id integer NOT NULL,
    work_id integer NOT NULL,
    task_id integer
);


ALTER TABLE public.users_reservedwork OWNER TO venkatesh;

--
-- Name: users_reservedwork_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_reservedwork_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_reservedwork_id_seq OWNER TO venkatesh;

--
-- Name: users_reservedwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_reservedwork_id_seq OWNED BY public.users_reservedwork.id;


--
-- Name: users_skill; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_skill (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    allocation_logic character varying(100) NOT NULL
);


ALTER TABLE public.users_skill OWNER TO venkatesh;

--
-- Name: users_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_skill_id_seq OWNER TO venkatesh;

--
-- Name: users_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_skill_id_seq OWNED BY public.users_skill.id;


--
-- Name: users_slot; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_slot (
    id integer NOT NULL,
    date date NOT NULL,
    day integer NOT NULL,
    time_slot_id integer NOT NULL,
    worker_id integer,
    on_leave boolean NOT NULL,
    quote_id integer,
    reason character varying(255),
    work_assigned_on_leave boolean NOT NULL
);


ALTER TABLE public.users_slot OWNER TO venkatesh;

--
-- Name: users_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_slot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_slot_id_seq OWNER TO venkatesh;

--
-- Name: users_slot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_slot_id_seq OWNED BY public.users_slot.id;


--
-- Name: users_slotspec; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_slotspec (
    id integer NOT NULL,
    start_time character varying(255) NOT NULL,
    end_time character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    kind character varying(255) NOT NULL
);


ALTER TABLE public.users_slotspec OWNER TO venkatesh;

--
-- Name: users_slotspec_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_slotspec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_slotspec_id_seq OWNER TO venkatesh;

--
-- Name: users_slotspec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_slotspec_id_seq OWNED BY public.users_slotspec.id;


--
-- Name: users_team; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_team (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.users_team OWNER TO venkatesh;

--
-- Name: users_team_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_team_id_seq OWNER TO venkatesh;

--
-- Name: users_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_team_id_seq OWNED BY public.users_team.id;


--
-- Name: users_user_skills; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_user_skills (
    id integer NOT NULL,
    user_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.users_user_skills OWNER TO venkatesh;

--
-- Name: users_user_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_user_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_skills_id_seq OWNER TO venkatesh;

--
-- Name: users_user_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_user_skills_id_seq OWNED BY public.users_user_skills.id;


--
-- Name: users_userprofile; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_userprofile (
    id integer NOT NULL,
    dob date,
    nominee_name character varying(255) NOT NULL,
    nominee_relation character varying(255) NOT NULL,
    nominee_dob date,
    nominee_id integer,
    user_id integer NOT NULL,
    objectionable_pincode boolean,
    questions public.hstore NOT NULL,
    uw_approved boolean,
    api_key character varying(255),
    is_amazon_prime boolean NOT NULL
);


ALTER TABLE public.users_userprofile OWNER TO venkatesh;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userprofile_id_seq OWNER TO venkatesh;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_userprofile_id_seq OWNED BY public.users_userprofile.id;


--
-- Name: users_workerprofile; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_workerprofile (
    id integer NOT NULL,
    ozonetel_agent_id character varying(255) NOT NULL,
    ozonetel_phone_number character varying(20) NOT NULL,
    user_id integer NOT NULL,
    freshdesk_agent_id bigint,
    ozonetel_unique_id integer,
    preferred_days integer NOT NULL,
    pincode integer,
    intermediary_id integer
);


ALTER TABLE public.users_workerprofile OWNER TO venkatesh;

--
-- Name: users_workerprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_workerprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_workerprofile_id_seq OWNER TO venkatesh;

--
-- Name: users_workerprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_workerprofile_id_seq OWNED BY public.users_workerprofile.id;


--
-- Name: users_workerprofile_preferred_slots; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_workerprofile_preferred_slots (
    id integer NOT NULL,
    workerprofile_id integer NOT NULL,
    slotspec_id integer NOT NULL
);


ALTER TABLE public.users_workerprofile_preferred_slots OWNER TO venkatesh;

--
-- Name: users_workerprofile_preferred_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_workerprofile_preferred_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_workerprofile_preferred_slots_id_seq OWNER TO venkatesh;

--
-- Name: users_workerprofile_preferred_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_workerprofile_preferred_slots_id_seq OWNED BY public.users_workerprofile_preferred_slots.id;


--
-- Name: users_workerregion; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.users_workerregion (
    id integer NOT NULL,
    is_primary boolean,
    region_name character varying(100) NOT NULL,
    worker_id integer NOT NULL
);


ALTER TABLE public.users_workerregion OWNER TO venkatesh;

--
-- Name: users_workerregion_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.users_workerregion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_workerregion_id_seq OWNER TO venkatesh;

--
-- Name: users_workerregion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.users_workerregion_id_seq OWNED BY public.users_workerregion.id;


--
-- Name: vendors_bikerdriver; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.vendors_bikerdriver (
    id integer NOT NULL,
    bd_partner_mobile character varying(256) NOT NULL,
    bd_partner_email character varying(256) NOT NULL,
    bd_partner_address character varying(256) NOT NULL,
    bd_partner_pincode character varying(256) NOT NULL,
    bd_partner_city character varying(256) NOT NULL,
    bd_partner_state character varying(256) NOT NULL,
    skill character varying(256) NOT NULL,
    bd_partner_entity_type character varying(256) NOT NULL,
    bd_partner_company character varying(256),
    bd_partner_drivers_license character varying(256) NOT NULL,
    bd_partner_drivers_license_photo character varying(256) NOT NULL,
    bd_partner_insurance_number character varying(256) NOT NULL,
    bd_partner_insurance_photo character varying(256) NOT NULL,
    bd_partner_insurance_expiry timestamp with time zone NOT NULL,
    bd_partner_voter_id character varying(256),
    bd_partner_voter_id_photo character varying(256),
    bd_partner_bike_owner character varying(256) NOT NULL,
    bd_partner_bike_owner_name character varying(256),
    bd_partner_bike_owner_relationship character varying(256),
    bd_partner_bike_owner_aadhar character varying(256),
    bd_partner_bike_owner_aadhar_image character varying(256),
    bd_partner_bike_owner_noc character varying(256),
    bd_partner_vehicle_registration character varying(256) NOT NULL,
    bd_partner_rc_photo character varying(256) NOT NULL,
    bd_partner_upi_address character varying(256),
    bd_partner_empanelment_date timestamp with time zone NOT NULL,
    bd_partner_bgv_status character varying(256) NOT NULL,
    bd_partner_remarks character varying(256),
    workflow_status character varying(256) NOT NULL,
    status character varying(256) NOT NULL,
    rejection_reason character varying(256),
    offboard_flag boolean NOT NULL,
    bd_approval_status boolean NOT NULL,
    acko_poc_id integer NOT NULL,
    bankaccount_id integer NOT NULL,
    legalentity_id integer NOT NULL,
    poc_id integer NOT NULL,
    bd_partner_blood_group character varying(256) NOT NULL,
    bd_partner_emergency_contact character varying(256) NOT NULL,
    bd_partner_gender character varying(256) NOT NULL,
    driving_license character varying(256) NOT NULL,
    isp character varying(256) NOT NULL,
    landmark character varying(256) NOT NULL,
    bd_partner_alt_address character varying(256) NOT NULL,
    fe_employee_id character varying(256) NOT NULL,
    mobile_os_version character varying(256) NOT NULL,
    mobile_brand character varying(256) NOT NULL,
    profile_pic character varying(256) NOT NULL,
    residence_type character varying(256) NOT NULL,
    staying_from_years character varying(256) NOT NULL,
    age_dependent1 character varying(256),
    age_dependent2 character varying(256),
    age_dependent3 character varying(256),
    age_dependent4 character varying(256),
    age_dependent5 character varying(256),
    appointed_for_zone character varying(256) NOT NULL,
    bd_partner_emergency_contact_relationship character varying(256) NOT NULL,
    date_of_joining timestamp with time zone NOT NULL,
    gender_dependent1 character varying(256),
    gender_dependent2 character varying(256),
    gender_dependent3 character varying(256),
    gender_dependent4 character varying(256),
    gender_dependent5 character varying(256),
    mobile_camera character varying(256) NOT NULL,
    mobile_processor character varying(256) NOT NULL,
    mobile_ram character varying(256) NOT NULL,
    name_dependent1 character varying(256),
    name_dependent2 character varying(256),
    name_dependent3 character varying(256),
    name_dependent4 character varying(256),
    name_dependent5 character varying(256),
    no_of_dependants character varying(256),
    relationship_dependent1 character varying(256),
    relationship_dependent2 character varying(256),
    relationship_dependent3 character varying(256),
    relationship_dependent4 character varying(256),
    relationship_dependent5 character varying(256),
    resident_from timestamp with time zone NOT NULL,
    idit_contact_id character varying(256) NOT NULL,
    bd_partner_secondary_mobile character varying(256) NOT NULL
);


ALTER TABLE public.vendors_bikerdriver OWNER TO venkatesh;

--
-- Name: vendors_bikerdriver_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.vendors_bikerdriver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_bikerdriver_id_seq OWNER TO venkatesh;

--
-- Name: vendors_bikerdriver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.vendors_bikerdriver_id_seq OWNED BY public.vendors_bikerdriver.id;


--
-- Name: vendors_workshop; Type: TABLE; Schema: public; Owner: venkatesh
--

CREATE TABLE public.vendors_workshop (
    id integer NOT NULL,
    email_id character varying(256) NOT NULL,
    repairer_type character varying(256) NOT NULL,
    automobile_type character varying(256) NOT NULL,
    type_of_brand_serviced character varying(256) NOT NULL,
    workshop_type character varying(256) NOT NULL,
    operational_hours_start timestamp with time zone NOT NULL,
    operational_hours_end timestamp with time zone NOT NULL,
    off_days character varying(256) NOT NULL,
    value_added_services character varying(256) NOT NULL,
    mou_signed boolean NOT NULL,
    empanelment_date timestamp with time zone NOT NULL,
    remarks character varying(256),
    status character varying(256) NOT NULL,
    workflow_status character varying(256) NOT NULL,
    rejection_reason character varying(256),
    offboard_flag boolean NOT NULL,
    workshop_approval_status boolean NOT NULL,
    workshop_rating character varying(256),
    first_escalation_name character varying(256) NOT NULL,
    first_escalation_title character varying(256) NOT NULL,
    first_escalation_phone character varying(256) NOT NULL,
    first_escalation_email character varying(256) NOT NULL,
    second_escalation_name character varying(256) NOT NULL,
    second_escalation_title character varying(256) NOT NULL,
    second_escalation_phone character varying(256) NOT NULL,
    second_escalation_email character varying(256) NOT NULL,
    skill character varying(256) NOT NULL,
    acko_poc_id integer NOT NULL,
    bankaccount_id integer NOT NULL,
    establishment_id integer NOT NULL,
    poc_id integer NOT NULL,
    affiliation character varying(256) NOT NULL,
    garage_rating character varying(256),
    idit_contact_id character varying(256) NOT NULL,
    locality character varying(256),
    mou_scanned_image character varying(256) NOT NULL
);


ALTER TABLE public.vendors_workshop OWNER TO venkatesh;

--
-- Name: vendors_workshop_id_seq; Type: SEQUENCE; Schema: public; Owner: venkatesh
--

CREATE SEQUENCE public.vendors_workshop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_workshop_id_seq OWNER TO venkatesh;

--
-- Name: vendors_workshop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: venkatesh
--

ALTER SEQUENCE public.vendors_workshop_id_seq OWNED BY public.vendors_workshop.id;


--
-- Name: acko_asset id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset ALTER COLUMN id SET DEFAULT nextval('public.acko_asset_id_seq'::regclass);


--
-- Name: acko_bankaccount id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankaccount ALTER COLUMN id SET DEFAULT nextval('public.acko_bankaccount_id_seq'::regclass);


--
-- Name: acko_bankbranch id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankbranch ALTER COLUMN id SET DEFAULT nextval('public.acko_bankbranch_id_seq'::regclass);


--
-- Name: acko_contact id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_contact ALTER COLUMN id SET DEFAULT nextval('public.acko_corecontact_id_seq'::regclass);


--
-- Name: acko_floataccount id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floataccount ALTER COLUMN id SET DEFAULT nextval('public.acko_floataccount_id_seq'::regclass);


--
-- Name: acko_floatdeposit id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floatdeposit ALTER COLUMN id SET DEFAULT nextval('public.acko_floatdeposit_id_seq'::regclass);


--
-- Name: acko_grouppolicy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_grouppolicy ALTER COLUMN id SET DEFAULT nextval('public.acko_grouppolicy_id_seq'::regclass);


--
-- Name: acko_gstinvoice id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_gstinvoice ALTER COLUMN id SET DEFAULT nextval('public.acko_gstinvoice_id_seq'::regclass);


--
-- Name: acko_legalentity id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_legalentity ALTER COLUMN id SET DEFAULT nextval('public.acko_legalentity_id_seq'::regclass);


--
-- Name: acko_policy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy ALTER COLUMN id SET DEFAULT nextval('public.acko_policy_id_seq'::regclass);


--
-- Name: acko_publickey id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_publickey ALTER COLUMN id SET DEFAULT nextval('public.acko_publickey_id_seq'::regclass);


--
-- Name: acko_quote id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote ALTER COLUMN id SET DEFAULT nextval('public.acko_quote_id_seq'::regclass);


--
-- Name: acko_quote_assets id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote_assets ALTER COLUMN id SET DEFAULT nextval('public.acko_quote_assets_id_seq'::regclass);


--
-- Name: acko_skipquestions id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_skipquestions ALTER COLUMN id SET DEFAULT nextval('public.acko_skipquestions_id_seq'::regclass);


--
-- Name: acko_tracker id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_tracker ALTER COLUMN id SET DEFAULT nextval('public.acko_tracker_id_seq'::regclass);


--
-- Name: acko_usercontact id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_usercontact ALTER COLUMN id SET DEFAULT nextval('public.acko_corecontactusers_id_seq'::regclass);


--
-- Name: acko_vehicle id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_vehicle ALTER COLUMN id SET DEFAULT nextval('public.acko_vehicle_id_seq'::regclass);


--
-- Name: acko_visit id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_visit ALTER COLUMN id SET DEFAULT nextval('public.acko_visit_id_seq'::regclass);


--
-- Name: ackore_ackoagentlicense id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_ackoagentlicense ALTER COLUMN id SET DEFAULT nextval('public.ackore_ackoagentlicense_id_seq'::regclass);


--
-- Name: ackore_asset id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_asset ALTER COLUMN id SET DEFAULT nextval('public.ackore_asset_id_seq'::regclass);


--
-- Name: ackore_claim id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_claim ALTER COLUMN id SET DEFAULT nextval('public.ackore_claim_id_seq'::regclass);


--
-- Name: ackore_coverage_ekinds id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage_ekinds ALTER COLUMN id SET DEFAULT nextval('public.ackore_coverage_ekinds_id_seq'::regclass);


--
-- Name: ackore_endorsement id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement ALTER COLUMN id SET DEFAULT nextval('public.ackore_endorsement_id_seq'::regclass);


--
-- Name: ackore_lead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lead ALTER COLUMN id SET DEFAULT nextval('public.ackore_lead_id_seq'::regclass);


--
-- Name: ackore_leadsource id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_leadsource ALTER COLUMN id SET DEFAULT nextval('public.ackore_leadsource_id_seq'::regclass);


--
-- Name: ackore_plan_addons id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_addons ALTER COLUMN id SET DEFAULT nextval('public.ackore_plan_addons_id_seq'::regclass);


--
-- Name: ackore_plan_included id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_included ALTER COLUMN id SET DEFAULT nextval('public.ackore_plan_included_id_seq'::regclass);


--
-- Name: ackore_policy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy ALTER COLUMN id SET DEFAULT nextval('public.ackore_policy_id_seq'::regclass);


--
-- Name: ackore_policy_addons id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy_addons ALTER COLUMN id SET DEFAULT nextval('public.ackore_policy_addons_id_seq'::regclass);


--
-- Name: ackore_quote id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote ALTER COLUMN id SET DEFAULT nextval('public.ackore_quote_id_seq'::regclass);


--
-- Name: ackore_quote_addons id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote_addons ALTER COLUMN id SET DEFAULT nextval('public.ackore_quote_addons_id_seq'::regclass);


--
-- Name: ackore_relative id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_relative ALTER COLUMN id SET DEFAULT nextval('public.ackore_relative_id_seq'::regclass);


--
-- Name: ackore_userclaimrelation id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userclaimrelation ALTER COLUMN id SET DEFAULT nextval('public.ackore_userclaimrelation_id_seq'::regclass);


--
-- Name: ackore_userpolicyrelation id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation ALTER COLUMN id SET DEFAULT nextval('public.ackore_userpolicyrelation_id_seq'::regclass);


--
-- Name: ackore_utlead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead ALTER COLUMN id SET DEFAULT nextval('public.ackore_utlead_id_seq'::regclass);


--
-- Name: activation_campaign id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_campaign ALTER COLUMN id SET DEFAULT nextval('public.activation_campaign_id_seq'::regclass);


--
-- Name: activation_lead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_lead ALTER COLUMN id SET DEFAULT nextval('public.activation_lead_id_seq'::regclass);


--
-- Name: akin_brand id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brand ALTER COLUMN id SET DEFAULT nextval('public.akin_brand_id_seq'::regclass);


--
-- Name: akin_brandmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brandmapping ALTER COLUMN id SET DEFAULT nextval('public.akin_brandmapping_id_seq'::regclass);


--
-- Name: akin_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_model ALTER COLUMN id SET DEFAULT nextval('public.akin_model_id_seq'::regclass);


--
-- Name: akin_modelmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelmapping ALTER COLUMN id SET DEFAULT nextval('public.akin_modelmapping_id_seq'::regclass);


--
-- Name: akin_modelnumber id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumber ALTER COLUMN id SET DEFAULT nextval('public.akin_modelnumber_id_seq'::regclass);


--
-- Name: akin_modelnumbermapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumbermapping ALTER COLUMN id SET DEFAULT nextval('public.akin_modelnumbermapping_id_seq'::regclass);


--
-- Name: akin_product id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_product ALTER COLUMN id SET DEFAULT nextval('public.akin_product_id_seq'::regclass);


--
-- Name: amazon_mobile_audit id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_audit ALTER COLUMN id SET DEFAULT nextval('public.amazon_mobile_audit_id_seq'::regclass);


--
-- Name: amazon_mobile_deprecation id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_deprecation ALTER COLUMN id SET DEFAULT nextval('public.amazon_mobile_deprecation_id_seq'::regclass);


--
-- Name: amazon_mobile_phoneowner id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_phoneowner ALTER COLUMN id SET DEFAULT nextval('public.amazon_mobile_phoneowner_id_seq'::regclass);


--
-- Name: amazon_mobile_plan id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_plan ALTER COLUMN id SET DEFAULT nextval('public.amazon_mobile_plan_id_seq'::regclass);


--
-- Name: amazon_mobile_policy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy ALTER COLUMN id SET DEFAULT nextval('public.amazon_mobile_policy_id_seq'::regclass);


--
-- Name: amazon_seller_category id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_category ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_category_id_seq'::regclass);


--
-- Name: amazon_seller_claim id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claim ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_claim_id_seq'::regclass);


--
-- Name: amazon_seller_claimcsv id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claimcsv ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_claimcsv_id_seq'::regclass);


--
-- Name: amazon_seller_cohort id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_cohort ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_cohert_id_seq'::regclass);


--
-- Name: amazon_seller_premiumparam id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_premiumparam ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_premiumparam_id_seq'::regclass);


--
-- Name: amazon_seller_seller id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_seller_id_seq'::regclass);


--
-- Name: amazon_seller_sellercsv id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_sellercsv ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_sellercsv_id_seq'::regclass);


--
-- Name: amazon_seller_settlement id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_settlement ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_settlement_id_seq'::regclass);


--
-- Name: amazon_seller_shipment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_shipment_id_seq'::regclass);


--
-- Name: amazon_seller_shipmentcsv id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipmentcsv ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_shipmentcsv_id_seq'::regclass);


--
-- Name: amazon_seller_subscription id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_subscription ALTER COLUMN id SET DEFAULT nextval('public.amazon_seller_subscription_id_seq'::regclass);


--
-- Name: analytics_attributedsource id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.analytics_attributedsource ALTER COLUMN id SET DEFAULT nextval('public.analytics_attributedsource_id_seq'::regclass);


--
-- Name: analytics_sources id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.analytics_sources ALTER COLUMN id SET DEFAULT nextval('public.analytics_sources_id_seq'::regclass);


--
-- Name: audatex_bill id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill ALTER COLUMN id SET DEFAULT nextval('public.audatex_bill_id_seq'::regclass);


--
-- Name: audatex_make id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make ALTER COLUMN id SET DEFAULT nextval('public.audatex_make_id_seq'::regclass);


--
-- Name: audatex_make_makes id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make_makes ALTER COLUMN id SET DEFAULT nextval('public.audatex_make_makes_id_seq'::regclass);


--
-- Name: audatex_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model ALTER COLUMN id SET DEFAULT nextval('public.audatex_model_id_seq'::regclass);


--
-- Name: audatex_model_models id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model_models ALTER COLUMN id SET DEFAULT nextval('public.audatex_model_models_id_seq'::regclass);


--
-- Name: audatex_variant id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variant ALTER COLUMN id SET DEFAULT nextval('public.audatex_variant_id_seq'::regclass);


--
-- Name: audatex_variantmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variantmapping ALTER COLUMN id SET DEFAULT nextval('public.audatex_variantmapping_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bike_quote id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bike_quote ALTER COLUMN id SET DEFAULT nextval('public.bike_quote_id_seq'::regclass);


--
-- Name: bitly_link id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bitly_link ALTER COLUMN id SET DEFAULT nextval('public.bitly_link_id_seq'::regclass);


--
-- Name: c3po_data id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_data ALTER COLUMN id SET DEFAULT nextval('public.c3po_data_id_seq'::regclass);


--
-- Name: c3po_dimension id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_dimension ALTER COLUMN id SET DEFAULT nextval('public.c3po_dimension_id_seq'::regclass);


--
-- Name: c3po_field id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_field ALTER COLUMN id SET DEFAULT nextval('public.c3po_field_id_seq'::regclass);


--
-- Name: c3po_filter id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_filter ALTER COLUMN id SET DEFAULT nextval('public.c3po_filter_id_seq'::regclass);


--
-- Name: c3po_relation id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_relation ALTER COLUMN id SET DEFAULT nextval('public.c3po_relation_id_seq'::regclass);


--
-- Name: c3po_segment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_segment ALTER COLUMN id SET DEFAULT nextval('public.c3po_segment_id_seq'::regclass);


--
-- Name: cardekho_make id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_make ALTER COLUMN id SET DEFAULT nextval('public.cardekho_make_id_seq'::regclass);


--
-- Name: cardekho_makemapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_makemapping ALTER COLUMN id SET DEFAULT nextval('public.cardekho_makemapping_id_seq'::regclass);


--
-- Name: cardekho_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_model ALTER COLUMN id SET DEFAULT nextval('public.cardekho_model_id_seq'::regclass);


--
-- Name: cardekho_modelcolor id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelcolor ALTER COLUMN id SET DEFAULT nextval('public.cardekho_modelcolor_id_seq'::regclass);


--
-- Name: cardekho_modelmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelmapping ALTER COLUMN id SET DEFAULT nextval('public.cardekho_modelmapping_id_seq'::regclass);


--
-- Name: cardekho_variant id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variant ALTER COLUMN id SET DEFAULT nextval('public.cardekho_variant_id_seq'::regclass);


--
-- Name: cardekho_variantmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variantmapping ALTER COLUMN id SET DEFAULT nextval('public.cardekho_variantmapping_id_seq'::regclass);


--
-- Name: commercialtp_commercialtppolicy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.commercialtp_commercialtppolicy ALTER COLUMN id SET DEFAULT nextval('public.commercialtp_commercialtppolicy_id_seq'::regclass);


--
-- Name: computron_kdone id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kdone ALTER COLUMN id SET DEFAULT nextval('public.computron_kdone_id_seq'::regclass);


--
-- Name: computron_kquery id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kquery ALTER COLUMN id SET DEFAULT nextval('public.computron_kquery_id_seq'::regclass);


--
-- Name: computron_kvalidator id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kvalidator ALTER COLUMN id SET DEFAULT nextval('public.computron_kvalidator_id_seq'::regclass);


--
-- Name: computron_raction id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_raction ALTER COLUMN id SET DEFAULT nextval('public.computron_raction_id_seq'::regclass);


--
-- Name: computron_rnotify id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_rnotify ALTER COLUMN id SET DEFAULT nextval('public.computron_rnotify_id_seq'::regclass);


--
-- Name: coverfox_make id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_make ALTER COLUMN id SET DEFAULT nextval('public.coverfox_make_id_seq'::regclass);


--
-- Name: coverfox_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_model ALTER COLUMN id SET DEFAULT nextval('public.coverfox_model_id_seq'::regclass);


--
-- Name: coverfox_variant id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant ALTER COLUMN id SET DEFAULT nextval('public.coverfox_variant_id_seq'::regclass);


--
-- Name: coverfox_variant_acko_variants id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant_acko_variants ALTER COLUMN id SET DEFAULT nextval('public.coverfox_variant_acko_variants_id_seq'::regclass);


--
-- Name: cuvora_vehicledata id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cuvora_vehicledata ALTER COLUMN id SET DEFAULT nextval('public.cuvora_vehicledata_id_seq'::regclass);


--
-- Name: devops_deployment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.devops_deployment ALTER COLUMN id SET DEFAULT nextval('public.devops_deployment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: explorer_query id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_query ALTER COLUMN id SET DEFAULT nextval('public.explorer_query_id_seq'::regclass);


--
-- Name: explorer_querylog id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_querylog ALTER COLUMN id SET DEFAULT nextval('public.explorer_querylog_id_seq'::regclass);


--
-- Name: fastlane_fastlane id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_fastlane ALTER COLUMN id SET DEFAULT nextval('public.fastlane_fastlane_id_seq'::regclass);


--
-- Name: fastlane_make id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make ALTER COLUMN id SET DEFAULT nextval('public.fastlane_make_id_seq'::regclass);


--
-- Name: fastlane_make_acko_makes id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_acko_makes ALTER COLUMN id SET DEFAULT nextval('public.fastlane_make_acko_makes_id_seq'::regclass);


--
-- Name: fastlane_make_cf_makes id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_cf_makes ALTER COLUMN id SET DEFAULT nextval('public.fastlane_make_cf_makes_id_seq'::regclass);


--
-- Name: fastlane_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model ALTER COLUMN id SET DEFAULT nextval('public.fastlane_model_id_seq'::regclass);


--
-- Name: fastlane_model_acko_models id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_acko_models ALTER COLUMN id SET DEFAULT nextval('public.fastlane_model_acko_models_id_seq'::regclass);


--
-- Name: fastlane_model_cf_models id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_cf_models ALTER COLUMN id SET DEFAULT nextval('public.fastlane_model_cf_models_id_seq'::regclass);


--
-- Name: fastlane_variant id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant ALTER COLUMN id SET DEFAULT nextval('public.fastlane_variant_id_seq'::regclass);


--
-- Name: fastlane_variant_acko_variants id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_acko_variants ALTER COLUMN id SET DEFAULT nextval('public.fastlane_variant_acko_variants_id_seq'::regclass);


--
-- Name: fastlane_variant_cf_variants id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_cf_variants ALTER COLUMN id SET DEFAULT nextval('public.fastlane_variant_cf_variants_id_seq'::regclass);


--
-- Name: flightdb_city id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_city ALTER COLUMN id SET DEFAULT nextval('public.flightdb_city_id_seq'::regclass);


--
-- Name: flightdb_flightinstance id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstance ALTER COLUMN id SET DEFAULT nextval('public.flightdb_flightinstance_id_seq'::regclass);


--
-- Name: flightdb_flightinstancehistory id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstancehistory ALTER COLUMN id SET DEFAULT nextval('public.flightdb_flightinstancehistory_id_seq'::regclass);


--
-- Name: freshdesk_ticket id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.freshdesk_ticket ALTER COLUMN id SET DEFAULT nextval('public.freshdesk_ticket_id_seq'::regclass);


--
-- Name: iet_part id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part ALTER COLUMN id SET DEFAULT nextval('public.iet_part_id_seq'::regclass);


--
-- Name: iet_part_makes id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_makes ALTER COLUMN id SET DEFAULT nextval('public.iet_part_makes_id_seq'::regclass);


--
-- Name: iet_part_models id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_models ALTER COLUMN id SET DEFAULT nextval('public.iet_part_models_id_seq'::regclass);


--
-- Name: iet_part_variants id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_variants ALTER COLUMN id SET DEFAULT nextval('public.iet_part_variants_id_seq'::regclass);


--
-- Name: iib_claimshistory id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iib_claimshistory ALTER COLUMN id SET DEFAULT nextval('public.iib_claimshistory_id_seq'::regclass);


--
-- Name: intranet_file id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file ALTER COLUMN id SET DEFAULT nextval('public.intranet_file_id_seq'::regclass);


--
-- Name: intranet_file_downs id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_downs ALTER COLUMN id SET DEFAULT nextval('public.intranet_file_downs_id_seq'::regclass);


--
-- Name: intranet_file_selfs id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_selfs ALTER COLUMN id SET DEFAULT nextval('public.intranet_file_selfs_id_seq'::regclass);


--
-- Name: intranet_file_ups id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_ups ALTER COLUMN id SET DEFAULT nextval('public.intranet_file_ups_id_seq'::regclass);


--
-- Name: intranet_room id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_room ALTER COLUMN id SET DEFAULT nextval('public.intranet_room_id_seq'::regclass);


--
-- Name: intranet_roomreservation id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_roomreservation ALTER COLUMN id SET DEFAULT nextval('public.intranet_roomreservation_id_seq'::regclass);


--
-- Name: karmator_qtime id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime ALTER COLUMN id SET DEFAULT nextval('public.karmator_qtime_id_seq'::regclass);


--
-- Name: karmator_task id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task ALTER COLUMN id SET DEFAULT nextval('public.karmator_task_id_seq'::regclass);


--
-- Name: karmator_work id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_work ALTER COLUMN id SET DEFAULT nextval('public.karmator_claim_id_seq'::regclass);


--
-- Name: karmator_workfield id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield ALTER COLUMN id SET DEFAULT nextval('public.karmator_claimfield_id_seq'::regclass);


--
-- Name: karmator_workfield_validators id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield_validators ALTER COLUMN id SET DEFAULT nextval('public.karmator_claimfield_validators_id_seq'::regclass);


--
-- Name: karmator_workhistory id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory ALTER COLUMN id SET DEFAULT nextval('public.karmator_workhistory_id_seq'::regclass);


--
-- Name: karmator_workkind id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workkind ALTER COLUMN id SET DEFAULT nextval('public.karmator_workkind_id_seq'::regclass);


--
-- Name: lsq_activity id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_activity ALTER COLUMN id SET DEFAULT nextval('public.lsq_activity_id_seq'::regclass);


--
-- Name: lsq_lead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_lead ALTER COLUMN id SET DEFAULT nextval('public.lsq_lead_id_seq'::regclass);


--
-- Name: masters_address id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_address ALTER COLUMN id SET DEFAULT nextval('public.masters_address_id_seq'::regclass);


--
-- Name: masters_equipmentclip id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_equipmentclip ALTER COLUMN id SET DEFAULT nextval('public.masters_equipmentclip_id_seq'::regclass);


--
-- Name: masters_establishment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment ALTER COLUMN id SET DEFAULT nextval('public.masters_establishment_id_seq'::regclass);


--
-- Name: masters_garage id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage ALTER COLUMN id SET DEFAULT nextval('public.masters_garage_id_seq'::regclass);


--
-- Name: masters_garage_makes id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage_makes ALTER COLUMN id SET DEFAULT nextval('public.masters_garage_makes_id_seq'::regclass);


--
-- Name: masters_garagetimings id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garagetimings ALTER COLUMN id SET DEFAULT nextval('public.masters_garagetimings_id_seq'::regclass);


--
-- Name: masters_intermediary id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary ALTER COLUMN id SET DEFAULT nextval('public.masters_intermediary_id_seq'::regclass);


--
-- Name: masters_intermediary_features id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_features ALTER COLUMN id SET DEFAULT nextval('public.masters_intermediary_features_id_seq'::regclass);


--
-- Name: masters_intermediary_plans id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_plans ALTER COLUMN id SET DEFAULT nextval('public.masters_intermediary_plans_id_seq'::regclass);


--
-- Name: masters_intermediary_rtos id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_rtos ALTER COLUMN id SET DEFAULT nextval('public.masters_intermediary_rtos_id_seq'::regclass);


--
-- Name: masters_intermediaryrtoplanmapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediaryrtoplanmapping ALTER COLUMN id SET DEFAULT nextval('public.masters_intermediaryrtoplanmapping_id_seq'::regclass);


--
-- Name: masters_logistics id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics ALTER COLUMN id SET DEFAULT nextval('public.masters_logistics_id_seq'::regclass);


--
-- Name: masters_logistics_pincode id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics_pincode ALTER COLUMN id SET DEFAULT nextval('public.masters_logistics_pincode_id_seq'::regclass);


--
-- Name: masters_make id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_make ALTER COLUMN id SET DEFAULT nextval('public.masters_make_id_seq'::regclass);


--
-- Name: masters_model id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_model ALTER COLUMN id SET DEFAULT nextval('public.masters_model_id_seq'::regclass);


--
-- Name: masters_modelcolor id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_modelcolor ALTER COLUMN id SET DEFAULT nextval('public.masters_modelcolor_id_seq'::regclass);


--
-- Name: masters_phonemake id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_phonemake ALTER COLUMN id SET DEFAULT nextval('public.masters_phonemake_id_seq'::regclass);


--
-- Name: masters_phonemodel id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_phonemodel ALTER COLUMN id SET DEFAULT nextval('public.masters_phonemodel_id_seq'::regclass);


--
-- Name: masters_pincode id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode ALTER COLUMN id SET DEFAULT nextval('public.masters_pincode_id_seq'::regclass);


--
-- Name: masters_pincode_regions id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode_regions ALTER COLUMN id SET DEFAULT nextval('public.masters_pincode_regions_id_seq'::regclass);


--
-- Name: masters_region id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region ALTER COLUMN id SET DEFAULT nextval('public.masters_region_id_seq'::regclass);


--
-- Name: masters_region_parents id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region_parents ALTER COLUMN id SET DEFAULT nextval('public.masters_region_parents_id_seq'::regclass);


--
-- Name: masters_rto id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rto ALTER COLUMN id SET DEFAULT nextval('public.masters_rto_id_seq'::regclass);


--
-- Name: masters_rtocitymapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping ALTER COLUMN id SET DEFAULT nextval('public.masters_rtocitymapping_id_seq'::regclass);


--
-- Name: masters_rtocitymapping_rtos id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping_rtos ALTER COLUMN id SET DEFAULT nextval('public.masters_rtocitymapping_rtos_id_seq'::regclass);


--
-- Name: masters_rtopincodemapping id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping ALTER COLUMN id SET DEFAULT nextval('public.masters_rtopincodemapping_id_seq'::regclass);


--
-- Name: masters_servicecenter id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter ALTER COLUMN id SET DEFAULT nextval('public.masters_servicecenter_id_seq'::regclass);


--
-- Name: masters_servicecenter_region id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter_region ALTER COLUMN id SET DEFAULT nextval('public.masters_servicecenter_region_id_seq'::regclass);


--
-- Name: masters_variant id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_variant ALTER COLUMN id SET DEFAULT nextval('public.masters_variant_id_seq'::regclass);


--
-- Name: motor_lead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_lead ALTER COLUMN id SET DEFAULT nextval('public.motor_lead_id_seq'::regclass);


--
-- Name: motor_leadsource id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_leadsource ALTER COLUMN id SET DEFAULT nextval('public.motor_leadsource_id_seq'::regclass);


--
-- Name: motor_policy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy ALTER COLUMN id SET DEFAULT nextval('public.motor_policy_id_seq'::regclass);


--
-- Name: motor_quote id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote ALTER COLUMN id SET DEFAULT nextval('public.motor_quote_id_seq'::regclass);


--
-- Name: motor_ratings_pincodezone id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_pincodezone ALTER COLUMN id SET DEFAULT nextval('public.motor_ratings_pincodezone_id_seq'::regclass);


--
-- Name: motor_ratings_uwdiscretion id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion ALTER COLUMN id SET DEFAULT nextval('public.motor_ratings_uwdiscretion_id_seq'::regclass);


--
-- Name: motor_ratings_zone id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_zone ALTER COLUMN id SET DEFAULT nextval('public.motor_ratings_zone_id_seq'::regclass);


--
-- Name: motor_utlead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_utlead ALTER COLUMN id SET DEFAULT nextval('public.motor_utlead_id_seq'::regclass);


--
-- Name: motor_vehicle id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_vehicle ALTER COLUMN id SET DEFAULT nextval('public.motor_vehicle_id_seq'::regclass);


--
-- Name: ola_emailpreference id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_emailpreference ALTER COLUMN id SET DEFAULT nextval('public.ola_emailpreferences_id_seq'::regclass);


--
-- Name: ola_invoice id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_invoice ALTER COLUMN id SET DEFAULT nextval('public.ola_invoice_id_seq'::regclass);


--
-- Name: ola_trip id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip ALTER COLUMN id SET DEFAULT nextval('public.ola_trip_id_seq'::regclass);


--
-- Name: ozonetel_agent id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agent ALTER COLUMN id SET DEFAULT nextval('public.ozonetel_agent_id_seq'::regclass);


--
-- Name: ozonetel_agentlogin id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agentlogin ALTER COLUMN id SET DEFAULT nextval('public.ozonetel_agentlogin_id_seq'::regclass);


--
-- Name: ozonetel_call id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_call ALTER COLUMN id SET DEFAULT nextval('public.ozonetel_call_id_seq'::regclass);


--
-- Name: ozonetel_dailyagentbreak id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_dailyagentbreak ALTER COLUMN id SET DEFAULT nextval('public.ozonetel_dailyagentbreak_id_seq'::regclass);


--
-- Name: payments_payment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_payment ALTER COLUMN id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- Name: payments_refund id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_refund ALTER COLUMN id SET DEFAULT nextval('public.payments_refund_id_seq'::regclass);


--
-- Name: payments_settlement id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_settlement ALTER COLUMN id SET DEFAULT nextval('public.payments_settlement_id_seq'::regclass);


--
-- Name: r2d2_allowance_reimbursement id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_allowance_reimbursement ALTER COLUMN id SET DEFAULT nextval('public.r2d2_allowance_reimbursement_id_seq'::regclass);


--
-- Name: r2d2_amazon_mobile_repair id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_amazon_mobile_repair ALTER COLUMN id SET DEFAULT nextval('public.r2d2_amazonmobilerepair_id_seq'::regclass);


--
-- Name: r2d2_appliances_extended_warranty id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_appliances_extended_warranty ALTER COLUMN id SET DEFAULT nextval('public.r2d2_appliances_extended_warranty_id_seq'::regclass);


--
-- Name: r2d2_burglary_fire_damage id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_burglary_fire_damage ALTER COLUMN id SET DEFAULT nextval('public.r2d2_burglary_fire_damage_id_seq'::regclass);


--
-- Name: r2d2_call id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_call ALTER COLUMN id SET DEFAULT nextval('public.r2d2_call_id_seq'::regclass);


--
-- Name: r2d2_cannedresponse id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse ALTER COLUMN id SET DEFAULT nextval('public.r2d2_cannedresponse_id_seq'::regclass);


--
-- Name: r2d2_carlead id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead ALTER COLUMN id SET DEFAULT nextval('public.r2d2_carlead_id_seq'::regclass);


--
-- Name: r2d2_claim id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_claim ALTER COLUMN id SET DEFAULT nextval('public.r2d2_claim_id_seq'::regclass);


--
-- Name: r2d2_disability_death id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_disability_death ALTER COLUMN id SET DEFAULT nextval('public.r2d2_disability_death_id_seq'::regclass);


--
-- Name: r2d2_edataspec id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_edataspec ALTER COLUMN id SET DEFAULT nextval('public.r2d2_edataspec_id_seq'::regclass);


--
-- Name: r2d2_endorsement id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_endorsement ALTER COLUMN id SET DEFAULT nextval('public.r2d2_endorsement_id_seq'::regclass);


--
-- Name: r2d2_event id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_event ALTER COLUMN id SET DEFAULT nextval('public.r2d2_event_id_seq'::regclass);


--
-- Name: r2d2_hospitalization_ipd id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_ipd ALTER COLUMN id SET DEFAULT nextval('public.r2d2_hospitalization_ipd_id_seq'::regclass);


--
-- Name: r2d2_hospitalization_opd id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_opd ALTER COLUMN id SET DEFAULT nextval('public.r2d2_hospitalization_opd_id_seq'::regclass);


--
-- Name: r2d2_link id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_link ALTER COLUMN id SET DEFAULT nextval('public.r2d2_link_id_seq'::regclass);


--
-- Name: r2d2_loss_theft_personal_belongings id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_loss_theft_personal_belongings ALTER COLUMN id SET DEFAULT nextval('public.r2d2_loss_theft_personal_belongings_id_seq'::regclass);


--
-- Name: r2d2_lp_visit id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lp_visit ALTER COLUMN id SET DEFAULT nextval('public.r2d2_lp_visit_id_seq'::regclass);


--
-- Name: r2d2_lsq_activity id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lsq_activity ALTER COLUMN id SET DEFAULT nextval('public.r2d2_lsq_activity_id_seq'::regclass);


--
-- Name: r2d2_mobile id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_mobile ALTER COLUMN id SET DEFAULT nextval('public.r2d2_mobile_id_seq'::regclass);


--
-- Name: r2d2_notification id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_notification ALTER COLUMN id SET DEFAULT nextval('public.r2d2_notification_id_seq'::regclass);


--
-- Name: r2d2_odataspec id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_odataspec ALTER COLUMN id SET DEFAULT nextval('public.r2d2_odataspec_id_seq'::regclass);


--
-- Name: r2d2_ola_trip id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip ALTER COLUMN id SET DEFAULT nextval('public.r2d2_ola_trip_id_seq'::regclass);


--
-- Name: r2d2_ola_trip_claim id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip_claim ALTER COLUMN id SET DEFAULT nextval('public.r2d2_ola_trip_claim_id_seq'::regclass);


--
-- Name: r2d2_payment id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_payment ALTER COLUMN id SET DEFAULT nextval('public.r2d2_payment_id_seq'::regclass);


--
-- Name: r2d2_policy id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_policy ALTER COLUMN id SET DEFAULT nextval('public.r2d2_policy_id_seq'::regclass);


--
-- Name: r2d2_pre_inspection id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_pre_inspection ALTER COLUMN id SET DEFAULT nextval('public.r2d2_pre_inspection_id_seq'::regclass);


--
-- Name: r2d2_quote id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_quote ALTER COLUMN id SET DEFAULT nextval('public.r2d2_quote_id_seq'::regclass);


--
-- Name: r2d2_tracker id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_tracker ALTER COLUMN id SET DEFAULT nextval('public.r2d2_tracker_id_seq'::regclass);


--
-- Name: r2d2_user id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_user ALTER COLUMN id SET DEFAULT nextval('public.r2d2_user_id_seq'::regclass);


--
-- Name: r2d2_visit id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_visit ALTER COLUMN id SET DEFAULT nextval('public.r2d2_visit_id_seq'::regclass);


--
-- Name: reports_keyreports id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_keyreports ALTER COLUMN id SET DEFAULT nextval('public.reports_keyreports_id_seq'::regclass);


--
-- Name: reports_report id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report ALTER COLUMN id SET DEFAULT nextval('public.reports_report_id_seq'::regclass);


--
-- Name: reports_report_downs id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_downs ALTER COLUMN id SET DEFAULT nextval('public.reports_report_downs_id_seq'::regclass);


--
-- Name: reports_report_selfs id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_selfs ALTER COLUMN id SET DEFAULT nextval('public.reports_report_selfs_id_seq'::regclass);


--
-- Name: reports_report_ups id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_ups ALTER COLUMN id SET DEFAULT nextval('public.reports_report_ups_id_seq'::regclass);


--
-- Name: slots_slot id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slot ALTER COLUMN id SET DEFAULT nextval('public.slots_slot_id_seq'::regclass);


--
-- Name: slots_slottemplate id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate ALTER COLUMN id SET DEFAULT nextval('public.slots_slottemplate_id_seq'::regclass);


--
-- Name: slots_slottemplate_template_time_range id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate_template_time_range ALTER COLUMN id SET DEFAULT nextval('public.slots_slottemplate_template_time_range_id_seq'::regclass);


--
-- Name: slots_slottime id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottime ALTER COLUMN id SET DEFAULT nextval('public.slots_slottime_id_seq'::regclass);


--
-- Name: socialleads_socialleads id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.socialleads_socialleads ALTER COLUMN id SET DEFAULT nextval('public.socialleads_socialleads_id_seq'::regclass);


--
-- Name: subscription_mandate id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.subscription_mandate ALTER COLUMN id SET DEFAULT nextval('public.subscription_mandate_id_seq'::regclass);


--
-- Name: users_company id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_company ALTER COLUMN id SET DEFAULT nextval('public.users_company_id_seq'::regclass);


--
-- Name: users_device id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_device ALTER COLUMN id SET DEFAULT nextval('public.users_device_id_seq'::regclass);


--
-- Name: users_email id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email ALTER COLUMN id SET DEFAULT nextval('public.users_email_id_seq'::regclass);


--
-- Name: users_oentity id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity ALTER COLUMN id SET DEFAULT nextval('public.users_oentity_id_seq'::regclass);


--
-- Name: users_oentity_dotted_line id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_dotted_line ALTER COLUMN id SET DEFAULT nextval('public.users_oentity_dotted_line_id_seq'::regclass);


--
-- Name: users_oentity_down id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_down ALTER COLUMN id SET DEFAULT nextval('public.users_oentity_down_id_seq'::regclass);


--
-- Name: users_oentity_self id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_self ALTER COLUMN id SET DEFAULT nextval('public.users_oentity_self_id_seq'::regclass);


--
-- Name: users_oentity_up id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_up ALTER COLUMN id SET DEFAULT nextval('public.users_oentity_up_id_seq'::regclass);


--
-- Name: users_phone id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone ALTER COLUMN id SET DEFAULT nextval('public.users_phone_id_seq'::regclass);


--
-- Name: users_remoteuser id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_remoteuser ALTER COLUMN id SET DEFAULT nextval('public.users_remoteuser_id_seq'::regclass);


--
-- Name: users_reservedwork id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_reservedwork ALTER COLUMN id SET DEFAULT nextval('public.users_reservedwork_id_seq'::regclass);


--
-- Name: users_skill id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_skill ALTER COLUMN id SET DEFAULT nextval('public.users_skill_id_seq'::regclass);


--
-- Name: users_slot id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot ALTER COLUMN id SET DEFAULT nextval('public.users_slot_id_seq'::regclass);


--
-- Name: users_slotspec id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slotspec ALTER COLUMN id SET DEFAULT nextval('public.users_slotspec_id_seq'::regclass);


--
-- Name: users_team id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_team ALTER COLUMN id SET DEFAULT nextval('public.users_team_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: users_user_skills id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_skills ALTER COLUMN id SET DEFAULT nextval('public.users_user_skills_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: users_userprofile id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_userprofile ALTER COLUMN id SET DEFAULT nextval('public.users_userprofile_id_seq'::regclass);


--
-- Name: users_workerprofile id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile ALTER COLUMN id SET DEFAULT nextval('public.users_workerprofile_id_seq'::regclass);


--
-- Name: users_workerprofile_preferred_slots id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile_preferred_slots ALTER COLUMN id SET DEFAULT nextval('public.users_workerprofile_preferred_slots_id_seq'::regclass);


--
-- Name: users_workerregion id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerregion ALTER COLUMN id SET DEFAULT nextval('public.users_workerregion_id_seq'::regclass);


--
-- Name: vendors_bikerdriver id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver ALTER COLUMN id SET DEFAULT nextval('public.vendors_bikerdriver_id_seq'::regclass);


--
-- Name: vendors_workshop id; Type: DEFAULT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop ALTER COLUMN id SET DEFAULT nextval('public.vendors_workshop_id_seq'::regclass);


--
-- Name: acko_asset acko_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset
    ADD CONSTRAINT acko_asset_pkey PRIMARY KEY (id);


--
-- Name: acko_asset acko_asset_tracker_id_aid_449cd8b2_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset
    ADD CONSTRAINT acko_asset_tracker_id_aid_449cd8b2_uniq UNIQUE (tracker_id, aid);


--
-- Name: acko_asset acko_asset_user_id_aid_fcede3f5_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset
    ADD CONSTRAINT acko_asset_user_id_aid_fcede3f5_uniq UNIQUE (user_id, aid);


--
-- Name: acko_bankaccount acko_bankaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankaccount
    ADD CONSTRAINT acko_bankaccount_pkey PRIMARY KEY (id);


--
-- Name: acko_bankbranch acko_bankbranch_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankbranch
    ADD CONSTRAINT acko_bankbranch_pkey PRIMARY KEY (id);


--
-- Name: acko_contact acko_corecontact_core_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_contact
    ADD CONSTRAINT acko_corecontact_core_id_key UNIQUE (core_id);


--
-- Name: acko_contact acko_corecontact_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_contact
    ADD CONSTRAINT acko_corecontact_pkey PRIMARY KEY (id);


--
-- Name: acko_usercontact acko_corecontactusers_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_usercontact
    ADD CONSTRAINT acko_corecontactusers_pkey PRIMARY KEY (id);


--
-- Name: acko_floataccount acko_floataccount_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floataccount
    ADD CONSTRAINT acko_floataccount_pkey PRIMARY KEY (id);


--
-- Name: acko_floatdeposit acko_floatdeposit_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floatdeposit
    ADD CONSTRAINT acko_floatdeposit_pkey PRIMARY KEY (id);


--
-- Name: acko_grouppolicy acko_grouppolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_grouppolicy
    ADD CONSTRAINT acko_grouppolicy_pkey PRIMARY KEY (id);


--
-- Name: acko_gstinvoice acko_gstinvoice_invoice_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_gstinvoice
    ADD CONSTRAINT acko_gstinvoice_invoice_id_key UNIQUE (invoice_number);


--
-- Name: acko_gstinvoice acko_gstinvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_gstinvoice
    ADD CONSTRAINT acko_gstinvoice_pkey PRIMARY KEY (id);


--
-- Name: acko_gstinvoice acko_gstinvoice_sequence_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_gstinvoice
    ADD CONSTRAINT acko_gstinvoice_sequence_key UNIQUE (sequence);


--
-- Name: acko_legalentity acko_legalentity_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_legalentity
    ADD CONSTRAINT acko_legalentity_pkey PRIMARY KEY (id);


--
-- Name: acko_policy acko_policy_idit_policy_number_07a99339_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_idit_policy_number_07a99339_uniq UNIQUE (idit_policy_number);


--
-- Name: acko_policy acko_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_pkey PRIMARY KEY (id);


--
-- Name: acko_policy acko_policy_policy_number_b9796d9e_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_policy_number_b9796d9e_uniq UNIQUE (policy_number);


--
-- Name: acko_policy acko_policy_quote_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_quote_id_key UNIQUE (quote_id);


--
-- Name: acko_product acko_product_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_product
    ADD CONSTRAINT acko_product_pkey PRIMARY KEY (id);


--
-- Name: acko_publickey acko_publickey_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_publickey
    ADD CONSTRAINT acko_publickey_pkey PRIMARY KEY (id);


--
-- Name: acko_quote_assets acko_quote_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote_assets
    ADD CONSTRAINT acko_quote_assets_pkey PRIMARY KEY (id);


--
-- Name: acko_quote_assets acko_quote_assets_quote_id_asset_id_c5769897_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote_assets
    ADD CONSTRAINT acko_quote_assets_quote_id_asset_id_c5769897_uniq UNIQUE (quote_id, asset_id);


--
-- Name: acko_quote acko_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote
    ADD CONSTRAINT acko_quote_pkey PRIMARY KEY (id);


--
-- Name: acko_skipquestions acko_skipquestions_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_skipquestions
    ADD CONSTRAINT acko_skipquestions_pkey PRIMARY KEY (id);


--
-- Name: acko_tracker acko_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_tracker
    ADD CONSTRAINT acko_tracker_pkey PRIMARY KEY (id);


--
-- Name: acko_vehicle acko_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_vehicle
    ADD CONSTRAINT acko_vehicle_pkey PRIMARY KEY (id);


--
-- Name: acko_visit acko_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_visit
    ADD CONSTRAINT acko_visit_pkey PRIMARY KEY (id);


--
-- Name: ackore_ackoagentlicense ackore_ackoagentlicense_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_ackoagentlicense
    ADD CONSTRAINT ackore_ackoagentlicense_pkey PRIMARY KEY (id);


--
-- Name: ackore_asset ackore_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_asset
    ADD CONSTRAINT ackore_asset_pkey PRIMARY KEY (id);


--
-- Name: ackore_ckind ackore_ckind_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_ckind
    ADD CONSTRAINT ackore_ckind_pkey PRIMARY KEY (id);


--
-- Name: ackore_claim ackore_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_claim
    ADD CONSTRAINT ackore_claim_pkey PRIMARY KEY (id);


--
-- Name: ackore_coverage_ekinds ackore_coverage_ekinds_coverage_id_ekind_id_e90bc955_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage_ekinds
    ADD CONSTRAINT ackore_coverage_ekinds_coverage_id_ekind_id_e90bc955_uniq UNIQUE (coverage_id, ekind_id);


--
-- Name: ackore_coverage_ekinds ackore_coverage_ekinds_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage_ekinds
    ADD CONSTRAINT ackore_coverage_ekinds_pkey PRIMARY KEY (id);


--
-- Name: ackore_ekind ackore_ekind_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_ekind
    ADD CONSTRAINT ackore_ekind_pkey PRIMARY KEY (id);


--
-- Name: ackore_endorsement ackore_endorsement_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement
    ADD CONSTRAINT ackore_endorsement_pkey PRIMARY KEY (id);


--
-- Name: ackore_coverage ackore_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage
    ADD CONSTRAINT ackore_feature_pkey PRIMARY KEY (id);


--
-- Name: ackore_lead ackore_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lead
    ADD CONSTRAINT ackore_lead_pkey PRIMARY KEY (id);


--
-- Name: ackore_leadsource ackore_leadsource_lead_id_source_id_b5a61397_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_leadsource
    ADD CONSTRAINT ackore_leadsource_lead_id_source_id_b5a61397_uniq UNIQUE (lead_id, source_id);


--
-- Name: ackore_leadsource ackore_leadsource_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_leadsource
    ADD CONSTRAINT ackore_leadsource_pkey PRIMARY KEY (id);


--
-- Name: ackore_lob ackore_lob_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lob
    ADD CONSTRAINT ackore_lob_pkey PRIMARY KEY (id);


--
-- Name: ackore_plan_addons ackore_plan_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_addons
    ADD CONSTRAINT ackore_plan_addons_pkey PRIMARY KEY (id);


--
-- Name: ackore_plan_addons ackore_plan_addons_plan_id_feature_id_fecbeddb_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_addons
    ADD CONSTRAINT ackore_plan_addons_plan_id_feature_id_fecbeddb_uniq UNIQUE (plan_id, coverage_id);


--
-- Name: ackore_plan_included ackore_plan_included_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_included
    ADD CONSTRAINT ackore_plan_included_pkey PRIMARY KEY (id);


--
-- Name: ackore_plan_included ackore_plan_included_plan_id_feature_id_d7d83a18_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_included
    ADD CONSTRAINT ackore_plan_included_plan_id_feature_id_d7d83a18_uniq UNIQUE (plan_id, coverage_id);


--
-- Name: ackore_plan ackore_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan
    ADD CONSTRAINT ackore_plan_pkey PRIMARY KEY (id);


--
-- Name: ackore_policy_addons ackore_policy_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy_addons
    ADD CONSTRAINT ackore_policy_addons_pkey PRIMARY KEY (id);


--
-- Name: ackore_policy_addons ackore_policy_addons_policy_id_feature_id_7c8dfbf6_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy_addons
    ADD CONSTRAINT ackore_policy_addons_policy_id_feature_id_7c8dfbf6_uniq UNIQUE (policy_id, coverage_id);


--
-- Name: ackore_policy ackore_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy
    ADD CONSTRAINT ackore_policy_pkey PRIMARY KEY (id);


--
-- Name: ackore_product ackore_product_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_product
    ADD CONSTRAINT ackore_product_pkey PRIMARY KEY (id);


--
-- Name: ackore_quote_addons ackore_quote_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote_addons
    ADD CONSTRAINT ackore_quote_addons_pkey PRIMARY KEY (id);


--
-- Name: ackore_quote_addons ackore_quote_addons_quote_id_feature_id_baa42f2f_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote_addons
    ADD CONSTRAINT ackore_quote_addons_quote_id_feature_id_baa42f2f_uniq UNIQUE (quote_id, coverage_id);


--
-- Name: ackore_quote ackore_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote
    ADD CONSTRAINT ackore_quote_pkey PRIMARY KEY (id);


--
-- Name: ackore_relative ackore_relative_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_relative
    ADD CONSTRAINT ackore_relative_pkey PRIMARY KEY (id);


--
-- Name: ackore_userclaimrelation ackore_userclaimrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userclaimrelation
    ADD CONSTRAINT ackore_userclaimrelation_pkey PRIMARY KEY (id);


--
-- Name: ackore_userpolicyrelation ackore_userpolicyrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation
    ADD CONSTRAINT ackore_userpolicyrelation_pkey PRIMARY KEY (id);


--
-- Name: ackore_userpolicyrelation ackore_userpolicyrelation_policy_id_user_id_52c87b19_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation
    ADD CONSTRAINT ackore_userpolicyrelation_policy_id_user_id_52c87b19_uniq UNIQUE (policy_id, user_id);


--
-- Name: ackore_utlead ackore_utlead_lead_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_lead_id_key UNIQUE (lead_id);


--
-- Name: ackore_utlead ackore_utlead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_pkey PRIMARY KEY (id);


--
-- Name: activation_campaign activation_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_campaign
    ADD CONSTRAINT activation_campaign_pkey PRIMARY KEY (id);


--
-- Name: activation_lead activation_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_lead
    ADD CONSTRAINT activation_lead_pkey PRIMARY KEY (id);


--
-- Name: akin_brand akin_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brand
    ADD CONSTRAINT akin_brand_pkey PRIMARY KEY (id);


--
-- Name: akin_brandmapping akin_brandmapping_intermediary_id_brand_id_string_6aecaac1_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brandmapping
    ADD CONSTRAINT akin_brandmapping_intermediary_id_brand_id_string_6aecaac1_uniq UNIQUE (intermediary_id, brand_id, string);


--
-- Name: akin_brandmapping akin_brandmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brandmapping
    ADD CONSTRAINT akin_brandmapping_pkey PRIMARY KEY (id);


--
-- Name: akin_model akin_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_model
    ADD CONSTRAINT akin_model_pkey PRIMARY KEY (id);


--
-- Name: akin_modelmapping akin_modelmapping_intermediary_id_model_id_string_f5dac766_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelmapping
    ADD CONSTRAINT akin_modelmapping_intermediary_id_model_id_string_f5dac766_uniq UNIQUE (intermediary_id, model_id, string);


--
-- Name: akin_modelmapping akin_modelmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelmapping
    ADD CONSTRAINT akin_modelmapping_pkey PRIMARY KEY (id);


--
-- Name: akin_modelnumber akin_modelnumber_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumber
    ADD CONSTRAINT akin_modelnumber_pkey PRIMARY KEY (id);


--
-- Name: akin_modelnumbermapping akin_modelnumbermapping_intermediary_id_model_nu_90575969_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumbermapping
    ADD CONSTRAINT akin_modelnumbermapping_intermediary_id_model_nu_90575969_uniq UNIQUE (intermediary_id, model_number_id, string);


--
-- Name: akin_modelnumbermapping akin_modelnumbermapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumbermapping
    ADD CONSTRAINT akin_modelnumbermapping_pkey PRIMARY KEY (id);


--
-- Name: akin_product akin_product_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_product
    ADD CONSTRAINT akin_product_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_audit amazon_mobile_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_audit
    ADD CONSTRAINT amazon_mobile_audit_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_deprecation amazon_mobile_deprecation_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_deprecation
    ADD CONSTRAINT amazon_mobile_deprecation_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_phoneowner amazon_mobile_phoneowner_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_phoneowner
    ADD CONSTRAINT amazon_mobile_phoneowner_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_phoneowner amazon_mobile_phoneowner_user_id_policy_id_1313c67f_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_phoneowner
    ADD CONSTRAINT amazon_mobile_phoneowner_user_id_policy_id_1313c67f_uniq UNIQUE (user_id, policy_id);


--
-- Name: amazon_mobile_plan amazon_mobile_plan_asin_5c07272a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_plan
    ADD CONSTRAINT amazon_mobile_plan_asin_5c07272a_uniq UNIQUE (asin);


--
-- Name: amazon_mobile_plan amazon_mobile_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_plan
    ADD CONSTRAINT amazon_mobile_plan_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_policy amazon_mobile_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_pkey PRIMARY KEY (id);


--
-- Name: amazon_mobile_policy amazon_mobile_policy_plan_order_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_plan_order_id_key UNIQUE (plan_order_id);


--
-- Name: amazon_mobile_policy amazon_mobile_policy_policy_number_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_policy_number_key UNIQUE (policy_number);


--
-- Name: amazon_mobile_policy amazon_mobile_policy_sequence_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_sequence_key UNIQUE (sequence);


--
-- Name: amazon_seller_category amazon_seller_category_category_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_category
    ADD CONSTRAINT amazon_seller_category_category_id_key UNIQUE (category_id);


--
-- Name: amazon_seller_category amazon_seller_category_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_category
    ADD CONSTRAINT amazon_seller_category_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_claim amazon_seller_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claim
    ADD CONSTRAINT amazon_seller_claim_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_claimcsv amazon_seller_claimcsv_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claimcsv
    ADD CONSTRAINT amazon_seller_claimcsv_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_cohort amazon_seller_cohert_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_cohort
    ADD CONSTRAINT amazon_seller_cohert_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_premiumparam amazon_seller_premiumparam_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_premiumparam
    ADD CONSTRAINT amazon_seller_premiumparam_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_seller amazon_seller_seller_acko_poc_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_acko_poc_id_key UNIQUE (acko_poc_id);


--
-- Name: amazon_seller_seller amazon_seller_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_seller amazon_seller_seller_poc_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_poc_id_key UNIQUE (poc_id);


--
-- Name: amazon_seller_seller amazon_seller_seller_seller_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_seller_id_key UNIQUE (seller_id);


--
-- Name: amazon_seller_sellercsv amazon_seller_sellercsv_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_sellercsv
    ADD CONSTRAINT amazon_seller_sellercsv_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_settlement amazon_seller_settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_settlement
    ADD CONSTRAINT amazon_seller_settlement_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_shipment amazon_seller_shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment
    ADD CONSTRAINT amazon_seller_shipment_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_shipment amazon_seller_shipment_shipment_item_id_8c36f280_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment
    ADD CONSTRAINT amazon_seller_shipment_shipment_item_id_8c36f280_uniq UNIQUE (shipment_item_id);


--
-- Name: amazon_seller_shipmentcsv amazon_seller_shipmentcsv_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipmentcsv
    ADD CONSTRAINT amazon_seller_shipmentcsv_pkey PRIMARY KEY (id);


--
-- Name: amazon_seller_subscription amazon_seller_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_subscription
    ADD CONSTRAINT amazon_seller_subscription_pkey PRIMARY KEY (id);


--
-- Name: analytics_attributedsource analytics_attributedsource_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.analytics_attributedsource
    ADD CONSTRAINT analytics_attributedsource_pkey PRIMARY KEY (id);


--
-- Name: analytics_sources analytics_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.analytics_sources
    ADD CONSTRAINT analytics_sources_pkey PRIMARY KEY (id);


--
-- Name: audatex_bill audatex_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill
    ADD CONSTRAINT audatex_bill_pkey PRIMARY KEY (id);


--
-- Name: audatex_bill audatex_bill_task_id_c9f6f127_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill
    ADD CONSTRAINT audatex_bill_task_id_c9f6f127_uniq UNIQUE (aduatex_task_id);


--
-- Name: audatex_make audatex_make_code_b5551b93_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make
    ADD CONSTRAINT audatex_make_code_b5551b93_uniq UNIQUE (code);


--
-- Name: audatex_make_makes audatex_make_makes_from_make_id_to_make_id_063e6135_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make_makes
    ADD CONSTRAINT audatex_make_makes_from_make_id_to_make_id_063e6135_uniq UNIQUE (from_make_id, to_make_id);


--
-- Name: audatex_make_makes audatex_make_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make_makes
    ADD CONSTRAINT audatex_make_makes_pkey PRIMARY KEY (id);


--
-- Name: audatex_make audatex_make_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make
    ADD CONSTRAINT audatex_make_pkey PRIMARY KEY (id);


--
-- Name: audatex_model audatex_model_make_id_code_ed7a62ab_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model
    ADD CONSTRAINT audatex_model_make_id_code_ed7a62ab_uniq UNIQUE (make_id, code);


--
-- Name: audatex_model_models audatex_model_models_from_model_id_to_model_id_68d67af9_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model_models
    ADD CONSTRAINT audatex_model_models_from_model_id_to_model_id_68d67af9_uniq UNIQUE (from_model_id, to_model_id);


--
-- Name: audatex_model_models audatex_model_models_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model_models
    ADD CONSTRAINT audatex_model_models_pkey PRIMARY KEY (id);


--
-- Name: audatex_model audatex_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model
    ADD CONSTRAINT audatex_model_pkey PRIMARY KEY (id);


--
-- Name: audatex_variant audatex_variant_model_id_code_10971e8a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variant
    ADD CONSTRAINT audatex_variant_model_id_code_10971e8a_uniq UNIQUE (model_id, code);


--
-- Name: audatex_variant audatex_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variant
    ADD CONSTRAINT audatex_variant_pkey PRIMARY KEY (id);


--
-- Name: audatex_variantmapping audatex_variantmapping_acko_variant_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variantmapping
    ADD CONSTRAINT audatex_variantmapping_acko_variant_id_key UNIQUE (acko_variant_id);


--
-- Name: audatex_variantmapping audatex_variantmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variantmapping
    ADD CONSTRAINT audatex_variantmapping_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: bike_quote bike_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bike_quote
    ADD CONSTRAINT bike_quote_pkey PRIMARY KEY (id);


--
-- Name: bitly_link bitly_link_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bitly_link
    ADD CONSTRAINT bitly_link_pkey PRIMARY KEY (id);


--
-- Name: bitly_link bitly_link_short_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bitly_link
    ADD CONSTRAINT bitly_link_short_key UNIQUE (short);


--
-- Name: c3po_data c3po_data_key_segment_id_order_2763fd82_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_data
    ADD CONSTRAINT c3po_data_key_segment_id_order_2763fd82_uniq UNIQUE (key, segment_id, "order");


--
-- Name: c3po_data c3po_data_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_data
    ADD CONSTRAINT c3po_data_pkey PRIMARY KEY (id);


--
-- Name: c3po_dimension c3po_dimension_okind_id_dimension_value_6086fded_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_dimension
    ADD CONSTRAINT c3po_dimension_okind_id_dimension_value_6086fded_uniq UNIQUE (okind_id, dimension, value);


--
-- Name: c3po_dimension c3po_dimension_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_dimension
    ADD CONSTRAINT c3po_dimension_pkey PRIMARY KEY (id);


--
-- Name: c3po_field c3po_field_okind_id_name_43c6e32f_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_field
    ADD CONSTRAINT c3po_field_okind_id_name_43c6e32f_uniq UNIQUE (okind_id, name);


--
-- Name: c3po_field c3po_field_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_field
    ADD CONSTRAINT c3po_field_pkey PRIMARY KEY (id);


--
-- Name: c3po_filter c3po_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_filter
    ADD CONSTRAINT c3po_filter_pkey PRIMARY KEY (id);


--
-- Name: c3po_okind c3po_okind_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_okind
    ADD CONSTRAINT c3po_okind_pkey PRIMARY KEY (name);


--
-- Name: c3po_relation c3po_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_relation
    ADD CONSTRAINT c3po_relation_pkey PRIMARY KEY (id);


--
-- Name: c3po_segment c3po_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_segment
    ADD CONSTRAINT c3po_segment_pkey PRIMARY KEY (id);


--
-- Name: cardekho_make cardekho_make_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_make
    ADD CONSTRAINT cardekho_make_pkey PRIMARY KEY (id);


--
-- Name: cardekho_makemapping cardekho_makemapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_makemapping
    ADD CONSTRAINT cardekho_makemapping_pkey PRIMARY KEY (id);


--
-- Name: cardekho_model cardekho_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_model
    ADD CONSTRAINT cardekho_model_pkey PRIMARY KEY (id);


--
-- Name: cardekho_modelcolor cardekho_modelcolor_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelcolor
    ADD CONSTRAINT cardekho_modelcolor_pkey PRIMARY KEY (id);


--
-- Name: cardekho_modelmapping cardekho_modelmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelmapping
    ADD CONSTRAINT cardekho_modelmapping_pkey PRIMARY KEY (id);


--
-- Name: cardekho_variant cardekho_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variant
    ADD CONSTRAINT cardekho_variant_pkey PRIMARY KEY (id);


--
-- Name: cardekho_variantmapping cardekho_variantmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variantmapping
    ADD CONSTRAINT cardekho_variantmapping_pkey PRIMARY KEY (id);


--
-- Name: commercialtp_commercialtppolicy commercialtp_commercialtppolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.commercialtp_commercialtppolicy
    ADD CONSTRAINT commercialtp_commercialtppolicy_pkey PRIMARY KEY (id);


--
-- Name: computron_kdone computron_kdone_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kdone
    ADD CONSTRAINT computron_kdone_name_key UNIQUE (name);


--
-- Name: computron_kdone computron_kdone_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kdone
    ADD CONSTRAINT computron_kdone_pkey PRIMARY KEY (id);


--
-- Name: computron_kquery computron_kquery_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kquery
    ADD CONSTRAINT computron_kquery_name_key UNIQUE (name);


--
-- Name: computron_kquery computron_kquery_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kquery
    ADD CONSTRAINT computron_kquery_pkey PRIMARY KEY (id);


--
-- Name: computron_kvalidator computron_kvalidator_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kvalidator
    ADD CONSTRAINT computron_kvalidator_name_key UNIQUE (name);


--
-- Name: computron_kvalidator computron_kvalidator_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_kvalidator
    ADD CONSTRAINT computron_kvalidator_pkey PRIMARY KEY (id);


--
-- Name: computron_raction computron_raction_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_raction
    ADD CONSTRAINT computron_raction_name_key UNIQUE (name);


--
-- Name: computron_raction computron_raction_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_raction
    ADD CONSTRAINT computron_raction_pkey PRIMARY KEY (id);


--
-- Name: computron_rnotify computron_rnotify_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_rnotify
    ADD CONSTRAINT computron_rnotify_name_key UNIQUE (name);


--
-- Name: computron_rnotify computron_rnotify_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.computron_rnotify
    ADD CONSTRAINT computron_rnotify_pkey PRIMARY KEY (id);


--
-- Name: coverfox_make coverfox_make_acko_make_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_make
    ADD CONSTRAINT coverfox_make_acko_make_id_key UNIQUE (acko_make_id);


--
-- Name: coverfox_make coverfox_make_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_make
    ADD CONSTRAINT coverfox_make_pkey PRIMARY KEY (id);


--
-- Name: coverfox_model coverfox_model_acko_model_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_model
    ADD CONSTRAINT coverfox_model_acko_model_id_key UNIQUE (acko_model_id);


--
-- Name: coverfox_model coverfox_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_model
    ADD CONSTRAINT coverfox_model_pkey PRIMARY KEY (id);


--
-- Name: coverfox_variant_acko_variants coverfox_variant_acko_va_from_variant_id_to_varia_baf470eb_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant_acko_variants
    ADD CONSTRAINT coverfox_variant_acko_va_from_variant_id_to_varia_baf470eb_uniq UNIQUE (from_variant_id, to_variant_id);


--
-- Name: coverfox_variant_acko_variants coverfox_variant_acko_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant_acko_variants
    ADD CONSTRAINT coverfox_variant_acko_variants_pkey PRIMARY KEY (id);


--
-- Name: coverfox_variant coverfox_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant
    ADD CONSTRAINT coverfox_variant_pkey PRIMARY KEY (id);


--
-- Name: cuvora_vehicledata cuvora_vehicledata_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cuvora_vehicledata
    ADD CONSTRAINT cuvora_vehicledata_pkey PRIMARY KEY (id);


--
-- Name: cuvora_vehicledata cuvora_vehicledata_reg_no_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cuvora_vehicledata
    ADD CONSTRAINT cuvora_vehicledata_reg_no_key UNIQUE (registration_number);


--
-- Name: devops_deployment devops_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.devops_deployment
    ADD CONSTRAINT devops_deployment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: explorer_query explorer_query_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_query
    ADD CONSTRAINT explorer_query_pkey PRIMARY KEY (id);


--
-- Name: explorer_querylog explorer_querylog_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_querylog
    ADD CONSTRAINT explorer_querylog_pkey PRIMARY KEY (id);


--
-- Name: fastlane_fastlane fastlane_fastlane_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_fastlane
    ADD CONSTRAINT fastlane_fastlane_pkey PRIMARY KEY (id);


--
-- Name: fastlane_fastlane fastlane_fastlane_registration_number_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_fastlane
    ADD CONSTRAINT fastlane_fastlane_registration_number_key UNIQUE (registration_number);


--
-- Name: fastlane_make_acko_makes fastlane_make_acko_makes_from_make_id_to_make_id_49d0c045_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_acko_makes
    ADD CONSTRAINT fastlane_make_acko_makes_from_make_id_to_make_id_49d0c045_uniq UNIQUE (from_make_id, to_make_id);


--
-- Name: fastlane_make_acko_makes fastlane_make_acko_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_acko_makes
    ADD CONSTRAINT fastlane_make_acko_makes_pkey PRIMARY KEY (id);


--
-- Name: fastlane_make_cf_makes fastlane_make_cf_makes_from_make_id_to_make_id_1e9cef5e_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_cf_makes
    ADD CONSTRAINT fastlane_make_cf_makes_from_make_id_to_make_id_1e9cef5e_uniq UNIQUE (from_make_id, to_make_id);


--
-- Name: fastlane_make_cf_makes fastlane_make_cf_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_cf_makes
    ADD CONSTRAINT fastlane_make_cf_makes_pkey PRIMARY KEY (id);


--
-- Name: fastlane_make fastlane_make_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make
    ADD CONSTRAINT fastlane_make_pkey PRIMARY KEY (id);


--
-- Name: fastlane_model_acko_models fastlane_model_acko_mode_from_model_id_to_model_i_f8e58a5a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_acko_models
    ADD CONSTRAINT fastlane_model_acko_mode_from_model_id_to_model_i_f8e58a5a_uniq UNIQUE (from_model_id, to_model_id);


--
-- Name: fastlane_model_acko_models fastlane_model_acko_models_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_acko_models
    ADD CONSTRAINT fastlane_model_acko_models_pkey PRIMARY KEY (id);


--
-- Name: fastlane_model_cf_models fastlane_model_cf_models_from_model_id_to_model_i_f9c775ad_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_cf_models
    ADD CONSTRAINT fastlane_model_cf_models_from_model_id_to_model_i_f9c775ad_uniq UNIQUE (from_model_id, to_model_id);


--
-- Name: fastlane_model_cf_models fastlane_model_cf_models_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_cf_models
    ADD CONSTRAINT fastlane_model_cf_models_pkey PRIMARY KEY (id);


--
-- Name: fastlane_model fastlane_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model
    ADD CONSTRAINT fastlane_model_pkey PRIMARY KEY (id);


--
-- Name: fastlane_variant_acko_variants fastlane_variant_acko_va_from_variant_id_to_varia_33f436dd_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_acko_variants
    ADD CONSTRAINT fastlane_variant_acko_va_from_variant_id_to_varia_33f436dd_uniq UNIQUE (from_variant_id, to_variant_id);


--
-- Name: fastlane_variant_acko_variants fastlane_variant_acko_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_acko_variants
    ADD CONSTRAINT fastlane_variant_acko_variants_pkey PRIMARY KEY (id);


--
-- Name: fastlane_variant_cf_variants fastlane_variant_cf_vari_from_variant_id_to_varia_f9333cdc_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_cf_variants
    ADD CONSTRAINT fastlane_variant_cf_vari_from_variant_id_to_varia_f9333cdc_uniq UNIQUE (from_variant_id, to_variant_id);


--
-- Name: fastlane_variant_cf_variants fastlane_variant_cf_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_cf_variants
    ADD CONSTRAINT fastlane_variant_cf_variants_pkey PRIMARY KEY (id);


--
-- Name: fastlane_variant fastlane_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant
    ADD CONSTRAINT fastlane_variant_pkey PRIMARY KEY (id);


--
-- Name: flightdb_airline flightdb_airline_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_airline
    ADD CONSTRAINT flightdb_airline_pkey PRIMARY KEY (id);


--
-- Name: flightdb_airport flightdb_airport_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_airport
    ADD CONSTRAINT flightdb_airport_pkey PRIMARY KEY (id);


--
-- Name: flightdb_city flightdb_city_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_city
    ADD CONSTRAINT flightdb_city_pkey PRIMARY KEY (id);


--
-- Name: flightdb_flight flightdb_flight_airline_id_flight_number_cb1ee3f5_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flight
    ADD CONSTRAINT flightdb_flight_airline_id_flight_number_cb1ee3f5_uniq UNIQUE (airline_id, flight_number);


--
-- Name: flightdb_flight flightdb_flight_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flight
    ADD CONSTRAINT flightdb_flight_pkey PRIMARY KEY (id);


--
-- Name: flightdb_flightinstance flightdb_flightinstance_flight_id_scheduled_depa_cb827004_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstance
    ADD CONSTRAINT flightdb_flightinstance_flight_id_scheduled_depa_cb827004_uniq UNIQUE (flight_id, scheduled_departure);


--
-- Name: flightdb_flightinstance flightdb_flightinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstance
    ADD CONSTRAINT flightdb_flightinstance_pkey PRIMARY KEY (id);


--
-- Name: flightdb_flightinstancehistory flightdb_flightinstancehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstancehistory
    ADD CONSTRAINT flightdb_flightinstancehistory_pkey PRIMARY KEY (id);


--
-- Name: freshdesk_ticket freshdesk_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.freshdesk_ticket
    ADD CONSTRAINT freshdesk_ticket_pkey PRIMARY KEY (id);


--
-- Name: freshdesk_ticket freshdesk_ticket_ticket_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.freshdesk_ticket
    ADD CONSTRAINT freshdesk_ticket_ticket_id_key UNIQUE (ticket_id);


--
-- Name: iet_part_makes iet_part_makes_part_id_make_id_e52e52a2_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_makes
    ADD CONSTRAINT iet_part_makes_part_id_make_id_e52e52a2_uniq UNIQUE (part_id, make_id);


--
-- Name: iet_part_makes iet_part_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_makes
    ADD CONSTRAINT iet_part_makes_pkey PRIMARY KEY (id);


--
-- Name: iet_part_models iet_part_models_part_id_model_id_bd2a9741_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_models
    ADD CONSTRAINT iet_part_models_part_id_model_id_bd2a9741_uniq UNIQUE (part_id, model_id);


--
-- Name: iet_part_models iet_part_models_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_models
    ADD CONSTRAINT iet_part_models_pkey PRIMARY KEY (id);


--
-- Name: iet_part iet_part_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part
    ADD CONSTRAINT iet_part_pkey PRIMARY KEY (id);


--
-- Name: iet_part_variants iet_part_variants_part_id_variant_id_5863e9b2_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_variants
    ADD CONSTRAINT iet_part_variants_part_id_variant_id_5863e9b2_uniq UNIQUE (part_id, variant_id);


--
-- Name: iet_part_variants iet_part_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_variants
    ADD CONSTRAINT iet_part_variants_pkey PRIMARY KEY (id);


--
-- Name: iib_claimshistory iib_claimshistory_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iib_claimshistory
    ADD CONSTRAINT iib_claimshistory_pkey PRIMARY KEY (id);


--
-- Name: intranet_file_downs intranet_file_downs_file_id_oentity_id_c7bc4fb1_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_downs
    ADD CONSTRAINT intranet_file_downs_file_id_oentity_id_c7bc4fb1_uniq UNIQUE (file_id, oentity_id);


--
-- Name: intranet_file_downs intranet_file_downs_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_downs
    ADD CONSTRAINT intranet_file_downs_pkey PRIMARY KEY (id);


--
-- Name: intranet_file intranet_file_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file
    ADD CONSTRAINT intranet_file_pkey PRIMARY KEY (id);


--
-- Name: intranet_file_selfs intranet_file_selfs_file_id_oentity_id_3b8205af_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_selfs
    ADD CONSTRAINT intranet_file_selfs_file_id_oentity_id_3b8205af_uniq UNIQUE (file_id, oentity_id);


--
-- Name: intranet_file_selfs intranet_file_selfs_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_selfs
    ADD CONSTRAINT intranet_file_selfs_pkey PRIMARY KEY (id);


--
-- Name: intranet_file_ups intranet_file_ups_file_id_oentity_id_e4539a36_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_ups
    ADD CONSTRAINT intranet_file_ups_file_id_oentity_id_e4539a36_uniq UNIQUE (file_id, oentity_id);


--
-- Name: intranet_file_ups intranet_file_ups_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_ups
    ADD CONSTRAINT intranet_file_ups_pkey PRIMARY KEY (id);


--
-- Name: intranet_room intranet_room_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_room
    ADD CONSTRAINT intranet_room_pkey PRIMARY KEY (id);


--
-- Name: intranet_roomreservation intranet_roomreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_roomreservation
    ADD CONSTRAINT intranet_roomreservation_pkey PRIMARY KEY (id);


--
-- Name: karmator_work karmator_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_work
    ADD CONSTRAINT karmator_claim_pkey PRIMARY KEY (id);


--
-- Name: karmator_workfield karmator_claimfield_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield
    ADD CONSTRAINT karmator_claimfield_pkey PRIMARY KEY (id);


--
-- Name: karmator_workfield_validators karmator_claimfield_vali_claimfield_id_rule_id_63829a60_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield_validators
    ADD CONSTRAINT karmator_claimfield_vali_claimfield_id_rule_id_63829a60_uniq UNIQUE (workfield_id, kvalidator_id);


--
-- Name: karmator_workfield_validators karmator_claimfield_validators_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield_validators
    ADD CONSTRAINT karmator_claimfield_validators_pkey PRIMARY KEY (id);


--
-- Name: karmator_qtime karmator_qtime_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_pkey PRIMARY KEY (id);


--
-- Name: karmator_qtime karmator_qtime_user_id_accepted_f872eb0d_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_user_id_accepted_f872eb0d_uniq UNIQUE (user_id, accepted);


--
-- Name: karmator_qtime karmator_qtime_work_id_rule_id_5d06fc34_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_work_id_rule_id_5d06fc34_uniq UNIQUE (work_id, task_id);


--
-- Name: karmator_task karmator_task_name_subname_c9e604df_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_name_subname_c9e604df_uniq UNIQUE (name, subname);


--
-- Name: karmator_task karmator_task_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_pkey PRIMARY KEY (id);


--
-- Name: karmator_workfield karmator_workfield_name_kind_id_ec6b0820_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield
    ADD CONSTRAINT karmator_workfield_name_kind_id_ec6b0820_uniq UNIQUE (name, kind_id);


--
-- Name: karmator_workhistory karmator_workhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory
    ADD CONSTRAINT karmator_workhistory_pkey PRIMARY KEY (id);


--
-- Name: karmator_workkind karmator_workkind_name_b4c63ea4_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workkind
    ADD CONSTRAINT karmator_workkind_name_b4c63ea4_uniq UNIQUE (name);


--
-- Name: karmator_workkind karmator_workkind_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workkind
    ADD CONSTRAINT karmator_workkind_pkey PRIMARY KEY (id);


--
-- Name: lsq_activity lsq_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_activity
    ADD CONSTRAINT lsq_activity_pkey PRIMARY KEY (id);


--
-- Name: lsq_activity lsq_activity_prospect_activity_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_activity
    ADD CONSTRAINT lsq_activity_prospect_activity_id_key UNIQUE (prospect_activity_id);


--
-- Name: lsq_lead lsq_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_lead
    ADD CONSTRAINT lsq_lead_pkey PRIMARY KEY (id);


--
-- Name: lsq_lead lsq_lead_prospect_id_c488c495_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.lsq_lead
    ADD CONSTRAINT lsq_lead_prospect_id_c488c495_uniq UNIQUE (prospect_id);


--
-- Name: masters_address masters_address_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_address
    ADD CONSTRAINT masters_address_pkey PRIMARY KEY (id);


--
-- Name: masters_address masters_address_user_id_default_3aec71d7_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_address
    ADD CONSTRAINT masters_address_user_id_default_3aec71d7_uniq UNIQUE (user_id, "default");


--
-- Name: masters_eduqual masters_eduqual_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_eduqual
    ADD CONSTRAINT masters_eduqual_pkey PRIMARY KEY (id);


--
-- Name: masters_equipmentclip masters_equipmentclip_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_equipmentclip
    ADD CONSTRAINT masters_equipmentclip_pkey PRIMARY KEY (id);


--
-- Name: masters_establishment masters_establishment_name_pincode_id_3bb011c4_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishment_name_pincode_id_3bb011c4_uniq UNIQUE (name, pincode_id);


--
-- Name: masters_establishment masters_establishment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishment_pkey PRIMARY KEY (id);


--
-- Name: masters_externalbifueltype masters_externalbifueltype_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_externalbifueltype
    ADD CONSTRAINT masters_externalbifueltype_pkey PRIMARY KEY (id);


--
-- Name: masters_financingtype masters_financingtype_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_financingtype
    ADD CONSTRAINT masters_financingtype_pkey PRIMARY KEY (id);


--
-- Name: masters_garage_makes masters_garage_makes_garage_id_make_id_9e4ce0c4_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage_makes
    ADD CONSTRAINT masters_garage_makes_garage_id_make_id_9e4ce0c4_uniq UNIQUE (garage_id, make_id);


--
-- Name: masters_garage_makes masters_garage_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage_makes
    ADD CONSTRAINT masters_garage_makes_pkey PRIMARY KEY (id);


--
-- Name: masters_garage masters_garage_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage
    ADD CONSTRAINT masters_garage_pkey PRIMARY KEY (id);


--
-- Name: masters_garagetimings masters_garagetimings_garage_id_day_c600668a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garagetimings
    ADD CONSTRAINT masters_garagetimings_garage_id_day_c600668a_uniq UNIQUE (garage_id, day);


--
-- Name: masters_garagetimings masters_garagetimings_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garagetimings
    ADD CONSTRAINT masters_garagetimings_pkey PRIMARY KEY (id);


--
-- Name: masters_gender masters_gender_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_gender
    ADD CONSTRAINT masters_gender_pkey PRIMARY KEY (id);


--
-- Name: masters_goodsnature masters_goodsnature_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_goodsnature
    ADD CONSTRAINT masters_goodsnature_pkey PRIMARY KEY (id);


--
-- Name: masters_intermediary_features masters_intermediary_fea_intermediary_id_feature__cad40aba_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_features
    ADD CONSTRAINT masters_intermediary_fea_intermediary_id_feature__cad40aba_uniq UNIQUE (intermediary_id, coverage_id);


--
-- Name: masters_intermediary_features masters_intermediary_features_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_features
    ADD CONSTRAINT masters_intermediary_features_pkey PRIMARY KEY (id);


--
-- Name: masters_intermediary masters_intermediary_irda_registration_number_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_irda_registration_number_key UNIQUE (irda_registration_number);


--
-- Name: masters_intermediary masters_intermediary_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_pkey PRIMARY KEY (id);


--
-- Name: masters_intermediary_plans masters_intermediary_pla_intermediary_id_plan_id_e9a61d7a_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_plans
    ADD CONSTRAINT masters_intermediary_pla_intermediary_id_plan_id_e9a61d7a_uniq UNIQUE (intermediary_id, plan_id);


--
-- Name: masters_intermediary_plans masters_intermediary_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_plans
    ADD CONSTRAINT masters_intermediary_plans_pkey PRIMARY KEY (id);


--
-- Name: masters_intermediary masters_intermediary_return_url_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_return_url_key UNIQUE (return_url);


--
-- Name: masters_intermediary_rtos masters_intermediary_rtos_intermediary_id_rto_id_b6e756e8_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_rtos
    ADD CONSTRAINT masters_intermediary_rtos_intermediary_id_rto_id_b6e756e8_uniq UNIQUE (intermediary_id, rto_id);


--
-- Name: masters_intermediary_rtos masters_intermediary_rtos_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_rtos
    ADD CONSTRAINT masters_intermediary_rtos_pkey PRIMARY KEY (id);


--
-- Name: masters_intermediaryrtoplanmapping masters_intermediaryrtoplanmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediaryrtoplanmapping
    ADD CONSTRAINT masters_intermediaryrtoplanmapping_pkey PRIMARY KEY (id);


--
-- Name: masters_logistics_pincode masters_logistics_pincode_logistics_id_pincode_id_da98c32d_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics_pincode
    ADD CONSTRAINT masters_logistics_pincode_logistics_id_pincode_id_da98c32d_uniq UNIQUE (logistics_id, pincode_id);


--
-- Name: masters_logistics_pincode masters_logistics_pincode_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics_pincode
    ADD CONSTRAINT masters_logistics_pincode_pkey PRIMARY KEY (id);


--
-- Name: masters_logistics masters_logistics_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics
    ADD CONSTRAINT masters_logistics_pkey PRIMARY KEY (id);


--
-- Name: masters_make masters_make_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_make
    ADD CONSTRAINT masters_make_name_key UNIQUE (name);


--
-- Name: masters_make masters_make_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_make
    ADD CONSTRAINT masters_make_pkey PRIMARY KEY (id);


--
-- Name: masters_model masters_model_make_id_name_vehicle_type_441f85cf_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_model
    ADD CONSTRAINT masters_model_make_id_name_vehicle_type_441f85cf_uniq UNIQUE (make_id, name, vehicle_type);


--
-- Name: masters_model masters_model_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_model
    ADD CONSTRAINT masters_model_pkey PRIMARY KEY (id);


--
-- Name: masters_modelcolor masters_modelcolor_model_id_default_fb1dd22b_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_modelcolor
    ADD CONSTRAINT masters_modelcolor_model_id_default_fb1dd22b_uniq UNIQUE (model_id, "default");


--
-- Name: masters_modelcolor masters_modelcolor_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_modelcolor
    ADD CONSTRAINT masters_modelcolor_pkey PRIMARY KEY (id);


--
-- Name: masters_phonemake masters_phonemake_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_phonemake
    ADD CONSTRAINT masters_phonemake_pkey PRIMARY KEY (id);


--
-- Name: masters_phonemodel masters_phonemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_phonemodel
    ADD CONSTRAINT masters_phonemodel_pkey PRIMARY KEY (id);


--
-- Name: masters_pincode masters_pincode_pincode_0c3bf186_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode
    ADD CONSTRAINT masters_pincode_pincode_0c3bf186_uniq UNIQUE (pincode);


--
-- Name: masters_pincode masters_pincode_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode
    ADD CONSTRAINT masters_pincode_pkey PRIMARY KEY (id);


--
-- Name: masters_pincode_regions masters_pincode_regions_pincode_id_region_id_7cb95c55_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode_regions
    ADD CONSTRAINT masters_pincode_regions_pincode_id_region_id_7cb95c55_uniq UNIQUE (pincode_id, region_id);


--
-- Name: masters_pincode_regions masters_pincode_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode_regions
    ADD CONSTRAINT masters_pincode_regions_pkey PRIMARY KEY (id);


--
-- Name: masters_previouspolicytype masters_previouspolicytype_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_previouspolicytype
    ADD CONSTRAINT masters_previouspolicytype_pkey PRIMARY KEY (id);


--
-- Name: masters_profession masters_profession_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_profession
    ADD CONSTRAINT masters_profession_pkey PRIMARY KEY (id);


--
-- Name: masters_region_parents masters_region_parents_from_region_id_to_region_e3e3fe23_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region_parents
    ADD CONSTRAINT masters_region_parents_from_region_id_to_region_e3e3fe23_uniq UNIQUE (from_region_id, to_region_id);


--
-- Name: masters_region_parents masters_region_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region_parents
    ADD CONSTRAINT masters_region_parents_pkey PRIMARY KEY (id);


--
-- Name: masters_region masters_region_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region
    ADD CONSTRAINT masters_region_pkey PRIMARY KEY (id);


--
-- Name: masters_region masters_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region
    ADD CONSTRAINT masters_region_slug_key UNIQUE (slug);


--
-- Name: masters_relationship masters_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_relationship
    ADD CONSTRAINT masters_relationship_pkey PRIMARY KEY (id);


--
-- Name: masters_rto masters_rto_code_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rto
    ADD CONSTRAINT masters_rto_code_key UNIQUE (code);


--
-- Name: masters_rto masters_rto_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rto
    ADD CONSTRAINT masters_rto_pkey PRIMARY KEY (id);


--
-- Name: masters_rtocitymapping masters_rtocitymapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping
    ADD CONSTRAINT masters_rtocitymapping_pkey PRIMARY KEY (id);


--
-- Name: masters_rtocitymapping_rtos masters_rtocitymapping_r_rtocitymapping_id_rto_id_5254646d_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping_rtos
    ADD CONSTRAINT masters_rtocitymapping_r_rtocitymapping_id_rto_id_5254646d_uniq UNIQUE (rtocitymapping_id, rto_id);


--
-- Name: masters_rtocitymapping_rtos masters_rtocitymapping_rtos_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping_rtos
    ADD CONSTRAINT masters_rtocitymapping_rtos_pkey PRIMARY KEY (id);


--
-- Name: masters_rtopincodemapping masters_rtopincodemapping_pincode_id_afea6a03_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping
    ADD CONSTRAINT masters_rtopincodemapping_pincode_id_afea6a03_uniq UNIQUE (pincode_id);


--
-- Name: masters_rtopincodemapping masters_rtopincodemapping_pincode_id_rto_id_015a1603_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping
    ADD CONSTRAINT masters_rtopincodemapping_pincode_id_rto_id_015a1603_uniq UNIQUE (pincode_id, rto_id);


--
-- Name: masters_rtopincodemapping masters_rtopincodemapping_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping
    ADD CONSTRAINT masters_rtopincodemapping_pkey PRIMARY KEY (id);


--
-- Name: masters_servicecenter masters_servicecenter_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter
    ADD CONSTRAINT masters_servicecenter_pkey PRIMARY KEY (id);


--
-- Name: masters_servicecenter_region masters_servicecenter_re_servicecenter_id_region__d7089558_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter_region
    ADD CONSTRAINT masters_servicecenter_re_servicecenter_id_region__d7089558_uniq UNIQUE (servicecenter_id, region_id);


--
-- Name: masters_servicecenter_region masters_servicecenter_region_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter_region
    ADD CONSTRAINT masters_servicecenter_region_pkey PRIMARY KEY (id);


--
-- Name: masters_title masters_title_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_title
    ADD CONSTRAINT masters_title_pkey PRIMARY KEY (id);


--
-- Name: masters_variant masters_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_variant
    ADD CONSTRAINT masters_variant_pkey PRIMARY KEY (id);


--
-- Name: masters_vehicletype masters_vehicletype_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_vehicletype
    ADD CONSTRAINT masters_vehicletype_pkey PRIMARY KEY (id);


--
-- Name: motor_lead motor_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_lead
    ADD CONSTRAINT motor_lead_pkey PRIMARY KEY (id);


--
-- Name: motor_leadsource motor_leadsource_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_leadsource
    ADD CONSTRAINT motor_leadsource_pkey PRIMARY KEY (id);


--
-- Name: motor_policy motor_policy_idit_policy_number_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_idit_policy_number_key UNIQUE (idit_policy_number);


--
-- Name: motor_policy motor_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_pkey PRIMARY KEY (id);


--
-- Name: motor_policy motor_policy_policy_number_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_policy_number_key UNIQUE (policy_number);


--
-- Name: motor_policy motor_policy_quote_id_6fbb9ad3_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_quote_id_6fbb9ad3_uniq UNIQUE (quote_id);


--
-- Name: motor_quote motor_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_pkey PRIMARY KEY (id);


--
-- Name: motor_ratings_pincodezone motor_ratings_pincodezone_pincode_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_pincodezone
    ADD CONSTRAINT motor_ratings_pincodezone_pincode_id_key UNIQUE (pincode_id);


--
-- Name: motor_ratings_pincodezone motor_ratings_pincodezone_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_pincodezone
    ADD CONSTRAINT motor_ratings_pincodezone_pkey PRIMARY KEY (id);


--
-- Name: motor_ratings_uwdiscretion motor_ratings_uwdiscreti_make_id_model_id_fuel_ty_4d83bfc0_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion
    ADD CONSTRAINT motor_ratings_uwdiscreti_make_id_model_id_fuel_ty_4d83bfc0_uniq UNIQUE (make_id, model_id, fuel_type, zone_id, cc_bucket, age_bucket, version);


--
-- Name: motor_ratings_uwdiscretion motor_ratings_uwdiscretion_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion
    ADD CONSTRAINT motor_ratings_uwdiscretion_pkey PRIMARY KEY (id);


--
-- Name: motor_ratings_zone motor_ratings_zone_code_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_zone
    ADD CONSTRAINT motor_ratings_zone_code_key UNIQUE (code);


--
-- Name: motor_ratings_zone motor_ratings_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_zone
    ADD CONSTRAINT motor_ratings_zone_pkey PRIMARY KEY (id);


--
-- Name: motor_utlead motor_utlead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_utlead
    ADD CONSTRAINT motor_utlead_pkey PRIMARY KEY (id);


--
-- Name: motor_vehicle motor_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_vehicle
    ADD CONSTRAINT motor_vehicle_pkey PRIMARY KEY (id);


--
-- Name: motor_vehicle motor_vehicle_registration_b69859f2_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_vehicle
    ADD CONSTRAINT motor_vehicle_registration_b69859f2_uniq UNIQUE (registration);


--
-- Name: ola_emailpreference ola_emailpreference_email_0412f838_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_emailpreference
    ADD CONSTRAINT ola_emailpreference_email_0412f838_uniq UNIQUE (email);


--
-- Name: ola_emailpreference ola_emailpreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_emailpreference
    ADD CONSTRAINT ola_emailpreferences_pkey PRIMARY KEY (id);


--
-- Name: ola_invoice ola_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_invoice
    ADD CONSTRAINT ola_invoice_pkey PRIMARY KEY (id);


--
-- Name: ola_trip ola_trip_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_pkey PRIMARY KEY (id);


--
-- Name: ola_trip ola_trip_trip_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_trip_id_key UNIQUE (trip_id);


--
-- Name: ozonetel_agent ozonetel_agent_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agent
    ADD CONSTRAINT ozonetel_agent_name_key UNIQUE (name);


--
-- Name: ozonetel_agent ozonetel_agent_ozonetel_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agent
    ADD CONSTRAINT ozonetel_agent_ozonetel_id_key UNIQUE (ozonetel_id);


--
-- Name: ozonetel_agent ozonetel_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agent
    ADD CONSTRAINT ozonetel_agent_pkey PRIMARY KEY (id);


--
-- Name: ozonetel_agentlogin ozonetel_agentlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_agentlogin
    ADD CONSTRAINT ozonetel_agentlogin_pkey PRIMARY KEY (id);


--
-- Name: ozonetel_call ozonetel_call_monitor_ucid_67f76335_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_call
    ADD CONSTRAINT ozonetel_call_monitor_ucid_67f76335_uniq UNIQUE (monitor_ucid);


--
-- Name: ozonetel_call ozonetel_call_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_call
    ADD CONSTRAINT ozonetel_call_pkey PRIMARY KEY (id);


--
-- Name: ozonetel_dailyagentbreak ozonetel_dailyagentbreak_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ozonetel_dailyagentbreak
    ADD CONSTRAINT ozonetel_dailyagentbreak_pkey PRIMARY KEY (id);


--
-- Name: payments_payment payments_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_payment
    ADD CONSTRAINT payments_payment_pkey PRIMARY KEY (id);


--
-- Name: payments_refund payments_refund_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_refund
    ADD CONSTRAINT payments_refund_pkey PRIMARY KEY (id);


--
-- Name: payments_settlement payments_settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_settlement
    ADD CONSTRAINT payments_settlement_pkey PRIMARY KEY (id);


--
-- Name: r2d2_allowance_reimbursement r2d2_allowance_reimbursement_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_allowance_reimbursement
    ADD CONSTRAINT r2d2_allowance_reimbursement_oid_key UNIQUE (oid);


--
-- Name: r2d2_allowance_reimbursement r2d2_allowance_reimbursement_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_allowance_reimbursement
    ADD CONSTRAINT r2d2_allowance_reimbursement_pkey PRIMARY KEY (id);


--
-- Name: r2d2_amazon_mobile_repair r2d2_amazonmobilerepair_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_amazon_mobile_repair
    ADD CONSTRAINT r2d2_amazonmobilerepair_oid_key UNIQUE (oid);


--
-- Name: r2d2_amazon_mobile_repair r2d2_amazonmobilerepair_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_amazon_mobile_repair
    ADD CONSTRAINT r2d2_amazonmobilerepair_pkey PRIMARY KEY (id);


--
-- Name: r2d2_appliances_extended_warranty r2d2_appliances_extended_warranty_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_appliances_extended_warranty
    ADD CONSTRAINT r2d2_appliances_extended_warranty_oid_key UNIQUE (oid);


--
-- Name: r2d2_appliances_extended_warranty r2d2_appliances_extended_warranty_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_appliances_extended_warranty
    ADD CONSTRAINT r2d2_appliances_extended_warranty_pkey PRIMARY KEY (id);


--
-- Name: r2d2_burglary_fire_damage r2d2_burglary_fire_damage_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_burglary_fire_damage
    ADD CONSTRAINT r2d2_burglary_fire_damage_oid_key UNIQUE (oid);


--
-- Name: r2d2_burglary_fire_damage r2d2_burglary_fire_damage_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_burglary_fire_damage
    ADD CONSTRAINT r2d2_burglary_fire_damage_pkey PRIMARY KEY (id);


--
-- Name: r2d2_call r2d2_call_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_call
    ADD CONSTRAINT r2d2_call_oid_key UNIQUE (oid);


--
-- Name: r2d2_call r2d2_call_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_call
    ADD CONSTRAINT r2d2_call_pkey PRIMARY KEY (id);


--
-- Name: r2d2_cannedresponse r2d2_cannedresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse
    ADD CONSTRAINT r2d2_cannedresponse_pkey PRIMARY KEY (id);


--
-- Name: r2d2_carlead r2d2_carlead_lead_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_lead_id_key UNIQUE (lead_id);


--
-- Name: r2d2_carlead r2d2_carlead_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_pkey PRIMARY KEY (id);


--
-- Name: r2d2_claim r2d2_claim_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_claim
    ADD CONSTRAINT r2d2_claim_oid_key UNIQUE (oid);


--
-- Name: r2d2_claim r2d2_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_claim
    ADD CONSTRAINT r2d2_claim_pkey PRIMARY KEY (id);


--
-- Name: r2d2_disability_death r2d2_disability_death_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_disability_death
    ADD CONSTRAINT r2d2_disability_death_oid_key UNIQUE (oid);


--
-- Name: r2d2_disability_death r2d2_disability_death_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_disability_death
    ADD CONSTRAINT r2d2_disability_death_pkey PRIMARY KEY (id);


--
-- Name: r2d2_edataspec r2d2_edataspec_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_edataspec
    ADD CONSTRAINT r2d2_edataspec_pkey PRIMARY KEY (id);


--
-- Name: r2d2_endorsement r2d2_endorsement_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_endorsement
    ADD CONSTRAINT r2d2_endorsement_oid_key UNIQUE (oid);


--
-- Name: r2d2_endorsement r2d2_endorsement_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_endorsement
    ADD CONSTRAINT r2d2_endorsement_pkey PRIMARY KEY (id);


--
-- Name: r2d2_event r2d2_event_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_event
    ADD CONSTRAINT r2d2_event_pkey PRIMARY KEY (id);


--
-- Name: r2d2_hospitalization_ipd r2d2_hospitalization_ipd_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_ipd
    ADD CONSTRAINT r2d2_hospitalization_ipd_oid_key UNIQUE (oid);


--
-- Name: r2d2_hospitalization_ipd r2d2_hospitalization_ipd_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_ipd
    ADD CONSTRAINT r2d2_hospitalization_ipd_pkey PRIMARY KEY (id);


--
-- Name: r2d2_hospitalization_opd r2d2_hospitalization_opd_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_opd
    ADD CONSTRAINT r2d2_hospitalization_opd_oid_key UNIQUE (oid);


--
-- Name: r2d2_hospitalization_opd r2d2_hospitalization_opd_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_hospitalization_opd
    ADD CONSTRAINT r2d2_hospitalization_opd_pkey PRIMARY KEY (id);


--
-- Name: r2d2_link r2d2_link_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_link
    ADD CONSTRAINT r2d2_link_oid_key UNIQUE (oid);


--
-- Name: r2d2_link r2d2_link_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_link
    ADD CONSTRAINT r2d2_link_pkey PRIMARY KEY (id);


--
-- Name: r2d2_link r2d2_link_short_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_link
    ADD CONSTRAINT r2d2_link_short_key UNIQUE (short);


--
-- Name: r2d2_loss_theft_personal_belongings r2d2_loss_theft_personal_belongings_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_loss_theft_personal_belongings
    ADD CONSTRAINT r2d2_loss_theft_personal_belongings_oid_key UNIQUE (oid);


--
-- Name: r2d2_loss_theft_personal_belongings r2d2_loss_theft_personal_belongings_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_loss_theft_personal_belongings
    ADD CONSTRAINT r2d2_loss_theft_personal_belongings_pkey PRIMARY KEY (id);


--
-- Name: r2d2_lp_visit r2d2_lp_visit_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lp_visit
    ADD CONSTRAINT r2d2_lp_visit_oid_key UNIQUE (oid);


--
-- Name: r2d2_lp_visit r2d2_lp_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lp_visit
    ADD CONSTRAINT r2d2_lp_visit_pkey PRIMARY KEY (id);


--
-- Name: r2d2_lsq_activity r2d2_lsq_activity_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lsq_activity
    ADD CONSTRAINT r2d2_lsq_activity_oid_key UNIQUE (oid);


--
-- Name: r2d2_lsq_activity r2d2_lsq_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_lsq_activity
    ADD CONSTRAINT r2d2_lsq_activity_pkey PRIMARY KEY (id);


--
-- Name: r2d2_mobile r2d2_mobile_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_mobile
    ADD CONSTRAINT r2d2_mobile_oid_key UNIQUE (oid);


--
-- Name: r2d2_mobile r2d2_mobile_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_mobile
    ADD CONSTRAINT r2d2_mobile_pkey PRIMARY KEY (id);


--
-- Name: r2d2_notification r2d2_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_notification
    ADD CONSTRAINT r2d2_notification_pkey PRIMARY KEY (id);


--
-- Name: r2d2_odataspec r2d2_odataspec_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_odataspec
    ADD CONSTRAINT r2d2_odataspec_pkey PRIMARY KEY (id);


--
-- Name: r2d2_ola_trip_claim r2d2_ola_trip_claim_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip_claim
    ADD CONSTRAINT r2d2_ola_trip_claim_oid_key UNIQUE (oid);


--
-- Name: r2d2_ola_trip_claim r2d2_ola_trip_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip_claim
    ADD CONSTRAINT r2d2_ola_trip_claim_pkey PRIMARY KEY (id);


--
-- Name: r2d2_ola_trip r2d2_ola_trip_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip
    ADD CONSTRAINT r2d2_ola_trip_oid_key UNIQUE (oid);


--
-- Name: r2d2_ola_trip r2d2_ola_trip_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_ola_trip
    ADD CONSTRAINT r2d2_ola_trip_pkey PRIMARY KEY (id);


--
-- Name: r2d2_payment r2d2_payment_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_payment
    ADD CONSTRAINT r2d2_payment_oid_key UNIQUE (oid);


--
-- Name: r2d2_payment r2d2_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_payment
    ADD CONSTRAINT r2d2_payment_pkey PRIMARY KEY (id);


--
-- Name: r2d2_policy r2d2_policy_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_policy
    ADD CONSTRAINT r2d2_policy_oid_key UNIQUE (oid);


--
-- Name: r2d2_policy r2d2_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_policy
    ADD CONSTRAINT r2d2_policy_pkey PRIMARY KEY (id);


--
-- Name: r2d2_pre_inspection r2d2_pre_inspection_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_pre_inspection
    ADD CONSTRAINT r2d2_pre_inspection_oid_key UNIQUE (oid);


--
-- Name: r2d2_pre_inspection r2d2_pre_inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_pre_inspection
    ADD CONSTRAINT r2d2_pre_inspection_pkey PRIMARY KEY (id);


--
-- Name: r2d2_quote r2d2_quote_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_quote
    ADD CONSTRAINT r2d2_quote_oid_key UNIQUE (oid);


--
-- Name: r2d2_quote r2d2_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_quote
    ADD CONSTRAINT r2d2_quote_pkey PRIMARY KEY (id);


--
-- Name: r2d2_tracker r2d2_tracker_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_tracker
    ADD CONSTRAINT r2d2_tracker_oid_key UNIQUE (oid);


--
-- Name: r2d2_tracker r2d2_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_tracker
    ADD CONSTRAINT r2d2_tracker_pkey PRIMARY KEY (id);


--
-- Name: r2d2_user r2d2_user_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_user
    ADD CONSTRAINT r2d2_user_oid_key UNIQUE (oid);


--
-- Name: r2d2_user r2d2_user_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_user
    ADD CONSTRAINT r2d2_user_pkey PRIMARY KEY (id);


--
-- Name: r2d2_visit r2d2_visit_oid_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_visit
    ADD CONSTRAINT r2d2_visit_oid_key UNIQUE (oid);


--
-- Name: r2d2_visit r2d2_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_visit
    ADD CONSTRAINT r2d2_visit_pkey PRIMARY KEY (id);


--
-- Name: reports_keyreports reports_keyreports_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_keyreports
    ADD CONSTRAINT reports_keyreports_pkey PRIMARY KEY (id);


--
-- Name: reports_report_downs reports_report_downs_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_downs
    ADD CONSTRAINT reports_report_downs_pkey PRIMARY KEY (id);


--
-- Name: reports_report_downs reports_report_downs_report_id_oentity_id_1c5a6c0f_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_downs
    ADD CONSTRAINT reports_report_downs_report_id_oentity_id_1c5a6c0f_uniq UNIQUE (report_id, oentity_id);


--
-- Name: reports_report reports_report_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report
    ADD CONSTRAINT reports_report_pkey PRIMARY KEY (id);


--
-- Name: reports_report_selfs reports_report_selfs_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_selfs
    ADD CONSTRAINT reports_report_selfs_pkey PRIMARY KEY (id);


--
-- Name: reports_report_selfs reports_report_selfs_report_id_oentity_id_1401a8c8_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_selfs
    ADD CONSTRAINT reports_report_selfs_report_id_oentity_id_1401a8c8_uniq UNIQUE (report_id, oentity_id);


--
-- Name: reports_report_ups reports_report_ups_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_ups
    ADD CONSTRAINT reports_report_ups_pkey PRIMARY KEY (id);


--
-- Name: reports_report_ups reports_report_ups_report_id_oentity_id_cfb110d5_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_ups
    ADD CONSTRAINT reports_report_ups_report_id_oentity_id_cfb110d5_uniq UNIQUE (report_id, oentity_id);


--
-- Name: slots_slot slots_slot_date_start_time_end_time_82368613_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slot
    ADD CONSTRAINT slots_slot_date_start_time_end_time_82368613_uniq UNIQUE (date, start_time, end_time);


--
-- Name: slots_slot slots_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slot
    ADD CONSTRAINT slots_slot_pkey PRIMARY KEY (id);


--
-- Name: slots_slottemplate slots_slottemplate_name_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate
    ADD CONSTRAINT slots_slottemplate_name_key UNIQUE (name);


--
-- Name: slots_slottemplate slots_slottemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate
    ADD CONSTRAINT slots_slottemplate_pkey PRIMARY KEY (id);


--
-- Name: slots_slottemplate_template_time_range slots_slottemplate_templ_slottemplate_id_slottime_e2c45083_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate_template_time_range
    ADD CONSTRAINT slots_slottemplate_templ_slottemplate_id_slottime_e2c45083_uniq UNIQUE (slottemplate_id, slottime_id);


--
-- Name: slots_slottemplate_template_time_range slots_slottemplate_template_time_range_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate_template_time_range
    ADD CONSTRAINT slots_slottemplate_template_time_range_pkey PRIMARY KEY (id);


--
-- Name: slots_slottime slots_slottime_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottime
    ADD CONSTRAINT slots_slottime_pkey PRIMARY KEY (id);


--
-- Name: socialleads_socialleads socialleads_socialleads_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.socialleads_socialleads
    ADD CONSTRAINT socialleads_socialleads_pkey PRIMARY KEY (id);


--
-- Name: subscription_mandate subscription_mandate_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.subscription_mandate
    ADD CONSTRAINT subscription_mandate_pkey PRIMARY KEY (id);


--
-- Name: motor_leadsource unique_lead_source; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_leadsource
    ADD CONSTRAINT unique_lead_source UNIQUE (lead_id, source_id);


--
-- Name: ackore_lead unique_user_asset; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lead
    ADD CONSTRAINT unique_user_asset UNIQUE (user_id, asset_id);


--
-- Name: motor_lead unique_user_vehicle; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_lead
    ADD CONSTRAINT unique_user_vehicle UNIQUE (user_id, vehicle_id);


--
-- Name: users_company users_company_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_company
    ADD CONSTRAINT users_company_pkey PRIMARY KEY (id);


--
-- Name: users_device users_device_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_device
    ADD CONSTRAINT users_device_pkey PRIMARY KEY (id);


--
-- Name: users_device users_device_token_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_device
    ADD CONSTRAINT users_device_token_key UNIQUE (token);


--
-- Name: users_email users_email_email_is_primary_b92e8156_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_email_is_primary_b92e8156_uniq UNIQUE (email, is_primary);


--
-- Name: users_email users_email_email_is_verified_05537ebd_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_email_is_verified_05537ebd_uniq UNIQUE (email, is_verified);


--
-- Name: users_email users_email_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_pkey PRIMARY KEY (id);


--
-- Name: users_email users_email_user_id_is_primary_d2ae0e1b_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_user_id_is_primary_d2ae0e1b_uniq UNIQUE (user_id, is_primary);


--
-- Name: users_oentity_dotted_line users_oentity_dotted_lin_from_oentity_id_to_oenti_e3e2db84_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_dotted_line
    ADD CONSTRAINT users_oentity_dotted_lin_from_oentity_id_to_oenti_e3e2db84_uniq UNIQUE (from_oentity_id, to_oentity_id);


--
-- Name: users_oentity_dotted_line users_oentity_dotted_line_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_dotted_line
    ADD CONSTRAINT users_oentity_dotted_line_pkey PRIMARY KEY (id);


--
-- Name: users_oentity_down users_oentity_down_oentity_id_permission_id_9828e7b7_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_down
    ADD CONSTRAINT users_oentity_down_oentity_id_permission_id_9828e7b7_uniq UNIQUE (oentity_id, permission_id);


--
-- Name: users_oentity_down users_oentity_down_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_down
    ADD CONSTRAINT users_oentity_down_pkey PRIMARY KEY (id);


--
-- Name: users_oentity users_oentity_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity
    ADD CONSTRAINT users_oentity_pkey PRIMARY KEY (id);


--
-- Name: users_oentity_self users_oentity_self_oentity_id_permission_id_57095118_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_self
    ADD CONSTRAINT users_oentity_self_oentity_id_permission_id_57095118_uniq UNIQUE (oentity_id, permission_id);


--
-- Name: users_oentity_self users_oentity_self_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_self
    ADD CONSTRAINT users_oentity_self_pkey PRIMARY KEY (id);


--
-- Name: users_oentity_up users_oentity_up_oentity_id_permission_id_393ce72f_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_up
    ADD CONSTRAINT users_oentity_up_oentity_id_permission_id_393ce72f_uniq UNIQUE (oentity_id, permission_id);


--
-- Name: users_oentity_up users_oentity_up_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_up
    ADD CONSTRAINT users_oentity_up_pkey PRIMARY KEY (id);


--
-- Name: users_phone users_phone_phone_is_primary_ff798cc5_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone
    ADD CONSTRAINT users_phone_phone_is_primary_ff798cc5_uniq UNIQUE (phone, is_primary);


--
-- Name: users_phone users_phone_phone_is_verified_78f96268_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone
    ADD CONSTRAINT users_phone_phone_is_verified_78f96268_uniq UNIQUE (phone, is_verified);


--
-- Name: users_phone users_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone
    ADD CONSTRAINT users_phone_pkey PRIMARY KEY (id);


--
-- Name: users_phone users_phone_user_id_is_primary_623aee1e_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone
    ADD CONSTRAINT users_phone_user_id_is_primary_623aee1e_uniq UNIQUE (user_id, is_primary);


--
-- Name: users_remoteuser users_remoteuser_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_remoteuser
    ADD CONSTRAINT users_remoteuser_pkey PRIMARY KEY (id);


--
-- Name: users_remoteuser users_remoteuser_remote_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_remoteuser
    ADD CONSTRAINT users_remoteuser_remote_id_key UNIQUE (remote_id);


--
-- Name: users_reservedwork users_reservedwork_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_reservedwork
    ADD CONSTRAINT users_reservedwork_pkey PRIMARY KEY (id);


--
-- Name: users_skill users_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_skill
    ADD CONSTRAINT users_skill_pkey PRIMARY KEY (id);


--
-- Name: users_slot users_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot
    ADD CONSTRAINT users_slot_pkey PRIMARY KEY (id);


--
-- Name: users_slot users_slot_quote_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot
    ADD CONSTRAINT users_slot_quote_id_key UNIQUE (quote_id);


--
-- Name: users_slotspec users_slotspec_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slotspec
    ADD CONSTRAINT users_slotspec_pkey PRIMARY KEY (id);


--
-- Name: users_team users_team_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_team
    ADD CONSTRAINT users_team_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_phone_fe37f55c_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_phone_fe37f55c_uniq UNIQUE (phone);


--
-- Name: users_user_skills users_user_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_skills
    ADD CONSTRAINT users_user_skills_pkey PRIMARY KEY (id);


--
-- Name: users_user_skills users_user_skills_user_id_skill_id_40063108_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_skills
    ADD CONSTRAINT users_user_skills_user_id_skill_id_40063108_uniq UNIQUE (user_id, skill_id);


--
-- Name: users_userprofile users_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_pkey PRIMARY KEY (id);


--
-- Name: users_userprofile users_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: users_workerprofile users_workerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile
    ADD CONSTRAINT users_workerprofile_pkey PRIMARY KEY (id);


--
-- Name: users_workerprofile_preferred_slots users_workerprofile_pref_workerprofile_id_slotspe_ebb96b5b_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile_preferred_slots
    ADD CONSTRAINT users_workerprofile_pref_workerprofile_id_slotspe_ebb96b5b_uniq UNIQUE (workerprofile_id, slotspec_id);


--
-- Name: users_workerprofile_preferred_slots users_workerprofile_preferred_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile_preferred_slots
    ADD CONSTRAINT users_workerprofile_preferred_slots_pkey PRIMARY KEY (id);


--
-- Name: users_workerprofile users_workerprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile
    ADD CONSTRAINT users_workerprofile_user_id_key UNIQUE (user_id);


--
-- Name: users_workerregion users_workerregion_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerregion
    ADD CONSTRAINT users_workerregion_pkey PRIMARY KEY (id);


--
-- Name: users_workerregion users_workerregion_worker_id_is_primary_d91dfad0_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerregion
    ADD CONSTRAINT users_workerregion_worker_id_is_primary_d91dfad0_uniq UNIQUE (worker_id, is_primary);


--
-- Name: users_workerregion users_workerregion_worker_id_region_name_569d392c_uniq; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerregion
    ADD CONSTRAINT users_workerregion_worker_id_region_name_569d392c_uniq UNIQUE (worker_id, region_name);


--
-- Name: vendors_bikerdriver vendors_bikerdriver_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver
    ADD CONSTRAINT vendors_bikerdriver_pkey PRIMARY KEY (id);


--
-- Name: vendors_workshop vendors_workshop_pkey; Type: CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop
    ADD CONSTRAINT vendors_workshop_pkey PRIMARY KEY (id);


--
-- Name: acko_asset_tracker_id_8f0d077a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_asset_tracker_id_8f0d077a ON public.acko_asset USING btree (tracker_id);


--
-- Name: acko_asset_user_id_ed00361e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_asset_user_id_ed00361e ON public.acko_asset USING btree (user_id);


--
-- Name: acko_bankaccount_account_branch_id_35ff15d6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_bankaccount_account_branch_id_35ff15d6 ON public.acko_bankaccount USING btree (account_branch_id);


--
-- Name: acko_bankaccount_legal_entity_id_8598ca60; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_bankaccount_legal_entity_id_8598ca60 ON public.acko_bankaccount USING btree (legal_entity_id);


--
-- Name: acko_bankaccount_updated_on_5ed04a97; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_bankaccount_updated_on_5ed04a97 ON public.acko_bankaccount USING btree (updated_on);


--
-- Name: acko_bankbranch_updated_on_eb8067b8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_bankbranch_updated_on_eb8067b8 ON public.acko_bankbranch USING btree (updated_on);


--
-- Name: acko_corecontact_core_id_d85db3df_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_corecontact_core_id_d85db3df_like ON public.acko_contact USING btree (core_id varchar_pattern_ops);


--
-- Name: acko_corecontactusers_core_contact_id_b924da2f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_corecontactusers_core_contact_id_b924da2f ON public.acko_usercontact USING btree (contact_id);


--
-- Name: acko_corecontactusers_user_id_f627d73e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_corecontactusers_user_id_f627d73e ON public.acko_usercontact USING btree (user_id);


--
-- Name: acko_floataccount_intermediary_id_ed8a12c1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_floataccount_intermediary_id_ed8a12c1 ON public.acko_floataccount USING btree (intermediary_id);


--
-- Name: acko_floatdeposit_account_id_a2b8d8c0; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_floatdeposit_account_id_a2b8d8c0 ON public.acko_floatdeposit USING btree (account_id);


--
-- Name: acko_floatdeposit_added_by_id_1cdadb26; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_floatdeposit_added_by_id_1cdadb26 ON public.acko_floatdeposit USING btree (added_by_id);


--
-- Name: acko_grouppolicy_account_id_bb035ab9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_account_id_bb035ab9 ON public.acko_grouppolicy USING btree (account_id);


--
-- Name: acko_grouppolicy_customer_id_8f1abb0e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_customer_id_8f1abb0e ON public.acko_grouppolicy USING btree (customer_id);


--
-- Name: acko_grouppolicy_policy_number_65388d1a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_policy_number_65388d1a ON public.acko_grouppolicy USING btree (policy_number);


--
-- Name: acko_grouppolicy_policy_number_65388d1a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_policy_number_65388d1a_like ON public.acko_grouppolicy USING btree (policy_number varchar_pattern_ops);


--
-- Name: acko_grouppolicy_slug_28e2f961; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_slug_28e2f961 ON public.acko_grouppolicy USING btree (slug);


--
-- Name: acko_grouppolicy_slug_28e2f961_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_grouppolicy_slug_28e2f961_like ON public.acko_grouppolicy USING btree (slug varchar_pattern_ops);


--
-- Name: acko_gstinvoice_content_type_id_3030b78a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_gstinvoice_content_type_id_3030b78a ON public.acko_gstinvoice USING btree (content_type_id);


--
-- Name: acko_gstinvoice_invoice_id_706b234f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_gstinvoice_invoice_id_706b234f_like ON public.acko_gstinvoice USING btree (invoice_number varchar_pattern_ops);


--
-- Name: acko_legalentity_content_type_id_3eaf9fa3; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_legalentity_content_type_id_3eaf9fa3 ON public.acko_legalentity USING btree (content_type_id);


--
-- Name: acko_legalentity_updated_on_7a5bb544; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_legalentity_updated_on_7a5bb544 ON public.acko_legalentity USING btree (updated_on);


--
-- Name: acko_policy_customer_id_bbad7fed; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_policy_customer_id_bbad7fed ON public.acko_policy USING btree (customer_id);


--
-- Name: acko_policy_idit_policy_number_07a99339_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_policy_idit_policy_number_07a99339_like ON public.acko_policy USING btree (idit_policy_number varchar_pattern_ops);


--
-- Name: acko_policy_payment_id_34863f92; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_policy_payment_id_34863f92 ON public.acko_policy USING btree (payment_id);


--
-- Name: acko_policy_policy_holder_id_bf15989b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_policy_policy_holder_id_bf15989b ON public.acko_policy USING btree (policy_holder_id);


--
-- Name: acko_policy_policy_number_b9796d9e_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_policy_policy_number_b9796d9e_like ON public.acko_policy USING btree (policy_number varchar_pattern_ops);


--
-- Name: acko_product_id_dc0390cc_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_product_id_dc0390cc_like ON public.acko_product USING btree (id varchar_pattern_ops);


--
-- Name: acko_publickey_content_type_id_3660d71b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_publickey_content_type_id_3660d71b ON public.acko_publickey USING btree (content_type_id);


--
-- Name: acko_publickey_created_by_id_089ae68f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_publickey_created_by_id_089ae68f ON public.acko_publickey USING btree (created_by_id);


--
-- Name: acko_quote_assets_asset_id_912e2b3c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_assets_asset_id_912e2b3c ON public.acko_quote_assets USING btree (asset_id);


--
-- Name: acko_quote_assets_quote_id_fb6d8557; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_assets_quote_id_fb6d8557 ON public.acko_quote_assets USING btree (quote_id);


--
-- Name: acko_quote_endorsed_policy_id_a41aeca1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_endorsed_policy_id_a41aeca1 ON public.acko_quote USING btree (endorsed_policy_id);


--
-- Name: acko_quote_parent_id_93c5e21d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_parent_id_93c5e21d ON public.acko_quote USING btree (parent_id);


--
-- Name: acko_quote_payment_id_63a1b672; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_payment_id_63a1b672 ON public.acko_quote USING btree (payment_id);


--
-- Name: acko_quote_token_payment_id_1f75268d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_quote_token_payment_id_1f75268d ON public.acko_quote USING btree (token_payment_id);


--
-- Name: acko_skipquestions_tracker_id_00e6d975; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_skipquestions_tracker_id_00e6d975 ON public.acko_skipquestions USING btree (tracker_id);


--
-- Name: acko_skipquestions_user_id_db704301; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_skipquestions_user_id_db704301 ON public.acko_skipquestions USING btree (user_id);


--
-- Name: acko_tracker_user_id_48a453c2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_tracker_user_id_48a453c2 ON public.acko_tracker USING btree (user_id);


--
-- Name: acko_vehicle_owner_id_0d83c639; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_vehicle_owner_id_0d83c639 ON public.acko_vehicle USING btree (owner_id);


--
-- Name: acko_visit_tracker_id_8bca8e4d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_visit_tracker_id_8bca8e4d ON public.acko_visit USING btree (tracker_id);


--
-- Name: acko_visit_updated_on_3adbae15; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX acko_visit_updated_on_3adbae15 ON public.acko_visit USING btree (updated_on);


--
-- Name: ackore_ackoagentlicense_user_id_5afcf674; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_ackoagentlicense_user_id_5afcf674 ON public.ackore_ackoagentlicense USING btree (user_id);


--
-- Name: ackore_ckind_id_08a075a5_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_ckind_id_08a075a5_like ON public.ackore_ckind USING btree (id varchar_pattern_ops);


--
-- Name: ackore_claim_claim_kind_id_de1228aa; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_claim_claim_kind_id_de1228aa ON public.ackore_claim USING btree (claim_kind_id);


--
-- Name: ackore_claim_claim_kind_id_de1228aa_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_claim_claim_kind_id_de1228aa_like ON public.ackore_claim USING btree (claim_kind_id varchar_pattern_ops);


--
-- Name: ackore_claim_policy_id_5c388380; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_claim_policy_id_5c388380 ON public.ackore_claim USING btree (policy_id);


--
-- Name: ackore_claim_work_id_cf8b38f8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_claim_work_id_cf8b38f8 ON public.ackore_claim USING btree (work_id);


--
-- Name: ackore_coverage_ekinds_coverage_id_23ad4dae; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_coverage_ekinds_coverage_id_23ad4dae ON public.ackore_coverage_ekinds USING btree (coverage_id);


--
-- Name: ackore_coverage_ekinds_coverage_id_23ad4dae_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_coverage_ekinds_coverage_id_23ad4dae_like ON public.ackore_coverage_ekinds USING btree (coverage_id varchar_pattern_ops);


--
-- Name: ackore_coverage_ekinds_ekind_id_895ecd42; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_coverage_ekinds_ekind_id_895ecd42 ON public.ackore_coverage_ekinds USING btree (ekind_id);


--
-- Name: ackore_coverage_ekinds_ekind_id_895ecd42_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_coverage_ekinds_ekind_id_895ecd42_like ON public.ackore_coverage_ekinds USING btree (ekind_id varchar_pattern_ops);


--
-- Name: ackore_ekind_id_e2d83b49_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_ekind_id_e2d83b49_like ON public.ackore_ekind USING btree (id varchar_pattern_ops);


--
-- Name: ackore_endorsement_ekind_id_4f315b0b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_endorsement_ekind_id_4f315b0b ON public.ackore_endorsement USING btree (ekind_id);


--
-- Name: ackore_endorsement_ekind_id_4f315b0b_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_endorsement_ekind_id_4f315b0b_like ON public.ackore_endorsement USING btree (ekind_id varchar_pattern_ops);


--
-- Name: ackore_endorsement_policy_id_84ccbccd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_endorsement_policy_id_84ccbccd ON public.ackore_endorsement USING btree (policy_id);


--
-- Name: ackore_endorsement_user_id_e7fe3175; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_endorsement_user_id_e7fe3175 ON public.ackore_endorsement USING btree (user_id);


--
-- Name: ackore_endorsement_work_id_a23f552a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_endorsement_work_id_a23f552a ON public.ackore_endorsement USING btree (work_id);


--
-- Name: ackore_feature_ckind_id_488ffed4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_feature_ckind_id_488ffed4 ON public.ackore_coverage USING btree (ckind_id);


--
-- Name: ackore_feature_ckind_id_488ffed4_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_feature_ckind_id_488ffed4_like ON public.ackore_coverage USING btree (ckind_id varchar_pattern_ops);


--
-- Name: ackore_feature_id_976062ec_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_feature_id_976062ec_like ON public.ackore_coverage USING btree (id varchar_pattern_ops);


--
-- Name: ackore_lead_asset_id_ea357531; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_lead_asset_id_ea357531 ON public.ackore_lead USING btree (asset_id);


--
-- Name: ackore_lead_user_id_d7645b46; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_lead_user_id_d7645b46 ON public.ackore_lead USING btree (user_id);


--
-- Name: ackore_leadsource_lead_id_2c48b2d2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_leadsource_lead_id_2c48b2d2 ON public.ackore_leadsource USING btree (lead_id);


--
-- Name: ackore_leadsource_source_id_6f6c705d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_leadsource_source_id_6f6c705d ON public.ackore_leadsource USING btree (source_id);


--
-- Name: ackore_lob_id_3864c1e0_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_lob_id_3864c1e0_like ON public.ackore_lob USING btree (id varchar_pattern_ops);


--
-- Name: ackore_plan_addons_feature_id_c66895dd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_addons_feature_id_c66895dd ON public.ackore_plan_addons USING btree (coverage_id);


--
-- Name: ackore_plan_addons_feature_id_c66895dd_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_addons_feature_id_c66895dd_like ON public.ackore_plan_addons USING btree (coverage_id varchar_pattern_ops);


--
-- Name: ackore_plan_addons_plan_id_f9874269; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_addons_plan_id_f9874269 ON public.ackore_plan_addons USING btree (plan_id);


--
-- Name: ackore_plan_addons_plan_id_f9874269_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_addons_plan_id_f9874269_like ON public.ackore_plan_addons USING btree (plan_id varchar_pattern_ops);


--
-- Name: ackore_plan_id_7a67ec71_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_id_7a67ec71_like ON public.ackore_plan USING btree (id varchar_pattern_ops);


--
-- Name: ackore_plan_included_feature_id_99f9b34b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_included_feature_id_99f9b34b ON public.ackore_plan_included USING btree (coverage_id);


--
-- Name: ackore_plan_included_feature_id_99f9b34b_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_included_feature_id_99f9b34b_like ON public.ackore_plan_included USING btree (coverage_id varchar_pattern_ops);


--
-- Name: ackore_plan_included_plan_id_0d579771; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_included_plan_id_0d579771 ON public.ackore_plan_included USING btree (plan_id);


--
-- Name: ackore_plan_included_plan_id_0d579771_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_included_plan_id_0d579771_like ON public.ackore_plan_included USING btree (plan_id varchar_pattern_ops);


--
-- Name: ackore_plan_product_id_b7a8dd44; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_product_id_b7a8dd44 ON public.ackore_plan USING btree (product_id);


--
-- Name: ackore_plan_product_id_b7a8dd44_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_plan_product_id_b7a8dd44_like ON public.ackore_plan USING btree (product_id varchar_pattern_ops);


--
-- Name: ackore_policy_addons_feature_id_b5f6c0d3; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_addons_feature_id_b5f6c0d3 ON public.ackore_policy_addons USING btree (coverage_id);


--
-- Name: ackore_policy_addons_feature_id_b5f6c0d3_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_addons_feature_id_b5f6c0d3_like ON public.ackore_policy_addons USING btree (coverage_id varchar_pattern_ops);


--
-- Name: ackore_policy_addons_policy_id_c98d4ee2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_addons_policy_id_c98d4ee2 ON public.ackore_policy_addons USING btree (policy_id);


--
-- Name: ackore_policy_payment_id_ceae0426; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_payment_id_ceae0426 ON public.ackore_policy USING btree (payment_id);


--
-- Name: ackore_policy_plan_id_4972e39c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_plan_id_4972e39c ON public.ackore_policy USING btree (plan_id);


--
-- Name: ackore_policy_plan_id_4972e39c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_plan_id_4972e39c_like ON public.ackore_policy USING btree (plan_id varchar_pattern_ops);


--
-- Name: ackore_policy_user_id_333ffc97; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_policy_user_id_333ffc97 ON public.ackore_policy USING btree (user_id);


--
-- Name: ackore_product_id_47c2ad16_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_product_id_47c2ad16_like ON public.ackore_product USING btree (id varchar_pattern_ops);


--
-- Name: ackore_product_lob_id_12a2f079; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_product_lob_id_12a2f079 ON public.ackore_product USING btree (lob_id);


--
-- Name: ackore_product_lob_id_12a2f079_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_product_lob_id_12a2f079_like ON public.ackore_product USING btree (lob_id varchar_pattern_ops);


--
-- Name: ackore_quote_addons_feature_id_1ab7d45c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_addons_feature_id_1ab7d45c ON public.ackore_quote_addons USING btree (coverage_id);


--
-- Name: ackore_quote_addons_feature_id_1ab7d45c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_addons_feature_id_1ab7d45c_like ON public.ackore_quote_addons USING btree (coverage_id varchar_pattern_ops);


--
-- Name: ackore_quote_addons_quote_id_cbb88688; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_addons_quote_id_cbb88688 ON public.ackore_quote_addons USING btree (quote_id);


--
-- Name: ackore_quote_payment_id_b305cc87; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_payment_id_b305cc87 ON public.ackore_quote USING btree (payment_id);


--
-- Name: ackore_quote_plan_id_f6d61373; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_plan_id_f6d61373 ON public.ackore_quote USING btree (plan_id);


--
-- Name: ackore_quote_plan_id_f6d61373_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_plan_id_f6d61373_like ON public.ackore_quote USING btree (plan_id varchar_pattern_ops);


--
-- Name: ackore_quote_ut_lead_id_f78f10c2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_quote_ut_lead_id_f78f10c2 ON public.ackore_quote USING btree (ut_lead_id);


--
-- Name: ackore_relative_relative_id_0c09955f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_relative_relative_id_0c09955f ON public.ackore_relative USING btree (relative_id);


--
-- Name: ackore_relative_user_id_6bd7c60e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_relative_user_id_6bd7c60e ON public.ackore_relative USING btree (user_id);


--
-- Name: ackore_userclaimrelation_claim_id_888dceea; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_userclaimrelation_claim_id_888dceea ON public.ackore_userclaimrelation USING btree (claim_id);


--
-- Name: ackore_userclaimrelation_user_id_b925000c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_userclaimrelation_user_id_b925000c ON public.ackore_userclaimrelation USING btree (user_id);


--
-- Name: ackore_userpolicyrelation_nominee_id_0b569d10; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_userpolicyrelation_nominee_id_0b569d10 ON public.ackore_userpolicyrelation USING btree (nominee_id);


--
-- Name: ackore_userpolicyrelation_policy_id_bc438f04; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_userpolicyrelation_policy_id_bc438f04 ON public.ackore_userpolicyrelation USING btree (policy_id);


--
-- Name: ackore_userpolicyrelation_user_id_0c073ffe; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_userpolicyrelation_user_id_0c073ffe ON public.ackore_userpolicyrelation USING btree (user_id);


--
-- Name: ackore_utlead_asset_id_8c8bf14f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_utlead_asset_id_8c8bf14f ON public.ackore_utlead USING btree (asset_id);


--
-- Name: ackore_utlead_tracker_id_a404c0ea; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_utlead_tracker_id_a404c0ea ON public.ackore_utlead USING btree (tracker_id);


--
-- Name: ackore_utlead_user_id_8a316fce; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ackore_utlead_user_id_8a316fce ON public.ackore_utlead USING btree (user_id);


--
-- Name: activation_campaign_agency_id_844292af; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX activation_campaign_agency_id_844292af ON public.activation_campaign USING btree (agency_id);


--
-- Name: activation_lead_agent_id_22cf9e0a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX activation_lead_agent_id_22cf9e0a ON public.activation_lead USING btree (agent_id);


--
-- Name: activation_lead_campaign_id_da90f02a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX activation_lead_campaign_id_da90f02a ON public.activation_lead USING btree (campaign_id);


--
-- Name: activation_lead_user_id_8c3b198f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX activation_lead_user_id_8c3b198f ON public.activation_lead USING btree (user_id);


--
-- Name: akin_brandmapping_brand_id_2cea764a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_brandmapping_brand_id_2cea764a ON public.akin_brandmapping USING btree (brand_id);


--
-- Name: akin_brandmapping_intermediary_id_aa149936; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_brandmapping_intermediary_id_aa149936 ON public.akin_brandmapping USING btree (intermediary_id);


--
-- Name: akin_model_product_id_f70d2b82; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_model_product_id_f70d2b82 ON public.akin_model USING btree (product_id);


--
-- Name: akin_modelmapping_intermediary_id_e5df173a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_modelmapping_intermediary_id_e5df173a ON public.akin_modelmapping USING btree (intermediary_id);


--
-- Name: akin_modelmapping_model_id_7ec26e76; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_modelmapping_model_id_7ec26e76 ON public.akin_modelmapping USING btree (model_id);


--
-- Name: akin_modelnumber_model_id_335522d6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_modelnumber_model_id_335522d6 ON public.akin_modelnumber USING btree (model_id);


--
-- Name: akin_modelnumbermapping_intermediary_id_c87eeafd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_modelnumbermapping_intermediary_id_c87eeafd ON public.akin_modelnumbermapping USING btree (intermediary_id);


--
-- Name: akin_modelnumbermapping_model_number_id_904914a9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_modelnumbermapping_model_number_id_904914a9 ON public.akin_modelnumbermapping USING btree (model_number_id);


--
-- Name: akin_product_brand_id_4608fbd2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX akin_product_brand_id_4608fbd2 ON public.akin_product USING btree (brand_id);


--
-- Name: amazon_mobile_phoneowner_policy_id_f1e87c7d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_phoneowner_policy_id_f1e87c7d ON public.amazon_mobile_phoneowner USING btree (policy_id);


--
-- Name: amazon_mobile_phoneowner_user_id_9b4da1f0; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_phoneowner_user_id_9b4da1f0 ON public.amazon_mobile_phoneowner USING btree (user_id);


--
-- Name: amazon_mobile_plan_asin_5c07272a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_plan_asin_5c07272a_like ON public.amazon_mobile_plan USING btree (asin varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_amazon_order_id_52e3be63_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_amazon_order_id_52e3be63_like ON public.amazon_mobile_policy USING btree (customer_purchase_id varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_customer_purchase_id_f8a4e6ab; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_customer_purchase_id_f8a4e6ab ON public.amazon_mobile_policy USING btree (customer_purchase_id);


--
-- Name: amazon_mobile_policy_customer_purchase_id_f8a4e6ab_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_customer_purchase_id_f8a4e6ab_like ON public.amazon_mobile_policy USING btree (customer_purchase_id varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_imei_f8607480; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_imei_f8607480 ON public.amazon_mobile_policy USING btree (imei);


--
-- Name: amazon_mobile_policy_imei_f8607480_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_imei_f8607480_like ON public.amazon_mobile_policy USING btree (imei varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_phone_order_id_674e5d0c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_phone_order_id_674e5d0c ON public.amazon_mobile_policy USING btree (phone_order_id);


--
-- Name: amazon_mobile_policy_phone_order_id_674e5d0c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_phone_order_id_674e5d0c_like ON public.amazon_mobile_policy USING btree (phone_order_id varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_pincode_id_f626d22b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_pincode_id_f626d22b ON public.amazon_mobile_policy USING btree (pincode_id);


--
-- Name: amazon_mobile_policy_plan_id_080bd552; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_plan_id_080bd552 ON public.amazon_mobile_policy USING btree (plan_id);


--
-- Name: amazon_mobile_policy_plan_order_id_d78760b5_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_plan_order_id_d78760b5_like ON public.amazon_mobile_policy USING btree (plan_order_id varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_policy_number_ceafb6e9_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_policy_number_ceafb6e9_like ON public.amazon_mobile_policy USING btree (policy_number varchar_pattern_ops);


--
-- Name: amazon_mobile_policy_user_id_898d1123; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_mobile_policy_user_id_898d1123 ON public.amazon_mobile_policy USING btree (user_id);


--
-- Name: amazon_seller_category_category_id_607b981f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_category_category_id_607b981f_like ON public.amazon_seller_category USING btree (category_id varchar_pattern_ops);


--
-- Name: amazon_seller_claim_seller_id_3b6f5df2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_claim_seller_id_3b6f5df2 ON public.amazon_seller_claim USING btree (seller_id);


--
-- Name: amazon_seller_claim_shipment_id_b6f63290; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_claim_shipment_id_b6f63290 ON public.amazon_seller_claim USING btree (shipment_id);


--
-- Name: amazon_seller_cohert_shipment_csv_id_719e1917; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_cohert_shipment_csv_id_719e1917 ON public.amazon_seller_cohort USING btree (shipment_csv_id);


--
-- Name: amazon_seller_premiumparam_seller_id_7bb0676b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_premiumparam_seller_id_7bb0676b ON public.amazon_seller_premiumparam USING btree (seller_id);


--
-- Name: amazon_seller_seller_seller_id_721e69f3_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_seller_seller_id_721e69f3_like ON public.amazon_seller_seller USING btree (seller_id varchar_pattern_ops);


--
-- Name: amazon_seller_seller_user_id_dd51bdf6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_seller_user_id_dd51bdf6 ON public.amazon_seller_seller USING btree (user_id);


--
-- Name: amazon_seller_settlement_seller_id_ee971f4c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_settlement_seller_id_ee971f4c ON public.amazon_seller_settlement USING btree (seller_id);


--
-- Name: amazon_seller_shipment_category_id_d6247c35; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_shipment_category_id_d6247c35 ON public.amazon_seller_shipment USING btree (category_id);


--
-- Name: amazon_seller_shipment_cohort_id_7d234e40; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_shipment_cohort_id_7d234e40 ON public.amazon_seller_shipment USING btree (cohort_id);


--
-- Name: amazon_seller_shipment_seller_id_48d77da6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_shipment_seller_id_48d77da6 ON public.amazon_seller_shipment USING btree (seller_id);


--
-- Name: amazon_seller_shipment_shipment_item_id_8c36f280_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_shipment_shipment_item_id_8c36f280_like ON public.amazon_seller_shipment USING btree (shipment_item_id varchar_pattern_ops);


--
-- Name: amazon_seller_subscription_seller_id_76906b38; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX amazon_seller_subscription_seller_id_76906b38 ON public.amazon_seller_subscription USING btree (seller_id);


--
-- Name: audatex_bill_field_id_6221a85e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_bill_field_id_6221a85e ON public.audatex_bill USING btree (field_id);


--
-- Name: audatex_bill_task_id_c9f6f127; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_bill_task_id_c9f6f127 ON public.audatex_bill USING btree (task_id);


--
-- Name: audatex_bill_task_id_c9f6f127_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_bill_task_id_c9f6f127_like ON public.audatex_bill USING btree (aduatex_task_id varchar_pattern_ops);


--
-- Name: audatex_bill_work_id_3b49f255; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_bill_work_id_3b49f255 ON public.audatex_bill USING btree (work_id);


--
-- Name: audatex_make_code_b5551b93_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_make_code_b5551b93_like ON public.audatex_make USING btree (code varchar_pattern_ops);


--
-- Name: audatex_make_makes_from_make_id_446c357f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_make_makes_from_make_id_446c357f ON public.audatex_make_makes USING btree (from_make_id);


--
-- Name: audatex_make_makes_to_make_id_bb714bd6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_make_makes_to_make_id_bb714bd6 ON public.audatex_make_makes USING btree (to_make_id);


--
-- Name: audatex_model_make_id_33a36d07; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_model_make_id_33a36d07 ON public.audatex_model USING btree (make_id);


--
-- Name: audatex_model_models_from_model_id_0cc9f59f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_model_models_from_model_id_0cc9f59f ON public.audatex_model_models USING btree (from_model_id);


--
-- Name: audatex_model_models_to_model_id_35adfdf2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_model_models_to_model_id_35adfdf2 ON public.audatex_model_models USING btree (to_model_id);


--
-- Name: audatex_variant_model_id_185fef3a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_variant_model_id_185fef3a ON public.audatex_variant USING btree (model_id);


--
-- Name: audatex_variantmapping_audatex_variant_id_875cbff9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX audatex_variantmapping_audatex_variant_id_875cbff9 ON public.audatex_variantmapping USING btree (audatex_variant_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.users_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.users_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: bike_quote_rto_id_93637755; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX bike_quote_rto_id_93637755 ON public.bike_quote USING btree (rto_id);


--
-- Name: bike_quote_state_id_f7d22324; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX bike_quote_state_id_f7d22324 ON public.bike_quote USING btree (state_id);


--
-- Name: bike_quote_variant_id_74848da1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX bike_quote_variant_id_74848da1 ON public.bike_quote USING btree (variant_id);


--
-- Name: bitly_link_created_by_id_193e57f8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX bitly_link_created_by_id_193e57f8 ON public.bitly_link USING btree (created_by_id);


--
-- Name: bitly_link_short_be783528_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX bitly_link_short_be783528_like ON public.bitly_link USING btree (short varchar_pattern_ops);


--
-- Name: c3po_data_segment_id_095cef08; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_data_segment_id_095cef08 ON public.c3po_data USING btree (segment_id);


--
-- Name: c3po_dimension_okind_id_29ca6e18; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_dimension_okind_id_29ca6e18 ON public.c3po_dimension USING btree (okind_id);


--
-- Name: c3po_dimension_okind_id_29ca6e18_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_dimension_okind_id_29ca6e18_like ON public.c3po_dimension USING btree (okind_id varchar_pattern_ops);


--
-- Name: c3po_field_okind_id_6b5d7e54; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_field_okind_id_6b5d7e54 ON public.c3po_field USING btree (okind_id);


--
-- Name: c3po_field_okind_id_6b5d7e54_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_field_okind_id_6b5d7e54_like ON public.c3po_field USING btree (okind_id varchar_pattern_ops);


--
-- Name: c3po_filter_segment_id_1a98ca95; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_filter_segment_id_1a98ca95 ON public.c3po_filter USING btree (segment_id);


--
-- Name: c3po_okind_name_a7366cd3_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_okind_name_a7366cd3_like ON public.c3po_okind USING btree (name varchar_pattern_ops);


--
-- Name: c3po_relation_many_id_fed83ee0; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_relation_many_id_fed83ee0 ON public.c3po_relation USING btree (many_id);


--
-- Name: c3po_relation_many_id_fed83ee0_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_relation_many_id_fed83ee0_like ON public.c3po_relation USING btree (many_id varchar_pattern_ops);


--
-- Name: c3po_relation_one_id_2e8322ab; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_relation_one_id_2e8322ab ON public.c3po_relation USING btree (one_id);


--
-- Name: c3po_relation_one_id_2e8322ab_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_relation_one_id_2e8322ab_like ON public.c3po_relation USING btree (one_id varchar_pattern_ops);


--
-- Name: c3po_segment_okind_id_f4e279ae; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_segment_okind_id_f4e279ae ON public.c3po_segment USING btree (okind_id);


--
-- Name: c3po_segment_okind_id_f4e279ae_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX c3po_segment_okind_id_f4e279ae_like ON public.c3po_segment USING btree (okind_id varchar_pattern_ops);


--
-- Name: cardekho_makemapping_acko_make_id_956067f6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_makemapping_acko_make_id_956067f6 ON public.cardekho_makemapping USING btree (acko_make_id);


--
-- Name: cardekho_makemapping_cardekho_make_id_d48b992a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_makemapping_cardekho_make_id_d48b992a ON public.cardekho_makemapping USING btree (cardekho_make_id);


--
-- Name: cardekho_model_make_id_ba383289; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_model_make_id_ba383289 ON public.cardekho_model USING btree (make_id);


--
-- Name: cardekho_modelcolor_model_id_157da114; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_modelcolor_model_id_157da114 ON public.cardekho_modelcolor USING btree (model_id);


--
-- Name: cardekho_modelmapping_acko_model_id_561635fc; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_modelmapping_acko_model_id_561635fc ON public.cardekho_modelmapping USING btree (acko_model_id);


--
-- Name: cardekho_modelmapping_cardekho_model_id_9b0b5c43; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_modelmapping_cardekho_model_id_9b0b5c43 ON public.cardekho_modelmapping USING btree (cardekho_model_id);


--
-- Name: cardekho_variant_model_id_ac4e8f72; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_variant_model_id_ac4e8f72 ON public.cardekho_variant USING btree (model_id);


--
-- Name: cardekho_variantmapping_acko_variant_id_6f155364; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_variantmapping_acko_variant_id_6f155364 ON public.cardekho_variantmapping USING btree (acko_variant_id);


--
-- Name: cardekho_variantmapping_cardekho_variant_id_b5737ec7; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cardekho_variantmapping_cardekho_variant_id_b5737ec7 ON public.cardekho_variantmapping USING btree (cardekho_variant_id);


--
-- Name: computron_kdone_name_f89b6d08_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX computron_kdone_name_f89b6d08_like ON public.computron_kdone USING btree (name varchar_pattern_ops);


--
-- Name: computron_kquery_name_b4d3271e_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX computron_kquery_name_b4d3271e_like ON public.computron_kquery USING btree (name varchar_pattern_ops);


--
-- Name: computron_kvalidator_name_cdb1bcce_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX computron_kvalidator_name_cdb1bcce_like ON public.computron_kvalidator USING btree (name varchar_pattern_ops);


--
-- Name: computron_raction_name_5f8e6d1a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX computron_raction_name_5f8e6d1a_like ON public.computron_raction USING btree (name varchar_pattern_ops);


--
-- Name: computron_rnotify_name_84c7bd17_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX computron_rnotify_name_84c7bd17_like ON public.computron_rnotify USING btree (name varchar_pattern_ops);


--
-- Name: coverfox_model_make_id_2ea9e36f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX coverfox_model_make_id_2ea9e36f ON public.coverfox_model USING btree (make_id);


--
-- Name: coverfox_variant_acko_variants_from_variant_id_5c4ec4c9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX coverfox_variant_acko_variants_from_variant_id_5c4ec4c9 ON public.coverfox_variant_acko_variants USING btree (from_variant_id);


--
-- Name: coverfox_variant_acko_variants_to_variant_id_91ef780d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX coverfox_variant_acko_variants_to_variant_id_91ef780d ON public.coverfox_variant_acko_variants USING btree (to_variant_id);


--
-- Name: coverfox_variant_model_id_73677704; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX coverfox_variant_model_id_73677704 ON public.coverfox_variant USING btree (model_id);


--
-- Name: cuvora_vehicledata_reg_no_e15a712d_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX cuvora_vehicledata_reg_no_e15a712d_like ON public.cuvora_vehicledata USING btree (registration_number varchar_pattern_ops);


--
-- Name: devops_deployment_user_id_7d6f9fab; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX devops_deployment_user_id_7d6f9fab ON public.devops_deployment USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: explorer_query_created_by_user_id_182dd868; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX explorer_query_created_by_user_id_182dd868 ON public.explorer_query USING btree (created_by_user_id);


--
-- Name: explorer_querylog_query_id_1635a6b4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX explorer_querylog_query_id_1635a6b4 ON public.explorer_querylog USING btree (query_id);


--
-- Name: explorer_querylog_run_by_user_id_cf26a49f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX explorer_querylog_run_by_user_id_cf26a49f ON public.explorer_querylog USING btree (run_by_user_id);


--
-- Name: fastlane_fastlane_registration_number_70a7c75b_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_fastlane_registration_number_70a7c75b_like ON public.fastlane_fastlane USING btree (registration_number varchar_pattern_ops);


--
-- Name: fastlane_fastlane_variant_id_4cf3bc8b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_fastlane_variant_id_4cf3bc8b ON public.fastlane_fastlane USING btree (variant_id);


--
-- Name: fastlane_make_acko_makes_from_make_id_78e2ecc2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_make_acko_makes_from_make_id_78e2ecc2 ON public.fastlane_make_acko_makes USING btree (from_make_id);


--
-- Name: fastlane_make_acko_makes_to_make_id_4f8720df; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_make_acko_makes_to_make_id_4f8720df ON public.fastlane_make_acko_makes USING btree (to_make_id);


--
-- Name: fastlane_make_cf_makes_from_make_id_87ef92a6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_make_cf_makes_from_make_id_87ef92a6 ON public.fastlane_make_cf_makes USING btree (from_make_id);


--
-- Name: fastlane_make_cf_makes_to_make_id_50ff0dd7; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_make_cf_makes_to_make_id_50ff0dd7 ON public.fastlane_make_cf_makes USING btree (to_make_id);


--
-- Name: fastlane_model_acko_models_from_model_id_12dfadc8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_model_acko_models_from_model_id_12dfadc8 ON public.fastlane_model_acko_models USING btree (from_model_id);


--
-- Name: fastlane_model_acko_models_to_model_id_da1d2409; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_model_acko_models_to_model_id_da1d2409 ON public.fastlane_model_acko_models USING btree (to_model_id);


--
-- Name: fastlane_model_cf_models_from_model_id_45e64e1f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_model_cf_models_from_model_id_45e64e1f ON public.fastlane_model_cf_models USING btree (from_model_id);


--
-- Name: fastlane_model_cf_models_to_model_id_f14c7884; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_model_cf_models_to_model_id_f14c7884 ON public.fastlane_model_cf_models USING btree (to_model_id);


--
-- Name: fastlane_model_make_id_28836c9b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_model_make_id_28836c9b ON public.fastlane_model USING btree (make_id);


--
-- Name: fastlane_variant_acko_variants_from_variant_id_6f4d2691; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_acko_variants_from_variant_id_6f4d2691 ON public.fastlane_variant_acko_variants USING btree (from_variant_id);


--
-- Name: fastlane_variant_acko_variants_to_variant_id_3a063a7d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_acko_variants_to_variant_id_3a063a7d ON public.fastlane_variant_acko_variants USING btree (to_variant_id);


--
-- Name: fastlane_variant_cf_variants_from_variant_id_069d436f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_cf_variants_from_variant_id_069d436f ON public.fastlane_variant_cf_variants USING btree (from_variant_id);


--
-- Name: fastlane_variant_cf_variants_to_variant_id_86ab91d2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_cf_variants_to_variant_id_86ab91d2 ON public.fastlane_variant_cf_variants USING btree (to_variant_id);


--
-- Name: fastlane_variant_master_id_70e83fb2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_master_id_70e83fb2 ON public.fastlane_variant USING btree (master_id);


--
-- Name: fastlane_variant_master_id_70e83fb2_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_master_id_70e83fb2_like ON public.fastlane_variant USING btree (master_id varchar_pattern_ops);


--
-- Name: fastlane_variant_model_id_db268b3d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX fastlane_variant_model_id_db268b3d ON public.fastlane_variant USING btree (model_id);


--
-- Name: flightdb_airline_id_c6e5ddb8_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_airline_id_c6e5ddb8_like ON public.flightdb_airline USING btree (id varchar_pattern_ops);


--
-- Name: flightdb_airport_city_id_d0cbdd1d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_airport_city_id_d0cbdd1d ON public.flightdb_airport USING btree (city_id);


--
-- Name: flightdb_airport_id_38321199_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_airport_id_38321199_like ON public.flightdb_airport USING btree (id varchar_pattern_ops);


--
-- Name: flightdb_flight_airline_id_c0241afa; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_airline_id_c0241afa ON public.flightdb_flight USING btree (airline_id);


--
-- Name: flightdb_flight_airline_id_c0241afa_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_airline_id_c0241afa_like ON public.flightdb_flight USING btree (airline_id varchar_pattern_ops);


--
-- Name: flightdb_flight_arrival_airport_id_9ccfd8bf; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_arrival_airport_id_9ccfd8bf ON public.flightdb_flight USING btree (arrival_airport_id);


--
-- Name: flightdb_flight_arrival_airport_id_9ccfd8bf_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_arrival_airport_id_9ccfd8bf_like ON public.flightdb_flight USING btree (arrival_airport_id varchar_pattern_ops);


--
-- Name: flightdb_flight_departure_airport_id_9b7b99ea; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_departure_airport_id_9b7b99ea ON public.flightdb_flight USING btree (departure_airport_id);


--
-- Name: flightdb_flight_departure_airport_id_9b7b99ea_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_departure_airport_id_9b7b99ea_like ON public.flightdb_flight USING btree (departure_airport_id varchar_pattern_ops);


--
-- Name: flightdb_flight_id_5f247b0a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flight_id_5f247b0a_like ON public.flightdb_flight USING btree (id varchar_pattern_ops);


--
-- Name: flightdb_flightinstance_flight_id_fff9a39f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flightinstance_flight_id_fff9a39f ON public.flightdb_flightinstance USING btree (flight_id);


--
-- Name: flightdb_flightinstance_flight_id_fff9a39f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flightinstance_flight_id_fff9a39f_like ON public.flightdb_flightinstance USING btree (flight_id varchar_pattern_ops);


--
-- Name: flightdb_flightinstancehistory_flight_instance_id_27928e8a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX flightdb_flightinstancehistory_flight_instance_id_27928e8a ON public.flightdb_flightinstancehistory USING btree (flight_instance_id);


--
-- Name: iet_part_created_by_id_016d5e48; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_created_by_id_016d5e48 ON public.iet_part USING btree (created_by_id);


--
-- Name: iet_part_makes_make_id_9d1197bd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_makes_make_id_9d1197bd ON public.iet_part_makes USING btree (make_id);


--
-- Name: iet_part_makes_part_id_d37b60a3; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_makes_part_id_d37b60a3 ON public.iet_part_makes USING btree (part_id);


--
-- Name: iet_part_models_model_id_12b0e103; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_models_model_id_12b0e103 ON public.iet_part_models USING btree (model_id);


--
-- Name: iet_part_models_part_id_701230f8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_models_part_id_701230f8 ON public.iet_part_models USING btree (part_id);


--
-- Name: iet_part_variants_part_id_7ced3aac; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_variants_part_id_7ced3aac ON public.iet_part_variants USING btree (part_id);


--
-- Name: iet_part_variants_variant_id_c5af8851; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_variants_variant_id_c5af8851 ON public.iet_part_variants USING btree (variant_id);


--
-- Name: iet_part_verified_by_id_57eb6c4e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX iet_part_verified_by_id_57eb6c4e ON public.iet_part USING btree (verified_by_id);


--
-- Name: intranet_file_downs_file_id_db25bf48; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_downs_file_id_db25bf48 ON public.intranet_file_downs USING btree (file_id);


--
-- Name: intranet_file_downs_oentity_id_65c576b1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_downs_oentity_id_65c576b1 ON public.intranet_file_downs USING btree (oentity_id);


--
-- Name: intranet_file_selfs_file_id_340dbc9a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_selfs_file_id_340dbc9a ON public.intranet_file_selfs USING btree (file_id);


--
-- Name: intranet_file_selfs_oentity_id_f9c1652d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_selfs_oentity_id_f9c1652d ON public.intranet_file_selfs USING btree (oentity_id);


--
-- Name: intranet_file_ups_file_id_227f6a21; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_ups_file_id_227f6a21 ON public.intranet_file_ups USING btree (file_id);


--
-- Name: intranet_file_ups_oentity_id_b4227b9b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_file_ups_oentity_id_b4227b9b ON public.intranet_file_ups USING btree (oentity_id);


--
-- Name: intranet_roomreservation_room_id_193a8d99; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_roomreservation_room_id_193a8d99 ON public.intranet_roomreservation USING btree (room_id);


--
-- Name: intranet_roomreservation_user_id_f28b99cd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX intranet_roomreservation_user_id_f28b99cd ON public.intranet_roomreservation USING btree (user_id);


--
-- Name: karmator_claimfield_name_685eb72e_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_claimfield_name_685eb72e_like ON public.karmator_workfield USING btree (name varchar_pattern_ops);


--
-- Name: karmator_claimfield_validators_claimfield_id_324b14c4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_claimfield_validators_claimfield_id_324b14c4 ON public.karmator_workfield_validators USING btree (workfield_id);


--
-- Name: karmator_claimfield_validators_rule_id_ab366908; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_claimfield_validators_rule_id_ab366908 ON public.karmator_workfield_validators USING btree (kvalidator_id);


--
-- Name: karmator_qtime_rule_id_fb60b64d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_qtime_rule_id_fb60b64d ON public.karmator_qtime USING btree (task_id);


--
-- Name: karmator_qtime_skill_id_7bf9cec8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_qtime_skill_id_7bf9cec8 ON public.karmator_qtime USING btree (skill_id);


--
-- Name: karmator_qtime_users_id_f550c9f6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_qtime_users_id_f550c9f6 ON public.karmator_qtime USING btree (user_id);


--
-- Name: karmator_qtime_work_id_d7fe7675; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_qtime_work_id_d7fe7675 ON public.karmator_qtime USING btree (work_id);


--
-- Name: karmator_task_done_id_4714ff18; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_task_done_id_4714ff18 ON public.karmator_task USING btree (done_id);


--
-- Name: karmator_task_kind_id_cab50f44; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_task_kind_id_cab50f44 ON public.karmator_task USING btree (kind_id);


--
-- Name: karmator_task_query_id_7fd9b936; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_task_query_id_7fd9b936 ON public.karmator_task USING btree (query_id);


--
-- Name: karmator_task_skill_id_13cce2b6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_task_skill_id_13cce2b6 ON public.karmator_task USING btree (skill_id);


--
-- Name: karmator_work_kind_id_91043365; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_work_kind_id_91043365 ON public.karmator_work USING btree (kind_id);


--
-- Name: karmator_workfield_kind_id_4b3285de; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workfield_kind_id_4b3285de ON public.karmator_workfield USING btree (kind_id);


--
-- Name: karmator_workhistory_task_id_e89e9d9d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workhistory_task_id_e89e9d9d ON public.karmator_workhistory USING btree (task_id);


--
-- Name: karmator_workhistory_tracker_id_4b4d17db; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workhistory_tracker_id_4b4d17db ON public.karmator_workhistory USING btree (tracker_id);


--
-- Name: karmator_workhistory_user_id_6fa1c888; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workhistory_user_id_6fa1c888 ON public.karmator_workhistory USING btree (user_id);


--
-- Name: karmator_workhistory_work_id_a2367dc5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workhistory_work_id_a2367dc5 ON public.karmator_workhistory USING btree (work_id);


--
-- Name: karmator_workkind_name_b4c63ea4_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workkind_name_b4c63ea4_like ON public.karmator_workkind USING btree (name varchar_pattern_ops);


--
-- Name: karmator_workkind_status_field_id_4a632e14; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX karmator_workkind_status_field_id_4a632e14 ON public.karmator_workkind USING btree (status_field_id);


--
-- Name: lsq_activity_prospect_activity_id_e0c614e3_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX lsq_activity_prospect_activity_id_e0c614e3_like ON public.lsq_activity USING btree (prospect_activity_id varchar_pattern_ops);


--
-- Name: lsq_lead_prospect_id_c488c495_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX lsq_lead_prospect_id_c488c495_like ON public.lsq_lead USING btree (prospect_id varchar_pattern_ops);


--
-- Name: masters_address_latlong_id; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_address_latlong_id ON public.masters_address USING gist (latlong);


--
-- Name: masters_address_pincode_id_0662971d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_address_pincode_id_0662971d ON public.masters_address USING btree (pincode_id);


--
-- Name: masters_address_user_id_4df23c29; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_address_user_id_4df23c29 ON public.masters_address USING btree (user_id);


--
-- Name: masters_eduqual_id_c8421d17_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_eduqual_id_c8421d17_like ON public.masters_eduqual USING btree (id varchar_pattern_ops);


--
-- Name: masters_equipmentclip_partner_id_2271b0f5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_equipmentclip_partner_id_2271b0f5 ON public.masters_equipmentclip USING btree (partner_id);


--
-- Name: masters_establishment_acko_poc_id_7b4ae63c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_establishment_acko_poc_id_7b4ae63c ON public.masters_establishment USING btree (acko_poc_id);


--
-- Name: masters_establishment_latlong_id; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_establishment_latlong_id ON public.masters_establishment USING gist (latlong);


--
-- Name: masters_establishment_legal_entity_id_cee926e7; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_establishment_legal_entity_id_cee926e7 ON public.masters_establishment USING btree (legal_entity_id);


--
-- Name: masters_establishment_owner_id_c66876ef; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_establishment_owner_id_c66876ef ON public.masters_establishment USING btree (poc_id);


--
-- Name: masters_establishment_pincode_id_39ab8ebd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_establishment_pincode_id_39ab8ebd ON public.masters_establishment USING btree (pincode_id);


--
-- Name: masters_externalbifueltype_id_0cc863c1_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_externalbifueltype_id_0cc863c1_like ON public.masters_externalbifueltype USING btree (id varchar_pattern_ops);


--
-- Name: masters_financingtype_id_dbfaaf60_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_financingtype_id_dbfaaf60_like ON public.masters_financingtype USING btree (id varchar_pattern_ops);


--
-- Name: masters_garage_created_by_id_84763a33; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_garage_created_by_id_84763a33 ON public.masters_garage USING btree (created_by_id);


--
-- Name: masters_garage_makes_garage_id_49f77b7d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_garage_makes_garage_id_49f77b7d ON public.masters_garage_makes USING btree (garage_id);


--
-- Name: masters_garage_makes_make_id_423a0048; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_garage_makes_make_id_423a0048 ON public.masters_garage_makes USING btree (make_id);


--
-- Name: masters_garagetimings_garage_id_becda48a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_garagetimings_garage_id_becda48a ON public.masters_garagetimings USING btree (garage_id);


--
-- Name: masters_gender_id_d1866f56_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_gender_id_d1866f56_like ON public.masters_gender USING btree (id varchar_pattern_ops);


--
-- Name: masters_goodsnature_id_ddf40949_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_goodsnature_id_ddf40949_like ON public.masters_goodsnature USING btree (id varchar_pattern_ops);


--
-- Name: masters_intermediary_acko_license_id_b69466af; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_acko_license_id_b69466af ON public.masters_intermediary USING btree (acko_license_id);


--
-- Name: masters_intermediary_features_feature_id_ff33d908; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_features_feature_id_ff33d908 ON public.masters_intermediary_features USING btree (coverage_id);


--
-- Name: masters_intermediary_features_feature_id_ff33d908_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_features_feature_id_ff33d908_like ON public.masters_intermediary_features USING btree (coverage_id varchar_pattern_ops);


--
-- Name: masters_intermediary_features_intermediary_id_98ec41ed; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_features_intermediary_id_98ec41ed ON public.masters_intermediary_features USING btree (intermediary_id);


--
-- Name: masters_intermediary_irda_registration_number_75545853_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_irda_registration_number_75545853_like ON public.masters_intermediary USING btree (irda_registration_number varchar_pattern_ops);


--
-- Name: masters_intermediary_key_id_d8a194a4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_key_id_d8a194a4 ON public.masters_intermediary USING btree (key_id);


--
-- Name: masters_intermediary_legal_entity_id_186b4664; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_legal_entity_id_186b4664 ON public.masters_intermediary USING btree (legal_entity_id);


--
-- Name: masters_intermediary_parent_id_c2dbf6a1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_parent_id_c2dbf6a1 ON public.masters_intermediary USING btree (parent_id);


--
-- Name: masters_intermediary_plans_intermediary_id_9839659f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_plans_intermediary_id_9839659f ON public.masters_intermediary_plans USING btree (intermediary_id);


--
-- Name: masters_intermediary_plans_plan_id_cd55ac28; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_plans_plan_id_cd55ac28 ON public.masters_intermediary_plans USING btree (plan_id);


--
-- Name: masters_intermediary_plans_plan_id_cd55ac28_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_plans_plan_id_cd55ac28_like ON public.masters_intermediary_plans USING btree (plan_id varchar_pattern_ops);


--
-- Name: masters_intermediary_return_url_3b8c55ee_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_return_url_3b8c55ee_like ON public.masters_intermediary USING btree (return_url varchar_pattern_ops);


--
-- Name: masters_intermediary_rtos_intermediary_id_76cd2de1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_rtos_intermediary_id_76cd2de1 ON public.masters_intermediary_rtos USING btree (intermediary_id);


--
-- Name: masters_intermediary_rtos_rto_id_9915af43; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediary_rtos_rto_id_9915af43 ON public.masters_intermediary_rtos USING btree (rto_id);


--
-- Name: masters_intermediaryrtoplanmapping_intermediary_id_ada7534a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediaryrtoplanmapping_intermediary_id_ada7534a ON public.masters_intermediaryrtoplanmapping USING btree (intermediary_id);


--
-- Name: masters_intermediaryrtoplanmapping_plan_id_cefcac87; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediaryrtoplanmapping_plan_id_cefcac87 ON public.masters_intermediaryrtoplanmapping USING btree (plan_id);


--
-- Name: masters_intermediaryrtoplanmapping_plan_id_cefcac87_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediaryrtoplanmapping_plan_id_cefcac87_like ON public.masters_intermediaryrtoplanmapping USING btree (plan_id varchar_pattern_ops);


--
-- Name: masters_intermediaryrtoplanmapping_rto_id_6646c00d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_intermediaryrtoplanmapping_rto_id_6646c00d ON public.masters_intermediaryrtoplanmapping USING btree (rto_id);


--
-- Name: masters_logistics_acko_poc_id_82332d20; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_logistics_acko_poc_id_82332d20 ON public.masters_logistics USING btree (acko_poc_id);


--
-- Name: masters_logistics_pincode_logistics_id_89a77411; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_logistics_pincode_logistics_id_89a77411 ON public.masters_logistics_pincode USING btree (logistics_id);


--
-- Name: masters_logistics_pincode_pincode_id_9369b56b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_logistics_pincode_pincode_id_9369b56b ON public.masters_logistics_pincode USING btree (pincode_id);


--
-- Name: masters_logistics_poc_id_a56d2927; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_logistics_poc_id_a56d2927 ON public.masters_logistics USING btree (poc_id);


--
-- Name: masters_make_name_7eaadd92_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_make_name_7eaadd92_like ON public.masters_make USING btree (name varchar_pattern_ops);


--
-- Name: masters_model_make_id_1629ad0d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_model_make_id_1629ad0d ON public.masters_model USING btree (make_id);


--
-- Name: masters_model_parent_id_bb9d5432; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_model_parent_id_bb9d5432 ON public.masters_model USING btree (parent_id);


--
-- Name: masters_modelcolor_model_id_e363c5c5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_modelcolor_model_id_e363c5c5 ON public.masters_modelcolor USING btree (model_id);


--
-- Name: masters_phonemodel_make_id_a9ee7a09; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_phonemodel_make_id_a9ee7a09 ON public.masters_phonemodel USING btree (make_id);


--
-- Name: masters_pincode_regions_pincode_id_1f73da17; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_pincode_regions_pincode_id_1f73da17 ON public.masters_pincode_regions USING btree (pincode_id);


--
-- Name: masters_pincode_regions_region_id_467584b9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_pincode_regions_region_id_467584b9 ON public.masters_pincode_regions USING btree (region_id);


--
-- Name: masters_previouspolicytype_id_eb973d27_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_previouspolicytype_id_eb973d27_like ON public.masters_previouspolicytype USING btree (id varchar_pattern_ops);


--
-- Name: masters_profession_id_f6fef799_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_profession_id_f6fef799_like ON public.masters_profession USING btree (id varchar_pattern_ops);


--
-- Name: masters_region_parents_from_region_id_39e43a78; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_region_parents_from_region_id_39e43a78 ON public.masters_region_parents USING btree (from_region_id);


--
-- Name: masters_region_parents_to_region_id_6003a41b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_region_parents_to_region_id_6003a41b ON public.masters_region_parents USING btree (to_region_id);


--
-- Name: masters_region_slug_a710d22f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_region_slug_a710d22f_like ON public.masters_region USING btree (slug varchar_pattern_ops);


--
-- Name: masters_relationship_id_5a610bba_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_relationship_id_5a610bba_like ON public.masters_relationship USING btree (id varchar_pattern_ops);


--
-- Name: masters_rto_code_0f133492_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rto_code_0f133492_like ON public.masters_rto USING btree (code varchar_pattern_ops);


--
-- Name: masters_rto_location_pincode_id_e8ca31bd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rto_location_pincode_id_e8ca31bd ON public.masters_rto USING btree (location_pincode_id);


--
-- Name: masters_rtocitymapping_city_id_e43f218e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rtocitymapping_city_id_e43f218e ON public.masters_rtocitymapping USING btree (city_id);


--
-- Name: masters_rtocitymapping_rtos_rto_id_f409cd13; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rtocitymapping_rtos_rto_id_f409cd13 ON public.masters_rtocitymapping_rtos USING btree (rto_id);


--
-- Name: masters_rtocitymapping_rtos_rtocitymapping_id_5058eaf2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rtocitymapping_rtos_rtocitymapping_id_5058eaf2 ON public.masters_rtocitymapping_rtos USING btree (rtocitymapping_id);


--
-- Name: masters_rtopincodemapping_rto_id_5c43537d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_rtopincodemapping_rto_id_5c43537d ON public.masters_rtopincodemapping USING btree (rto_id);


--
-- Name: masters_servicecenter_acko_poc_id_f6d27219; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_servicecenter_acko_poc_id_f6d27219 ON public.masters_servicecenter USING btree (acko_poc_id);


--
-- Name: masters_servicecenter_pincode_id_e222f80b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_servicecenter_pincode_id_e222f80b ON public.masters_servicecenter USING btree (pincode_id);


--
-- Name: masters_servicecenter_poc_id_654dcfc4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_servicecenter_poc_id_654dcfc4 ON public.masters_servicecenter USING btree (poc_id);


--
-- Name: masters_servicecenter_region_region_id_73e1c15a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_servicecenter_region_region_id_73e1c15a ON public.masters_servicecenter_region USING btree (region_id);


--
-- Name: masters_servicecenter_region_servicecenter_id_d30595ef; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_servicecenter_region_servicecenter_id_d30595ef ON public.masters_servicecenter_region USING btree (servicecenter_id);


--
-- Name: masters_title_id_60564d2f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_title_id_60564d2f_like ON public.masters_title USING btree (id varchar_pattern_ops);


--
-- Name: masters_variant_model_id_384783b2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_variant_model_id_384783b2 ON public.masters_variant USING btree (model_id);


--
-- Name: masters_variant_name_fde253ea; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_variant_name_fde253ea ON public.masters_variant USING btree (name);


--
-- Name: masters_variant_name_fde253ea_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_variant_name_fde253ea_like ON public.masters_variant USING btree (name varchar_pattern_ops);


--
-- Name: masters_vehicletype_id_e898236a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX masters_vehicletype_id_e898236a_like ON public.masters_vehicletype USING btree (id varchar_pattern_ops);


--
-- Name: motor_lead_user_id_021c2133; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_lead_user_id_021c2133 ON public.motor_lead USING btree (user_id);


--
-- Name: motor_lead_vehicle_id_71aa06fd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_lead_vehicle_id_71aa06fd ON public.motor_lead USING btree (vehicle_id);


--
-- Name: motor_leadsource_lead_id_2df4eab8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_leadsource_lead_id_2df4eab8 ON public.motor_leadsource USING btree (lead_id);


--
-- Name: motor_leadsource_source_id_ab3169fd; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_leadsource_source_id_ab3169fd ON public.motor_leadsource USING btree (source_id);


--
-- Name: motor_policy_customer_id_7894ca5a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_customer_id_7894ca5a ON public.motor_policy USING btree (customer_id);


--
-- Name: motor_policy_idit_policy_number_04d368d4_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_idit_policy_number_04d368d4_like ON public.motor_policy USING btree (idit_policy_number varchar_pattern_ops);


--
-- Name: motor_policy_partner_id_dcf8370c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_partner_id_dcf8370c ON public.motor_policy USING btree (partner_id);


--
-- Name: motor_policy_payment_id_9312622f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_payment_id_9312622f ON public.motor_policy USING btree (payment_id);


--
-- Name: motor_policy_policy_holder_id_4ed9b9d9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_policy_holder_id_4ed9b9d9 ON public.motor_policy USING btree (policy_holder_id);


--
-- Name: motor_policy_policy_number_eba0f70a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_policy_policy_number_eba0f70a_like ON public.motor_policy USING btree (policy_number varchar_pattern_ops);


--
-- Name: motor_quote_appointee_relationship_id_873b5fed; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_appointee_relationship_id_873b5fed ON public.motor_quote USING btree (appointee_relationship_id);


--
-- Name: motor_quote_appointee_relationship_id_873b5fed_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_appointee_relationship_id_873b5fed_like ON public.motor_quote USING btree (appointee_relationship_id varchar_pattern_ops);


--
-- Name: motor_quote_color_code_id_e42b557d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_color_code_id_e42b557d ON public.motor_quote USING btree (color_code_id);


--
-- Name: motor_quote_edu_qualification_id_ec8f01cb; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_edu_qualification_id_ec8f01cb ON public.motor_quote USING btree (edu_qualification_id);


--
-- Name: motor_quote_edu_qualification_id_ec8f01cb_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_edu_qualification_id_ec8f01cb_like ON public.motor_quote USING btree (edu_qualification_id varchar_pattern_ops);


--
-- Name: motor_quote_external_bifuel_type_id_da2d1128; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_external_bifuel_type_id_da2d1128 ON public.motor_quote USING btree (external_bifuel_type_id);


--
-- Name: motor_quote_external_bifuel_type_id_da2d1128_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_external_bifuel_type_id_da2d1128_like ON public.motor_quote USING btree (external_bifuel_type_id varchar_pattern_ops);


--
-- Name: motor_quote_financing_type_id_dd8f2e6f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_financing_type_id_dd8f2e6f ON public.motor_quote USING btree (financing_type_id);


--
-- Name: motor_quote_financing_type_id_dd8f2e6f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_financing_type_id_dd8f2e6f_like ON public.motor_quote USING btree (financing_type_id varchar_pattern_ops);


--
-- Name: motor_quote_gender_id_6aa042ed; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_gender_id_6aa042ed ON public.motor_quote USING btree (gender_id);


--
-- Name: motor_quote_gender_id_6aa042ed_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_gender_id_6aa042ed_like ON public.motor_quote USING btree (gender_id varchar_pattern_ops);


--
-- Name: motor_quote_lead_source_id_e2d6cdce; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_lead_source_id_e2d6cdce ON public.motor_quote USING btree (lead_source_id);


--
-- Name: motor_quote_nature_of_goods_id_2893f043; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_nature_of_goods_id_2893f043 ON public.motor_quote USING btree (nature_of_goods_id);


--
-- Name: motor_quote_nature_of_goods_id_2893f043_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_nature_of_goods_id_2893f043_like ON public.motor_quote USING btree (nature_of_goods_id varchar_pattern_ops);


--
-- Name: motor_quote_nominee_relationship_id_7d4f2b3c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_nominee_relationship_id_7d4f2b3c ON public.motor_quote USING btree (nominee_relationship_id);


--
-- Name: motor_quote_nominee_relationship_id_7d4f2b3c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_nominee_relationship_id_7d4f2b3c_like ON public.motor_quote USING btree (nominee_relationship_id varchar_pattern_ops);


--
-- Name: motor_quote_partner_id_d72309b8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_partner_id_d72309b8 ON public.motor_quote USING btree (partner_id);


--
-- Name: motor_quote_payment_id_34c1fca1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_payment_id_34c1fca1 ON public.motor_quote USING btree (payment_id);


--
-- Name: motor_quote_pincode_id_d134f51b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_pincode_id_d134f51b ON public.motor_quote USING btree (pincode_id);


--
-- Name: motor_quote_plan_recommended_id_dc5f3533; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_plan_recommended_id_dc5f3533 ON public.motor_quote USING btree (plan_recommended_id);


--
-- Name: motor_quote_plan_recommended_id_dc5f3533_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_plan_recommended_id_dc5f3533_like ON public.motor_quote USING btree (plan_recommended_id varchar_pattern_ops);


--
-- Name: motor_quote_plan_selected_id_16ce5e1a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_plan_selected_id_16ce5e1a ON public.motor_quote USING btree (plan_selected_id);


--
-- Name: motor_quote_plan_selected_id_16ce5e1a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_plan_selected_id_16ce5e1a_like ON public.motor_quote USING btree (plan_selected_id varchar_pattern_ops);


--
-- Name: motor_quote_previous_policy_type_id_d0e0df90; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_previous_policy_type_id_d0e0df90 ON public.motor_quote USING btree (previous_policy_type_id);


--
-- Name: motor_quote_previous_policy_type_id_d0e0df90_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_previous_policy_type_id_d0e0df90_like ON public.motor_quote USING btree (previous_policy_type_id varchar_pattern_ops);


--
-- Name: motor_quote_product_id_49ea7003; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_product_id_49ea7003 ON public.motor_quote USING btree (product_id);


--
-- Name: motor_quote_product_id_49ea7003_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_product_id_49ea7003_like ON public.motor_quote USING btree (product_id varchar_pattern_ops);


--
-- Name: motor_quote_profession_id_075601ad; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_profession_id_075601ad ON public.motor_quote USING btree (profession_id);


--
-- Name: motor_quote_profession_id_075601ad_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_profession_id_075601ad_like ON public.motor_quote USING btree (profession_id varchar_pattern_ops);


--
-- Name: motor_quote_rto_id_e2cb7695; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_rto_id_e2cb7695 ON public.motor_quote USING btree (rto_id);


--
-- Name: motor_quote_title_id_a2820cf5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_title_id_a2820cf5 ON public.motor_quote USING btree (title_id);


--
-- Name: motor_quote_title_id_a2820cf5_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_title_id_a2820cf5_like ON public.motor_quote USING btree (title_id varchar_pattern_ops);


--
-- Name: motor_quote_utlead_id_c5d38bd2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_utlead_id_c5d38bd2 ON public.motor_quote USING btree (utlead_id);


--
-- Name: motor_quote_variant_id_dbf7f497; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_variant_id_dbf7f497 ON public.motor_quote USING btree (variant_id);


--
-- Name: motor_quote_vehicle_id_c326020a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_quote_vehicle_id_c326020a ON public.motor_quote USING btree (vehicle_id);


--
-- Name: motor_ratings_pincodezone_zone_id_17d4c6e2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_ratings_pincodezone_zone_id_17d4c6e2 ON public.motor_ratings_pincodezone USING btree (zone_id);


--
-- Name: motor_ratings_uwdiscretion_make_id_67ec4742; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_ratings_uwdiscretion_make_id_67ec4742 ON public.motor_ratings_uwdiscretion USING btree (make_id);


--
-- Name: motor_ratings_uwdiscretion_model_id_c5539b64; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_ratings_uwdiscretion_model_id_c5539b64 ON public.motor_ratings_uwdiscretion USING btree (model_id);


--
-- Name: motor_ratings_uwdiscretion_zone_id_d6ac0a0d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_ratings_uwdiscretion_zone_id_d6ac0a0d ON public.motor_ratings_uwdiscretion USING btree (zone_id);


--
-- Name: motor_utlead_tracker_id_ae0d4c4a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_utlead_tracker_id_ae0d4c4a ON public.motor_utlead USING btree (tracker_id);


--
-- Name: motor_utlead_user_id_615575c7; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_utlead_user_id_615575c7 ON public.motor_utlead USING btree (user_id);


--
-- Name: motor_utlead_vehicle_id_3b4dd318; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_utlead_vehicle_id_3b4dd318 ON public.motor_utlead USING btree (vehicle_id);


--
-- Name: motor_vehicle_registration_b69859f2_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_vehicle_registration_b69859f2_like ON public.motor_vehicle USING btree (registration varchar_pattern_ops);


--
-- Name: motor_vehicle_variant_id_03de24fe; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_vehicle_variant_id_03de24fe ON public.motor_vehicle USING btree (variant_id);


--
-- Name: motor_vehicle_work_id_ea2eb264; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX motor_vehicle_work_id_ea2eb264 ON public.motor_vehicle USING btree (work_id);


--
-- Name: ola_emailpreference_email_0412f838_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_emailpreference_email_0412f838_like ON public.ola_emailpreference USING btree (email varchar_pattern_ops);


--
-- Name: ola_invoice_invoice_id_bac752ad; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_invoice_invoice_id_bac752ad ON public.ola_invoice USING btree (invoice_id);


--
-- Name: ola_invoice_ola_invoice_id_db8cd6bb; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_invoice_ola_invoice_id_db8cd6bb ON public.ola_invoice USING btree (ola_invoice_id);


--
-- Name: ola_invoice_ola_invoice_id_db8cd6bb_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_invoice_ola_invoice_id_db8cd6bb_like ON public.ola_invoice USING btree (ola_invoice_id varchar_pattern_ops);


--
-- Name: ola_trip_booked_on_a512dc5e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_booked_on_a512dc5e ON public.ola_trip USING btree (booked_on);


--
-- Name: ola_trip_corporate_invoice_id_8559c95d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_corporate_invoice_id_8559c95d ON public.ola_trip USING btree (corporate_invoice_id);


--
-- Name: ola_trip_driver_id_1ec66e9e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_driver_id_1ec66e9e ON public.ola_trip USING btree (driver_id);


--
-- Name: ola_trip_is_cancelled_8f105f2b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_is_cancelled_8f105f2b ON public.ola_trip USING btree (is_cancelled);


--
-- Name: ola_trip_phone_2e9081ba; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_phone_2e9081ba ON public.ola_trip USING btree (phone);


--
-- Name: ola_trip_phone_2e9081ba_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_phone_2e9081ba_like ON public.ola_trip USING btree (phone varchar_pattern_ops);


--
-- Name: ola_trip_policy_id_8f5e6eb0; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_policy_id_8f5e6eb0 ON public.ola_trip USING btree (policy_id);


--
-- Name: ola_trip_traveler_phone_13f367be; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_traveler_phone_13f367be ON public.ola_trip USING btree (traveler_phone);


--
-- Name: ola_trip_traveler_phone_13f367be_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_traveler_phone_13f367be_like ON public.ola_trip USING btree (traveler_phone varchar_pattern_ops);


--
-- Name: ola_trip_trip_id_8f401639_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_trip_id_8f401639_like ON public.ola_trip USING btree (trip_id varchar_pattern_ops);


--
-- Name: ola_trip_user_id_40d43f67; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_user_id_40d43f67 ON public.ola_trip USING btree (user_id);


--
-- Name: ola_trip_vehicle_id_33b9253a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ola_trip_vehicle_id_33b9253a ON public.ola_trip USING btree (vehicle_id);


--
-- Name: ozonetel_agent_name_0f01227f_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ozonetel_agent_name_0f01227f_like ON public.ozonetel_agent USING btree (name varchar_pattern_ops);


--
-- Name: ozonetel_call_monitor_ucid_67f76335_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX ozonetel_call_monitor_ucid_67f76335_like ON public.ozonetel_call USING btree (monitor_ucid varchar_pattern_ops);


--
-- Name: payments_payment_mandate_id_67d3a364; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX payments_payment_mandate_id_67d3a364 ON public.payments_payment USING btree (mandate_id);


--
-- Name: payments_payment_user_id_f9db060a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX payments_payment_user_id_f9db060a ON public.payments_payment USING btree (user_id);


--
-- Name: payments_refund_payment_id_a70693f7; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX payments_refund_payment_id_a70693f7 ON public.payments_refund USING btree (payment_id);


--
-- Name: payments_refund_user_id_024e7071; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX payments_refund_user_id_024e7071 ON public.payments_refund USING btree (user_id);


--
-- Name: payments_settlement_payment_id_a61afbdf; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX payments_settlement_payment_id_a61afbdf ON public.payments_settlement USING btree (payment_id);


--
-- Name: r2d2_allowance_reimbursement_oid_8d316b90_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_allowance_reimbursement_oid_8d316b90_like ON public.r2d2_allowance_reimbursement USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_amazonmobilerepair_oid_1cb16594_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_amazonmobilerepair_oid_1cb16594_like ON public.r2d2_amazon_mobile_repair USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_appliances_extended_warranty_oid_b9be42b6_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_appliances_extended_warranty_oid_b9be42b6_like ON public.r2d2_appliances_extended_warranty USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_burglary_fire_damage_oid_39e1f315_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_burglary_fire_damage_oid_39e1f315_like ON public.r2d2_burglary_fire_damage USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_call_oid_d5a639d5_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_call_oid_d5a639d5_like ON public.r2d2_call USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_cannedresponse_email_id_0d4aa9d5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_cannedresponse_email_id_0d4aa9d5 ON public.r2d2_cannedresponse USING btree (email_id);


--
-- Name: r2d2_cannedresponse_phone_id_a0c1bdb6; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_cannedresponse_phone_id_a0c1bdb6 ON public.r2d2_cannedresponse USING btree (phone_id);


--
-- Name: r2d2_cannedresponse_sender_id_366d335e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_cannedresponse_sender_id_366d335e ON public.r2d2_cannedresponse USING btree (sender_id);


--
-- Name: r2d2_cannedresponse_user_id_3fbc37ee; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_cannedresponse_user_id_3fbc37ee ON public.r2d2_cannedresponse USING btree (user_id);


--
-- Name: r2d2_carlead_crm_state_id_7b10443f; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_crm_state_id_7b10443f ON public.r2d2_carlead USING btree (crm_state_id);


--
-- Name: r2d2_carlead_customer_id_c536f4cb; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_customer_id_c536f4cb ON public.r2d2_carlead USING btree (customer_id);


--
-- Name: r2d2_carlead_customer_id_c536f4cb_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_customer_id_c536f4cb_like ON public.r2d2_carlead USING btree (customer_id varchar_pattern_ops);


--
-- Name: r2d2_carlead_first_call_disposition_id_2456f003; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_first_call_disposition_id_2456f003 ON public.r2d2_carlead USING btree (first_call_disposition_id);


--
-- Name: r2d2_carlead_fuel_type_id_3b4a48e2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_fuel_type_id_3b4a48e2 ON public.r2d2_carlead USING btree (fuel_type_id);


--
-- Name: r2d2_carlead_last_call_disposition_id_a0b22c9b; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_last_call_disposition_id_a0b22c9b ON public.r2d2_carlead USING btree (last_call_disposition_id);


--
-- Name: r2d2_carlead_last_call_sub_disposition_id_6e553f55; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_last_call_sub_disposition_id_6e553f55 ON public.r2d2_carlead USING btree (last_call_sub_disposition_id);


--
-- Name: r2d2_carlead_lead_creator_id_87a588fb; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_lead_creator_id_87a588fb ON public.r2d2_carlead USING btree (lead_creator_id);


--
-- Name: r2d2_carlead_lead_id_adb1f870_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_lead_id_adb1f870_like ON public.r2d2_carlead USING btree (lead_id varchar_pattern_ops);


--
-- Name: r2d2_carlead_lead_type_id_53791f20; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_lead_type_id_53791f20 ON public.r2d2_carlead USING btree (lead_type_id);


--
-- Name: r2d2_carlead_phone_4e4da1ee; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_phone_4e4da1ee ON public.r2d2_carlead USING btree (phone);


--
-- Name: r2d2_carlead_phone_4e4da1ee_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_phone_4e4da1ee_like ON public.r2d2_carlead USING btree (phone varchar_pattern_ops);


--
-- Name: r2d2_carlead_product_state_id_f1a1814e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_product_state_id_f1a1814e ON public.r2d2_carlead USING btree (product_state_id);


--
-- Name: r2d2_carlead_registration_number_0e36c391; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_registration_number_0e36c391 ON public.r2d2_carlead USING btree (registration_number);


--
-- Name: r2d2_carlead_registration_number_0e36c391_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_carlead_registration_number_0e36c391_like ON public.r2d2_carlead USING btree (registration_number varchar_pattern_ops);


--
-- Name: r2d2_claim_oid_2c788179_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_claim_oid_2c788179_like ON public.r2d2_claim USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_disability_death_oid_110f9d82_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_disability_death_oid_110f9d82_like ON public.r2d2_disability_death USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_endorsement_oid_e9d57e13_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_endorsement_oid_e9d57e13_like ON public.r2d2_endorsement USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_event_product_index; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_event_product_index ON public.r2d2_event USING btree (((odata ->> 'product'::text)));


--
-- Name: r2d2_event_visit_id_663b9c08; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_event_visit_id_663b9c08 ON public.r2d2_event USING btree (visit_id);


--
-- Name: r2d2_hospitalization_ipd_oid_6368a0e7_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_hospitalization_ipd_oid_6368a0e7_like ON public.r2d2_hospitalization_ipd USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_hospitalization_opd_oid_77b12a58_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_hospitalization_opd_oid_77b12a58_like ON public.r2d2_hospitalization_opd USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_link_oid_a946a1de_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_link_oid_a946a1de_like ON public.r2d2_link USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_link_short_4e5e1c44_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_link_short_4e5e1c44_like ON public.r2d2_link USING btree (short varchar_pattern_ops);


--
-- Name: r2d2_loss_theft_personal_belongings_oid_1623fd72_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_loss_theft_personal_belongings_oid_1623fd72_like ON public.r2d2_loss_theft_personal_belongings USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_lp_visit_oid_f755cc72_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_lp_visit_oid_f755cc72_like ON public.r2d2_lp_visit USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_lsq_activity_oid_cccaa151_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_lsq_activity_oid_cccaa151_like ON public.r2d2_lsq_activity USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_mobile_oid_2bcfa4b7_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_mobile_oid_2bcfa4b7_like ON public.r2d2_mobile USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_notification_event_id_664a6b99; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_notification_event_id_664a6b99 ON public.r2d2_notification USING btree (event_id);


--
-- Name: r2d2_notification_rAction_id_eb8b59d3; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX "r2d2_notification_rAction_id_eb8b59d3" ON public.r2d2_notification USING btree (raction_id);


--
-- Name: r2d2_ola_trip_claim_oid_386430c2_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_ola_trip_claim_oid_386430c2_like ON public.r2d2_ola_trip_claim USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_ola_trip_oid_9aad1fae_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_ola_trip_oid_9aad1fae_like ON public.r2d2_ola_trip USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_payment_oid_41a1b5d8_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_payment_oid_41a1b5d8_like ON public.r2d2_payment USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_policy_oid_ff1bd020_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_policy_oid_ff1bd020_like ON public.r2d2_policy USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_pre_inspection_oid_9930049a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_pre_inspection_oid_9930049a_like ON public.r2d2_pre_inspection USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_quote_oid_9ccd5246_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_quote_oid_9ccd5246_like ON public.r2d2_quote USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_tracker_oid_2a84457a_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_tracker_oid_2a84457a_like ON public.r2d2_tracker USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_user_oid_ec92cd84_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_user_oid_ec92cd84_like ON public.r2d2_user USING btree (oid varchar_pattern_ops);


--
-- Name: r2d2_visit_oid_62ea801c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX r2d2_visit_oid_62ea801c_like ON public.r2d2_visit USING btree (oid varchar_pattern_ops);


--
-- Name: reports_keyreports_report_id_efc96d02; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_keyreports_report_id_efc96d02 ON public.reports_keyreports USING btree (report_id);


--
-- Name: reports_report_downs_oentity_id_d6d69d4c; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_downs_oentity_id_d6d69d4c ON public.reports_report_downs USING btree (oentity_id);


--
-- Name: reports_report_downs_report_id_4d08eaf5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_downs_report_id_4d08eaf5 ON public.reports_report_downs USING btree (report_id);


--
-- Name: reports_report_selfs_oentity_id_2f7cd687; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_selfs_oentity_id_2f7cd687 ON public.reports_report_selfs USING btree (oentity_id);


--
-- Name: reports_report_selfs_report_id_d308826e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_selfs_report_id_d308826e ON public.reports_report_selfs USING btree (report_id);


--
-- Name: reports_report_ups_oentity_id_4b6ec02a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_ups_oentity_id_4b6ec02a ON public.reports_report_ups USING btree (oentity_id);


--
-- Name: reports_report_ups_report_id_2c149a96; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX reports_report_ups_report_id_2c149a96 ON public.reports_report_ups USING btree (report_id);


--
-- Name: slots_slot_template_id_1c32c360; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX slots_slot_template_id_1c32c360 ON public.slots_slot USING btree (template_id);


--
-- Name: slots_slottemplate_name_d017ecfb_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX slots_slottemplate_name_d017ecfb_like ON public.slots_slottemplate USING btree (name varchar_pattern_ops);


--
-- Name: slots_slottemplate_template_time_range_slottemplate_id_9e1bbf12; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX slots_slottemplate_template_time_range_slottemplate_id_9e1bbf12 ON public.slots_slottemplate_template_time_range USING btree (slottemplate_id);


--
-- Name: slots_slottemplate_template_time_range_slottime_id_e5d2233a; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX slots_slottemplate_template_time_range_slottime_id_e5d2233a ON public.slots_slottemplate_template_time_range USING btree (slottime_id);


--
-- Name: subscription_mandate_user_id_01627b2e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX subscription_mandate_user_id_01627b2e ON public.subscription_mandate USING btree (user_id);


--
-- Name: users_device_token_b2c01a57_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_device_token_b2c01a57_like ON public.users_device USING btree (token varchar_pattern_ops);


--
-- Name: users_device_user_id_7f43d271; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_device_user_id_7f43d271 ON public.users_device USING btree (user_id);


--
-- Name: users_email_user_id_d0a90c30; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_email_user_id_d0a90c30 ON public.users_email USING btree (user_id);


--
-- Name: users_oentity_boss_id_9d90b463; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_boss_id_9d90b463 ON public.users_oentity USING btree (boss_id);


--
-- Name: users_oentity_dotted_line_from_oentity_id_fd78ce5e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_dotted_line_from_oentity_id_fd78ce5e ON public.users_oentity_dotted_line USING btree (from_oentity_id);


--
-- Name: users_oentity_dotted_line_to_oentity_id_bdac2610; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_dotted_line_to_oentity_id_bdac2610 ON public.users_oentity_dotted_line USING btree (to_oentity_id);


--
-- Name: users_oentity_down_oentity_id_ec081211; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_down_oentity_id_ec081211 ON public.users_oentity_down USING btree (oentity_id);


--
-- Name: users_oentity_down_permission_id_d3c53168; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_down_permission_id_d3c53168 ON public.users_oentity_down USING btree (permission_id);


--
-- Name: users_oentity_self_oentity_id_f2d7e3aa; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_self_oentity_id_f2d7e3aa ON public.users_oentity_self USING btree (oentity_id);


--
-- Name: users_oentity_self_permission_id_7e7423fa; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_self_permission_id_7e7423fa ON public.users_oentity_self USING btree (permission_id);


--
-- Name: users_oentity_skill_id_dc2cb76d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_skill_id_dc2cb76d ON public.users_oentity USING btree (skill_id);


--
-- Name: users_oentity_up_oentity_id_f67f54a3; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_up_oentity_id_f67f54a3 ON public.users_oentity_up USING btree (oentity_id);


--
-- Name: users_oentity_up_permission_id_ea42000d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_up_permission_id_ea42000d ON public.users_oentity_up USING btree (permission_id);


--
-- Name: users_oentity_user_id_b5c96ee5; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_oentity_user_id_b5c96ee5 ON public.users_oentity USING btree (user_id);


--
-- Name: users_phone_user_id_d19565e2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_phone_user_id_d19565e2 ON public.users_phone USING btree (user_id);


--
-- Name: users_remoteuser_remote_id_637c31a9_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_remoteuser_remote_id_637c31a9_like ON public.users_remoteuser USING btree (remote_id varchar_pattern_ops);


--
-- Name: users_remoteuser_user_id_c8cbb365; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_remoteuser_user_id_c8cbb365 ON public.users_remoteuser USING btree (user_id);


--
-- Name: users_reservedwork_task_id_033ef7d4; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_reservedwork_task_id_033ef7d4 ON public.users_reservedwork USING btree (task_id);


--
-- Name: users_reservedwork_user_id_332ceef8; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_reservedwork_user_id_332ceef8 ON public.users_reservedwork USING btree (user_id);


--
-- Name: users_reservedwork_work_id_f9fba2cc; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_reservedwork_work_id_f9fba2cc ON public.users_reservedwork USING btree (work_id);


--
-- Name: users_slot_time_slot_id_6de5f522; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_slot_time_slot_id_6de5f522 ON public.users_slot USING btree (time_slot_id);


--
-- Name: users_slot_worker_id_04106ec9; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_slot_worker_id_04106ec9 ON public.users_slot USING btree (worker_id);


--
-- Name: users_user_company_id_14799323; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_user_company_id_14799323 ON public.users_user USING btree (company_id);


--
-- Name: users_user_latlong_id; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_user_latlong_id ON public.users_user USING gist (latlong);


--
-- Name: users_user_phone_fe37f55c_like; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_user_phone_fe37f55c_like ON public.users_user USING btree (phone varchar_pattern_ops);


--
-- Name: users_user_skills_skill_id_d60be33e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_user_skills_skill_id_d60be33e ON public.users_user_skills USING btree (skill_id);


--
-- Name: users_user_skills_user_id_cf6a7e1e; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_user_skills_user_id_cf6a7e1e ON public.users_user_skills USING btree (user_id);


--
-- Name: users_userprofile_nominee_id_8219a95d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_userprofile_nominee_id_8219a95d ON public.users_userprofile USING btree (nominee_id);


--
-- Name: users_workerprofile_intermediary_id_ba9ac1f0; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_workerprofile_intermediary_id_ba9ac1f0 ON public.users_workerprofile USING btree (intermediary_id);


--
-- Name: users_workerprofile_preferred_slots_slotspec_id_820bef32; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_workerprofile_preferred_slots_slotspec_id_820bef32 ON public.users_workerprofile_preferred_slots USING btree (slotspec_id);


--
-- Name: users_workerprofile_preferred_slots_workerprofile_id_3c735c91; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_workerprofile_preferred_slots_workerprofile_id_3c735c91 ON public.users_workerprofile_preferred_slots USING btree (workerprofile_id);


--
-- Name: users_workerregion_worker_id_2970ef18; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX users_workerregion_worker_id_2970ef18 ON public.users_workerregion USING btree (worker_id);


--
-- Name: vendors_bikerdriver_acko_poc_id_d58bc4e2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_bikerdriver_acko_poc_id_d58bc4e2 ON public.vendors_bikerdriver USING btree (acko_poc_id);


--
-- Name: vendors_bikerdriver_bankaccount_id_dd1d6e28; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_bikerdriver_bankaccount_id_dd1d6e28 ON public.vendors_bikerdriver USING btree (bankaccount_id);


--
-- Name: vendors_bikerdriver_legalentity_id_72b22cd1; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_bikerdriver_legalentity_id_72b22cd1 ON public.vendors_bikerdriver USING btree (legalentity_id);


--
-- Name: vendors_bikerdriver_poc_id_ab1db532; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_bikerdriver_poc_id_ab1db532 ON public.vendors_bikerdriver USING btree (poc_id);


--
-- Name: vendors_workshop_acko_poc_id_abd12577; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_workshop_acko_poc_id_abd12577 ON public.vendors_workshop USING btree (acko_poc_id);


--
-- Name: vendors_workshop_bankaccount_id_3951c27d; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_workshop_bankaccount_id_3951c27d ON public.vendors_workshop USING btree (bankaccount_id);


--
-- Name: vendors_workshop_establishment_id_b9498a93; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_workshop_establishment_id_b9498a93 ON public.vendors_workshop USING btree (establishment_id);


--
-- Name: vendors_workshop_poc_id_b096d0f2; Type: INDEX; Schema: public; Owner: venkatesh
--

CREATE INDEX vendors_workshop_poc_id_b096d0f2 ON public.vendors_workshop USING btree (poc_id);


--
-- Name: r2d2_edataspec validators_changed; Type: TRIGGER; Schema: public; Owner: venkatesh
--

CREATE TRIGGER validators_changed AFTER INSERT OR DELETE OR UPDATE OR TRUNCATE ON public.r2d2_edataspec FOR EACH STATEMENT EXECUTE PROCEDURE public.validators_changed();


--
-- Name: r2d2_odataspec validators_changed; Type: TRIGGER; Schema: public; Owner: venkatesh
--

CREATE TRIGGER validators_changed AFTER INSERT OR DELETE OR UPDATE OR TRUNCATE ON public.r2d2_odataspec FOR EACH STATEMENT EXECUTE PROCEDURE public.validators_changed();


--
-- Name: acko_asset acko_asset_tracker_id_8f0d077a_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset
    ADD CONSTRAINT acko_asset_tracker_id_8f0d077a_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_asset acko_asset_user_id_ed00361e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_asset
    ADD CONSTRAINT acko_asset_user_id_ed00361e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_bankaccount acko_bankaccount_account_branch_id_35ff15d6_fk_acko_bank; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankaccount
    ADD CONSTRAINT acko_bankaccount_account_branch_id_35ff15d6_fk_acko_bank FOREIGN KEY (account_branch_id) REFERENCES public.acko_bankbranch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_bankaccount acko_bankaccount_legal_entity_id_8598ca60_fk_acko_lega; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_bankaccount
    ADD CONSTRAINT acko_bankaccount_legal_entity_id_8598ca60_fk_acko_lega FOREIGN KEY (legal_entity_id) REFERENCES public.acko_legalentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_usercontact acko_corecontactusers_user_id_f627d73e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_usercontact
    ADD CONSTRAINT acko_corecontactusers_user_id_f627d73e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_floataccount acko_floataccount_intermediary_id_ed8a12c1_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floataccount
    ADD CONSTRAINT acko_floataccount_intermediary_id_ed8a12c1_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_floatdeposit acko_floatdeposit_account_id_a2b8d8c0_fk_acko_floataccount_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floatdeposit
    ADD CONSTRAINT acko_floatdeposit_account_id_a2b8d8c0_fk_acko_floataccount_id FOREIGN KEY (account_id) REFERENCES public.acko_floataccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_floatdeposit acko_floatdeposit_added_by_id_1cdadb26_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_floatdeposit
    ADD CONSTRAINT acko_floatdeposit_added_by_id_1cdadb26_fk_users_user_id FOREIGN KEY (added_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_grouppolicy acko_grouppolicy_account_id_bb035ab9_fk_acko_floataccount_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_grouppolicy
    ADD CONSTRAINT acko_grouppolicy_account_id_bb035ab9_fk_acko_floataccount_id FOREIGN KEY (account_id) REFERENCES public.acko_floataccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_grouppolicy acko_grouppolicy_customer_id_8f1abb0e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_grouppolicy
    ADD CONSTRAINT acko_grouppolicy_customer_id_8f1abb0e_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_gstinvoice acko_gstinvoice_content_type_id_3030b78a_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_gstinvoice
    ADD CONSTRAINT acko_gstinvoice_content_type_id_3030b78a_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_legalentity acko_legalentity_content_type_id_3eaf9fa3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_legalentity
    ADD CONSTRAINT acko_legalentity_content_type_id_3eaf9fa3_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_policy acko_policy_customer_id_bbad7fed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_customer_id_bbad7fed_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_policy acko_policy_payment_id_34863f92_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_payment_id_34863f92_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_policy acko_policy_policy_holder_id_bf15989b_fk_acko_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_policy_holder_id_bf15989b_fk_acko_contact_id FOREIGN KEY (policy_holder_id) REFERENCES public.acko_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_policy acko_policy_quote_id_fd0d7f23_fk_acko_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_policy
    ADD CONSTRAINT acko_policy_quote_id_fd0d7f23_fk_acko_quote_id FOREIGN KEY (quote_id) REFERENCES public.acko_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_publickey acko_publickey_content_type_id_3660d71b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_publickey
    ADD CONSTRAINT acko_publickey_content_type_id_3660d71b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_publickey acko_publickey_created_by_id_089ae68f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_publickey
    ADD CONSTRAINT acko_publickey_created_by_id_089ae68f_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote_assets acko_quote_assets_asset_id_912e2b3c_fk_acko_asset_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote_assets
    ADD CONSTRAINT acko_quote_assets_asset_id_912e2b3c_fk_acko_asset_id FOREIGN KEY (asset_id) REFERENCES public.acko_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote_assets acko_quote_assets_quote_id_fb6d8557_fk_acko_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote_assets
    ADD CONSTRAINT acko_quote_assets_quote_id_fb6d8557_fk_acko_quote_id FOREIGN KEY (quote_id) REFERENCES public.acko_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote acko_quote_endorsed_policy_id_a41aeca1_fk_acko_policy_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote
    ADD CONSTRAINT acko_quote_endorsed_policy_id_a41aeca1_fk_acko_policy_id FOREIGN KEY (endorsed_policy_id) REFERENCES public.acko_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote acko_quote_parent_id_93c5e21d_fk_acko_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote
    ADD CONSTRAINT acko_quote_parent_id_93c5e21d_fk_acko_quote_id FOREIGN KEY (parent_id) REFERENCES public.acko_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote acko_quote_payment_id_63a1b672_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote
    ADD CONSTRAINT acko_quote_payment_id_63a1b672_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_quote acko_quote_token_payment_id_1f75268d_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_quote
    ADD CONSTRAINT acko_quote_token_payment_id_1f75268d_fk_payments_payment_id FOREIGN KEY (token_payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_skipquestions acko_skipquestions_tracker_id_00e6d975_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_skipquestions
    ADD CONSTRAINT acko_skipquestions_tracker_id_00e6d975_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_skipquestions acko_skipquestions_user_id_db704301_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_skipquestions
    ADD CONSTRAINT acko_skipquestions_user_id_db704301_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_tracker acko_tracker_user_id_48a453c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_tracker
    ADD CONSTRAINT acko_tracker_user_id_48a453c2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_usercontact acko_usercontact_contact_id_e25edb88_fk_acko_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_usercontact
    ADD CONSTRAINT acko_usercontact_contact_id_e25edb88_fk_acko_contact_id FOREIGN KEY (contact_id) REFERENCES public.acko_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_vehicle acko_vehicle_owner_id_0d83c639_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_vehicle
    ADD CONSTRAINT acko_vehicle_owner_id_0d83c639_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acko_visit acko_visit_tracker_id_8bca8e4d_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.acko_visit
    ADD CONSTRAINT acko_visit_tracker_id_8bca8e4d_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_ackoagentlicense ackore_ackoagentlicense_user_id_5afcf674_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_ackoagentlicense
    ADD CONSTRAINT ackore_ackoagentlicense_user_id_5afcf674_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_claim ackore_claim_claim_kind_id_de1228aa_fk; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_claim
    ADD CONSTRAINT ackore_claim_claim_kind_id_de1228aa_fk FOREIGN KEY (claim_kind_id) REFERENCES public.ackore_ckind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_claim ackore_claim_policy_id_5c388380_fk_ackore_policy_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_claim
    ADD CONSTRAINT ackore_claim_policy_id_5c388380_fk_ackore_policy_id FOREIGN KEY (policy_id) REFERENCES public.ackore_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_claim ackore_claim_work_id_cf8b38f8_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_claim
    ADD CONSTRAINT ackore_claim_work_id_cf8b38f8_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_coverage_ekinds ackore_coverage_ekin_coverage_id_23ad4dae_fk_ackore_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage_ekinds
    ADD CONSTRAINT ackore_coverage_ekin_coverage_id_23ad4dae_fk_ackore_co FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_coverage_ekinds ackore_coverage_ekinds_ekind_id_895ecd42_fk_ackore_ekind_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage_ekinds
    ADD CONSTRAINT ackore_coverage_ekinds_ekind_id_895ecd42_fk_ackore_ekind_id FOREIGN KEY (ekind_id) REFERENCES public.ackore_ekind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_endorsement ackore_endorsement_ekind_id_4f315b0b_fk_ackore_ekind_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement
    ADD CONSTRAINT ackore_endorsement_ekind_id_4f315b0b_fk_ackore_ekind_id FOREIGN KEY (ekind_id) REFERENCES public.ackore_ekind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_endorsement ackore_endorsement_policy_id_84ccbccd_fk_ackore_policy_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement
    ADD CONSTRAINT ackore_endorsement_policy_id_84ccbccd_fk_ackore_policy_id FOREIGN KEY (policy_id) REFERENCES public.ackore_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_endorsement ackore_endorsement_user_id_e7fe3175_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement
    ADD CONSTRAINT ackore_endorsement_user_id_e7fe3175_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_endorsement ackore_endorsement_work_id_a23f552a_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_endorsement
    ADD CONSTRAINT ackore_endorsement_work_id_a23f552a_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_coverage ackore_feature_ckind_id_488ffed4_fk; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_coverage
    ADD CONSTRAINT ackore_feature_ckind_id_488ffed4_fk FOREIGN KEY (ckind_id) REFERENCES public.ackore_ckind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_lead ackore_lead_asset_id_ea357531_fk_ackore_asset_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lead
    ADD CONSTRAINT ackore_lead_asset_id_ea357531_fk_ackore_asset_id FOREIGN KEY (asset_id) REFERENCES public.ackore_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_lead ackore_lead_user_id_d7645b46_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_lead
    ADD CONSTRAINT ackore_lead_user_id_d7645b46_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_leadsource ackore_leadsource_lead_id_2c48b2d2_fk_ackore_lead_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_leadsource
    ADD CONSTRAINT ackore_leadsource_lead_id_2c48b2d2_fk_ackore_lead_id FOREIGN KEY (lead_id) REFERENCES public.ackore_lead(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_leadsource ackore_leadsource_source_id_6f6c705d_fk_masters_intermediary_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_leadsource
    ADD CONSTRAINT ackore_leadsource_source_id_6f6c705d_fk_masters_intermediary_id FOREIGN KEY (source_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_plan_addons ackore_plan_addons_coverage_id_6514a038_fk_ackore_coverage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_addons
    ADD CONSTRAINT ackore_plan_addons_coverage_id_6514a038_fk_ackore_coverage_id FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_plan_addons ackore_plan_addons_plan_id_f9874269_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_addons
    ADD CONSTRAINT ackore_plan_addons_plan_id_f9874269_fk_ackore_plan_id FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_plan_included ackore_plan_included_coverage_id_95b10af3_fk_ackore_coverage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_included
    ADD CONSTRAINT ackore_plan_included_coverage_id_95b10af3_fk_ackore_coverage_id FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_plan_included ackore_plan_included_plan_id_0d579771_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan_included
    ADD CONSTRAINT ackore_plan_included_plan_id_0d579771_fk_ackore_plan_id FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_plan ackore_plan_product_id_b7a8dd44_fk_ackore_product_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_plan
    ADD CONSTRAINT ackore_plan_product_id_b7a8dd44_fk_ackore_product_id FOREIGN KEY (product_id) REFERENCES public.ackore_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_policy_addons ackore_policy_addons_coverage_id_7285c6ee_fk_ackore_coverage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy_addons
    ADD CONSTRAINT ackore_policy_addons_coverage_id_7285c6ee_fk_ackore_coverage_id FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_policy_addons ackore_policy_addons_policy_id_c98d4ee2_fk_ackore_policy_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy_addons
    ADD CONSTRAINT ackore_policy_addons_policy_id_c98d4ee2_fk_ackore_policy_id FOREIGN KEY (policy_id) REFERENCES public.ackore_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_policy ackore_policy_payment_id_ceae0426_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy
    ADD CONSTRAINT ackore_policy_payment_id_ceae0426_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_policy ackore_policy_plan_id_4972e39c_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy
    ADD CONSTRAINT ackore_policy_plan_id_4972e39c_fk_ackore_plan_id FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_policy ackore_policy_user_id_333ffc97_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_policy
    ADD CONSTRAINT ackore_policy_user_id_333ffc97_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_product ackore_product_lob_id_12a2f079_fk_ackore_lob_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_product
    ADD CONSTRAINT ackore_product_lob_id_12a2f079_fk_ackore_lob_id FOREIGN KEY (lob_id) REFERENCES public.ackore_lob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_quote_addons ackore_quote_addons_coverage_id_a1c82ec0_fk_ackore_coverage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote_addons
    ADD CONSTRAINT ackore_quote_addons_coverage_id_a1c82ec0_fk_ackore_coverage_id FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_quote_addons ackore_quote_addons_quote_id_cbb88688_fk_ackore_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote_addons
    ADD CONSTRAINT ackore_quote_addons_quote_id_cbb88688_fk_ackore_quote_id FOREIGN KEY (quote_id) REFERENCES public.ackore_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_quote ackore_quote_payment_id_b305cc87_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote
    ADD CONSTRAINT ackore_quote_payment_id_b305cc87_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_quote ackore_quote_plan_id_f6d61373_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote
    ADD CONSTRAINT ackore_quote_plan_id_f6d61373_fk_ackore_plan_id FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_quote ackore_quote_ut_lead_id_f78f10c2_fk_ackore_utlead_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_quote
    ADD CONSTRAINT ackore_quote_ut_lead_id_f78f10c2_fk_ackore_utlead_id FOREIGN KEY (ut_lead_id) REFERENCES public.ackore_utlead(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_relative ackore_relative_relative_id_0c09955f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_relative
    ADD CONSTRAINT ackore_relative_relative_id_0c09955f_fk_users_user_id FOREIGN KEY (relative_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_relative ackore_relative_user_id_6bd7c60e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_relative
    ADD CONSTRAINT ackore_relative_user_id_6bd7c60e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_userclaimrelation ackore_userclaimrelation_claim_id_888dceea_fk_ackore_claim_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userclaimrelation
    ADD CONSTRAINT ackore_userclaimrelation_claim_id_888dceea_fk_ackore_claim_id FOREIGN KEY (claim_id) REFERENCES public.ackore_claim(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_userclaimrelation ackore_userclaimrelation_user_id_b925000c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userclaimrelation
    ADD CONSTRAINT ackore_userclaimrelation_user_id_b925000c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_userpolicyrelation ackore_userpolicyrel_nominee_id_0b569d10_fk_ackore_re; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation
    ADD CONSTRAINT ackore_userpolicyrel_nominee_id_0b569d10_fk_ackore_re FOREIGN KEY (nominee_id) REFERENCES public.ackore_relative(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_userpolicyrelation ackore_userpolicyrel_policy_id_bc438f04_fk_ackore_po; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation
    ADD CONSTRAINT ackore_userpolicyrel_policy_id_bc438f04_fk_ackore_po FOREIGN KEY (policy_id) REFERENCES public.ackore_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_userpolicyrelation ackore_userpolicyrelation_user_id_0c073ffe_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_userpolicyrelation
    ADD CONSTRAINT ackore_userpolicyrelation_user_id_0c073ffe_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_utlead ackore_utlead_asset_id_8c8bf14f_fk_ackore_asset_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_asset_id_8c8bf14f_fk_ackore_asset_id FOREIGN KEY (asset_id) REFERENCES public.ackore_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_utlead ackore_utlead_lead_id_1ac9763c_fk_ackore_lead_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_lead_id_1ac9763c_fk_ackore_lead_id FOREIGN KEY (lead_id) REFERENCES public.ackore_lead(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_utlead ackore_utlead_tracker_id_a404c0ea_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_tracker_id_a404c0ea_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ackore_utlead ackore_utlead_user_id_8a316fce_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ackore_utlead
    ADD CONSTRAINT ackore_utlead_user_id_8a316fce_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activation_campaign activation_campaign_agency_id_844292af_fk_users_company_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_campaign
    ADD CONSTRAINT activation_campaign_agency_id_844292af_fk_users_company_id FOREIGN KEY (agency_id) REFERENCES public.users_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activation_lead activation_lead_agent_id_22cf9e0a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_lead
    ADD CONSTRAINT activation_lead_agent_id_22cf9e0a_fk_users_user_id FOREIGN KEY (agent_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activation_lead activation_lead_campaign_id_da90f02a_fk_activation_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_lead
    ADD CONSTRAINT activation_lead_campaign_id_da90f02a_fk_activation_campaign_id FOREIGN KEY (campaign_id) REFERENCES public.activation_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activation_lead activation_lead_user_id_8c3b198f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.activation_lead
    ADD CONSTRAINT activation_lead_user_id_8c3b198f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_brandmapping akin_brandmapping_brand_id_2cea764a_fk_akin_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brandmapping
    ADD CONSTRAINT akin_brandmapping_brand_id_2cea764a_fk_akin_brand_id FOREIGN KEY (brand_id) REFERENCES public.akin_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_brandmapping akin_brandmapping_intermediary_id_aa149936_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_brandmapping
    ADD CONSTRAINT akin_brandmapping_intermediary_id_aa149936_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_model akin_model_product_id_f70d2b82_fk_akin_product_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_model
    ADD CONSTRAINT akin_model_product_id_f70d2b82_fk_akin_product_id FOREIGN KEY (product_id) REFERENCES public.akin_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_modelmapping akin_modelmapping_intermediary_id_e5df173a_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelmapping
    ADD CONSTRAINT akin_modelmapping_intermediary_id_e5df173a_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_modelmapping akin_modelmapping_model_id_7ec26e76_fk_akin_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelmapping
    ADD CONSTRAINT akin_modelmapping_model_id_7ec26e76_fk_akin_model_id FOREIGN KEY (model_id) REFERENCES public.akin_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_modelnumber akin_modelnumber_model_id_335522d6_fk_akin_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumber
    ADD CONSTRAINT akin_modelnumber_model_id_335522d6_fk_akin_model_id FOREIGN KEY (model_id) REFERENCES public.akin_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_modelnumbermapping akin_modelnumbermapp_intermediary_id_c87eeafd_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumbermapping
    ADD CONSTRAINT akin_modelnumbermapp_intermediary_id_c87eeafd_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_modelnumbermapping akin_modelnumbermapp_model_number_id_904914a9_fk_akin_mode; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_modelnumbermapping
    ADD CONSTRAINT akin_modelnumbermapp_model_number_id_904914a9_fk_akin_mode FOREIGN KEY (model_number_id) REFERENCES public.akin_modelnumber(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: akin_product akin_product_brand_id_4608fbd2_fk_akin_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.akin_product
    ADD CONSTRAINT akin_product_brand_id_4608fbd2_fk_akin_brand_id FOREIGN KEY (brand_id) REFERENCES public.akin_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_mobile_phoneowner amazon_mobile_phoneo_policy_id_f1e87c7d_fk_amazon_mo; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_phoneowner
    ADD CONSTRAINT amazon_mobile_phoneo_policy_id_f1e87c7d_fk_amazon_mo FOREIGN KEY (policy_id) REFERENCES public.amazon_mobile_policy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_mobile_phoneowner amazon_mobile_phoneowner_user_id_9b4da1f0_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_phoneowner
    ADD CONSTRAINT amazon_mobile_phoneowner_user_id_9b4da1f0_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_mobile_policy amazon_mobile_policy_pincode_id_f626d22b_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_pincode_id_f626d22b_fk_masters_pincode_id FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_mobile_policy amazon_mobile_policy_plan_id_080bd552_fk_amazon_mobile_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_plan_id_080bd552_fk_amazon_mobile_plan_id FOREIGN KEY (plan_id) REFERENCES public.amazon_mobile_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_mobile_policy amazon_mobile_policy_user_id_898d1123_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_mobile_policy
    ADD CONSTRAINT amazon_mobile_policy_user_id_898d1123_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_claim amazon_seller_claim_seller_id_3b6f5df2_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claim
    ADD CONSTRAINT amazon_seller_claim_seller_id_3b6f5df2_fk_amazon_se FOREIGN KEY (seller_id) REFERENCES public.amazon_seller_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_claim amazon_seller_claim_shipment_id_b6f63290_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_claim
    ADD CONSTRAINT amazon_seller_claim_shipment_id_b6f63290_fk_amazon_se FOREIGN KEY (shipment_id) REFERENCES public.amazon_seller_shipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_cohort amazon_seller_cohert_shipment_csv_id_719e1917_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_cohort
    ADD CONSTRAINT amazon_seller_cohert_shipment_csv_id_719e1917_fk_amazon_se FOREIGN KEY (shipment_csv_id) REFERENCES public.amazon_seller_shipmentcsv(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_premiumparam amazon_seller_premiu_seller_id_7bb0676b_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_premiumparam
    ADD CONSTRAINT amazon_seller_premiu_seller_id_7bb0676b_fk_amazon_se FOREIGN KEY (seller_id) REFERENCES public.amazon_seller_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_seller amazon_seller_seller_acko_poc_id_bd335be9_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_acko_poc_id_bd335be9_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_seller amazon_seller_seller_poc_id_d307431e_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_poc_id_d307431e_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_seller amazon_seller_seller_user_id_dd51bdf6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_seller
    ADD CONSTRAINT amazon_seller_seller_user_id_dd51bdf6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_settlement amazon_seller_settle_seller_id_ee971f4c_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_settlement
    ADD CONSTRAINT amazon_seller_settle_seller_id_ee971f4c_fk_amazon_se FOREIGN KEY (seller_id) REFERENCES public.amazon_seller_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_shipment amazon_seller_shipme_category_id_d6247c35_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment
    ADD CONSTRAINT amazon_seller_shipme_category_id_d6247c35_fk_amazon_se FOREIGN KEY (category_id) REFERENCES public.amazon_seller_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_shipment amazon_seller_shipme_cohort_id_7d234e40_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment
    ADD CONSTRAINT amazon_seller_shipme_cohort_id_7d234e40_fk_amazon_se FOREIGN KEY (cohort_id) REFERENCES public.amazon_seller_cohort(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_shipment amazon_seller_shipme_seller_id_48d77da6_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_shipment
    ADD CONSTRAINT amazon_seller_shipme_seller_id_48d77da6_fk_amazon_se FOREIGN KEY (seller_id) REFERENCES public.amazon_seller_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: amazon_seller_subscription amazon_seller_subscr_seller_id_76906b38_fk_amazon_se; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.amazon_seller_subscription
    ADD CONSTRAINT amazon_seller_subscr_seller_id_76906b38_fk_amazon_se FOREIGN KEY (seller_id) REFERENCES public.amazon_seller_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_bill audatex_bill_field_id_6221a85e_fk_karmator_workfield_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill
    ADD CONSTRAINT audatex_bill_field_id_6221a85e_fk_karmator_workfield_id FOREIGN KEY (field_id) REFERENCES public.karmator_workfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_bill audatex_bill_task_id_c9f6f127_fk_karmator_task_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill
    ADD CONSTRAINT audatex_bill_task_id_c9f6f127_fk_karmator_task_id FOREIGN KEY (task_id) REFERENCES public.karmator_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_bill audatex_bill_work_id_3b49f255_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_bill
    ADD CONSTRAINT audatex_bill_work_id_3b49f255_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_make_makes audatex_make_makes_from_make_id_446c357f_fk_audatex_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make_makes
    ADD CONSTRAINT audatex_make_makes_from_make_id_446c357f_fk_audatex_make_id FOREIGN KEY (from_make_id) REFERENCES public.audatex_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_make_makes audatex_make_makes_to_make_id_bb714bd6_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_make_makes
    ADD CONSTRAINT audatex_make_makes_to_make_id_bb714bd6_fk_masters_make_id FOREIGN KEY (to_make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_model audatex_model_make_id_33a36d07_fk_audatex_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model
    ADD CONSTRAINT audatex_model_make_id_33a36d07_fk_audatex_make_id FOREIGN KEY (make_id) REFERENCES public.audatex_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_model_models audatex_model_models_from_model_id_0cc9f59f_fk_audatex_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model_models
    ADD CONSTRAINT audatex_model_models_from_model_id_0cc9f59f_fk_audatex_model_id FOREIGN KEY (from_model_id) REFERENCES public.audatex_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_model_models audatex_model_models_to_model_id_35adfdf2_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_model_models
    ADD CONSTRAINT audatex_model_models_to_model_id_35adfdf2_fk_masters_model_id FOREIGN KEY (to_model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_variant audatex_variant_model_id_185fef3a_fk_audatex_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variant
    ADD CONSTRAINT audatex_variant_model_id_185fef3a_fk_audatex_model_id FOREIGN KEY (model_id) REFERENCES public.audatex_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_variantmapping audatex_variantmappi_acko_variant_id_3a56df29_fk_masters_v; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variantmapping
    ADD CONSTRAINT audatex_variantmappi_acko_variant_id_3a56df29_fk_masters_v FOREIGN KEY (acko_variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audatex_variantmapping audatex_variantmappi_audatex_variant_id_875cbff9_fk_audatex_v; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.audatex_variantmapping
    ADD CONSTRAINT audatex_variantmappi_audatex_variant_id_875cbff9_fk_audatex_v FOREIGN KEY (audatex_variant_id) REFERENCES public.audatex_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bike_quote bike_quote_rto_id_93637755_fk_masters_rto_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bike_quote
    ADD CONSTRAINT bike_quote_rto_id_93637755_fk_masters_rto_id FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bike_quote bike_quote_state_id_f7d22324_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bike_quote
    ADD CONSTRAINT bike_quote_state_id_f7d22324_fk_django_content_type_id FOREIGN KEY (state_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bike_quote bike_quote_variant_id_74848da1_fk_masters_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bike_quote
    ADD CONSTRAINT bike_quote_variant_id_74848da1_fk_masters_variant_id FOREIGN KEY (variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bitly_link bitly_link_created_by_id_193e57f8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.bitly_link
    ADD CONSTRAINT bitly_link_created_by_id_193e57f8_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_data c3po_data_segment_id_095cef08_fk_c3po_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_data
    ADD CONSTRAINT c3po_data_segment_id_095cef08_fk_c3po_segment_id FOREIGN KEY (segment_id) REFERENCES public.c3po_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_dimension c3po_dimension_okind_id_29ca6e18_fk_c3po_okind_name; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_dimension
    ADD CONSTRAINT c3po_dimension_okind_id_29ca6e18_fk_c3po_okind_name FOREIGN KEY (okind_id) REFERENCES public.c3po_okind(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_field c3po_field_okind_id_6b5d7e54_fk_c3po_okind_name; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_field
    ADD CONSTRAINT c3po_field_okind_id_6b5d7e54_fk_c3po_okind_name FOREIGN KEY (okind_id) REFERENCES public.c3po_okind(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_filter c3po_filter_segment_id_1a98ca95_fk_c3po_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_filter
    ADD CONSTRAINT c3po_filter_segment_id_1a98ca95_fk_c3po_segment_id FOREIGN KEY (segment_id) REFERENCES public.c3po_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_relation c3po_relation_many_id_fed83ee0_fk_c3po_okind_name; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_relation
    ADD CONSTRAINT c3po_relation_many_id_fed83ee0_fk_c3po_okind_name FOREIGN KEY (many_id) REFERENCES public.c3po_okind(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_relation c3po_relation_one_id_2e8322ab_fk_c3po_okind_name; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_relation
    ADD CONSTRAINT c3po_relation_one_id_2e8322ab_fk_c3po_okind_name FOREIGN KEY (one_id) REFERENCES public.c3po_okind(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c3po_segment c3po_segment_okind_id_f4e279ae_fk_c3po_okind_name; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.c3po_segment
    ADD CONSTRAINT c3po_segment_okind_id_f4e279ae_fk_c3po_okind_name FOREIGN KEY (okind_id) REFERENCES public.c3po_okind(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_makemapping cardekho_makemapping_acko_make_id_956067f6_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_makemapping
    ADD CONSTRAINT cardekho_makemapping_acko_make_id_956067f6_fk_masters_make_id FOREIGN KEY (acko_make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_makemapping cardekho_makemapping_cardekho_make_id_d48b992a_fk_cardekho_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_makemapping
    ADD CONSTRAINT cardekho_makemapping_cardekho_make_id_d48b992a_fk_cardekho_ FOREIGN KEY (cardekho_make_id) REFERENCES public.cardekho_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_model cardekho_model_make_id_ba383289_fk_cardekho_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_model
    ADD CONSTRAINT cardekho_model_make_id_ba383289_fk_cardekho_make_id FOREIGN KEY (make_id) REFERENCES public.cardekho_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_modelcolor cardekho_modelcolor_model_id_157da114_fk_cardekho_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelcolor
    ADD CONSTRAINT cardekho_modelcolor_model_id_157da114_fk_cardekho_model_id FOREIGN KEY (model_id) REFERENCES public.cardekho_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_modelmapping cardekho_modelmappin_acko_model_id_561635fc_fk_masters_m; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelmapping
    ADD CONSTRAINT cardekho_modelmappin_acko_model_id_561635fc_fk_masters_m FOREIGN KEY (acko_model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_modelmapping cardekho_modelmappin_cardekho_model_id_9b0b5c43_fk_cardekho_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_modelmapping
    ADD CONSTRAINT cardekho_modelmappin_cardekho_model_id_9b0b5c43_fk_cardekho_ FOREIGN KEY (cardekho_model_id) REFERENCES public.cardekho_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_variant cardekho_variant_model_id_ac4e8f72_fk_cardekho_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variant
    ADD CONSTRAINT cardekho_variant_model_id_ac4e8f72_fk_cardekho_model_id FOREIGN KEY (model_id) REFERENCES public.cardekho_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_variantmapping cardekho_variantmapp_acko_variant_id_6f155364_fk_masters_v; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variantmapping
    ADD CONSTRAINT cardekho_variantmapp_acko_variant_id_6f155364_fk_masters_v FOREIGN KEY (acko_variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cardekho_variantmapping cardekho_variantmapp_cardekho_variant_id_b5737ec7_fk_cardekho_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.cardekho_variantmapping
    ADD CONSTRAINT cardekho_variantmapp_cardekho_variant_id_b5737ec7_fk_cardekho_ FOREIGN KEY (cardekho_variant_id) REFERENCES public.cardekho_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_make coverfox_make_acko_make_id_b1293228_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_make
    ADD CONSTRAINT coverfox_make_acko_make_id_b1293228_fk_masters_make_id FOREIGN KEY (acko_make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_model coverfox_model_acko_model_id_eddfb488_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_model
    ADD CONSTRAINT coverfox_model_acko_model_id_eddfb488_fk_masters_model_id FOREIGN KEY (acko_model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_model coverfox_model_make_id_2ea9e36f_fk_coverfox_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_model
    ADD CONSTRAINT coverfox_model_make_id_2ea9e36f_fk_coverfox_make_id FOREIGN KEY (make_id) REFERENCES public.coverfox_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_variant_acko_variants coverfox_variant_ack_from_variant_id_5c4ec4c9_fk_coverfox_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant_acko_variants
    ADD CONSTRAINT coverfox_variant_ack_from_variant_id_5c4ec4c9_fk_coverfox_ FOREIGN KEY (from_variant_id) REFERENCES public.coverfox_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_variant_acko_variants coverfox_variant_ack_to_variant_id_91ef780d_fk_masters_v; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant_acko_variants
    ADD CONSTRAINT coverfox_variant_ack_to_variant_id_91ef780d_fk_masters_v FOREIGN KEY (to_variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coverfox_variant coverfox_variant_model_id_73677704_fk_coverfox_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.coverfox_variant
    ADD CONSTRAINT coverfox_variant_model_id_73677704_fk_coverfox_model_id FOREIGN KEY (model_id) REFERENCES public.coverfox_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devops_deployment devops_deployment_user_id_7d6f9fab_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.devops_deployment
    ADD CONSTRAINT devops_deployment_user_id_7d6f9fab_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: explorer_query explorer_query_created_by_user_id_182dd868_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_query
    ADD CONSTRAINT explorer_query_created_by_user_id_182dd868_fk_users_user_id FOREIGN KEY (created_by_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: explorer_querylog explorer_querylog_query_id_1635a6b4_fk_explorer_query_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_querylog
    ADD CONSTRAINT explorer_querylog_query_id_1635a6b4_fk_explorer_query_id FOREIGN KEY (query_id) REFERENCES public.explorer_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: explorer_querylog explorer_querylog_run_by_user_id_cf26a49f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.explorer_querylog
    ADD CONSTRAINT explorer_querylog_run_by_user_id_cf26a49f_fk_users_user_id FOREIGN KEY (run_by_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_fastlane fastlane_fastlane_variant_id_4cf3bc8b_fk_masters_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_fastlane
    ADD CONSTRAINT fastlane_fastlane_variant_id_4cf3bc8b_fk_masters_variant_id FOREIGN KEY (variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_make_acko_makes fastlane_make_acko_m_from_make_id_78e2ecc2_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_acko_makes
    ADD CONSTRAINT fastlane_make_acko_m_from_make_id_78e2ecc2_fk_fastlane_ FOREIGN KEY (from_make_id) REFERENCES public.fastlane_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_make_acko_makes fastlane_make_acko_makes_to_make_id_4f8720df_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_acko_makes
    ADD CONSTRAINT fastlane_make_acko_makes_to_make_id_4f8720df_fk_masters_make_id FOREIGN KEY (to_make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_make_cf_makes fastlane_make_cf_mak_from_make_id_87ef92a6_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_cf_makes
    ADD CONSTRAINT fastlane_make_cf_mak_from_make_id_87ef92a6_fk_fastlane_ FOREIGN KEY (from_make_id) REFERENCES public.fastlane_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_make_cf_makes fastlane_make_cf_makes_to_make_id_50ff0dd7_fk_coverfox_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_make_cf_makes
    ADD CONSTRAINT fastlane_make_cf_makes_to_make_id_50ff0dd7_fk_coverfox_make_id FOREIGN KEY (to_make_id) REFERENCES public.coverfox_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_model_acko_models fastlane_model_acko__from_model_id_12dfadc8_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_acko_models
    ADD CONSTRAINT fastlane_model_acko__from_model_id_12dfadc8_fk_fastlane_ FOREIGN KEY (from_model_id) REFERENCES public.fastlane_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_model_acko_models fastlane_model_acko__to_model_id_da1d2409_fk_masters_m; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_acko_models
    ADD CONSTRAINT fastlane_model_acko__to_model_id_da1d2409_fk_masters_m FOREIGN KEY (to_model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_model_cf_models fastlane_model_cf_mo_from_model_id_45e64e1f_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_cf_models
    ADD CONSTRAINT fastlane_model_cf_mo_from_model_id_45e64e1f_fk_fastlane_ FOREIGN KEY (from_model_id) REFERENCES public.fastlane_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_model_cf_models fastlane_model_cf_mo_to_model_id_f14c7884_fk_coverfox_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model_cf_models
    ADD CONSTRAINT fastlane_model_cf_mo_to_model_id_f14c7884_fk_coverfox_ FOREIGN KEY (to_model_id) REFERENCES public.coverfox_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_model fastlane_model_make_id_28836c9b_fk_fastlane_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_model
    ADD CONSTRAINT fastlane_model_make_id_28836c9b_fk_fastlane_make_id FOREIGN KEY (make_id) REFERENCES public.fastlane_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_variant_acko_variants fastlane_variant_ack_from_variant_id_6f4d2691_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_acko_variants
    ADD CONSTRAINT fastlane_variant_ack_from_variant_id_6f4d2691_fk_fastlane_ FOREIGN KEY (from_variant_id) REFERENCES public.fastlane_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_variant_acko_variants fastlane_variant_ack_to_variant_id_3a063a7d_fk_masters_v; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_acko_variants
    ADD CONSTRAINT fastlane_variant_ack_to_variant_id_3a063a7d_fk_masters_v FOREIGN KEY (to_variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_variant_cf_variants fastlane_variant_cf__from_variant_id_069d436f_fk_fastlane_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_cf_variants
    ADD CONSTRAINT fastlane_variant_cf__from_variant_id_069d436f_fk_fastlane_ FOREIGN KEY (from_variant_id) REFERENCES public.fastlane_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_variant_cf_variants fastlane_variant_cf__to_variant_id_86ab91d2_fk_coverfox_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant_cf_variants
    ADD CONSTRAINT fastlane_variant_cf__to_variant_id_86ab91d2_fk_coverfox_ FOREIGN KEY (to_variant_id) REFERENCES public.coverfox_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fastlane_variant fastlane_variant_model_id_db268b3d_fk_fastlane_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.fastlane_variant
    ADD CONSTRAINT fastlane_variant_model_id_db268b3d_fk_fastlane_model_id FOREIGN KEY (model_id) REFERENCES public.fastlane_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_airport flightdb_airport_city_id_d0cbdd1d_fk; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_airport
    ADD CONSTRAINT flightdb_airport_city_id_d0cbdd1d_fk FOREIGN KEY (city_id) REFERENCES public.flightdb_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_flight flightdb_flight_airline_id_c0241afa_fk_flightdb_airline_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flight
    ADD CONSTRAINT flightdb_flight_airline_id_c0241afa_fk_flightdb_airline_id FOREIGN KEY (airline_id) REFERENCES public.flightdb_airline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_flight flightdb_flight_arrival_airport_id_9ccfd8bf_fk_flightdb_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flight
    ADD CONSTRAINT flightdb_flight_arrival_airport_id_9ccfd8bf_fk_flightdb_ FOREIGN KEY (arrival_airport_id) REFERENCES public.flightdb_airport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_flight flightdb_flight_departure_airport_id_9b7b99ea_fk_flightdb_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flight
    ADD CONSTRAINT flightdb_flight_departure_airport_id_9b7b99ea_fk_flightdb_ FOREIGN KEY (departure_airport_id) REFERENCES public.flightdb_airport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_flightinstance flightdb_flightinsta_flight_id_fff9a39f_fk_flightdb_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstance
    ADD CONSTRAINT flightdb_flightinsta_flight_id_fff9a39f_fk_flightdb_ FOREIGN KEY (flight_id) REFERENCES public.flightdb_flight(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flightdb_flightinstancehistory flightdb_flightinsta_flight_instance_id_27928e8a_fk_flightdb_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.flightdb_flightinstancehistory
    ADD CONSTRAINT flightdb_flightinsta_flight_instance_id_27928e8a_fk_flightdb_ FOREIGN KEY (flight_instance_id) REFERENCES public.flightdb_flightinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part iet_part_created_by_id_016d5e48_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part
    ADD CONSTRAINT iet_part_created_by_id_016d5e48_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_makes iet_part_makes_make_id_9d1197bd_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_makes
    ADD CONSTRAINT iet_part_makes_make_id_9d1197bd_fk_masters_make_id FOREIGN KEY (make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_makes iet_part_makes_part_id_d37b60a3_fk_iet_part_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_makes
    ADD CONSTRAINT iet_part_makes_part_id_d37b60a3_fk_iet_part_id FOREIGN KEY (part_id) REFERENCES public.iet_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_models iet_part_models_model_id_12b0e103_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_models
    ADD CONSTRAINT iet_part_models_model_id_12b0e103_fk_masters_model_id FOREIGN KEY (model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_models iet_part_models_part_id_701230f8_fk_iet_part_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_models
    ADD CONSTRAINT iet_part_models_part_id_701230f8_fk_iet_part_id FOREIGN KEY (part_id) REFERENCES public.iet_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_variants iet_part_variants_part_id_7ced3aac_fk_iet_part_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_variants
    ADD CONSTRAINT iet_part_variants_part_id_7ced3aac_fk_iet_part_id FOREIGN KEY (part_id) REFERENCES public.iet_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part_variants iet_part_variants_variant_id_c5af8851_fk_masters_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part_variants
    ADD CONSTRAINT iet_part_variants_variant_id_c5af8851_fk_masters_variant_id FOREIGN KEY (variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iet_part iet_part_verified_by_id_57eb6c4e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.iet_part
    ADD CONSTRAINT iet_part_verified_by_id_57eb6c4e_fk_users_user_id FOREIGN KEY (verified_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_downs intranet_file_downs_file_id_db25bf48_fk_intranet_file_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_downs
    ADD CONSTRAINT intranet_file_downs_file_id_db25bf48_fk_intranet_file_id FOREIGN KEY (file_id) REFERENCES public.intranet_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_downs intranet_file_downs_oentity_id_65c576b1_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_downs
    ADD CONSTRAINT intranet_file_downs_oentity_id_65c576b1_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_selfs intranet_file_selfs_file_id_340dbc9a_fk_intranet_file_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_selfs
    ADD CONSTRAINT intranet_file_selfs_file_id_340dbc9a_fk_intranet_file_id FOREIGN KEY (file_id) REFERENCES public.intranet_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_selfs intranet_file_selfs_oentity_id_f9c1652d_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_selfs
    ADD CONSTRAINT intranet_file_selfs_oentity_id_f9c1652d_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_ups intranet_file_ups_file_id_227f6a21_fk_intranet_file_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_ups
    ADD CONSTRAINT intranet_file_ups_file_id_227f6a21_fk_intranet_file_id FOREIGN KEY (file_id) REFERENCES public.intranet_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_file_ups intranet_file_ups_oentity_id_b4227b9b_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_file_ups
    ADD CONSTRAINT intranet_file_ups_oentity_id_b4227b9b_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_roomreservation intranet_roomreservation_room_id_193a8d99_fk_intranet_room_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_roomreservation
    ADD CONSTRAINT intranet_roomreservation_room_id_193a8d99_fk_intranet_room_id FOREIGN KEY (room_id) REFERENCES public.intranet_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intranet_roomreservation intranet_roomreservation_user_id_f28b99cd_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.intranet_roomreservation
    ADD CONSTRAINT intranet_roomreservation_user_id_f28b99cd_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_qtime karmator_qtime_skill_id_7bf9cec8_fk_users_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_skill_id_7bf9cec8_fk_users_skill_id FOREIGN KEY (skill_id) REFERENCES public.users_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_qtime karmator_qtime_task_id_47b0cc5b_fk_karmator_task_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_task_id_47b0cc5b_fk_karmator_task_id FOREIGN KEY (task_id) REFERENCES public.karmator_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_qtime karmator_qtime_user_id_29fe8bae_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_user_id_29fe8bae_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_qtime karmator_qtime_work_id_d7fe7675_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_qtime
    ADD CONSTRAINT karmator_qtime_work_id_d7fe7675_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_task karmator_task_done_id_4714ff18_fk_computron_kdone_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_done_id_4714ff18_fk_computron_kdone_id FOREIGN KEY (done_id) REFERENCES public.computron_kdone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_task karmator_task_kind_id_cab50f44_fk_karmator_workkind_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_kind_id_cab50f44_fk_karmator_workkind_id FOREIGN KEY (kind_id) REFERENCES public.karmator_workkind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_task karmator_task_query_id_7fd9b936_fk_computron_kquery_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_query_id_7fd9b936_fk_computron_kquery_id FOREIGN KEY (query_id) REFERENCES public.computron_kquery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_task karmator_task_skill_id_13cce2b6_fk_users_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_task
    ADD CONSTRAINT karmator_task_skill_id_13cce2b6_fk_users_skill_id FOREIGN KEY (skill_id) REFERENCES public.users_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_work karmator_work_kind_id_91043365_fk_karmator_workkind_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_work
    ADD CONSTRAINT karmator_work_kind_id_91043365_fk_karmator_workkind_id FOREIGN KEY (kind_id) REFERENCES public.karmator_workkind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workfield karmator_workfield_kind_id_4b3285de_fk_karmator_workkind_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield
    ADD CONSTRAINT karmator_workfield_kind_id_4b3285de_fk_karmator_workkind_id FOREIGN KEY (kind_id) REFERENCES public.karmator_workkind(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workfield_validators karmator_workfield_v_kvalidator_id_38997e27_fk_computron; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield_validators
    ADD CONSTRAINT karmator_workfield_v_kvalidator_id_38997e27_fk_computron FOREIGN KEY (kvalidator_id) REFERENCES public.computron_kvalidator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workfield_validators karmator_workfield_v_workfield_id_a78e61fb_fk_karmator_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workfield_validators
    ADD CONSTRAINT karmator_workfield_v_workfield_id_a78e61fb_fk_karmator_ FOREIGN KEY (workfield_id) REFERENCES public.karmator_workfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workhistory karmator_workhistory_task_id_e89e9d9d_fk_karmator_task_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory
    ADD CONSTRAINT karmator_workhistory_task_id_e89e9d9d_fk_karmator_task_id FOREIGN KEY (task_id) REFERENCES public.karmator_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workhistory karmator_workhistory_tracker_id_4b4d17db_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory
    ADD CONSTRAINT karmator_workhistory_tracker_id_4b4d17db_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workhistory karmator_workhistory_user_id_6fa1c888_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory
    ADD CONSTRAINT karmator_workhistory_user_id_6fa1c888_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workhistory karmator_workhistory_work_id_a2367dc5_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workhistory
    ADD CONSTRAINT karmator_workhistory_work_id_a2367dc5_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: karmator_workkind karmator_workkind_status_field_id_4a632e14_fk_karmator_; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.karmator_workkind
    ADD CONSTRAINT karmator_workkind_status_field_id_4a632e14_fk_karmator_ FOREIGN KEY (status_field_id) REFERENCES public.karmator_workfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_address masters_address_pincode_id_0662971d_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_address
    ADD CONSTRAINT masters_address_pincode_id_0662971d_fk_masters_pincode_id FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_address masters_address_user_id_4df23c29_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_address
    ADD CONSTRAINT masters_address_user_id_4df23c29_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_equipmentclip masters_equipmentcli_partner_id_2271b0f5_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_equipmentclip
    ADD CONSTRAINT masters_equipmentcli_partner_id_2271b0f5_fk_masters_i FOREIGN KEY (partner_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_establishment masters_establishmen_legal_entity_id_cee926e7_fk_acko_lega; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishmen_legal_entity_id_cee926e7_fk_acko_lega FOREIGN KEY (legal_entity_id) REFERENCES public.acko_legalentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_establishment masters_establishment_acko_poc_id_7b4ae63c_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishment_acko_poc_id_7b4ae63c_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_establishment masters_establishment_pincode_id_39ab8ebd_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishment_pincode_id_39ab8ebd_fk_masters_pincode_id FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_establishment masters_establishment_poc_id_9d9f2da4_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_establishment
    ADD CONSTRAINT masters_establishment_poc_id_9d9f2da4_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_garage masters_garage_created_by_id_84763a33_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage
    ADD CONSTRAINT masters_garage_created_by_id_84763a33_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_garage_makes masters_garage_makes_garage_id_49f77b7d_fk_masters_garage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage_makes
    ADD CONSTRAINT masters_garage_makes_garage_id_49f77b7d_fk_masters_garage_id FOREIGN KEY (garage_id) REFERENCES public.masters_garage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_garage_makes masters_garage_makes_make_id_423a0048_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garage_makes
    ADD CONSTRAINT masters_garage_makes_make_id_423a0048_fk_masters_make_id FOREIGN KEY (make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_garagetimings masters_garagetimings_garage_id_becda48a_fk_masters_garage_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_garagetimings
    ADD CONSTRAINT masters_garagetimings_garage_id_becda48a_fk_masters_garage_id FOREIGN KEY (garage_id) REFERENCES public.masters_garage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary masters_intermediary_acko_license_id_b69466af_fk_ackore_ac; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_acko_license_id_b69466af_fk_ackore_ac FOREIGN KEY (acko_license_id) REFERENCES public.ackore_ackoagentlicense(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_features masters_intermediary_coverage_id_75817d1d_fk_ackore_co; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_features
    ADD CONSTRAINT masters_intermediary_coverage_id_75817d1d_fk_ackore_co FOREIGN KEY (coverage_id) REFERENCES public.ackore_coverage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_rtos masters_intermediary_intermediary_id_76cd2de1_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_rtos
    ADD CONSTRAINT masters_intermediary_intermediary_id_76cd2de1_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_plans masters_intermediary_intermediary_id_9839659f_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_plans
    ADD CONSTRAINT masters_intermediary_intermediary_id_9839659f_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_features masters_intermediary_intermediary_id_98ec41ed_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_features
    ADD CONSTRAINT masters_intermediary_intermediary_id_98ec41ed_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediaryrtoplanmapping masters_intermediary_intermediary_id_ada7534a_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediaryrtoplanmapping
    ADD CONSTRAINT masters_intermediary_intermediary_id_ada7534a_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary masters_intermediary_key_id_d8a194a4_fk_acko_publickey_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_key_id_d8a194a4_fk_acko_publickey_id FOREIGN KEY (key_id) REFERENCES public.acko_publickey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary masters_intermediary_legal_entity_id_186b4664_fk_acko_lega; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_legal_entity_id_186b4664_fk_acko_lega FOREIGN KEY (legal_entity_id) REFERENCES public.acko_legalentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary masters_intermediary_parent_id_c2dbf6a1_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary
    ADD CONSTRAINT masters_intermediary_parent_id_c2dbf6a1_fk_masters_i FOREIGN KEY (parent_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediaryrtoplanmapping masters_intermediary_plan_id_cefcac87_fk_ackore_pl; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediaryrtoplanmapping
    ADD CONSTRAINT masters_intermediary_plan_id_cefcac87_fk_ackore_pl FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_plans masters_intermediary_plans_plan_id_cd55ac28_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_plans
    ADD CONSTRAINT masters_intermediary_plans_plan_id_cd55ac28_fk_ackore_plan_id FOREIGN KEY (plan_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediaryrtoplanmapping masters_intermediary_rto_id_6646c00d_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediaryrtoplanmapping
    ADD CONSTRAINT masters_intermediary_rto_id_6646c00d_fk_masters_r FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_intermediary_rtos masters_intermediary_rtos_rto_id_9915af43_fk_masters_rto_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_intermediary_rtos
    ADD CONSTRAINT masters_intermediary_rtos_rto_id_9915af43_fk_masters_rto_id FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_logistics masters_logistics_acko_poc_id_82332d20_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics
    ADD CONSTRAINT masters_logistics_acko_poc_id_82332d20_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_logistics_pincode masters_logistics_pi_logistics_id_89a77411_fk_masters_l; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics_pincode
    ADD CONSTRAINT masters_logistics_pi_logistics_id_89a77411_fk_masters_l FOREIGN KEY (logistics_id) REFERENCES public.masters_logistics(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_logistics_pincode masters_logistics_pi_pincode_id_9369b56b_fk_masters_p; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics_pincode
    ADD CONSTRAINT masters_logistics_pi_pincode_id_9369b56b_fk_masters_p FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_logistics masters_logistics_poc_id_a56d2927_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_logistics
    ADD CONSTRAINT masters_logistics_poc_id_a56d2927_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_model masters_model_make_id_1629ad0d_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_model
    ADD CONSTRAINT masters_model_make_id_1629ad0d_fk_masters_make_id FOREIGN KEY (make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_model masters_model_parent_id_bb9d5432_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_model
    ADD CONSTRAINT masters_model_parent_id_bb9d5432_fk_masters_model_id FOREIGN KEY (parent_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_modelcolor masters_modelcolor_model_id_e363c5c5_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_modelcolor
    ADD CONSTRAINT masters_modelcolor_model_id_e363c5c5_fk_masters_model_id FOREIGN KEY (model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_phonemodel masters_phonemodel_make_id_a9ee7a09_fk_masters_phonemake_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_phonemodel
    ADD CONSTRAINT masters_phonemodel_make_id_a9ee7a09_fk_masters_phonemake_id FOREIGN KEY (make_id) REFERENCES public.masters_phonemake(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_pincode_regions masters_pincode_regi_pincode_id_1f73da17_fk_masters_p; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode_regions
    ADD CONSTRAINT masters_pincode_regi_pincode_id_1f73da17_fk_masters_p FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_pincode_regions masters_pincode_regions_region_id_467584b9_fk_masters_region_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_pincode_regions
    ADD CONSTRAINT masters_pincode_regions_region_id_467584b9_fk_masters_region_id FOREIGN KEY (region_id) REFERENCES public.masters_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_region_parents masters_region_paren_from_region_id_39e43a78_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region_parents
    ADD CONSTRAINT masters_region_paren_from_region_id_39e43a78_fk_masters_r FOREIGN KEY (from_region_id) REFERENCES public.masters_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_region_parents masters_region_paren_to_region_id_6003a41b_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_region_parents
    ADD CONSTRAINT masters_region_paren_to_region_id_6003a41b_fk_masters_r FOREIGN KEY (to_region_id) REFERENCES public.masters_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rto masters_rto_location_pincode_id_e8ca31bd_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rto
    ADD CONSTRAINT masters_rto_location_pincode_id_e8ca31bd_fk_masters_pincode_id FOREIGN KEY (location_pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rtocitymapping_rtos masters_rtocitymappi_rtocitymapping_id_5058eaf2_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping_rtos
    ADD CONSTRAINT masters_rtocitymappi_rtocitymapping_id_5058eaf2_fk_masters_r FOREIGN KEY (rtocitymapping_id) REFERENCES public.masters_rtocitymapping(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rtocitymapping masters_rtocitymapping_city_id_e43f218e_fk_masters_region_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping
    ADD CONSTRAINT masters_rtocitymapping_city_id_e43f218e_fk_masters_region_id FOREIGN KEY (city_id) REFERENCES public.masters_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rtocitymapping_rtos masters_rtocitymapping_rtos_rto_id_f409cd13_fk_masters_rto_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtocitymapping_rtos
    ADD CONSTRAINT masters_rtocitymapping_rtos_rto_id_f409cd13_fk_masters_rto_id FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rtopincodemapping masters_rtopincodema_pincode_id_afea6a03_fk_masters_p; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping
    ADD CONSTRAINT masters_rtopincodema_pincode_id_afea6a03_fk_masters_p FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_rtopincodemapping masters_rtopincodemapping_rto_id_5c43537d_fk_masters_rto_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_rtopincodemapping
    ADD CONSTRAINT masters_rtopincodemapping_rto_id_5c43537d_fk_masters_rto_id FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_servicecenter_region masters_servicecente_region_id_73e1c15a_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter_region
    ADD CONSTRAINT masters_servicecente_region_id_73e1c15a_fk_masters_r FOREIGN KEY (region_id) REFERENCES public.masters_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_servicecenter_region masters_servicecente_servicecenter_id_d30595ef_fk_masters_s; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter_region
    ADD CONSTRAINT masters_servicecente_servicecenter_id_d30595ef_fk_masters_s FOREIGN KEY (servicecenter_id) REFERENCES public.masters_servicecenter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_servicecenter masters_servicecenter_acko_poc_id_f6d27219_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter
    ADD CONSTRAINT masters_servicecenter_acko_poc_id_f6d27219_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_servicecenter masters_servicecenter_pincode_id_e222f80b_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter
    ADD CONSTRAINT masters_servicecenter_pincode_id_e222f80b_fk_masters_pincode_id FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_servicecenter masters_servicecenter_poc_id_654dcfc4_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_servicecenter
    ADD CONSTRAINT masters_servicecenter_poc_id_654dcfc4_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masters_variant masters_variant_model_id_384783b2_fk_masters_model_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.masters_variant
    ADD CONSTRAINT masters_variant_model_id_384783b2_fk_masters_model_id FOREIGN KEY (model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_lead motor_lead_user_id_021c2133_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_lead
    ADD CONSTRAINT motor_lead_user_id_021c2133_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_lead motor_lead_vehicle_id_71aa06fd_fk_motor_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_lead
    ADD CONSTRAINT motor_lead_vehicle_id_71aa06fd_fk_motor_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.motor_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_leadsource motor_leadsource_lead_id_2df4eab8_fk_motor_lead_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_leadsource
    ADD CONSTRAINT motor_leadsource_lead_id_2df4eab8_fk_motor_lead_id FOREIGN KEY (lead_id) REFERENCES public.motor_lead(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_leadsource motor_leadsource_source_id_ab3169fd_fk_masters_intermediary_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_leadsource
    ADD CONSTRAINT motor_leadsource_source_id_ab3169fd_fk_masters_intermediary_id FOREIGN KEY (source_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_policy motor_policy_customer_id_7894ca5a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_customer_id_7894ca5a_fk_users_user_id FOREIGN KEY (customer_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_policy motor_policy_partner_id_dcf8370c_fk_masters_intermediary_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_partner_id_dcf8370c_fk_masters_intermediary_id FOREIGN KEY (partner_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_policy motor_policy_payment_id_9312622f_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_payment_id_9312622f_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_policy motor_policy_policy_holder_id_4ed9b9d9_fk_acko_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_policy_holder_id_4ed9b9d9_fk_acko_contact_id FOREIGN KEY (policy_holder_id) REFERENCES public.acko_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_policy motor_policy_quote_id_6fbb9ad3_fk_motor_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_policy
    ADD CONSTRAINT motor_policy_quote_id_6fbb9ad3_fk_motor_quote_id FOREIGN KEY (quote_id) REFERENCES public.motor_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_appointee_relationsh_873b5fed_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_appointee_relationsh_873b5fed_fk_masters_r FOREIGN KEY (appointee_relationship_id) REFERENCES public.masters_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_color_code_id_e42b557d_fk_masters_modelcolor_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_color_code_id_e42b557d_fk_masters_modelcolor_id FOREIGN KEY (color_code_id) REFERENCES public.masters_modelcolor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_edu_qualification_id_ec8f01cb_fk; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_edu_qualification_id_ec8f01cb_fk FOREIGN KEY (edu_qualification_id) REFERENCES public.masters_eduqual(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_external_bifuel_type_da2d1128_fk_masters_e; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_external_bifuel_type_da2d1128_fk_masters_e FOREIGN KEY (external_bifuel_type_id) REFERENCES public.masters_externalbifueltype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_financing_type_id_dd8f2e6f_fk_masters_f; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_financing_type_id_dd8f2e6f_fk_masters_f FOREIGN KEY (financing_type_id) REFERENCES public.masters_financingtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_gender_id_6aa042ed_fk_masters_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_gender_id_6aa042ed_fk_masters_gender_id FOREIGN KEY (gender_id) REFERENCES public.masters_gender(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_lead_source_id_e2d6cdce_fk_motor_leadsource_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_lead_source_id_e2d6cdce_fk_motor_leadsource_id FOREIGN KEY (lead_source_id) REFERENCES public.motor_leadsource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_nature_of_goods_id_2893f043_fk_masters_g; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_nature_of_goods_id_2893f043_fk_masters_g FOREIGN KEY (nature_of_goods_id) REFERENCES public.masters_goodsnature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_nominee_relationship_7d4f2b3c_fk_masters_r; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_nominee_relationship_7d4f2b3c_fk_masters_r FOREIGN KEY (nominee_relationship_id) REFERENCES public.masters_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_partner_id_d72309b8_fk_masters_intermediary_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_partner_id_d72309b8_fk_masters_intermediary_id FOREIGN KEY (partner_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_payment_id_34c1fca1_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_payment_id_34c1fca1_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_pincode_id_d134f51b_fk_masters_pincode_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_pincode_id_d134f51b_fk_masters_pincode_id FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_plan_recommended_id_dc5f3533_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_plan_recommended_id_dc5f3533_fk_ackore_plan_id FOREIGN KEY (plan_recommended_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_plan_selected_id_16ce5e1a_fk_ackore_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_plan_selected_id_16ce5e1a_fk_ackore_plan_id FOREIGN KEY (plan_selected_id) REFERENCES public.ackore_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_previous_policy_type_d0e0df90_fk_masters_p; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_previous_policy_type_d0e0df90_fk_masters_p FOREIGN KEY (previous_policy_type_id) REFERENCES public.masters_previouspolicytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_product_id_49ea7003_fk_ackore_product_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_product_id_49ea7003_fk_ackore_product_id FOREIGN KEY (product_id) REFERENCES public.ackore_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_profession_id_075601ad_fk; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_profession_id_075601ad_fk FOREIGN KEY (profession_id) REFERENCES public.masters_profession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_rto_id_e2cb7695_fk_masters_rto_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_rto_id_e2cb7695_fk_masters_rto_id FOREIGN KEY (rto_id) REFERENCES public.masters_rto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_title_id_a2820cf5_fk_masters_title_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_title_id_a2820cf5_fk_masters_title_id FOREIGN KEY (title_id) REFERENCES public.masters_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_utlead_id_c5d38bd2_fk_motor_utlead_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_utlead_id_c5d38bd2_fk_motor_utlead_id FOREIGN KEY (utlead_id) REFERENCES public.motor_utlead(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_variant_id_dbf7f497_fk_masters_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_variant_id_dbf7f497_fk_masters_variant_id FOREIGN KEY (variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_quote motor_quote_vehicle_id_c326020a_fk_motor_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_quote
    ADD CONSTRAINT motor_quote_vehicle_id_c326020a_fk_motor_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.motor_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_ratings_pincodezone motor_ratings_pincod_pincode_id_4bf949db_fk_masters_p; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_pincodezone
    ADD CONSTRAINT motor_ratings_pincod_pincode_id_4bf949db_fk_masters_p FOREIGN KEY (pincode_id) REFERENCES public.masters_pincode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_ratings_pincodezone motor_ratings_pincod_zone_id_17d4c6e2_fk_motor_rat; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_pincodezone
    ADD CONSTRAINT motor_ratings_pincod_zone_id_17d4c6e2_fk_motor_rat FOREIGN KEY (zone_id) REFERENCES public.motor_ratings_zone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_ratings_uwdiscretion motor_ratings_uwdisc_model_id_c5539b64_fk_masters_m; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion
    ADD CONSTRAINT motor_ratings_uwdisc_model_id_c5539b64_fk_masters_m FOREIGN KEY (model_id) REFERENCES public.masters_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_ratings_uwdiscretion motor_ratings_uwdisc_zone_id_d6ac0a0d_fk_motor_rat; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion
    ADD CONSTRAINT motor_ratings_uwdisc_zone_id_d6ac0a0d_fk_motor_rat FOREIGN KEY (zone_id) REFERENCES public.motor_ratings_zone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_ratings_uwdiscretion motor_ratings_uwdiscretion_make_id_67ec4742_fk_masters_make_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_ratings_uwdiscretion
    ADD CONSTRAINT motor_ratings_uwdiscretion_make_id_67ec4742_fk_masters_make_id FOREIGN KEY (make_id) REFERENCES public.masters_make(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_utlead motor_utlead_tracker_id_ae0d4c4a_fk_acko_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_utlead
    ADD CONSTRAINT motor_utlead_tracker_id_ae0d4c4a_fk_acko_tracker_id FOREIGN KEY (tracker_id) REFERENCES public.acko_tracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_utlead motor_utlead_user_id_615575c7_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_utlead
    ADD CONSTRAINT motor_utlead_user_id_615575c7_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_utlead motor_utlead_vehicle_id_3b4dd318_fk_motor_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_utlead
    ADD CONSTRAINT motor_utlead_vehicle_id_3b4dd318_fk_motor_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.motor_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_vehicle motor_vehicle_variant_id_03de24fe_fk_masters_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_vehicle
    ADD CONSTRAINT motor_vehicle_variant_id_03de24fe_fk_masters_variant_id FOREIGN KEY (variant_id) REFERENCES public.masters_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: motor_vehicle motor_vehicle_work_id_ea2eb264_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.motor_vehicle
    ADD CONSTRAINT motor_vehicle_work_id_ea2eb264_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_invoice ola_invoice_invoice_id_bac752ad_fk_acko_gstinvoice_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_invoice
    ADD CONSTRAINT ola_invoice_invoice_id_bac752ad_fk_acko_gstinvoice_id FOREIGN KEY (invoice_id) REFERENCES public.acko_gstinvoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_trip ola_trip_corporate_invoice_id_8559c95d_fk_ola_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_corporate_invoice_id_8559c95d_fk_ola_invoice_id FOREIGN KEY (corporate_invoice_id) REFERENCES public.ola_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_trip ola_trip_driver_id_1ec66e9e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_driver_id_1ec66e9e_fk_auth_user_id FOREIGN KEY (driver_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_trip ola_trip_policy_id_8f5e6eb0_fk_acko_grouppolicy_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_policy_id_8f5e6eb0_fk_acko_grouppolicy_id FOREIGN KEY (policy_id) REFERENCES public.acko_grouppolicy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_trip ola_trip_user_id_40d43f67_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_user_id_40d43f67_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ola_trip ola_trip_vehicle_id_33b9253a_fk_acko_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.ola_trip
    ADD CONSTRAINT ola_trip_vehicle_id_33b9253a_fk_acko_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.acko_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_payment payments_payment_mandate_id_67d3a364_fk_subscription_mandate_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_payment
    ADD CONSTRAINT payments_payment_mandate_id_67d3a364_fk_subscription_mandate_id FOREIGN KEY (mandate_id) REFERENCES public.subscription_mandate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_payment payments_payment_user_id_f9db060a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_payment
    ADD CONSTRAINT payments_payment_user_id_f9db060a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_refund payments_refund_payment_id_a70693f7_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_refund
    ADD CONSTRAINT payments_refund_payment_id_a70693f7_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_refund payments_refund_user_id_024e7071_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_refund
    ADD CONSTRAINT payments_refund_user_id_024e7071_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_settlement payments_settlement_payment_id_a61afbdf_fk_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.payments_settlement
    ADD CONSTRAINT payments_settlement_payment_id_a61afbdf_fk_payments_payment_id FOREIGN KEY (payment_id) REFERENCES public.payments_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_cannedresponse r2d2_cannedresponse_email_id_0d4aa9d5_fk_users_email_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse
    ADD CONSTRAINT r2d2_cannedresponse_email_id_0d4aa9d5_fk_users_email_id FOREIGN KEY (email_id) REFERENCES public.users_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_cannedresponse r2d2_cannedresponse_phone_id_a0c1bdb6_fk_users_phone_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse
    ADD CONSTRAINT r2d2_cannedresponse_phone_id_a0c1bdb6_fk_users_phone_id FOREIGN KEY (phone_id) REFERENCES public.users_phone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_cannedresponse r2d2_cannedresponse_sender_id_366d335e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse
    ADD CONSTRAINT r2d2_cannedresponse_sender_id_366d335e_fk_users_user_id FOREIGN KEY (sender_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_cannedresponse r2d2_cannedresponse_user_id_3fbc37ee_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_cannedresponse
    ADD CONSTRAINT r2d2_cannedresponse_user_id_3fbc37ee_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_crm_state_id_7b10443f_fk_c3po_dimension_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_crm_state_id_7b10443f_fk_c3po_dimension_id FOREIGN KEY (crm_state_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_first_call_dispositi_2456f003_fk_c3po_dime; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_first_call_dispositi_2456f003_fk_c3po_dime FOREIGN KEY (first_call_disposition_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_fuel_type_id_3b4a48e2_fk_c3po_dimension_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_fuel_type_id_3b4a48e2_fk_c3po_dimension_id FOREIGN KEY (fuel_type_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_last_call_dispositio_a0b22c9b_fk_c3po_dime; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_last_call_dispositio_a0b22c9b_fk_c3po_dime FOREIGN KEY (last_call_disposition_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_last_call_sub_dispos_6e553f55_fk_c3po_dime; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_last_call_sub_dispos_6e553f55_fk_c3po_dime FOREIGN KEY (last_call_sub_disposition_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_lead_creator_id_87a588fb_fk_c3po_dimension_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_lead_creator_id_87a588fb_fk_c3po_dimension_id FOREIGN KEY (lead_creator_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_lead_type_id_53791f20_fk_c3po_dimension_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_lead_type_id_53791f20_fk_c3po_dimension_id FOREIGN KEY (lead_type_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_carlead r2d2_carlead_product_state_id_f1a1814e_fk_c3po_dimension_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_carlead
    ADD CONSTRAINT r2d2_carlead_product_state_id_f1a1814e_fk_c3po_dimension_id FOREIGN KEY (product_state_id) REFERENCES public.c3po_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_event r2d2_event_visit_id_663b9c08_fk_acko_visit_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_event
    ADD CONSTRAINT r2d2_event_visit_id_663b9c08_fk_acko_visit_id FOREIGN KEY (visit_id) REFERENCES public.acko_visit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_notification r2d2_notification_event_id_664a6b99_fk_r2d2_event_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_notification
    ADD CONSTRAINT r2d2_notification_event_id_664a6b99_fk_r2d2_event_id FOREIGN KEY (event_id) REFERENCES public.r2d2_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r2d2_notification r2d2_notification_raction_id_d51206dd_fk_computron_raction_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.r2d2_notification
    ADD CONSTRAINT r2d2_notification_raction_id_d51206dd_fk_computron_raction_id FOREIGN KEY (raction_id) REFERENCES public.computron_raction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_keyreports reports_keyreports_report_id_efc96d02_fk_reports_report_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_keyreports
    ADD CONSTRAINT reports_keyreports_report_id_efc96d02_fk_reports_report_id FOREIGN KEY (report_id) REFERENCES public.reports_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_downs reports_report_downs_oentity_id_d6d69d4c_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_downs
    ADD CONSTRAINT reports_report_downs_oentity_id_d6d69d4c_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_downs reports_report_downs_report_id_4d08eaf5_fk_reports_report_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_downs
    ADD CONSTRAINT reports_report_downs_report_id_4d08eaf5_fk_reports_report_id FOREIGN KEY (report_id) REFERENCES public.reports_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_selfs reports_report_selfs_oentity_id_2f7cd687_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_selfs
    ADD CONSTRAINT reports_report_selfs_oentity_id_2f7cd687_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_selfs reports_report_selfs_report_id_d308826e_fk_reports_report_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_selfs
    ADD CONSTRAINT reports_report_selfs_report_id_d308826e_fk_reports_report_id FOREIGN KEY (report_id) REFERENCES public.reports_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_ups reports_report_ups_oentity_id_4b6ec02a_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_ups
    ADD CONSTRAINT reports_report_ups_oentity_id_4b6ec02a_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_ups reports_report_ups_report_id_2c149a96_fk_reports_report_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.reports_report_ups
    ADD CONSTRAINT reports_report_ups_report_id_2c149a96_fk_reports_report_id FOREIGN KEY (report_id) REFERENCES public.reports_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: slots_slot slots_slot_template_id_1c32c360_fk_slots_slottemplate_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slot
    ADD CONSTRAINT slots_slot_template_id_1c32c360_fk_slots_slottemplate_id FOREIGN KEY (template_id) REFERENCES public.slots_slottemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: slots_slottemplate_template_time_range slots_slottemplate_t_slottemplate_id_9e1bbf12_fk_slots_slo; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate_template_time_range
    ADD CONSTRAINT slots_slottemplate_t_slottemplate_id_9e1bbf12_fk_slots_slo FOREIGN KEY (slottemplate_id) REFERENCES public.slots_slottemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: slots_slottemplate_template_time_range slots_slottemplate_t_slottime_id_e5d2233a_fk_slots_slo; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.slots_slottemplate_template_time_range
    ADD CONSTRAINT slots_slottemplate_t_slottime_id_e5d2233a_fk_slots_slo FOREIGN KEY (slottime_id) REFERENCES public.slots_slottime(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscription_mandate subscription_mandate_user_id_01627b2e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.subscription_mandate
    ADD CONSTRAINT subscription_mandate_user_id_01627b2e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_device users_device_user_id_7f43d271_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_device
    ADD CONSTRAINT users_device_user_id_7f43d271_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_email users_email_user_id_d0a90c30_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_email
    ADD CONSTRAINT users_email_user_id_d0a90c30_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity users_oentity_boss_id_9d90b463_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity
    ADD CONSTRAINT users_oentity_boss_id_9d90b463_fk_users_oentity_id FOREIGN KEY (boss_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_dotted_line users_oentity_dotted_from_oentity_id_fd78ce5e_fk_users_oen; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_dotted_line
    ADD CONSTRAINT users_oentity_dotted_from_oentity_id_fd78ce5e_fk_users_oen FOREIGN KEY (from_oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_dotted_line users_oentity_dotted_to_oentity_id_bdac2610_fk_users_oen; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_dotted_line
    ADD CONSTRAINT users_oentity_dotted_to_oentity_id_bdac2610_fk_users_oen FOREIGN KEY (to_oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_down users_oentity_down_oentity_id_ec081211_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_down
    ADD CONSTRAINT users_oentity_down_oentity_id_ec081211_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_down users_oentity_down_permission_id_d3c53168_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_down
    ADD CONSTRAINT users_oentity_down_permission_id_d3c53168_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_self users_oentity_self_oentity_id_f2d7e3aa_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_self
    ADD CONSTRAINT users_oentity_self_oentity_id_f2d7e3aa_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_self users_oentity_self_permission_id_7e7423fa_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_self
    ADD CONSTRAINT users_oentity_self_permission_id_7e7423fa_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity users_oentity_skill_id_dc2cb76d_fk_users_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity
    ADD CONSTRAINT users_oentity_skill_id_dc2cb76d_fk_users_skill_id FOREIGN KEY (skill_id) REFERENCES public.users_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_up users_oentity_up_oentity_id_f67f54a3_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_up
    ADD CONSTRAINT users_oentity_up_oentity_id_f67f54a3_fk_users_oentity_id FOREIGN KEY (oentity_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity_up users_oentity_up_permission_id_ea42000d_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity_up
    ADD CONSTRAINT users_oentity_up_permission_id_ea42000d_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_oentity users_oentity_user_id_b5c96ee5_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_oentity
    ADD CONSTRAINT users_oentity_user_id_b5c96ee5_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_phone users_phone_user_id_d19565e2_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_phone
    ADD CONSTRAINT users_phone_user_id_d19565e2_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_remoteuser users_remoteuser_user_id_c8cbb365_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_remoteuser
    ADD CONSTRAINT users_remoteuser_user_id_c8cbb365_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reservedwork users_reservedwork_task_id_033ef7d4_fk_karmator_task_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_reservedwork
    ADD CONSTRAINT users_reservedwork_task_id_033ef7d4_fk_karmator_task_id FOREIGN KEY (task_id) REFERENCES public.karmator_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reservedwork users_reservedwork_user_id_332ceef8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_reservedwork
    ADD CONSTRAINT users_reservedwork_user_id_332ceef8_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reservedwork users_reservedwork_work_id_f9fba2cc_fk_karmator_work_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_reservedwork
    ADD CONSTRAINT users_reservedwork_work_id_f9fba2cc_fk_karmator_work_id FOREIGN KEY (work_id) REFERENCES public.karmator_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_slot users_slot_quote_id_3e6f2425_fk_acko_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot
    ADD CONSTRAINT users_slot_quote_id_3e6f2425_fk_acko_quote_id FOREIGN KEY (quote_id) REFERENCES public.acko_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_slot users_slot_time_slot_id_6de5f522_fk_users_slotspec_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot
    ADD CONSTRAINT users_slot_time_slot_id_6de5f522_fk_users_slotspec_id FOREIGN KEY (time_slot_id) REFERENCES public.users_slotspec(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_slot users_slot_worker_id_04106ec9_fk_users_workerprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_slot
    ADD CONSTRAINT users_slot_worker_id_04106ec9_fk_users_workerprofile_id FOREIGN KEY (worker_id) REFERENCES public.users_workerprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user users_user_company_id_14799323_fk_users_company_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_company_id_14799323_fk_users_company_id FOREIGN KEY (company_id) REFERENCES public.users_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_skills users_user_skills_skill_id_d60be33e_fk_users_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_skills
    ADD CONSTRAINT users_user_skills_skill_id_d60be33e_fk_users_skill_id FOREIGN KEY (skill_id) REFERENCES public.users_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_skills users_user_skills_user_id_cf6a7e1e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_user_skills
    ADD CONSTRAINT users_user_skills_user_id_cf6a7e1e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userprofile users_userprofile_nominee_id_8219a95d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_nominee_id_8219a95d_fk_users_user_id FOREIGN KEY (nominee_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userprofile users_userprofile_user_id_87251ef1_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_87251ef1_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_workerprofile_preferred_slots users_workerprofile__slotspec_id_820bef32_fk_users_slo; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile_preferred_slots
    ADD CONSTRAINT users_workerprofile__slotspec_id_820bef32_fk_users_slo FOREIGN KEY (slotspec_id) REFERENCES public.users_slotspec(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_workerprofile_preferred_slots users_workerprofile__workerprofile_id_3c735c91_fk_users_wor; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile_preferred_slots
    ADD CONSTRAINT users_workerprofile__workerprofile_id_3c735c91_fk_users_wor FOREIGN KEY (workerprofile_id) REFERENCES public.users_workerprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_workerprofile users_workerprofile_intermediary_id_ba9ac1f0_fk_masters_i; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile
    ADD CONSTRAINT users_workerprofile_intermediary_id_ba9ac1f0_fk_masters_i FOREIGN KEY (intermediary_id) REFERENCES public.masters_intermediary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_workerprofile users_workerprofile_user_id_5bc71a65_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerprofile
    ADD CONSTRAINT users_workerprofile_user_id_5bc71a65_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_workerregion users_workerregion_worker_id_2970ef18_fk_users_workerprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.users_workerregion
    ADD CONSTRAINT users_workerregion_worker_id_2970ef18_fk_users_workerprofile_id FOREIGN KEY (worker_id) REFERENCES public.users_workerprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_bikerdriver vendors_bikerdriver_acko_poc_id_d58bc4e2_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver
    ADD CONSTRAINT vendors_bikerdriver_acko_poc_id_d58bc4e2_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_bikerdriver vendors_bikerdriver_bankaccount_id_dd1d6e28_fk_acko_bank; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver
    ADD CONSTRAINT vendors_bikerdriver_bankaccount_id_dd1d6e28_fk_acko_bank FOREIGN KEY (bankaccount_id) REFERENCES public.acko_bankaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_bikerdriver vendors_bikerdriver_legalentity_id_72b22cd1_fk_acko_lega; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver
    ADD CONSTRAINT vendors_bikerdriver_legalentity_id_72b22cd1_fk_acko_lega FOREIGN KEY (legalentity_id) REFERENCES public.acko_legalentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_bikerdriver vendors_bikerdriver_poc_id_ab1db532_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_bikerdriver
    ADD CONSTRAINT vendors_bikerdriver_poc_id_ab1db532_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_workshop vendors_workshop_acko_poc_id_abd12577_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop
    ADD CONSTRAINT vendors_workshop_acko_poc_id_abd12577_fk_users_oentity_id FOREIGN KEY (acko_poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_workshop vendors_workshop_bankaccount_id_3951c27d_fk_acko_bankaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop
    ADD CONSTRAINT vendors_workshop_bankaccount_id_3951c27d_fk_acko_bankaccount_id FOREIGN KEY (bankaccount_id) REFERENCES public.acko_bankaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_workshop vendors_workshop_establishment_id_b9498a93_fk_masters_e; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop
    ADD CONSTRAINT vendors_workshop_establishment_id_b9498a93_fk_masters_e FOREIGN KEY (establishment_id) REFERENCES public.masters_establishment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors_workshop vendors_workshop_poc_id_b096d0f2_fk_users_oentity_id; Type: FK CONSTRAINT; Schema: public; Owner: venkatesh
--

ALTER TABLE ONLY public.vendors_workshop
    ADD CONSTRAINT vendors_workshop_poc_id_b096d0f2_fk_users_oentity_id FOREIGN KEY (poc_id) REFERENCES public.users_oentity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

