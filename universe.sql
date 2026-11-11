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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    is_near_earth_object boolean,
    description text,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    mass_in_solar_masses numeric,
    is_spiral boolean,
    description text
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    mass_in_earth_masses numeric,
    is_spherical boolean,
    description text,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    distance_from_earth_in_millions_of_km integer,
    mass_earth numeric,
    has_rings boolean,
    description text,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    mass_in_solar_masses numeric,
    is_active boolean,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Eros', 17, true, 'A near-Earth asteroid.', 3);
INSERT INTO public.asteroid VALUES (2, 'Ida', 31, false, 'An asteroid in the main asteroid belt.', 3);
INSERT INTO public.asteroid VALUES (3, 'Psyche', 226, false, 'A metallic asteroid in the main asteroid belt.', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 1500000000000, true, 'The galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1200000000000, true, 'The nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 50000000000, true, 'A small spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 13000, 100000000000, false, 'A satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 13000, 7000000000, false, 'A dwarf irregular galaxy near the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 13000, 160000000000, true, 'A famous spiral galaxy with prominent spiral arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 0.0123, true, 'Earth''s only natural satellite.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 0.00000000179, false, 'The larger and closer moon of Mars.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 0.000000000248, false, 'The smaller moon of Mars.', 4);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 0.01495, true, 'A volcanically active moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 0.00804, true, 'An icy moon that may have a subsurface ocean.', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 0.0248, true, 'The largest moon in the Solar System.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 0.0181, true, 'A heavily cratered moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 0.0226, true, 'A moon with lakes of liquid methane.', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 0.0000181, true, 'An icy moon with water vapor geysers.', 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 4500, 0.000387, true, 'Saturn''s second-largest moon.', 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 4500, 0.000303, true, 'A moon with contrasting light and dark regions.', 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 4500, 0.0000110, true, 'A moon of Uranus with unusual terrain.', 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 4500, 0.000226, true, 'An icy moon of Uranus.', 7);
INSERT INTO public.moon VALUES (14, 'Triton', 4500, 0.00359, true, 'Neptune''s largest moon with retrograde orbit.', 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 4500, 0.0000032, false, 'A dark irregular moon of Neptune.', 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 4500, 0.000000050, false, 'A moon of Neptune with an unusual elliptical orbit.', 8);
INSERT INTO public.moon VALUES (17, 'Charon', 4500, 0.00174, true, 'Pluto''s largest moon.', 10);
INSERT INTO public.moon VALUES (18, 'Hi''iaka', 4500, 0.0000040, true, 'A moon of the dwarf planet Haumea.', 11);
INSERT INTO public.moon VALUES (19, 'MK2', 4500, 0.00000010, false, 'A small moon of Makemake.', 12);
INSERT INTO public.moon VALUES (20, 'Dysnomia', 4500, 0.000010, true, 'The known moon of the dwarf planet Eris.', 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 92, 0.0553, false, 'The smallest planet in the Solar System and the closest to the Sun.', 2);
INSERT INTO public.planet VALUES (2, 'Venus', 41, 0.815, false, 'The hottest planet in the Solar System, with a thick and toxic atmosphere.', 2);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 1.000, false, 'The only known planet to support life, with liquid water on its surface.', 2);
INSERT INTO public.planet VALUES (4, 'Mars', 78, 0.107, false, 'Known as the Red Planet because of its reddish surface.', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 628, 317.83, true, 'The largest planet in the Solar System, famous for its Great Red Spot.', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1277, 95.16, true, 'A gas giant best known for its spectacular ring system.', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 2723, 14.54, true, 'An ice giant that rotates on its side and has a blue-green atmosphere.', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 4349, 17.15, true, 'The farthest known planet from the Sun, with extremely strong winds.', 2);
INSERT INTO public.planet VALUES (9, 'Ceres', 265, 0.000157, false, 'A dwarf planet located in the asteroid belt between Mars and Jupiter.', 2);
INSERT INTO public.planet VALUES (10, 'Pluto', 5750, 0.00218, false, 'A dwarf planet in the Kuiper Belt, once classified as the ninth planet.', 2);
INSERT INTO public.planet VALUES (11, 'Haumea', 816, 0.00067, true, 'A dwarf planet in the Kuiper Belt with an unusual elongated shape and rapid rotation.', 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 6648, 0.00052, false, 'A dwarf planet in the Kuiper Belt with a frozen surface and very low temperatures.', 2);
INSERT INTO public.planet VALUES (13, 'Eris', 9984, 0.00278, false, 'A distant dwarf planet in the scattered disc, slightly smaller than Pluto.', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 4600, 1, true, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (3, 'V1', 100, 5, true, 'A Cepheid variable star used by Edwin Hubble to determine the distance to Andromeda.', 2);
INSERT INTO public.star VALUES (4, 'Var B', 3, 50, true, 'A luminous blue variable star in the Triangulum Galaxy.', 3);
INSERT INTO public.star VALUES (5, 'R136a1', 1, 215, true, 'One of the most massive known stars in the universe.', 4);
INSERT INTO public.star VALUES (6, 'Sk 159', 3, 40, true, 'A massive hot star in the Small Magellanic Cloud.', 5);
INSERT INTO public.star VALUES (7, 'SN 2011dh progenitor', 17, 13, false, 'A yellow supergiant that exploded as a supernova in 2011.', 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

