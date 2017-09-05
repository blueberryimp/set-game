--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE cards (
    card_id integer NOT NULL,
    card_name character varying(4) NOT NULL,
    card_image character varying(64) NOT NULL,
    color character varying(64) NOT NULL,
    shape character varying(64) NOT NULL,
    pattern character varying(64) NOT NULL,
    number integer NOT NULL
);


ALTER TABLE cards OWNER TO "user";

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE cards_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cards_card_id_seq OWNER TO "user";

--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE cards_card_id_seq OWNED BY cards.card_id;


--
-- Name: cardstate; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE cardstate (
    cardstate_id integer NOT NULL,
    gamestate_id integer NOT NULL,
    card_status boolean NOT NULL
);


ALTER TABLE cardstate OWNER TO "user";

--
-- Name: cardstate_cardstate_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE cardstate_cardstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cardstate_cardstate_id_seq OWNER TO "user";

--
-- Name: cardstate_cardstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE cardstate_cardstate_id_seq OWNED BY cardstate.cardstate_id;


--
-- Name: gamestate; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE gamestate (
    gamestate_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE gamestate OWNER TO "user";

--
-- Name: gamestate_gamestate_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE gamestate_gamestate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gamestate_gamestate_id_seq OWNER TO "user";

--
-- Name: gamestate_gamestate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE gamestate_gamestate_id_seq OWNED BY gamestate.gamestate_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(24) NOT NULL,
    fname character varying(64) NOT NULL,
    lname character varying(64) NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE users OWNER TO "user";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO "user";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: card_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY cards ALTER COLUMN card_id SET DEFAULT nextval('cards_card_id_seq'::regclass);


--
-- Name: cardstate_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY cardstate ALTER COLUMN cardstate_id SET DEFAULT nextval('cardstate_cardstate_id_seq'::regclass);


--
-- Name: gamestate_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY gamestate ALTER COLUMN gamestate_id SET DEFAULT nextval('gamestate_gamestate_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: user
--

COPY cards (card_id, card_name, card_image, color, shape, pattern, number) FROM stdin;
1	rss3	static/cards/rss3.gif	red	squiggle	stripe	3
2	gde1	static/cards/gde1.gif	green	diamond	empty	1
3	gde2	static/cards/gde2.gif	green	diamond	empty	2
4	gde3	static/cards/gde3.gif	green	diamond	empty	3
5	gdf1	static/cards/gdf1.gif	green	diamond	filled	1
6	gdf2	static/cards/gdf2.gif	green	diamond	filled	2
7	gdf3	static/cards/gdf3.gif	green	diamond	filled	3
8	gds1	static/cards/gds1.gif	green	diamond	stripe	1
9	gds2	static/cards/gds2.gif	green	diamond	stripe	2
10	gds3	static/cards/gds3.gif	green	diamond	stripe	3
11	goe1	static/cards/goe1.gif	green	oval	empty	1
12	goe2	static/cards/goe2.gif	green	oval	empty	2
13	goe3	static/cards/goe3.gif	green	oval	empty	3
14	gof1	static/cards/gof1.gif	green	oval	filled	1
15	gof2	static/cards/gof2.gif	green	oval	filled	2
16	gof3	static/cards/gof3.gif	green	oval	filled	3
17	gos1	static/cards/gos1.gif	green	oval	stripe	1
18	gos2	static/cards/gos2.gif	green	oval	stripe	2
19	gos3	static/cards/gos3.gif	green	oval	stripe	3
20	gse1	static/cards/gse1.gif	green	squiggle	empty	1
21	gse2	static/cards/gse2.gif	green	squiggle	empty	2
22	gse3	static/cards/gse3.gif	green	squiggle	empty	3
23	gsf1	static/cards/gsf1.gif	green	squiggle	filled	1
24	gsf2	static/cards/gsf2.gif	green	squiggle	filled	2
25	gsf3	static/cards/gsf3.gif	green	squiggle	filled	3
26	gss1	static/cards/gss1.gif	green	squiggle	stripe	1
27	gss2	static/cards/gss2.gif	green	squiggle	stripe	2
28	gss3	static/cards/gss3.gif	green	squiggle	stripe	3
29	pde1	static/cards/pde1.gif	purple	diamond	empty	1
30	pde2	static/cards/pde2.gif	purple	diamond	empty	2
31	pde3	static/cards/pde3.gif	purple	diamond	empty	3
32	pdf1	static/cards/pdf1.gif	purple	diamond	filled	1
33	pdf2	static/cards/pdf2.gif	purple	diamond	filled	2
34	pdf3	static/cards/pdf3.gif	purple	diamond	filled	3
35	pds1	static/cards/pds1.gif	purple	diamond	stripe	1
36	pds2	static/cards/pds2.gif	purple	diamond	stripe	2
37	pds3	static/cards/pds3.gif	purple	diamond	stripe	3
38	poe1	static/cards/poe1.gif	purple	oval	empty	1
39	poe2	static/cards/poe2.gif	purple	oval	empty	2
40	poe3	static/cards/poe3.gif	purple	oval	empty	3
41	pof1	static/cards/pof1.gif	purple	oval	filled	1
42	pof2	static/cards/pof2.gif	purple	oval	filled	2
43	pof3	static/cards/pof3.gif	purple	oval	filled	3
44	pos1	static/cards/pos1.gif	purple	oval	stripe	1
45	pos2	static/cards/pos2.gif	purple	oval	stripe	2
46	pos3	static/cards/pos3.gif	purple	oval	stripe	3
47	pse1	static/cards/pse1.gif	purple	squiggle	empty	1
48	pse2	static/cards/pse2.gif	purple	squiggle	empty	2
49	pse3	static/cards/pse3.gif	purple	squiggle	empty	3
50	psf1	static/cards/psf1.gif	purple	squiggle	filled	1
51	psf2	static/cards/psf2.gif	purple	squiggle	filled	2
52	psf3	static/cards/psf3.gif	purple	squiggle	filled	3
53	pss1	static/cards/pss1.gif	purple	squiggle	stripe	1
54	pss2	static/cards/pss2.gif	purple	squiggle	stripe	2
55	pss3	static/cards/pss3.gif	purple	squiggle	stripe	3
56	rde1	static/cards/rde1.gif	red	diamond	empty	1
57	rde2	static/cards/rde2.gif	red	diamond	empty	2
58	rde3	static/cards/rde3.gif	red	diamond	empty	3
59	rdf1	static/cards/rdf1.gif	red	diamond	filled	1
60	rdf2	static/cards/rdf2.gif	red	diamond	filled	2
61	rdf3	static/cards/rdf3.gif	red	diamond	filled	3
62	rds1	static/cards/rds1.gif	red	diamond	stripe	1
63	rds2	static/cards/rds2.gif	red	diamond	stripe	2
64	rds3	static/cards/rds3.gif	red	diamond	stripe	3
65	roe1	static/cards/roe1.gif	red	oval	empty	1
66	roe2	static/cards/roe2.gif	red	oval	empty	2
67	roe3	static/cards/roe3.gif	red	oval	empty	3
68	rof1	static/cards/rof1.gif	red	oval	filled	1
69	rof2	static/cards/rof2.gif	red	oval	filled	2
70	rof3	static/cards/rof3.gif	red	oval	filled	3
71	ros1	static/cards/ros1.gif	red	oval	stripe	1
72	ros2	static/cards/ros2.gif	red	oval	stripe	2
73	ros3	static/cards/ros3.gif	red	oval	stripe	3
74	rse1	static/cards/roe1.gif	red	squiggle	empty	1
75	rse2	static/cards/roe2.gif	red	squiggle	empty	2
76	rse3	static/cards/rse3.gif	red	squiggle	empty	3
77	rsf1	static/cards/rsf1.gif	red	squiggle	filled	1
78	rsf2	static/cards/rsf2.gif	red	squiggle	filled	2
79	rsf3	static/cards/rsf3.gif	red	squiggle	filled	3
80	rss1	static/cards/rss1.gif	red	squiggle	stripe	1
81	rss2	static/cards/rss2.gif	red	squiggle	stripe	2
\.


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('cards_card_id_seq', 81, true);


--
-- Data for Name: cardstate; Type: TABLE DATA; Schema: public; Owner: user
--

COPY cardstate (cardstate_id, gamestate_id, card_status) FROM stdin;
\.


--
-- Name: cardstate_cardstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('cardstate_cardstate_id_seq', 1, false);


--
-- Data for Name: gamestate; Type: TABLE DATA; Schema: public; Owner: user
--

COPY gamestate (gamestate_id, user_id, score) FROM stdin;
2	1	4
3	1	7
4	1	0
5	1	0
6	1	0
7	1	0
8	1	0
9	1	0
10	1	0
11	1	0
12	1	0
13	1	0
14	1	0
\.


--
-- Name: gamestate_gamestate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('gamestate_gamestate_id_seq', 14, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users (user_id, username, fname, lname, email, password) FROM stdin;
1	blueberryimp	Michelle 	Luu	blueberryimps@gmail.com	munki
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('users_user_id_seq', 1, true);


--
-- Name: cards_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- Name: cardstate_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cardstate
    ADD CONSTRAINT cardstate_pkey PRIMARY KEY (cardstate_id);


--
-- Name: gamestate_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY gamestate
    ADD CONSTRAINT gamestate_pkey PRIMARY KEY (gamestate_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: ix_cardstate_gamestate_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_cardstate_gamestate_id ON cardstate USING btree (gamestate_id);


--
-- Name: ix_gamestate_user_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_gamestate_user_id ON gamestate USING btree (user_id);


--
-- Name: cardstate_gamestate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cardstate
    ADD CONSTRAINT cardstate_gamestate_id_fkey FOREIGN KEY (gamestate_id) REFERENCES gamestate(gamestate_id);


--
-- Name: gamestate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY gamestate
    ADD CONSTRAINT gamestate_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

