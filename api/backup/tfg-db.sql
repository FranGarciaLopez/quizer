--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg110+1)
-- Dumped by pg_dump version 13.4 (Debian 13.4-1.pgdg110+1)

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
-- Name: path_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.path_types AS ENUM (
    'technical',
    'cognitive',
    'values'
);


ALTER TYPE public.path_types OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: careers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.careers (
    requirements jsonb DEFAULT '[]'::jsonb NOT NULL,
    id integer NOT NULL,
    name jsonb,
    "desc" jsonb,
    type character varying,
    subtype character varying,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.careers OWNER TO postgres;

--
-- Name: COLUMN careers.requirements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.careers.requirements IS 'list of path ids';


--
-- Name: COLUMN careers.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.careers.name IS 'tranlation';


--
-- Name: COLUMN careers."desc"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.careers."desc" IS 'tranlation';


--
-- Name: careers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.careers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careers_id_seq OWNER TO postgres;

--
-- Name: careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.careers_id_seq OWNED BY public.careers.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paths (
    id integer NOT NULL,
    name jsonb NOT NULL,
    "desc" jsonb,
    type character varying NOT NULL,
    subtype character varying,
    requirements jsonb DEFAULT '[]'::jsonb NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.paths OWNER TO postgres;

--
-- Name: COLUMN paths.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paths.name IS 'tranlation';


--
-- Name: COLUMN paths."desc"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paths."desc" IS 'tranlation';


--
-- Name: COLUMN paths.requirements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paths.requirements IS 'array of path ids';


--
-- Name: paths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paths_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paths_id_seq OWNER TO postgres;

--
-- Name: paths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paths_id_seq OWNED BY public.paths.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    test_id integer,
    topic_id integer,
    "order" integer,
    text jsonb,
    image character varying,
    timeout integer,
    answers jsonb,
    id integer NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    skip_conditions jsonb DEFAULT '[]'::jsonb NOT NULL,
    skip_text json DEFAULT '{}'::json NOT NULL
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: COLUMN questions.text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.questions.text IS 'tranlation';


--
-- Name: COLUMN questions.skip_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.questions.skip_text IS 'translation';


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id integer NOT NULL,
    topic_id integer,
    name jsonb,
    url character varying,
    status character varying,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: COLUMN resources.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.resources.name IS 'tranlation';


--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: table_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_name_id_seq OWNER TO postgres;

--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    dimentions jsonb,
    id integer NOT NULL,
    path_id integer,
    name jsonb,
    "desc" jsonb,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    questions_last date DEFAULT now() NOT NULL,
    questions_day integer DEFAULT 5 NOT NULL,
    key character varying,
    conclusion jsonb
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: COLUMN tests.dimentions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tests.dimentions IS 'array of dimentions';


--
-- Name: COLUMN tests.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tests.name IS 'tranlation';


--
-- Name: COLUMN tests."desc"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tests."desc" IS 'tranlation';


--
-- Name: COLUMN tests.conclusion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tests.conclusion IS 'translation';


--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    topic_id integer NOT NULL,
    name jsonb,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- Name: COLUMN topics.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.topics.name IS 'tranlation';


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.topic_id;


--
-- Name: user_careers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_careers (
    career_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_careers OWNER TO postgres;

--
-- Name: user_paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_paths (
    path_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_paths OWNER TO postgres;

--
-- Name: user_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_questions (
    question_id integer NOT NULL,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    answer jsonb,
    test_id integer NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    skip_conditions jsonb DEFAULT '[]'::jsonb NOT NULL,
    skip_text json DEFAULT '{}'::json NOT NULL
);


ALTER TABLE public.user_questions OWNER TO postgres;

--
-- Name: COLUMN user_questions.skip_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_questions.skip_text IS 'translation';


--
-- Name: user_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_resources (
    user_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.user_resources OWNER TO postgres;

--
-- Name: user_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_test_id_seq OWNER TO postgres;

--
-- Name: user_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tests (
    id integer DEFAULT nextval('public.user_test_id_seq'::regclass) NOT NULL,
    test_id integer,
    user_id integer,
    status character varying,
    acc_results jsonb DEFAULT '{}'::jsonb NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    questions_today integer DEFAULT 0 NOT NULL,
    questions_day integer DEFAULT 5 NOT NULL
);


ALTER TABLE public.user_tests OWNER TO postgres;

--
-- Name: COLUMN user_tests.acc_results; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_tests.acc_results IS 'array of dimention results';


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    surname character varying,
    nickname character varying NOT NULL,
    lang character varying NOT NULL,
    telegram_id integer NOT NULL,
    initialized boolean DEFAULT false,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    today_questions integer DEFAULT 5 NOT NULL,
    average_questions integer DEFAULT 5 NOT NULL,
    email character varying,
    age integer,
    studing boolean,
    working boolean,
    job_title character varying,
    password character varying DEFAULT ''::character varying NOT NULL,
    is_admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: careers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.careers ALTER COLUMN id SET DEFAULT nextval('public.careers_id_seq'::regclass);


--
-- Name: paths id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths ALTER COLUMN id SET DEFAULT nextval('public.paths_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: topics topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN topic_id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: careers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.careers (requirements, id, name, "desc", type, subtype, created, updated) FROM stdin;
\.


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paths (id, name, "desc", type, subtype, requirements, created, updated) FROM stdin;
15	{"es": "otro path"}	{"es": "otro path"}	psyco	\N	[]	2022-11-14 17:17:20.775537+00	2022-11-14 17:17:20.775537+00
2	{"en": "Test", "es": "Prueba"}	{"en": "Test description", "es": "desc de prueba 1"}	psyco	\N	"\\"[]\\""	2021-08-24 20:24:57.127691+00	2021-08-24 20:24:57.127691+00
1	{"en": "Don`t do that.", "es": "No lo hagas."}	{"en": "As a mentor, I want to meet you and to meet yourself.", "es": "Como mentor, necesito conocerte y necesito que te conozcas. . Es la única manera de que este viaje te lleve al lugar correcto"}	psyco	\N	"\\"[]\\""	2020-12-17 17:28:16.091338+00	2020-12-17 17:28:16.091338+00
40	{"es": "Java edited"}	{"es": "Aprende los conceptos de Java edited"}	psyco	\N	[]	2022-11-28 12:29:33.776665+00	2022-11-28 12:29:33.776665+00
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (test_id, topic_id, "order", text, image, timeout, answers, id, created, updated, skip_conditions, skip_text) FROM stdin;
1	\N	8	{"es": "8/90"}	\N	60	[{"text": {"es": "Me gusta “devolverla” cuando alguien me ofende"}, "result": {"k": 1}}, {"text": {"es": "Me gusta hacer cosas nuevas o diferentes."}, "result": {"z": 1}}]	10	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	3	{"es": "Lo se, es complicado, pero tienes que elegir una"}	\N	60	[{"text": {"es": "Me gusta enseñar a la gente cómo hacer las cosas"}, "result": {"p": 1}}, {"text": {"es": "Me gusta hacer las cosas lo mejor posible"}, "result": {"a": 1}}]	5	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	4	{"es": "Para ir más rápido te diré solo que está es la pregunta 4 de 90. Son muchas, pero se responde rápido"}	\N	60	[{"text": {"es": "Me gusta hacer las cosas lo mejor posible"}, "result": {"x": 1}}, {"text": {"es": "Me gusta decir a la gente lo que tiene que hacer"}, "result": {"p": 1}}]	6	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	5	{"es": "5/90"}	\N	60	[{"text": {"es": "Me gusta unirme a grupos"}, "result": {"b": 1}}, {"text": {"es": "Me gusta ser tomado en cuenta por los grupos"}, "result": {"x": 1}}]	7	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	6	{"es": "6/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me gusta hacer un amigo íntimo"}, "result": {"o": 1}}, {"text": {"es": "Me gusta hacer amistad con el grupo"}, "result": {"b": 1}}]	8	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	1	{"es": "En una situación profesional, ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Soy trabajador"}, "result": {"g": 1}}, {"text": {"es": "No soy de humor variable"}, "result": {"e": 1}}]	3	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	7	{"es": "7/90"}	\N	60	[{"text": {"es": "Soy rápido en cambiar cuando lo creo necesario"}, "result": {"z": 1}}, {"text": {"es": "Intento hacer amigos íntimos"}, "result": {"o": 1}}]	9	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	9	{"es": "9/90"}	\N	60	[{"text": {"es": "Quiero que mi jefe me estime"}, "result": {"f": 1}}, {"text": {"es": "Me gusta decir a la gente cuando están equivocados"}, "result": {"k": 1}}]	11	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	10	{"es": "10/90"}	\N	60	[{"text": {"es": "Me gusta seguir las instrucciones que me dan"}, "result": {"w": 1}}, {"text": {"es": "Me gusta agradar a mis superiores"}, "result": {"f": 1}}]	21	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	72	{"es": "72/90"}	\N	60	[{"text": {"es": "El grupo hace normalmente lo que yo quiero"}, "result": {"l": 1}}, {"text": {"es": "Normalmente tengo prisa"}, "result": {"t": 1}}]	83	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	30	{"es": "30/90"}	\N	60	[{"text": {"es": "Me gusta que me digan exactamente cómo hacer las cosas"}, "result": {"w": 1}}, {"text": {"es": "Me aburro fácilmente"}, "result": {"z": 1}}]	41	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	50	{"es": "50/90"}	\N	60	[{"text": {"es": "Me gusta tener instrucciones precisas para hacer un trabajo"}, "result": {"w": 1}}, {"text": {"es": "Me gusta estar con la gente"}, "result": {"b": 1}}]	61	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	2	{"es": "Igual que antes, ¿Con que afirmación te identificas más?"}	\N	60	[{"text": {"es": "Me gusta hacer el trabajo mejor que los demás"}, "result": {"a": 1}}, {"text": {"es": "Me gusta seguir con lo he empezado hasta terminarlo"}, "result": {"n": 1}}]	4	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	51	{"es": "51/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Siempre trato de hacer mi trabajo perfecto"}, "result": {"g": 1}}, {"text": {"es": "Me dicen que soy prácticamente incansable"}, "result": {"v": 1}}]	62	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	14	{"es": "14/90"}	\N	60	[{"text": {"es": "Me gusta ser animado e interesante"}, "result": {"x": 1}}, {"text": {"es": "Yo quiero tener mucho éxito"}, "result": {"a": 1}}]	25	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	15	{"es": "15/90"}	\N	60	[{"text": {"es": "Me gusta “encajar” con grupos"}, "result": {"b": 1}}, {"text": {"es": "Me gusta ayudar a las personas a tomar decisiones"}, "result": {"p": 1}}]	26	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	16	{"es": "16/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me preocupa cuando alguien no me estima"}, "result": {"o": 1}}, {"text": {"es": "Me gusta que la gente note mi presencia"}, "result": {"x": 1}}]	27	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	17	{"es": "17/90"}	\N	60	[{"text": {"es": "Me gusta probar cosas nuevas"}, "result": {"z": 1}}, {"text": {"es": "Prefiero trabajar con otras personas que solo"}, "result": {"b": 1}}]	28	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	18	{"es": "18/90"}	\N	60	[{"text": {"es": "Algunas veces culpo a otros cuando las cosas salen mal"}, "result": {"k": 1}}, {"text": {"es": "Me molesta cuando no le gusto a alguien"}, "result": {"o": 1}}]	29	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	19	{"es": "19/90"}	\N	60	[{"text": {"es": "Me gusta complacer a mis superiores"}, "result": {"f": 1}}, {"text": {"es": "Me gusta intentar trabajos nuevos y diferentes"}, "result": {"z": 1}}]	30	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	20	{"es": "20/90"}	\N	60	[{"text": {"es": "Me gusta tener instrucciones detalladas para hacer un trabajo"}, "result": {"w": 1}}, {"text": {"es": "Me gusta decírselo a la gente cuando me enfada"}, "result": {"k": 1}}]	31	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
27	\N	\N	{"es": "a"}	\N	\N	[{"text": {"es": "a"}, "result": {"key": "a", "value": "1"}}]	248	2022-12-04 13:55:52.771811+00	2022-12-04 13:55:52.771811+00	[]	{}
27	\N	\N	{"es": "b"}	\N	\N	[{"text": {"es": "b"}, "result": {"key": "a", "value": "1"}}]	250	2022-12-04 14:11:25.380122+00	2022-12-04 14:11:25.380122+00	[]	{}
1	\N	21	{"es": "21/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Siempre me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Me gusta ir paso a paso con gran cuidado"}, "result": {"d": 1}}]	32	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	23	{"es": "23/90"}	\N	60	[{"text": {"es": "Me enfado con facilidad"}, "result": {"i": 1}}, {"text": {"es": "Soy lento tomando decisiones"}, "result": {"e": 1}}]	34	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	24	{"es": "24/90"}	\N	60	[{"text": {"es": "Me gusta trabajar en varias actividades al mismo tiempo"}, "result": {"x": 1}}, {"text": {"es": "Cuando estoy en grupo me gusta estar callado"}, "result": {"n": 1}}]	35	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	25	{"es": "25/90"}	\N	60	[{"text": {"es": "Me encanta que me inviten"}, "result": {"b": 1}}, {"text": {"es": "Me gusta hacer las cosas mejor que los demás"}, "result": {"a": 1}}]	36	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	26	{"es": "26/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me gusta hacer amigos íntimos"}, "result": {"o": 1}}, {"text": {"es": "Me gusta hablar de mis éxitos"}, "result": {"p": 1}}]	37	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	27	{"es": "27/90"}	\N	60	[{"text": {"es": "Me gusta hacer cosas nuevas y diferentes"}, "result": {"z": 1}}, {"text": {"es": "Me gusta hablar de mis éxitos"}, "result": {"x": 1}}]	38	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	28	{"es": "28/90"}	\N	60	[{"text": {"es": "Cuando tengo razón me gusta luchar por ella"}, "result": {"k": 1}}, {"text": {"es": "Me gusta pertenecer a un grupo"}, "result": {"b": 1}}]	39	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	11	{"es": "11/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Soy ordenado"}, "result": {"c": 1}}]	22	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	12	{"es": "12/90"}	\N	60	[{"text": {"es": "Consigo que la gente haga lo que yo quiero"}, "result": {"l": 1}}, {"text": {"es": "No me altero fácilmente"}, "result": {"e": 1}}]	23	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	22	{"es": "22/90"}	\N	60	[{"text": {"es": "Soy un buen “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Organizo bien el trabajo en un puesto"}, "result": {"c": 1}}]	33	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	29	{"es": "29/90"}	\N	60	[{"text": {"es": "Evito ser diferente"}, "result": {"f": 1}}, {"text": {"es": "Intento acercarme mucho a la gente"}, "result": {"o": 1}}]	40	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	33	{"es": "33/90"}	\N	60	[{"text": {"es": "Tomo decisiones fácil y rápidamente"}, "result": {"i": 1}}, {"text": {"es": "Tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	44	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	34	{"es": "34/90"}	\N	60	[{"text": {"es": "Hago las cosas de prisa"}, "result": {"t": 1}}, {"text": {"es": "Yo no me pongo enfadado ni triste a menudo"}, "result": {"e": 1}}]	45	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	35	{"es": "35/90"}	\N	60	[{"text": {"es": "Quiero ser parte del grupo"}, "result": {"b": 1}}, {"text": {"es": "Quiero hacer un solo trabajo a un tiempo"}, "result": {"n": 1}}]	46	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	36	{"es": "36/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Intento hacer amigos íntimos"}, "result": {"o": 1}}, {"text": {"es": "Intento mucho ser el mejor"}, "result": {"a": 1}}]	47	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	37	{"es": "37/90"}	\N	60	[{"text": {"es": "Me gustan los nuevos estilos en trajes y coches"}, "result": {"z": 1}}, {"text": {"es": "Me gusta ser responsable por otros"}, "result": {"p": 1}}]	48	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	38	{"es": "38/90"}	\N	60	[{"text": {"es": "Disfruto discutiendo"}, "result": {"k": 1}}, {"text": {"es": "Me gusta llamar la atención"}, "result": {"x": 1}}]	49	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	39	{"es": "39/90"}	\N	60	[{"text": {"es": "Me gusta agradar a mis superiores"}, "result": {"f": 1}}, {"text": {"es": "Estoy interesado en ser parte del grupo"}, "result": {"b": 1}}]	50	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	41	{"es": "41/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Soy muy amigable"}, "result": {"s": 1}}]	52	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	42	{"es": "42/90"}	\N	60	[{"text": {"es": "La gente piensa que soy un buen “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Pienso con cuidado y largamente"}, "result": {"r": 1}}]	53	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	43	{"es": "43/90"}	\N	60	[{"text": {"es": "A menudo me arriesgo"}, "result": {"i": 1}}, {"text": {"es": "Me gusta protestar por pequeñas cosas"}, "result": {"d": 1}}]	54	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	44	{"es": "44/90"}	\N	60	[{"text": {"es": "La gente piensa que trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "La gente piensa que tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	55	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	45	{"es": "45/90"}	\N	60	[{"text": {"es": "Me gusta jugar y hacer deportes"}, "result": {"v": 1}}, {"text": {"es": "Soy muy agradable"}, "result": {"e": 1}}]	56	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	46	{"es": "46/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me gusta que la gente esté unida y sea amistosa"}, "result": {"o": 1}}, {"text": {"es": "Siempre trato de terminar lo que he empezado"}, "result": {"n": 1}}]	57	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	48	{"es": "48/90"}	\N	60	[{"text": {"es": "Me gusta que me traten justamente"}, "result": {"k": 1}}, {"text": {"es": "Me gusta decir a los demás cómo hacer las cosas"}, "result": {"p": 1}}]	59	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	49	{"es": "49/90"}	\N	60	[{"text": {"es": "Me gusta hacer aquello que esperan de mí"}, "result": {"f": 1}}, {"text": {"es": "Me gusta llamar la atención"}, "result": {"x": 1}}]	60	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	31	{"es": "31/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Trabajo mucho"}, "result": {"g": 1}}, {"text": {"es": "Pienso y planeo mucho"}, "result": {"r": 1}}]	42	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	32	{"es": "32/90"}	\N	60	[{"text": {"es": "Me gusta dirigir el grupo"}, "result": {"l": 1}}, {"text": {"es": "Los pequeños detalles me interesan"}, "result": {"d": 1}}]	43	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	40	{"es": "40/90"}	\N	60	[{"text": {"es": "Me gusta seguir las reglas con cuidado"}, "result": {"w": 1}}, {"text": {"es": "Me gusta que la gente me conozca muy bien"}, "result": {"o": 1}}]	51	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	47	{"es": "47/90"}	\N	60	[{"text": {"es": "Me gusta experimentar y probar nuevas cosas"}, "result": {"z": 1}}, {"text": {"es": "Me gusta hacer bien un trabajo difícil"}, "result": {"a": 1}}]	58	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	54	{"es": "54/90"}	\N	60	[{"text": {"es": "Trabajo a un paso rápido y constante"}, "result": {"t": 1}}, {"text": {"es": "Disfruto trabajando en detalles"}, "result": {"d": 1}}]	65	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	55	{"es": "55/90"}	\N	60	[{"text": {"es": "Tengo mucha energía para juegos y deportes"}, "result": {"v": 1}}, {"text": {"es": "Tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	66	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	56	{"es": "56/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Me llevo bien con todo el mundo"}, "result": {"s": 1}}, {"text": {"es": "Soy de temperamento estable"}, "result": {"e": 1}}]	67	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	58	{"es": "58/90"}	\N	60	[{"text": {"es": "Normalmente lucho por lo que yo creo"}, "result": {"k": 1}}, {"text": {"es": "Normalmente me gusta trabajar mucho"}, "result": {"a": 1}}]	69	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	59	{"es": "59/90"}	\N	60	[{"text": {"es": "Me gustan las sugerencias de las personas que admiro"}, "result": {"f": 1}}, {"text": {"es": "Me gusta estar encargado de otras personas"}, "result": {"p": 1}}]	70	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	60	{"es": "60/90"}	\N	60	[{"text": {"es": "Me dejo influenciar mucho por la gente"}, "result": {"w": 1}}, {"text": {"es": "Me gusta ser el centro de atención"}, "result": {"x": 1}}]	71	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	62	{"es": "62/90"}	\N	60	[{"text": {"es": "Cuando hablo el grupo escucha"}, "result": {"l": 1}}, {"text": {"es": "Soy hábil con herramientas"}, "result": {"v": 1}}]	73	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	63	{"es": "63/90"}	\N	60	[{"text": {"es": "Soy lento en hacer amigos"}, "result": {"i": 1}}, {"text": {"es": "Soy lento en decidirme"}, "result": {"s": 1}}]	74	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	64	{"es": "64/90"}	\N	60	[{"text": {"es": "Normalmente como de prisa"}, "result": {"t": 1}}, {"text": {"es": "Disfruto leyendo"}, "result": {"r": 1}}]	75	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	65	{"es": "65/90"}	\N	60	[{"text": {"es": "Me gusta el trabajo en donde puedo moverme"}, "result": {"v": 1}}, {"text": {"es": "Me gusta el trabajo que tenga que hacerse con cuidado"}, "result": {"d": 1}}]	76	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	67	{"es": "67/90"}	\N	60	[{"text": {"es": "Planeo a largo plazo"}, "result": {"r": 1}}, {"text": {"es": "Siempre soy agradable"}, "result": {"e": 1}}]	78	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	68	{"es": "68/90"}	\N	60	[{"text": {"es": "Tengo gran orgullo de mi buen nombre"}, "result": {"k": 1}}, {"text": {"es": "Insisto en un problema hasta que está resuelto"}, "result": {"n": 1}}]	79	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	69	{"es": "69/90"}	\N	60	[{"text": {"es": "Me gusta agradar ala gente que admiro"}, "result": {"f": 1}}, {"text": {"es": "Quiero tener éxito"}, "result": {"a": 1}}]	80	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	70	{"es": "70/90"}	\N	60	[{"text": {"es": "Me gusta que otros tomen decisiones para el grupo"}, "result": {"w": 1}}, {"text": {"es": "A mi me gusta tomar decisiones para el grupo"}, "result": {"p": 1}}]	81	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	71	{"es": "71/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Siempre me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Tomo decisiones fácilmente y rápidamente"}, "result": {"i": 1}}]	82	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	52	{"es": "52/90"}	\N	60	[{"text": {"es": "Soy el tipo “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Hago amigos fácilmente"}, "result": {"s": 1}}]	63	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	53	{"es": "53/90"}	\N	60	[{"text": {"es": "Asumo riesgos"}, "result": {"i": 1}}, {"text": {"es": "Pienso mucho"}, "result": {"r": 1}}]	64	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	61	{"es": "61/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Normalmente trabajo mucho"}, "result": {"g": 1}}, {"text": {"es": "Normalmente trabajo de prisa"}, "result": {"t": 1}}]	72	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	66	{"es": "66/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Hago el mayor número posible de amigos"}, "result": {"s": 1}}, {"text": {"es": "Encuentro lo que he guardado"}, "result": {"c": 1}}]	77	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	75	{"es": "75/90"}	\N	60	[{"text": {"es": "Normalmente tengo energía"}, "result": {"v": 1}}, {"text": {"es": "Dedico mucho tiempo a pensar"}, "result": {"r": 1}}]	86	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	77	{"es": "77/90"}	\N	60	[{"text": {"es": "Pienso y planeo mucho"}, "result": {"r": 1}}, {"text": {"es": "Guardo todas las cosas en su sitio"}, "result": {"c": 1}}]	88	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	78	{"es": "78/90"}	\N	60	[{"text": {"es": "Me gusta el trabajo que requiere detalles"}, "result": {"d": 1}}, {"text": {"es": "Tardo en enfadarme"}, "result": {"e": 1}}]	89	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	79	{"es": "79/90"}	\N	60	[{"text": {"es": "Me gusta seguir a la gente que admiro"}, "result": {"f": 1}}, {"text": {"es": "Siempre termino el trabajo que he empezado"}, "result": {"n": 1}}]	90	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	80	{"es": "80/90"}	\N	60	[{"text": {"es": "Me gustan las instrucciones claras"}, "result": {"w": 1}}, {"text": {"es": "Me gusta trabajar mucho"}, "result": {"a": 1}}]	91	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	81	{"es": "81/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Persigo aquello que deseo"}, "result": {"g": 1}}, {"text": {"es": "Soy un buen “dirigente”"}, "result": {"l": 1}}]	92	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	82	{"es": "82/90"}	\N	60	[{"text": {"es": "Hago que los demás trabajen mucho"}, "result": {"l": 1}}, {"text": {"es": "Soy desenfadado"}, "result": {"i": 1}}]	93	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	84	{"es": "84/90"}	\N	60	[{"text": {"es": "Normalmente trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "Hablo de prisa"}, "result": {"v": 1}}]	95	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	85	{"es": "85/90"}	\N	60	[{"text": {"es": "No me gusta conocer gente"}, "result": {"v": 1}}, {"text": {"es": "Me canso enseguida"}, "result": {"s": 1}}]	96	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	86	{"es": "86/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Hago muchísimos amigos"}, "result": {"s": 1}}, {"text": {"es": "Dedico mucho tiempo a pensar"}, "result": {"r": 1}}]	97	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	87	{"es": "87/90"}	\N	60	[{"text": {"es": "Me gusta pensar sobre teoría"}, "result": {"r": 1}}, {"text": {"es": "Me gusta trabajar con detalles"}, "result": {"d": 1}}]	98	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	88	{"es": "88/90"}	\N	60	[{"text": {"es": "Me gusta trabajar con detalles"}, "result": {"d": 1}}, {"text": {"es": "Me gusta organizar mi trabajo"}, "result": {"c": 1}}]	99	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	89	{"es": "89/90"}	\N	60	[{"text": {"es": "Pongo las cosas en su sitio"}, "result": {"c": 1}}, {"text": {"es": "Siempre soy agradable"}, "result": {"e": 1}}]	100	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	74	{"es": "74/90"}	\N	60	[{"text": {"es": "Trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "Hago amigos enseguida"}, "result": {"s": 1}}]	85	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	57	{"es": "57/90"}	\N	60	[{"text": {"es": "Quiero conocer nueva gente y hacer cosas nuevas"}, "result": {"z": 1}}, {"text": {"es": "Siempre quiero terminar el trabajo que he empezado"}, "result": {"n": 1}}]	68	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	73	{"es": "73/90"}	\N	60	[{"text": {"es": "A menudo me siento cansando"}, "result": {"i": 1}}, {"text": {"es": "Soy lento tomando decisiones"}, "result": {"v": 1}}]	84	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	76	{"es": "76/90 ¿Con que afirmación te sientes más comodo?"}	\N	60	[{"text": {"es": "Soy muy cordial con la gente"}, "result": {"s": 1}}, {"text": {"es": "Me gusta el trabajo que requiere precisión"}, "result": {"d": 1}}]	87	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	83	{"es": "83/90"}	\N	60	[{"text": {"es": "Tomo decisiones rápidas"}, "result": {"i": 1}}, {"text": {"es": "Hablo de prisa"}, "result": {"t": 1}}]	94	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
1	\N	90	{"es": "90/90"}	\N	60	[{"text": {"es": "Me gusta que me digan qué he de hacer"}, "result": {"w": 1}}, {"text": {"es": "Tengo que terminar lo que he empezado"}, "result": {"n": 1}}]	101	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
0	\N	3	{"es": "Me crearon con 3 objetivos:. 👉 Ofercerte caminos por los que evolucionar profecionalmente. 👉 Ayudarte a aprender recomendandote videos y textos. 👉 Hacerte seguimiento de tus progresos, y. 👉 Recomendarte las empresas y puestos que mejor encajen contigo"}	\N	600	[{"text": {"es": "Mola!"}, "result": {"action": "u/initialized/true"}}]	105	2021-01-04 22:05:29.16619+00	2021-01-04 22:05:29.16619+00	[{"value": "{{user.initialized}}", "expected": "true"}]	{"es": "Peeeeerfecto 👌"}
0	\N	1	{"es": "Como prefieres que te llame?"}	\N	600	[{"text": {"es": "{{user.name}}"}, "result": {"action": "u/nickname/{{user.name}}"}}, {"text": {"es": "{{user.surname}}"}, "result": {"action": "u/nickname/{{user.surname}}"}}, {"text": {"es": "{{user.nickname}}"}, "result": {"action": "u/nickname/{{user.nickname}}"}}, {"open": true, "text": {"es": "Mejor llamame..."}, "result": {"action": "u/nickname/***"}}]	102	2020-12-20 20:56:14.967534+00	2020-12-20 20:56:14.967534+00	[]	{}
0	\N	2	{"es": "Quieres que te cuenta porque existo?"}	\N	600	[{"text": {"es": "Vale 👍"}, "result": {"action": "u/initialized/false"}}, {"text": {"es": "Ya me se la historia 😜"}, "result": {"action": "u/initialized/true"}}, {"text": {"es": "very very very very very very very very very very very very very very very very very long"}, "result": {"action": "u/initialized/xxx"}}]	104	2021-01-04 21:55:45.656062+00	2021-01-04 21:55:45.656062+00	[]	{}
2	\N	1	{"es": "Cual de los siguientes datos es un string?"}	\N	60	[{"text": {"es": "4"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "4.0"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "'4'"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "04"}, "result": {"right": 0, "total": 1}}]	106	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
2	\N	1	{"es": "Cual de los siguientes datos es un número?"}	\N	60	[{"text": {"es": "4"}, "result": {"right": 0.5, "total": 1}}, {"text": {"es": "4.0"}, "result": {"right": 0.5, "total": 1}}, {"text": {"es": "'4'"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Las opciones 1 y 2 son correctas"}, "result": {"right": 1, "total": 1}}]	107	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
0	\N	4	{"es": "Estudias o trabajas? Que conste que no estoy intentado ligar 😇... jajaja"}	\N	600	[{"text": {"es": "Trabajo"}, "result": {"action": ["u/working/true", "u/studing/false"]}}, {"text": {"es": "Estudio"}, "result": {"action": ["u/working/false", "u/studing/true"]}}, {"text": {"es": "Las dos"}, "result": {"action": ["u/working/true", "u/studing/true"]}}]	103	2020-12-20 20:56:14.967534+00	2020-12-20 20:56:14.967534+00	[]	{}
2	\N	1	{"es": "Que valores puede tener un dato booleano?"}	\N	60	[{"text": {"es": "True o False"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "True, False o Null"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "0 ó 1"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "0, 1 o Undefined"}, "result": {"right": 0, "total": 1}}]	108	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
2	\N	1	{"es": "Cuales son los tipos de datos basicos en JavaScript"}	\N	60	[{"text": {"es": "Int y Booleanos"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Int, Float, Booleanos y Null"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Undefined"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Strings"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Arrays y Objetos"}, "result": {"right": 1, "total": 1}}]	109	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
2	\N	1	{"es": "Cual es el índice del element 'manzana' en el Array: ['manzana', 'pera, 'platano', 'melocotón']"}	\N	60	[{"text": {"es": "0"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "1"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "2"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "3"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "4"}, "result": {"right": 0, "total": 1}}]	110	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00	[]	{}
21	\N	\N	{"es": "¿Cómo se llama la utilidad del JDK que nos permite generar páginas Web a partir de unos comentarios especiales insertados en el código fuente?"}	\N	\N	[{"text": {"es": "docuweb"}, "result": {"right": "0"}}, {"text": {"es": "javadoc"}, "result": {"right": "1"}}]	165	2022-12-01 17:22:41.937057+00	2022-12-01 17:22:41.937057+00	[]	{}
21	\N	\N	{"es": "¿Cual de las siguientes definiciones se ajusta mejor a la definición de `identificador` en Java?"}	\N	\N	[{"text": {"es": "Comienza por cualquier carácter y tiene un máximo de 128 caracteres."}, "result": {"right": "0"}}, {"text": {"es": "Puede utilizar cualquier tipo de carácter, incluso caracteres especiales como ’ñ’ o ’Ç’."}, "result": {"right": "1"}}]	166	2022-12-01 17:23:43.017274+00	2022-12-01 17:23:43.017274+00	[]	{}
21	\N	\N	{"es": "¿Es posible convertir un valor de tipo boolean a un entero int?"}	\N	\N	[{"text": {"es": "Si. Al igual que en C, el tipo boolean es en realidad un valor entero (0-false; 1-true)."}, "result": {"right": "0"}}, {"text": {"es": "No es posible ni de forma automática ni haciendo casting, ya que el tipo boolean no es compatible con ningún otro."}, "result": {"right": "1"}}]	167	2022-12-01 17:24:14.113419+00	2022-12-01 17:24:14.113419+00	[]	{}
21	\N	\N	{"es": "Cuando tenemos una expresión con varios paréntesis anidados,"}	\N	\N	[{"text": {"es": "Se evaluará comenzando por el paréntesis de mayor nivel (el más interior)."}, "result": {"right": "1"}}, {"text": {"es": "Se evaluará teniendo en cuenta sólo la prioridad o nivel de precedencia de los operadores, pues los paréntesis sólo sirven para presentar de manera más clara la expresión al programador."}, "result": {"right": "0"}}]	168	2022-12-01 17:25:39.524004+00	2022-12-01 17:25:39.524004+00	[]	{}
21	\N	\N	{"es": "¿Es necesario habilitar la comprobación de aserciones para poder utilizarlas?"}	\N	\N	[{"text": {"es": "No, si se utiliza la sentencia ’assert’ ya se habilitan automáticamente."}, "result": {"right": "0"}}, {"text": {"es": "Sí, con unos argumentos a la hora de invocar a la JVM (java -ea ...)"}, "result": {"right": "1"}}]	169	2022-12-01 17:26:09.845575+00	2022-12-01 17:26:09.845575+00	[]	{}
21	\N	\N	{"es": "En un objeto de la clase Vector podemos almacenar:"}	\N	\N	[{"text": {"es": "Objetos de cualquier clase (mezclados)."}, "result": {"right": "1", "total": ""}}, {"text": {"es": "Sólo objetos que tengan alguna relación, por ejemplo, que sus clases hereden de una misma clase (distinta de Object)."}, "result": {"right": "0", "total": ""}}]	170	2022-12-01 17:26:48.100274+00	2022-12-01 17:26:48.100274+00	[]	{}
15	\N	\N	{"es": "pregunta"}	\N	\N	[{"text": {"es": "respuesta pregunta "}, "result": {"right": 1}}]	164	2022-12-01 15:28:26.146184+00	2022-12-01 15:28:26.146184+00	[]	{}
20	\N	\N	{"de": "Was is das?", "es": "esto es lo que sea"}	\N	\N	[{"text": {"de": "lo que sea en aleman", "es": "lo que sea"}, "result": {"right": 1, "total": "0"}}, {"text": {"de": "lo que sea 2 en aleman", "es": "lo que sea 2"}, "result": {"right": 0, "total": "1"}}]	149	2022-11-13 20:31:35.024+00	2022-11-13 20:31:35.024+00	[]	{}
20	\N	\N	{"es": "¿Si?"}	\N	\N	[{"text": {"es": "No"}, "result": 1}, {"text": {"es": "Si"}, "result": 0}]	141	2022-11-10 14:13:51.615943+00	2022-11-10 14:13:51.615943+00	[]	{}
20	\N	\N	{"es": "dfsdf"}	\N	\N	[{"text": {"es": "dsf"}, "result": {"right": 1}}]	152	2022-11-14 09:17:53.808953+00	2022-11-14 09:17:53.808953+00	[]	{}
20	\N	\N	{"es": "Esto es una prueba"}	\N	\N	[{"text": {"es": "Prueba 1"}, "result": 1}]	150	2022-11-14 09:00:36.826379+00	2022-11-14 09:00:36.826379+00	[]	{}
21	\N	\N	{"es": "En un ’applet’, la función init() se ejecuta:"}	\N	\N	[{"text": {"es": "Al visitar por primera vez la página web que referencia al applet."}, "result": {"right": "1"}}, {"text": {"es": "Cada vez que se visita la página web que referencia al applet sin cerrar el navegador."}, "result": {"right": "0"}}]	171	2022-12-01 17:27:16.283918+00	2022-12-01 17:27:16.283918+00	[]	{}
21	\N	\N	{"es": "La clase DataInputStream se utiliza para ..."}	\N	\N	[{"text": {"es": "Abrir un fichero binario para lectura."}, "result": {"right": "0"}}, {"text": {"es": "Leer datos de tipo primitivo."}, "result": {"right": "1"}}]	172	2022-12-01 17:27:56.121825+00	2022-12-01 17:27:56.121825+00	[]	{}
21	\N	\N	{"es": "Un objeto de la clase URLConnection nos permite:"}	\N	\N	[{"text": {"es": "Averiguar la dirección IP de cualquier ordenador a partir de su nombre, y viceversa."}, "result": {"right": "0"}}, {"text": {"es": "Trocear en paquetes la información a transmitir a través de un socket."}, "result": {"right": "0"}}]	173	2022-12-01 17:28:32.588163+00	2022-12-01 17:28:32.588163+00	[]	{}
21	\N	\N	{"es": "¿Con qué otro nombre se conoce a la base de datos relacional JavaDB?"}	\N	\N	[{"text": {"es": "Apache Derby"}, "result": {"right": "1"}}, {"text": {"es": "Java Derby"}, "result": {"right": "0"}}]	174	2022-12-01 17:28:55.886037+00	2022-12-01 17:28:55.886037+00	[]	{}
15	\N	\N	{"es": "a"}	\N	\N	[{"text": {"es": "aa"}, "result": {"right": "a", "total": 1}}, {"text": {"es": "bb"}, "result": {"right": "b", "total": 0}}, {"text": {"es": "cc"}, "result": {"right": "c", "total": 0}}]	264	2022-12-06 10:22:54.632187+00	2022-12-06 10:22:54.632187+00	[]	{}
15	\N	\N	{"es": ""}	\N	\N	[{"text": {"es": "c"}, "result": {"right": "a", "total": 1}}, {"text": {"es": "b"}, "result": {"right": "b", "total": 0}}, {"text": {"es": "a"}, "result": {"right": "c", "total": 0}}, {"text": {"es": "d"}, "result": {"right": "d", "total": 1}}]	265	2022-12-06 16:32:25.429261+00	2022-12-06 16:32:25.429261+00	[]	{}
15	\N	\N	{"es": "Pregunta 1"}	\N	\N	[{"text": {"es": "RespuestaA"}, "result": {"right": "a", "total": 1}}, {"text": {"es": "RespuestaB"}, "result": {"right": "b", "total": 0}}, {"text": {"es": "RespuestaC"}, "result": {"right": "c", "total": 0}}]	260	2022-12-06 09:42:09.499498+00	2022-12-06 09:42:09.499498+00	[]	{}
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, topic_id, name, url, status, created, updated) FROM stdin;
5	\N	"Prueba"	\N	\N	2021-10-12 15:25:13.325762+00	2021-10-12 15:25:13.325762+00
1	\N	"Prueba"	\N	\N	2021-10-12 15:27:15.946725+00	2021-10-12 15:27:15.946725+00
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (dimentions, id, path_id, name, "desc", created, updated, priority, questions_last, questions_day, key, conclusion) FROM stdin;
{"a": {"name": {"es": "Necesidad de logro"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "b": {"name": {"es": "Necesidad de pertenecer a grupos"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "c": {"name": {"es": "Orden"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "d": {"name": {"es": "Atención a los detalles"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "e": {"name": {"es": "Contención emocional"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "f": {"name": {"es": "Necesidad de apoyar a sus superiores"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "g": {"name": {"es": "Rol del trabajador duro"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "h": {"name": {"es": "Planificación"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "i": {"name": {"es": "Facilidad para tomar decisiones"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "k": {"name": {"es": "Necesidad de imponerse a los demás"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "l": {"name": {"es": "Rol de líder"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "n": {"name": {"es": "Necesidad de terminar una tarea"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "o": {"name": {"es": "Necesidad de intimidad y afecto"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "p": {"name": {"es": "Necesidad de controlar a los demás"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "r": {"name": {"es": "Pensamiento teórico"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "s": {"name": {"es": "Cordialidad"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "t": {"name": {"es": "Ritmo de trabajo"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "v": {"name": {"es": "Persistencia"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "w": {"name": {"es": "Necesidad de normas"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "x": {"name": {"es": "Necesidad de protagonismo"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "z": {"name": {"es": "Necesidad de cambio"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}}	1	1	{"es": "Me gustaría continuar con el Test PAPI, que viene del inglés \\"Personality and Preference Inventory\\""}	{"es": "Es uno de los test más utilizados en RRHH porque es bastante fiables y rápido de hacer. Normalmente se utiliza para saber si una persona encaja en un determinado puesto. Ten en cuenta que este test no se puede aprobar o suspender. Sólo indica como eres. Te interesa saber como te ven las empresas?"}	2020-12-17 17:20:54.872029+00	2020-12-17 17:20:54.872029+00	1000	2020-12-22	5	papi	{"es": "Ya hemos terminado el test PAPI. Estos son los resultados. {{#each conclusions}}{{name}}: {{#if importance}}*{{/if}}({{value}}/10) {{message}}{{#if importance}}*{{/if}}. {{/each}}"}
\N	2	2	{"es": "Todo programador Javascript que se precide debe tener un buen conocimiento de los tipos de datos que puede manejar"}	{"es": "vamos a empezar con algo sencillo para ir calentando motores 🚀"}	2021-08-24 20:25:08.290341+00	2021-08-24 20:25:08.290341+00	9000	2021-08-24	5	js-data_types-basic	{"es": "Vale, hemos acabado con las preguntas básicas sobre tipos de variables. Aquí van tus restulados! {{#each conclusions}}{{name}}: {{#if importance}}*{{/if}}({{value}}/10) {{message}}{{#if importance}}*{{/if}}. {{/each}}"}
\N	21	40	{"es": "Java Test Febrero 2022"}	{"es": "Cuestionario tipo test del examen 2022 asignatura programación avanzada"}	2022-11-28 17:10:15.634559+00	2022-11-28 17:10:15.634559+00	0	2022-11-28	5	\N	{"es": "Evaluación ordinaria programación avanzada"}
\N	30	40	{"es": "Java Test 2"}	{"es": "Este es el segundo test de Java"}	2022-12-04 14:17:50.724736+00	2022-12-04 14:17:50.724736+00	0	2022-12-04	5	\N	{"es": "Necesito ver primero tus conocimientos de Java"}
\N	20	2	{"es": "Que hay de nuevo amigo"}	{"es": "Test muy novedoso"}	2022-11-10 14:13:34.428485+00	2022-11-10 14:13:34.428485+00	0	2022-11-10	5	\N	{"es": "Claro que sí"}
\N	6	1	{"es": "Prueba"}	{"es": "desc de prueba"}	2021-10-02 11:48:14.22895+00	2021-10-02 11:48:14.22895+00	0	2021-10-02	5	\N	{"es": "desc de prueba 2"}
\N	0	\N	{"es": "Que te parece si empezamos por algunas preguntas básicas"}	{"es": "y así nos vamos conociendonos"}	2020-12-20 20:49:59.461751+00	2020-12-20 20:49:59.461751+00	10000	2020-12-22	100	basic	{"es": "Vale, hemos acabado con las preguntas básicas sobre tipos de variables. Aquí van tus restulados! {{#each conclusions}}{{name}}: {{#if importance}}*{{/if}}({{value}}/10) {{message}}{{#if importance}}*{{/if}}. {{/each}}"}
\N	15	2	{"es": "hola"}	{"es": "hola"}	2022-11-08 20:08:38.703933+00	2022-11-08 20:08:38.703933+00	0	2022-11-08	5	\N	{"es": "hola"}
\N	27	40	{"es": "Java Test 2 edited"}	{"es": "Este es el segundo test de Java edited"}	2022-11-30 19:07:45.846422+00	2022-11-30 19:07:45.846422+00	0	2022-11-30	5	\N	{"es": "Necesito ver primero tus conocimientos de Java edited"}
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (topic_id, name, created, updated) FROM stdin;
4	"Python"	2021-10-11 11:12:25.026272+00	2021-10-11 11:12:25.026272+00
5	"Python"	2021-10-12 15:21:32.33825+00	2021-10-12 15:21:32.33825+00
7	"Postgres"	2022-05-25 11:42:06.944436+00	2022-05-25 11:42:06.944436+00
6	"soy Estocolmo"	2022-05-25 11:41:22.833984+00	2022-05-25 11:41:22.833984+00
8	"New Balance"	2022-05-25 12:00:51.829313+00	2022-05-25 12:00:51.829313+00
3	"Amazon"	2021-10-11 10:17:33.640372+00	2021-10-11 10:17:33.640372+00
\.


--
-- Data for Name: user_careers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_careers (career_id, user_id, status, created, updated) FROM stdin;
\.


--
-- Data for Name: user_paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_paths (path_id, user_id, status, created, updated) FROM stdin;
15	233	active	2022-12-14 13:34:15.267936+00	2022-12-14 13:34:15.267936+00
40	233	active	2022-12-14 13:43:43.244748+00	2022-12-14 13:43:43.244748+00
1	233	active	2022-12-14 13:43:45.652292+00	2022-12-14 13:43:45.652292+00
2	233	active	2022-12-14 13:43:39.818252+00	2022-12-14 13:43:39.818252+00
\.


--
-- Data for Name: user_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_questions (question_id, status, answer, test_id, user_id, created, updated, skip_conditions, skip_text) FROM stdin;
105	skipped	\N	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[{"value": "{{user.initialized}}", "expected": "true"}]	{"es": "Peeeeerfecto 👌"}
103	skipped	\N	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
102	skipped	{"action": "u/nickname/Jovi"}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
104	skipped	{"action": "u/initialized/true"}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
106	done	{"right": 1, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
107	done	{"right": 0.5, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
108	done	{"right": 1, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
109	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
110	done	{"right": 1, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
\.


--
-- Data for Name: user_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_resources (user_id, topic_id) FROM stdin;
19	1
\.


--
-- Data for Name: user_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tests (id, test_id, user_id, status, acc_results, created, updated, questions_today, questions_day) FROM stdin;
132	0	19	complete	{"right": 3.5, "total": 5}	2021-09-25 10:13:57.34+00	2021-09-25 10:13:57.34+00	4	100
140	6	19	\N	{}	2021-10-12 15:51:45.235278+00	2021-10-12 15:51:45.235278+00	0	5
141	6	19	\N	{}	2021-10-12 15:52:40.101213+00	2021-10-12 15:52:40.101213+00	0	5
142	6	19	\N	{}	2021-10-12 15:56:01.734534+00	2021-10-12 15:56:01.734534+00	0	5
143	2	19	\N	{}	2021-11-02 11:36:43.538257+00	2021-11-02 11:36:43.538257+00	0	5
144	2	19	\N	{}	2021-11-02 11:36:45.797562+00	2021-11-02 11:36:45.797562+00	0	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, surname, nickname, lang, telegram_id, initialized, created, updated, today_questions, average_questions, email, age, studing, working, job_title, password, is_admin) FROM stdin;
19	Jovi	Sogorb	Jovi	es	3	t	2020-12-20 21:38:39.383+00	2020-12-20 21:38:39.383+00	5	5	frangalo34@gmail.com	\N	f	t	\N	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeZA8ZO/UAIm5jEcWfD5v6ooyAh1lzQbe	t
218	Parco	Froglore	parquito	en	3	f	2022-12-06 19:55:13.656142+00	2022-12-06 19:55:13.656142+00	5	5	parco_forglore@gmail.com	\N	\N	\N	\N	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeKkppyHiVYYjUYRYtvdUfW006bfgCtum	t
24	admin	admin	admin	es	3	f	2021-01-03 17:30:55.123+00	2021-01-03 17:30:55.123+00	5	5	NULL	\N	f	t	\N		t
233	user	user	user	en	3	f	2022-12-12 17:49:14.903951+00	2022-12-12 17:49:14.903951+00	5	5	user@user.es	\N	f	t	\N	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeWMxotDfIpSLSUH8GNj7D6LrEMx1Ckv2	f
51	Maria12	Maria12	Maria12	es	3	f	2022-02-21 12:32:38.299142+00	2022-02-21 12:32:38.299142+00	5	5	frangalo34@gmail.com	\N	\N	\N	\N	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeKkppyHiVYYjUYRYtvdUfW006bfgCtum	t
103	admin	admin	admin	es	3	f	2022-11-08 21:12:43.27099+00	2022-11-08 21:12:43.27099+00	5	5	fsdf@xdfs	\N	\N	\N	\N	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeCftiIXAwlPTaJTzMLMZxvjGZBiDgZTG	t
\.


--
-- Name: careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.careers_id_seq', 1, false);


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paths_id_seq', 83, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 271, true);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_id_seq', 8, true);


--
-- Name: table_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_name_id_seq', 1, false);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 64, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 8, true);


--
-- Name: user_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_test_id_seq', 144, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 239, true);


--
-- Name: careers careers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (id);


--
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (topic_id);


--
-- Name: user_careers user_careers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_careers
    ADD CONSTRAINT user_careers_pkey PRIMARY KEY (career_id, user_id);


--
-- Name: user_paths user_paths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_paths
    ADD CONSTRAINT user_paths_pkey PRIMARY KEY (path_id, user_id);


--
-- Name: user_questions user_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_questions
    ADD CONSTRAINT user_questions_pkey PRIMARY KEY (question_id, user_id);


--
-- Name: user_resources user_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_resources
    ADD CONSTRAINT user_resources_pkey PRIMARY KEY (user_id, topic_id);


--
-- Name: user_tests user_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tests
    ADD CONSTRAINT user_tests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: questions questions_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: questions questions_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(topic_id);


--
-- Name: resources resources_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(topic_id);


--
-- Name: tests tests_path_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_path_id_fkey FOREIGN KEY (path_id) REFERENCES public.paths(id);


--
-- Name: user_careers user_careers_career_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_careers
    ADD CONSTRAINT user_careers_career_id_fkey FOREIGN KEY (career_id) REFERENCES public.careers(id);


--
-- Name: user_paths user_paths_path_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_paths
    ADD CONSTRAINT user_paths_path_id_fkey FOREIGN KEY (path_id) REFERENCES public.paths(id);


--
-- Name: user_paths user_paths_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_paths
    ADD CONSTRAINT user_paths_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_questions user_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_questions
    ADD CONSTRAINT user_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: user_questions user_questions_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_questions
    ADD CONSTRAINT user_questions_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: user_questions user_questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_questions
    ADD CONSTRAINT user_questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_resources user_resources_resources_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_resources
    ADD CONSTRAINT user_resources_resources_id_fkey FOREIGN KEY (topic_id) REFERENCES public.resources(id);


--
-- Name: user_resources user_resources_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_resources
    ADD CONSTRAINT user_resources_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_tests user_tests_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tests
    ADD CONSTRAINT user_tests_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: user_tests user_tests_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tests
    ADD CONSTRAINT user_tests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

