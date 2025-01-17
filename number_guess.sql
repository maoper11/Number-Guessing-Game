--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE guess_number;
--
-- Name: guess_number; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guess_number WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guess_number OWNER TO freecodecamp;

\connect guess_number

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    attempts integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 3);
INSERT INTO public.games VALUES (2, 2, 8);
INSERT INTO public.games VALUES (3, 9, 838);
INSERT INTO public.games VALUES (4, 9, 600);
INSERT INTO public.games VALUES (5, 10, 440);
INSERT INTO public.games VALUES (6, 10, 750);
INSERT INTO public.games VALUES (7, 9, 16);
INSERT INTO public.games VALUES (8, 9, 214);
INSERT INTO public.games VALUES (9, 9, 663);
INSERT INTO public.games VALUES (10, 1, 3);
INSERT INTO public.games VALUES (11, 1, 11);
INSERT INTO public.games VALUES (12, 1, 5);
INSERT INTO public.games VALUES (13, 1, 1);
INSERT INTO public.games VALUES (14, 1, 13);
INSERT INTO public.games VALUES (15, 11, 564);
INSERT INTO public.games VALUES (16, 11, 537);
INSERT INTO public.games VALUES (17, 12, 77);
INSERT INTO public.games VALUES (18, 12, 242);
INSERT INTO public.games VALUES (19, 11, 428);
INSERT INTO public.games VALUES (20, 11, 959);
INSERT INTO public.games VALUES (21, 11, 771);
INSERT INTO public.games VALUES (22, 13, 10);
INSERT INTO public.games VALUES (23, 14, 94);
INSERT INTO public.games VALUES (24, 14, 463);
INSERT INTO public.games VALUES (25, 15, 129);
INSERT INTO public.games VALUES (26, 15, 2);
INSERT INTO public.games VALUES (27, 14, 166);
INSERT INTO public.games VALUES (28, 14, 605);
INSERT INTO public.games VALUES (29, 14, 509);
INSERT INTO public.games VALUES (30, 13, 12);
INSERT INTO public.games VALUES (31, 16, 850);
INSERT INTO public.games VALUES (32, 16, 19);
INSERT INTO public.games VALUES (33, 17, 38);
INSERT INTO public.games VALUES (34, 17, 124);
INSERT INTO public.games VALUES (35, 16, 37);
INSERT INTO public.games VALUES (36, 16, 502);
INSERT INTO public.games VALUES (37, 16, 821);
INSERT INTO public.games VALUES (38, 19, 8);
INSERT INTO public.games VALUES (39, 19, 10);
INSERT INTO public.games VALUES (40, 20, 10);
INSERT INTO public.games VALUES (41, 21, 454);
INSERT INTO public.games VALUES (42, 21, 218);
INSERT INTO public.games VALUES (43, 22, 794);
INSERT INTO public.games VALUES (44, 22, 627);
INSERT INTO public.games VALUES (45, 21, 352);
INSERT INTO public.games VALUES (46, 21, 136);
INSERT INTO public.games VALUES (47, 21, 285);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Mauricio');
INSERT INTO public.users VALUES (2, 'Juan');
INSERT INTO public.users VALUES (3, 'user_1730941840904');
INSERT INTO public.users VALUES (4, 'user_1730941840903');
INSERT INTO public.users VALUES (5, 'user_1730941950382');
INSERT INTO public.users VALUES (6, 'user_1730941950381');
INSERT INTO public.users VALUES (7, '500');
INSERT INTO public.users VALUES (8, '100');
INSERT INTO public.users VALUES (9, 'user_1730947488150');
INSERT INTO public.users VALUES (10, 'user_1730947488149');
INSERT INTO public.users VALUES (11, 'user_1730948808209');
INSERT INTO public.users VALUES (12, 'user_1730948808208');
INSERT INTO public.users VALUES (13, 'Man');
INSERT INTO public.users VALUES (14, 'user_1730948960655');
INSERT INTO public.users VALUES (15, 'user_1730948960653');
INSERT INTO public.users VALUES (16, 'user_1730949212688');
INSERT INTO public.users VALUES (17, 'user_1730949212687');
INSERT INTO public.users VALUES (18, 'Mauricio');
INSERT INTO public.users VALUES (19, 'Andres');
INSERT INTO public.users VALUES (20, 'Camila');
INSERT INTO public.users VALUES (21, 'user_1730951723655');
INSERT INTO public.users VALUES (22, 'user_1730951723654');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 47, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

