--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    mid integer NOT NULL,
    label character varying NOT NULL,
    stack character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    component_id character varying,
    label character varying NOT NULL,
    type character varying,
    is_active boolean DEFAULT false NOT NULL,
    data_extension_key character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    package_id character varying
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    channel_id uuid
);


ALTER TABLE public.email OWNER TO postgres;

--
-- Name: package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package (
    id character varying NOT NULL,
    label character varying NOT NULL,
    client_id character varying NOT NULL,
    client_secret character varying NOT NULL,
    auth_base_url character varying NOT NULL,
    rest_base_url character varying NOT NULL,
    soap_base_url character varying NOT NULL,
    jwt character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    mid integer
);


ALTER TABLE public.package OWNER TO postgres;

--
-- Name: send_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.send_log (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    journey_id character varying,
    journey_name character varying,
    journey_version character varying,
    contact_key character varying,
    activity_id character varying NOT NULL,
    activity_name character varying NOT NULL,
    sender character varying NOT NULL,
    receiver character varying NOT NULL,
    payload character varying,
    msg_id character varying,
    sent_date character varying NOT NULL,
    status character varying NOT NULL,
    error_code integer NOT NULL,
    message character varying NOT NULL,
    api_response character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    channel_id uuid
);


ALTER TABLE public.send_log OWNER TO postgres;

--
-- Name: service_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_account (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    project_name character varying NOT NULL,
    project_id character varying NOT NULL,
    private_key character varying NOT NULL,
    client_email character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    channel_id uuid
);


ALTER TABLE public.service_account OWNER TO postgres;

--
-- Name: vgs_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vgs_user (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    channel_id uuid
);


ALTER TABLE public.vgs_user OWNER TO postgres;

--
-- Name: zalo_oa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zalo_oa (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying NOT NULL,
    oa_id character varying,
    access_token character varying,
    refresh_token character varying,
    expiry_date character varying,
    is_connected boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    channel_id uuid
);


ALTER TABLE public.zalo_oa OWNER TO postgres;

--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (mid, label, stack, created_at, updated_at, deleted_at) FROM stdin;
1	2	5	2000-01-01 00:00:00	2000-01-01 00:00:00	2000-01-01 00:00:00
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id, component_id, label, type, is_active, data_extension_key, created_at, updated_at, deleted_at, package_id) FROM stdin;
\.


--
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email (id, label, created_at, updated_at, deleted_at, channel_id) FROM stdin;
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package (id, label, client_id, client_secret, auth_base_url, rest_base_url, soap_base_url, jwt, created_at, updated_at, deleted_at, mid) FROM stdin;
\.


--
-- Data for Name: send_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.send_log (id, journey_id, journey_name, journey_version, contact_key, activity_id, activity_name, sender, receiver, payload, msg_id, sent_date, status, error_code, message, api_response, created_at, updated_at, deleted_at, channel_id) FROM stdin;
\.


--
-- Data for Name: service_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_account (id, project_name, project_id, private_key, client_email, created_at, updated_at, deleted_at, channel_id) FROM stdin;
\.


--
-- Data for Name: vgs_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vgs_user (id, label, username, password, created_at, updated_at, deleted_at, channel_id) FROM stdin;
\.


--
-- Data for Name: zalo_oa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zalo_oa (id, label, oa_id, access_token, refresh_token, expiry_date, is_connected, created_at, updated_at, deleted_at, channel_id) FROM stdin;
\.


--
-- Name: email PK_1e7ed8734ee054ef18002e29b1c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT "PK_1e7ed8734ee054ef18002e29b1c" PRIMARY KEY (id);


--
-- Name: service_account PK_2efb318de61f6487f806627dbd2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_account
    ADD CONSTRAINT "PK_2efb318de61f6487f806627dbd2" PRIMARY KEY (id);


--
-- Name: package PK_308364c66df656295bc4ec467c2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT "PK_308364c66df656295bc4ec467c2" PRIMARY KEY (id);


--
-- Name: channel PK_590f33ee6ee7d76437acf362e39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "PK_590f33ee6ee7d76437acf362e39" PRIMARY KEY (id);


--
-- Name: business PK_802475f61ba42a4d50d3de8e4cf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT "PK_802475f61ba42a4d50d3de8e4cf" PRIMARY KEY (mid);


--
-- Name: zalo_oa PK_bc9d688c2cf54a4d69a2fbec377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zalo_oa
    ADD CONSTRAINT "PK_bc9d688c2cf54a4d69a2fbec377" PRIMARY KEY (id);


--
-- Name: send_log PK_d1a6bbe9311ff1d8bc89eac0ae0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.send_log
    ADD CONSTRAINT "PK_d1a6bbe9311ff1d8bc89eac0ae0" PRIMARY KEY (id);


--
-- Name: vgs_user PK_d8f92372e57536faa9351a6aabd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vgs_user
    ADD CONSTRAINT "PK_d8f92372e57536faa9351a6aabd" PRIMARY KEY (id);


--
-- Name: service_account FK_006d8913d154db05e93f28cfa9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_account
    ADD CONSTRAINT "FK_006d8913d154db05e93f28cfa9e" FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: channel FK_0ad27ffed77eeae23cb9f909c2d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_0ad27ffed77eeae23cb9f909c2d" FOREIGN KEY (package_id) REFERENCES public.package(id) ON DELETE CASCADE;


--
-- Name: vgs_user FK_3a1dd0c7b42b87b7bb2d06faa79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vgs_user
    ADD CONSTRAINT "FK_3a1dd0c7b42b87b7bb2d06faa79" FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: send_log FK_4e6b9bcf58643e26fad72dee518; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.send_log
    ADD CONSTRAINT "FK_4e6b9bcf58643e26fad72dee518" FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: email FK_80c1038fee35aace2774e928d51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT "FK_80c1038fee35aace2774e928d51" FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: zalo_oa FK_b41acb954df6f76a124304d2639; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zalo_oa
    ADD CONSTRAINT "FK_b41acb954df6f76a124304d2639" FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: package FK_f4265c0a721ff2ac658050e82ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT "FK_f4265c0a721ff2ac658050e82ce" FOREIGN KEY (mid) REFERENCES public.business(mid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

