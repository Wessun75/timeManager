--
-- PostgreSQL database dump
--

<<<<<<< HEAD
-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
=======
-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e

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

<<<<<<< HEAD
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;
=======
SET default_tablespace = '';

SET default_table_access_method = heap;
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e

--
-- Name: clocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clocks (
    id bigint NOT NULL,
    "time" timestamp(0) without time zone,
    status boolean DEFAULT false NOT NULL,
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: clocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clocks_id_seq OWNED BY public.clocks.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
<<<<<<< HEAD
=======
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    team_name character varying NOT NULL,
    id integer NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
<<<<<<< HEAD
    username character varying(255),
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
=======
    username character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    role integer NOT NULL,
    team_id integer,
    manage_id integer[],
    password character varying NOT NULL
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workingtimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workingtimes (
    id bigint NOT NULL,
    start timestamp(0) without time zone,
    "end" timestamp(0) without time zone,
<<<<<<< HEAD
    "user_id" bigint,
=======
    user_id bigint,
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: workingtimes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workingtimes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workingtimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workingtimes_id_seq OWNED BY public.workingtimes.id;


--
-- Name: clocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clocks ALTER COLUMN id SET DEFAULT nextval('public.clocks_id_seq'::regclass);


--
<<<<<<< HEAD
=======
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workingtimes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workingtimes ALTER COLUMN id SET DEFAULT nextval('public.workingtimes_id_seq'::regclass);


--
-- Name: clocks clocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clocks
    ADD CONSTRAINT clocks_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
<<<<<<< HEAD
=======
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workingtimes workingtimes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workingtimes
    ADD CONSTRAINT workingtimes_pkey PRIMARY KEY (id);


--
-- Name: clocks_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX clocks_user_id_index ON public.clocks USING btree (user_id);


--
<<<<<<< HEAD
-- Name: workingtimes_user_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workingtimes_user_index ON public.workingtimes USING btree ("user");
=======
-- Name: workingtimes_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX workingtimes_user_id_index ON public.workingtimes USING btree (user_id);
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e


--
-- Name: clocks clocks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clocks
    ADD CONSTRAINT clocks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
<<<<<<< HEAD
-- Name: workingtimes workingtimes_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workingtimes
    ADD CONSTRAINT workingtimes_user_fkey FOREIGN KEY ("user") REFERENCES public.users(id);
=======
-- Name: workingtimes workingtimes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workingtimes
    ADD CONSTRAINT workingtimes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20201021101609);
INSERT INTO public."schema_migrations" (version) VALUES (20201021101618);
INSERT INTO public."schema_migrations" (version) VALUES (20201021101622);
INSERT INTO public."schema_migrations" (version) VALUES (20201021112541);
INSERT INTO public."schema_migrations" (version) VALUES (20201021113418);
<<<<<<< HEAD
=======
INSERT INTO public."schema_migrations" (version) VALUES (20201022214748);
INSERT INTO public."schema_migrations" (version) VALUES (20201022214918);
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
