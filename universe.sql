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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    light_distance numeric,
    shape character varying(64) NOT NULL,
    has_warphole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    orbit_speed integer NOT NULL,
    rotate_speed integer,
    distance_from_planet numeric NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    has_alien boolean,
    size numeric NOT NULL,
    mass numeric NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rickandmorty; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rickandmorty (
    rickandmorty_id integer NOT NULL,
    name character varying(64) NOT NULL,
    galaxy_id integer,
    star_id integer,
    moon_id integer,
    planet_id integer
);


ALTER TABLE public.rickandmorty OWNER TO freecodecamp;

--
-- Name: rickandmorty_character_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rickandmorty_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rickandmorty_character_id_seq OWNER TO freecodecamp;

--
-- Name: rickandmorty_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rickandmorty_character_id_seq OWNED BY public.rickandmorty.rickandmorty_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    will_be_blackhole boolean,
    size numeric,
    color text,
    name character varying(64) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: rickandmorty rickandmorty_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty ALTER COLUMN rickandmorty_id SET DEFAULT nextval('public.rickandmorty_character_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 'spiral', false);
INSERT INTO public.galaxy VALUES (2, 'Cigar', 12000000, 'cigar', true);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 17000000, 'spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Quasar-1', 1200000000, 'Round', true);
INSERT INTO public.galaxy VALUES (5, 'Manifier', 11000000, 'Round', false);
INSERT INTO public.galaxy VALUES (6, 'Horse', 22000000, 'Cigar', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 13, 320, 80, 120000, 'Aurelia I');
INSERT INTO public.moon VALUES (23, 13, 295, 70, 180000, 'Aurelia II');
INSERT INTO public.moon VALUES (24, 14, 410, 90, 140500, 'Cindora Minor');
INSERT INTO public.moon VALUES (25, 14, 380, 75, 201300, 'Cindora Shade');
INSERT INTO public.moon VALUES (26, 15, 520, 110, 310000, 'Vorath Prime');
INSERT INTO public.moon VALUES (27, 15, 505, 100, 355000, 'Vorath Ember');
INSERT INTO public.moon VALUES (28, 15, 498, 95, 402000, 'Vorath Halo');
INSERT INTO public.moon VALUES (29, 16, 270, 60, 90000, 'Marellis Pearl');
INSERT INTO public.moon VALUES (30, 16, 260, 55, 130000, 'Marellis Frost');
INSERT INTO public.moon VALUES (31, 17, 610, 130, 480000, 'Jaxion Crown');
INSERT INTO public.moon VALUES (32, 17, 590, 120, 525000, 'Jaxion Vigil');
INSERT INTO public.moon VALUES (33, 18, 340, 85, 160000, 'Thalassa Tide');
INSERT INTO public.moon VALUES (34, 18, 332, 78, 210000, 'Thalassa Mist');
INSERT INTO public.moon VALUES (35, 19, 200, 40, 70000, 'Irenae Shard');
INSERT INTO public.moon VALUES (36, 20, 450, 105, 350000, 'Krydon Watch');
INSERT INTO public.moon VALUES (37, 20, 442, 98, 410000, 'Krydon Gloom');
INSERT INTO public.moon VALUES (38, 21, 305, 68, 150000, 'Seraphi Lantern');
INSERT INTO public.moon VALUES (39, 22, 555, 125, 460000, 'Brontes Roar');
INSERT INTO public.moon VALUES (40, 23, 230, 50, 100000, 'Ossira Drift');
INSERT INTO public.moon VALUES (41, 24, 360, 82, 190000, 'Velastra Halo');
INSERT INTO public.moon VALUES (42, 24, 352, 79, 240000, 'Velastra Echo');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 7, true, 12.3, 5.9, 'Aurelia');
INSERT INTO public.planet VALUES (14, 7, false, 9.7, 4.1, 'Cindora');
INSERT INTO public.planet VALUES (15, 2, true, 15.2, 8.3, 'Vorath');
INSERT INTO public.planet VALUES (16, 2, false, 6.4, 2.7, 'Marellis');
INSERT INTO public.planet VALUES (17, 3, false, 21.0, 19.5, 'Jaxion');
INSERT INTO public.planet VALUES (18, 3, true, 10.5, 6.2, 'Thalassa');
INSERT INTO public.planet VALUES (19, 4, false, 4.9, 1.3, 'Irenae');
INSERT INTO public.planet VALUES (20, 4, true, 13.8, 7.4, 'Krydon');
INSERT INTO public.planet VALUES (21, 7, false, 8.1, 3.6, 'Seraphi');
INSERT INTO public.planet VALUES (22, 2, true, 17.6, 12.2, 'Brontes');
INSERT INTO public.planet VALUES (23, 3, false, 5.5, 1.9, 'Ossira');
INSERT INTO public.planet VALUES (24, 4, true, 11.9, 5.4, 'Velastra');


--
-- Data for Name: rickandmorty; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rickandmorty VALUES (1, 'morty', 5, 6, NULL, NULL);
INSERT INTO public.rickandmorty VALUES (5, 'rick', 6, 7, NULL, 14);
INSERT INTO public.rickandmorty VALUES (7, 'rick&morty', 6, 2, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 1, true, 2.7, 'Blue-White', 'Alpheratz');
INSERT INTO public.star VALUES (3, 2, false, 0.55, 'Orange', 'Cactus-In-Bottle');
INSERT INTO public.star VALUES (4, 3, true, 330, 'White', 'White-alge');
INSERT INTO public.star VALUES (5, 4, true, 100000000, 'Grey', 'Black Mesa');
INSERT INTO public.star VALUES (6, 5, true, 998, 'Blue', 'Where is my Magnifier?');
INSERT INTO public.star VALUES (7, 6, false, 0.78, 'Red', 'Sheep');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: rickandmorty_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rickandmorty_character_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rickandmorty rickandmorty_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_name_key UNIQUE (name);


--
-- Name: rickandmorty rickandmorty_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_pkey PRIMARY KEY (rickandmorty_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: rickandmorty rickandmorty_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: rickandmorty rickandmorty_traveled_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_traveled_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: rickandmorty rickandmorty_traveled_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_traveled_moon_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: rickandmorty rickandmorty_traveled_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rickandmorty
    ADD CONSTRAINT rickandmorty_traveled_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

