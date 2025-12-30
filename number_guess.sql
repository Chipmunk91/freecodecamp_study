--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: scoreboard; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scoreboard (
    name character varying(128) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.scoreboard OWNER TO freecodecamp;

--
-- Data for Name: scoreboard; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scoreboard VALUES ('alpha', 5, 1);
INSERT INTO public.scoreboard VALUES ('user_1767101376012', 2, 77);
INSERT INTO public.scoreboard VALUES ('user_1767101376013', 5, 249);


--
-- Name: scoreboard scoreboard_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_name_key UNIQUE (name);


--
-- Name: scoreboard scoreboard_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

