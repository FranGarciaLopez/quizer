--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paths (
    id integer NOT NULL,
    name jsonb NOT NULL,
    "desc" jsonb,
    type character varying NOT NULL,
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
    timeout integer,
    answers jsonb,
    id integer NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: COLUMN questions.text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.questions.text IS 'tranlation';


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
    key character varying
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
    id integer NOT NULL,
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
-- Name: user_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_tests_id_seq OWNER TO postgres;

--
-- Name: user_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tests_id_seq OWNED BY public.user_tests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    surname character varying,
    nickname character varying NOT NULL,
    lang character varying NOT NULL,
    initialized boolean DEFAULT false,
    created timestamp with time zone DEFAULT now() NOT NULL,
    updated timestamp with time zone DEFAULT now() NOT NULL,
    today_questions integer DEFAULT 5 NOT NULL,
    average_questions integer DEFAULT 5 NOT NULL,
    email character varying,
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
-- Name: user_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tests ALTER COLUMN id SET DEFAULT nextval('public.user_tests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paths (id, name, "desc", type, requirements, created, updated) FROM stdin;
1	{"en": "I need you to do this test.", "es": "Necesito que hagas este test."}	{"en": "As a mentor, I want to meet you and to meet yourself.", "es": "Como mentor, necesito conocerte y necesito que te conozcas. . Es la única manera de que este viaje te lleve al lugar correcto"}	psyco	"\\"[]\\""	2020-12-17 17:28:16.091338+00	2020-12-17 17:28:16.091338+00
2	{"en": "Java Script", "es": "Java Script"}	{"en": "Java Script Tests ", "es": "Tests de Java Script"}	JavaScript	"\\"[]\\""	2021-08-24 20:24:57.127691+00	2021-08-24 20:24:57.127691+00
40	{"en": "Java", "es": "Java"}	{"en": "Learn the concepts of Java", "es": "Aprende los conceptos de Java"}	psyco	[]	2022-11-28 12:29:33.776665+00	2022-11-28 12:29:33.776665+00
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (test_id, topic_id, "order", text, timeout, answers, id, created, updated) FROM stdin;
1	\N	8	{"es": "8/90"}	60	[{"text": {"es": "Me gusta “devolverla” cuando alguien me ofende"}, "result": {"k": 1}}, {"text": {"es": "Me gusta hacer cosas nuevas o diferentes."}, "result": {"z": 1}}]	10	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	3	{"es": "Lo se, es complicado, pero tienes que elegir una"}	60	[{"text": {"es": "Me gusta enseñar a la gente cómo hacer las cosas"}, "result": {"p": 1}}, {"text": {"es": "Me gusta hacer las cosas lo mejor posible"}, "result": {"a": 1}}]	5	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	4	{"es": "Para ir más rápido te diré solo que está es la pregunta 4 de 90. Son muchas, pero se responde rápido"}	60	[{"text": {"es": "Me gusta hacer las cosas lo mejor posible"}, "result": {"x": 1}}, {"text": {"es": "Me gusta decir a la gente lo que tiene que hacer"}, "result": {"p": 1}}]	6	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	5	{"es": "5/90"}	60	[{"text": {"es": "Me gusta unirme a grupos"}, "result": {"b": 1}}, {"text": {"es": "Me gusta ser tomado en cuenta por los grupos"}, "result": {"x": 1}}]	7	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	6	{"es": "6/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me gusta hacer un amigo íntimo"}, "result": {"o": 1}}, {"text": {"es": "Me gusta hacer amistad con el grupo"}, "result": {"b": 1}}]	8	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	1	{"es": "En una situación profesional, ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Soy trabajador"}, "result": {"g": 1}}, {"text": {"es": "No soy de humor variable"}, "result": {"e": 1}}]	3	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	7	{"es": "7/90"}	60	[{"text": {"es": "Soy rápido en cambiar cuando lo creo necesario"}, "result": {"z": 1}}, {"text": {"es": "Intento hacer amigos íntimos"}, "result": {"o": 1}}]	9	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	9	{"es": "9/90"}	60	[{"text": {"es": "Quiero que mi jefe me estime"}, "result": {"f": 1}}, {"text": {"es": "Me gusta decir a la gente cuando están equivocados"}, "result": {"k": 1}}]	11	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	10	{"es": "10/90"}	60	[{"text": {"es": "Me gusta seguir las instrucciones que me dan"}, "result": {"w": 1}}, {"text": {"es": "Me gusta agradar a mis superiores"}, "result": {"f": 1}}]	21	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	72	{"es": "72/90"}	60	[{"text": {"es": "El grupo hace normalmente lo que yo quiero"}, "result": {"l": 1}}, {"text": {"es": "Normalmente tengo prisa"}, "result": {"t": 1}}]	83	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	30	{"es": "30/90"}	60	[{"text": {"es": "Me gusta que me digan exactamente cómo hacer las cosas"}, "result": {"w": 1}}, {"text": {"es": "Me aburro fácilmente"}, "result": {"z": 1}}]	41	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	50	{"es": "50/90"}	60	[{"text": {"es": "Me gusta tener instrucciones precisas para hacer un trabajo"}, "result": {"w": 1}}, {"text": {"es": "Me gusta estar con la gente"}, "result": {"b": 1}}]	61	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	2	{"es": "Igual que antes, ¿Con que afirmación te identificas más?"}	60	[{"text": {"es": "Me gusta hacer el trabajo mejor que los demás"}, "result": {"a": 1}}, {"text": {"es": "Me gusta seguir con lo he empezado hasta terminarlo"}, "result": {"n": 1}}]	4	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	51	{"es": "51/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Siempre trato de hacer mi trabajo perfecto"}, "result": {"g": 1}}, {"text": {"es": "Me dicen que soy prácticamente incansable"}, "result": {"v": 1}}]	62	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	14	{"es": "14/90"}	60	[{"text": {"es": "Me gusta ser animado e interesante"}, "result": {"x": 1}}, {"text": {"es": "Yo quiero tener mucho éxito"}, "result": {"a": 1}}]	25	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	15	{"es": "15/90"}	60	[{"text": {"es": "Me gusta “encajar” con grupos"}, "result": {"b": 1}}, {"text": {"es": "Me gusta ayudar a las personas a tomar decisiones"}, "result": {"p": 1}}]	26	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	16	{"es": "16/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me preocupa cuando alguien no me estima"}, "result": {"o": 1}}, {"text": {"es": "Me gusta que la gente note mi presencia"}, "result": {"x": 1}}]	27	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	17	{"es": "17/90"}	60	[{"text": {"es": "Me gusta probar cosas nuevas"}, "result": {"z": 1}}, {"text": {"es": "Prefiero trabajar con otras personas que solo"}, "result": {"b": 1}}]	28	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	18	{"es": "18/90"}	60	[{"text": {"es": "Algunas veces culpo a otros cuando las cosas salen mal"}, "result": {"k": 1}}, {"text": {"es": "Me molesta cuando no le gusto a alguien"}, "result": {"o": 1}}]	29	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	19	{"es": "19/90"}	60	[{"text": {"es": "Me gusta complacer a mis superiores"}, "result": {"f": 1}}, {"text": {"es": "Me gusta intentar trabajos nuevos y diferentes"}, "result": {"z": 1}}]	30	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	20	{"es": "20/90"}	60	[{"text": {"es": "Me gusta tener instrucciones detalladas para hacer un trabajo"}, "result": {"w": 1}}, {"text": {"es": "Me gusta decírselo a la gente cuando me enfada"}, "result": {"k": 1}}]	31	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	21	{"es": "21/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Siempre me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Me gusta ir paso a paso con gran cuidado"}, "result": {"d": 1}}]	32	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	23	{"es": "23/90"}	60	[{"text": {"es": "Me enfado con facilidad"}, "result": {"i": 1}}, {"text": {"es": "Soy lento tomando decisiones"}, "result": {"e": 1}}]	34	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	24	{"es": "24/90"}	60	[{"text": {"es": "Me gusta trabajar en varias actividades al mismo tiempo"}, "result": {"x": 1}}, {"text": {"es": "Cuando estoy en grupo me gusta estar callado"}, "result": {"n": 1}}]	35	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	25	{"es": "25/90"}	60	[{"text": {"es": "Me encanta que me inviten"}, "result": {"b": 1}}, {"text": {"es": "Me gusta hacer las cosas mejor que los demás"}, "result": {"a": 1}}]	36	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	26	{"es": "26/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me gusta hacer amigos íntimos"}, "result": {"o": 1}}, {"text": {"es": "Me gusta hablar de mis éxitos"}, "result": {"p": 1}}]	37	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	27	{"es": "27/90"}	60	[{"text": {"es": "Me gusta hacer cosas nuevas y diferentes"}, "result": {"z": 1}}, {"text": {"es": "Me gusta hablar de mis éxitos"}, "result": {"x": 1}}]	38	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	28	{"es": "28/90"}	60	[{"text": {"es": "Cuando tengo razón me gusta luchar por ella"}, "result": {"k": 1}}, {"text": {"es": "Me gusta pertenecer a un grupo"}, "result": {"b": 1}}]	39	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	11	{"es": "11/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Soy ordenado"}, "result": {"c": 1}}]	22	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	12	{"es": "12/90"}	60	[{"text": {"es": "Consigo que la gente haga lo que yo quiero"}, "result": {"l": 1}}, {"text": {"es": "No me altero fácilmente"}, "result": {"e": 1}}]	23	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	22	{"es": "22/90"}	60	[{"text": {"es": "Soy un buen “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Organizo bien el trabajo en un puesto"}, "result": {"c": 1}}]	33	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	29	{"es": "29/90"}	60	[{"text": {"es": "Evito ser diferente"}, "result": {"f": 1}}, {"text": {"es": "Intento acercarme mucho a la gente"}, "result": {"o": 1}}]	40	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	33	{"es": "33/90"}	60	[{"text": {"es": "Tomo decisiones fácil y rápidamente"}, "result": {"i": 1}}, {"text": {"es": "Tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	44	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	34	{"es": "34/90"}	60	[{"text": {"es": "Hago las cosas de prisa"}, "result": {"t": 1}}, {"text": {"es": "Yo no me pongo enfadado ni triste a menudo"}, "result": {"e": 1}}]	45	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	35	{"es": "35/90"}	60	[{"text": {"es": "Quiero ser parte del grupo"}, "result": {"b": 1}}, {"text": {"es": "Quiero hacer un solo trabajo a un tiempo"}, "result": {"n": 1}}]	46	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	36	{"es": "36/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Intento hacer amigos íntimos"}, "result": {"o": 1}}, {"text": {"es": "Intento mucho ser el mejor"}, "result": {"a": 1}}]	47	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	37	{"es": "37/90"}	60	[{"text": {"es": "Me gustan los nuevos estilos en trajes y coches"}, "result": {"z": 1}}, {"text": {"es": "Me gusta ser responsable por otros"}, "result": {"p": 1}}]	48	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	38	{"es": "38/90"}	60	[{"text": {"es": "Disfruto discutiendo"}, "result": {"k": 1}}, {"text": {"es": "Me gusta llamar la atención"}, "result": {"x": 1}}]	49	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	39	{"es": "39/90"}	60	[{"text": {"es": "Me gusta agradar a mis superiores"}, "result": {"f": 1}}, {"text": {"es": "Estoy interesado en ser parte del grupo"}, "result": {"b": 1}}]	50	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	41	{"es": "41/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Soy muy amigable"}, "result": {"s": 1}}]	52	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	42	{"es": "42/90"}	60	[{"text": {"es": "La gente piensa que soy un buen “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Pienso con cuidado y largamente"}, "result": {"r": 1}}]	53	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	43	{"es": "43/90"}	60	[{"text": {"es": "A menudo me arriesgo"}, "result": {"i": 1}}, {"text": {"es": "Me gusta protestar por pequeñas cosas"}, "result": {"d": 1}}]	54	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	44	{"es": "44/90"}	60	[{"text": {"es": "La gente piensa que trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "La gente piensa que tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	55	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	45	{"es": "45/90"}	60	[{"text": {"es": "Me gusta jugar y hacer deportes"}, "result": {"v": 1}}, {"text": {"es": "Soy muy agradable"}, "result": {"e": 1}}]	56	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	46	{"es": "46/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me gusta que la gente esté unida y sea amistosa"}, "result": {"o": 1}}, {"text": {"es": "Siempre trato de terminar lo que he empezado"}, "result": {"n": 1}}]	57	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	48	{"es": "48/90"}	60	[{"text": {"es": "Me gusta que me traten justamente"}, "result": {"k": 1}}, {"text": {"es": "Me gusta decir a los demás cómo hacer las cosas"}, "result": {"p": 1}}]	59	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	49	{"es": "49/90"}	60	[{"text": {"es": "Me gusta hacer aquello que esperan de mí"}, "result": {"f": 1}}, {"text": {"es": "Me gusta llamar la atención"}, "result": {"x": 1}}]	60	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	31	{"es": "31/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Trabajo mucho"}, "result": {"g": 1}}, {"text": {"es": "Pienso y planeo mucho"}, "result": {"r": 1}}]	42	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	32	{"es": "32/90"}	60	[{"text": {"es": "Me gusta dirigir el grupo"}, "result": {"l": 1}}, {"text": {"es": "Los pequeños detalles me interesan"}, "result": {"d": 1}}]	43	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	40	{"es": "40/90"}	60	[{"text": {"es": "Me gusta seguir las reglas con cuidado"}, "result": {"w": 1}}, {"text": {"es": "Me gusta que la gente me conozca muy bien"}, "result": {"o": 1}}]	51	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	47	{"es": "47/90"}	60	[{"text": {"es": "Me gusta experimentar y probar nuevas cosas"}, "result": {"z": 1}}, {"text": {"es": "Me gusta hacer bien un trabajo difícil"}, "result": {"a": 1}}]	58	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	54	{"es": "54/90"}	60	[{"text": {"es": "Trabajo a un paso rápido y constante"}, "result": {"t": 1}}, {"text": {"es": "Disfruto trabajando en detalles"}, "result": {"d": 1}}]	65	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	55	{"es": "55/90"}	60	[{"text": {"es": "Tengo mucha energía para juegos y deportes"}, "result": {"v": 1}}, {"text": {"es": "Tengo mis cosas cuidadas y ordenadas"}, "result": {"c": 1}}]	66	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	56	{"es": "56/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Me llevo bien con todo el mundo"}, "result": {"s": 1}}, {"text": {"es": "Soy de temperamento estable"}, "result": {"e": 1}}]	67	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	58	{"es": "58/90"}	60	[{"text": {"es": "Normalmente lucho por lo que yo creo"}, "result": {"k": 1}}, {"text": {"es": "Normalmente me gusta trabajar mucho"}, "result": {"a": 1}}]	69	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	59	{"es": "59/90"}	60	[{"text": {"es": "Me gustan las sugerencias de las personas que admiro"}, "result": {"f": 1}}, {"text": {"es": "Me gusta estar encargado de otras personas"}, "result": {"p": 1}}]	70	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	60	{"es": "60/90"}	60	[{"text": {"es": "Me dejo influenciar mucho por la gente"}, "result": {"w": 1}}, {"text": {"es": "Me gusta ser el centro de atención"}, "result": {"x": 1}}]	71	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	62	{"es": "62/90"}	60	[{"text": {"es": "Cuando hablo el grupo escucha"}, "result": {"l": 1}}, {"text": {"es": "Soy hábil con herramientas"}, "result": {"v": 1}}]	73	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	63	{"es": "63/90"}	60	[{"text": {"es": "Soy lento en hacer amigos"}, "result": {"i": 1}}, {"text": {"es": "Soy lento en decidirme"}, "result": {"s": 1}}]	74	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	64	{"es": "64/90"}	60	[{"text": {"es": "Normalmente como de prisa"}, "result": {"t": 1}}, {"text": {"es": "Disfruto leyendo"}, "result": {"r": 1}}]	75	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	65	{"es": "65/90"}	60	[{"text": {"es": "Me gusta el trabajo en donde puedo moverme"}, "result": {"v": 1}}, {"text": {"es": "Me gusta el trabajo que tenga que hacerse con cuidado"}, "result": {"d": 1}}]	76	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	67	{"es": "67/90"}	60	[{"text": {"es": "Planeo a largo plazo"}, "result": {"r": 1}}, {"text": {"es": "Siempre soy agradable"}, "result": {"e": 1}}]	78	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	68	{"es": "68/90"}	60	[{"text": {"es": "Tengo gran orgullo de mi buen nombre"}, "result": {"k": 1}}, {"text": {"es": "Insisto en un problema hasta que está resuelto"}, "result": {"n": 1}}]	79	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	69	{"es": "69/90"}	60	[{"text": {"es": "Me gusta agradar ala gente que admiro"}, "result": {"f": 1}}, {"text": {"es": "Quiero tener éxito"}, "result": {"a": 1}}]	80	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	70	{"es": "70/90"}	60	[{"text": {"es": "Me gusta que otros tomen decisiones para el grupo"}, "result": {"w": 1}}, {"text": {"es": "A mi me gusta tomar decisiones para el grupo"}, "result": {"p": 1}}]	81	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	71	{"es": "71/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Siempre me esfuerzo mucho"}, "result": {"g": 1}}, {"text": {"es": "Tomo decisiones fácilmente y rápidamente"}, "result": {"i": 1}}]	82	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	52	{"es": "52/90"}	60	[{"text": {"es": "Soy el tipo “dirigente”"}, "result": {"l": 1}}, {"text": {"es": "Hago amigos fácilmente"}, "result": {"s": 1}}]	63	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	53	{"es": "53/90"}	60	[{"text": {"es": "Asumo riesgos"}, "result": {"i": 1}}, {"text": {"es": "Pienso mucho"}, "result": {"r": 1}}]	64	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	61	{"es": "61/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Normalmente trabajo mucho"}, "result": {"g": 1}}, {"text": {"es": "Normalmente trabajo de prisa"}, "result": {"t": 1}}]	72	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	66	{"es": "66/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Hago el mayor número posible de amigos"}, "result": {"s": 1}}, {"text": {"es": "Encuentro lo que he guardado"}, "result": {"c": 1}}]	77	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	75	{"es": "75/90"}	60	[{"text": {"es": "Normalmente tengo energía"}, "result": {"v": 1}}, {"text": {"es": "Dedico mucho tiempo a pensar"}, "result": {"r": 1}}]	86	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	77	{"es": "77/90"}	60	[{"text": {"es": "Pienso y planeo mucho"}, "result": {"r": 1}}, {"text": {"es": "Guardo todas las cosas en su sitio"}, "result": {"c": 1}}]	88	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	78	{"es": "78/90"}	60	[{"text": {"es": "Me gusta el trabajo que requiere detalles"}, "result": {"d": 1}}, {"text": {"es": "Tardo en enfadarme"}, "result": {"e": 1}}]	89	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	79	{"es": "79/90"}	60	[{"text": {"es": "Me gusta seguir a la gente que admiro"}, "result": {"f": 1}}, {"text": {"es": "Siempre termino el trabajo que he empezado"}, "result": {"n": 1}}]	90	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	80	{"es": "80/90"}	60	[{"text": {"es": "Me gustan las instrucciones claras"}, "result": {"w": 1}}, {"text": {"es": "Me gusta trabajar mucho"}, "result": {"a": 1}}]	91	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	81	{"es": "81/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Persigo aquello que deseo"}, "result": {"g": 1}}, {"text": {"es": "Soy un buen “dirigente”"}, "result": {"l": 1}}]	92	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	82	{"es": "82/90"}	60	[{"text": {"es": "Hago que los demás trabajen mucho"}, "result": {"l": 1}}, {"text": {"es": "Soy desenfadado"}, "result": {"i": 1}}]	93	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	84	{"es": "84/90"}	60	[{"text": {"es": "Normalmente trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "Hablo de prisa"}, "result": {"v": 1}}]	95	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	85	{"es": "85/90"}	60	[{"text": {"es": "No me gusta conocer gente"}, "result": {"v": 1}}, {"text": {"es": "Me canso enseguida"}, "result": {"s": 1}}]	96	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	86	{"es": "86/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Hago muchísimos amigos"}, "result": {"s": 1}}, {"text": {"es": "Dedico mucho tiempo a pensar"}, "result": {"r": 1}}]	97	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	87	{"es": "87/90"}	60	[{"text": {"es": "Me gusta pensar sobre teoría"}, "result": {"r": 1}}, {"text": {"es": "Me gusta trabajar con detalles"}, "result": {"d": 1}}]	98	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	88	{"es": "88/90"}	60	[{"text": {"es": "Me gusta trabajar con detalles"}, "result": {"d": 1}}, {"text": {"es": "Me gusta organizar mi trabajo"}, "result": {"c": 1}}]	99	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	89	{"es": "89/90"}	60	[{"text": {"es": "Pongo las cosas en su sitio"}, "result": {"c": 1}}, {"text": {"es": "Siempre soy agradable"}, "result": {"e": 1}}]	100	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	74	{"es": "74/90"}	60	[{"text": {"es": "Trabajo de prisa"}, "result": {"t": 1}}, {"text": {"es": "Hago amigos enseguida"}, "result": {"s": 1}}]	85	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	57	{"es": "57/90"}	60	[{"text": {"es": "Quiero conocer nueva gente y hacer cosas nuevas"}, "result": {"z": 1}}, {"text": {"es": "Siempre quiero terminar el trabajo que he empezado"}, "result": {"n": 1}}]	68	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	73	{"es": "73/90"}	60	[{"text": {"es": "A menudo me siento cansando"}, "result": {"i": 1}}, {"text": {"es": "Soy lento tomando decisiones"}, "result": {"v": 1}}]	84	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	76	{"es": "76/90 ¿Con que afirmación te sientes más comodo?"}	60	[{"text": {"es": "Soy muy cordial con la gente"}, "result": {"s": 1}}, {"text": {"es": "Me gusta el trabajo que requiere precisión"}, "result": {"d": 1}}]	87	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	83	{"es": "83/90"}	60	[{"text": {"es": "Tomo decisiones rápidas"}, "result": {"i": 1}}, {"text": {"es": "Hablo de prisa"}, "result": {"t": 1}}]	94	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
1	\N	90	{"es": "90/90"}	60	[{"text": {"es": "Me gusta que me digan qué he de hacer"}, "result": {"w": 1}}, {"text": {"es": "Tengo que terminar lo que he empezado"}, "result": {"n": 1}}]	101	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
0	\N	3	{"es": "Me crearon con 3 objetivos:. 👉 Ofercerte caminos por los que evolucionar profecionalmente. 👉 Ayudarte a aprender recomendandote videos y textos. 👉 Hacerte seguimiento de tus progresos, y. 👉 Recomendarte las empresas y puestos que mejor encajen contigo"}	600	[{"text": {"es": "Mola!"}, "result": {"action": "u/initialized/true"}}]	105	2021-01-04 22:05:29.16619+00	2021-01-04 22:05:29.16619+00
0	\N	1	{"es": "Como prefieres que te llame?"}	600	[{"text": {"es": "{{user.name}}"}, "result": {"action": "u/nickname/{{user.name}}"}}, {"text": {"es": "{{user.surname}}"}, "result": {"action": "u/nickname/{{user.surname}}"}}, {"text": {"es": "{{user.nickname}}"}, "result": {"action": "u/nickname/{{user.nickname}}"}}, {"open": true, "text": {"es": "Mejor llamame..."}, "result": {"action": "u/nickname/***"}}]	102	2020-12-20 20:56:14.967534+00	2020-12-20 20:56:14.967534+00
0	\N	2	{"es": "Quieres que te cuenta porque existo?"}	600	[{"text": {"es": "Vale 👍"}, "result": {"action": "u/initialized/false"}}, {"text": {"es": "Ya me se la historia 😜"}, "result": {"action": "u/initialized/true"}}, {"text": {"es": "very very very very very very very very very very very very very very very very very long"}, "result": {"action": "u/initialized/xxx"}}]	104	2021-01-04 21:55:45.656062+00	2021-01-04 21:55:45.656062+00
2	\N	1	{"es": "Cual de los siguientes datos es un string?"}	60	[{"text": {"es": "4"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "4.0"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "'4'"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "04"}, "result": {"right": 0, "total": 1}}]	106	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
2	\N	1	{"es": "Cual de los siguientes datos es un número?"}	60	[{"text": {"es": "4"}, "result": {"right": 0.5, "total": 1}}, {"text": {"es": "4.0"}, "result": {"right": 0.5, "total": 1}}, {"text": {"es": "'4'"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Las opciones 1 y 2 son correctas"}, "result": {"right": 1, "total": 1}}]	107	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
0	\N	4	{"es": "Estudias o trabajas? Que conste que no estoy intentado ligar 😇... jajaja"}	600	[{"text": {"es": "Trabajo"}, "result": {"action": ["u/working/true", "u/studing/false"]}}, {"text": {"es": "Estudio"}, "result": {"action": ["u/working/false", "u/studing/true"]}}, {"text": {"es": "Las dos"}, "result": {"action": ["u/working/true", "u/studing/true"]}}]	103	2020-12-20 20:56:14.967534+00	2020-12-20 20:56:14.967534+00
2	\N	1	{"es": "Que valores puede tener un dato booleano?"}	60	[{"text": {"es": "True o False"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "True, False o Null"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "0 ó 1"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "0, 1 o Undefined"}, "result": {"right": 0, "total": 1}}]	108	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
2	\N	1	{"es": "Cuales son los tipos de datos basicos en JavaScript"}	60	[{"text": {"es": "Int y Booleanos"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Int, Float, Booleanos y Null"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Undefined"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Strings"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Todos los anteriores más Arrays y Objetos"}, "result": {"right": 1, "total": 1}}]	109	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
2	\N	1	{"es": "Cual es el índice del element 'manzana' en el Array: ['manzana', 'pera, 'platano', 'melocotón']"}	60	[{"text": {"es": "0"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "1"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "2"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "3"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "4"}, "result": {"right": 0, "total": 1}}]	110	2020-12-17 11:43:35.524+00	2020-12-17 11:43:35.524+00
65	\N	2	{"es": "¿Cual de las siguientes definiciones se ajusta mejor a la definición de ’identificador’ en Java?"}	\N	[{"text": {"es": "Comienza por cualquier carácter y tiene un máximo de 128 caracteres."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Java no es sensible a las mayúsculas, es decir, el identificador ’edad’ es similar a ’EDAD’."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Puede utilizar cualquier tipo de carácter, incluso caracteres especiales como ’ñ’ o ’Ç’."}, "result": {"right": 1, "total": 1}}]	280	2022-12-22 16:20:06.836043+00	2022-12-22 16:20:06.836043+00
65	\N	6	{"es": "En un objeto de la clase Vector podemos almacenar:"}	\N	[{"text": {"es": "Objetos de cualquier clase (mezclados)."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Sólo objetos de la misma clase que el primero que se inserte."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sólo objetos que tengan alguna relación, por ejemplo, que sus clases hereden de una misma clase (distinta de Object)."}, "result": {"right": 0, "total": 1}}]	284	2022-12-22 16:22:52.386916+00	2022-12-22 16:22:52.386916+00
65	\N	7	{"es": "En un ’applet’, la función init() se ejecuta:"}	\N	[{"text": {"es": "Al visitar por primera vez la página web que referencia al applet."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Cada vez que se visita la página web que referencia al applet sin cerrar el navegador."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Al crear el objeto Applet tras hacer el ’new’."}, "result": {"right": 0, "total": 1}}]	285	2022-12-22 16:23:38.985219+00	2022-12-22 16:23:38.985219+00
65	\N	8	{"es": "La clase DataInputStream se utiliza para ..."}	\N	[{"text": {"es": "Abrir un fichero binario para lectura."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Leer datos de tipo primitivo."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Leer objetos completos."}, "result": {"right": 0, "total": 1}}]	286	2022-12-22 16:25:19.754321+00	2022-12-22 16:25:19.754321+00
65	\N	9	{"es": "Un objeto de la clase URLConnection nos permite:"}	\N	[{"text": {"es": "Averiguar la dirección IP de cualquier ordenador a partir de su nombre, y viceversa."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Trocear en paquetes la información a transmitir a través de un socket."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Descargarnos algún recurso existente en Internet (página web, imagen, etc.)"}, "result": {"right": 1, "total": 1}}]	287	2022-12-22 16:26:19.869707+00	2022-12-22 16:26:19.869707+00
65	\N	4	{"es": ".Cuando tenemos una expresión con varios paréntesis anidados,"}	\N	[{"text": {"es": "Se evaluará comenzando por el paréntesis de mayor nivel (el más interior)."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Siempre se evalúa de izquierda a derecha."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Se evaluará teniendo en cuenta sólo la prioridad o nivel de precedencia de los operadores, pues los paréntesis sólo sirven para presentar de manera más clara la expresión al programador."}, "result": {"right": 0, "total": 1}}]	282	2022-12-22 16:21:24.021819+00	2022-12-22 16:21:24.021819+00
65	\N	3	{"es": "¿Es posible convertir un valor de tipo boolean a un entero int?"}	\N	[{"text": {"es": "Si. Al igual que en C, el tipo boolean es en realidad un valor entero (0-false; 1-true)."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Automáticamente no, pero con haciendo casting (conversión explícita) si."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "No es posible ni de forma automática ni haciendo casting, ya que el tipo boolean no es compatible con ningún otro."}, "result": {"right": 1, "total": 1}}]	281	2022-12-22 16:20:42.832547+00	2022-12-22 16:20:42.832547+00
65	\N	1	{"es": "¿Cómo se llama la utilidad del JDK que nos permite generar páginas Web a partir de unos comentarios especiales insertados en el código fuente?"}	\N	[{"text": {"es": "docuweb"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "javadoc"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "javah"}, "result": {"right": 0, "total": 1}}]	279	2022-12-22 16:19:01.87688+00	2022-12-22 16:19:01.87688+00
30	\N	\N	{"es": "Si dentro de una función tenemos una variable local ’x’, y hay otra variable global a la clase también llamada ’x’, ¿podremos acceder a ambas variables?"}	\N	[{"text": {"es": "El compilador dará un error."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, podemos acceder a la variable local directamente y haciendo uso de la palabra reservada ’this’ podremos acceder a la variable global."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "No, ya que al poner ’x’ se considera la global (por defecto)."}, "result": {"right": 0, "total": 1}}]	289	2023-01-18 09:22:12.804847+00	2023-01-18 09:22:12.804847+00
30	\N	\N	{"es": "En Programación Orientada a Objetos, un objeto es ..."}	\N	[{"text": {"es": "una instancia concreta de una clase incorporada en la librería de clases de Java."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "una instancia concreta de una clase realizada por nosotros."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "cualquiera de las dos anteriores."}, "result": {"right": 1, "total": 1}}]	290	2023-01-18 09:23:16.901462+00	2023-01-18 09:23:16.901462+00
30	\N	\N	{"es": "¿Cuál de las siguientes sentencias es la única forma correcta de definir un array de dos dimensiones?"}	\N	[{"text": {"es": "int n[10,10];"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "int n[10][10];"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "int n[][] = { { 1, 2 }, { 3, 4 } };"}, "result": {"right": 1, "total": 1}}]	291	2023-01-18 09:23:48.327297+00	2023-01-18 09:23:48.327297+00
30	\N	\N	{"es": "En general, en la POO, existen los tipos de herencia simple y múltiple. En Java:"}	\N	[{"text": {"es": "disponemos sólo de la herencia simple"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "disponemos de ambos tipos de herencia, pues Java es un lenguaje orientado a objetos."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "disponemos sólo de la herencia múltiple."}, "result": {"right": 0, "total": 1}}]	292	2023-01-18 09:24:28.024057+00	2023-01-18 09:24:28.024057+00
30	\N	\N	{"es": "¿Podría recorrerse una pila Stack mediante un bucle for-each o un objeto Iterator?"}	\N	[{"text": {"es": "No, sólo se puede con los métodos propios de una pila (apilar/desapilar)"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, aunque se trataría como un ArrayList o Vector (First-In-First-Out), no como una pila."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Sí, y el orden sería el de una pila en todo caso (Last-In-First-Out)"}, "result": {"right": 0, "total": 1}}]	293	2023-01-18 09:24:59.163791+00	2023-01-18 09:24:59.163791+00
30	\N	\N	{"es": "Cuando desarrollamos aplicaciones de tipo gráfico, ¿para qué se utilizan los gestores de esquemas?"}	\N	[{"text": {"es": "Para controlar de forma automática el tamaño de los componentes que se añaden."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Para controlar de forma automática la posición de los componentes que se añaden."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Las dos anteriores"}, "result": {"right": 1, "total": 1}}]	294	2023-01-18 09:25:30.839509+00	2023-01-18 09:25:30.839509+00
30	\N	\N	{"es": "¿Cómo debemos finalizar un diálogo mostrado desde un Frame?"}	\N	[{"text": {"es": "Con: setVisible(false);"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Con: dispose();"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Cualquiera de las dos anteriores."}, "result": {"right": 1, "total": 1}}]	295	2023-01-18 09:26:02.904998+00	2023-01-18 09:26:02.904998+00
30	\N	\N	{"es": "Para dibujar en un componente o en un contenedor, ¿en qué función se escriben las instrucciones necesarias?."}	\N	[{"text": {"es": "void repaint (Graphics g) { ... }"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "void paint (Graphics g) { ... }"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "En cualquiera de las dos anteriores."}, "result": {"right": 0, "total": 1}}]	296	2023-01-18 09:26:49.786838+00	2023-01-18 09:26:49.786838+00
30	\N	\N	{"es": "Si abrimos un archivo con la clase FileInputStream, ¿estamos obligados a capturar alguna excepción?"}	\N	[{"text": {"es": "Sí, la excepción FileIOException."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, la excepción FileNotFoundException."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "No, el uso de excepciones es opcional en este caso."}, "result": {"right": 0, "total": 1}}]	297	2023-01-18 09:27:25.421995+00	2023-01-18 09:27:25.421995+00
30	\N	\N	{"es": "La sentencia SQL para contar todos los registros de una tabla Libros es:"}	\N	[{"text": {"es": "SELECT COUNT(*) FROM Libros"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "COUNT(*) FROM Libros"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "RECORDS(*) FROM Librosc"}, "result": {"right": 0, "total": 1}}]	298	2023-01-18 09:27:57.639891+00	2023-01-18 09:27:57.639891+00
67	\N	2	{"es": "¿Cuál es la finalidad del uso del juego de caracteres Unicode?"}	\N	[{"text": {"es": "conseguir mayor rapidez a la hora de visualizar los caracteres en pantalla."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "ninguna, es un código más, tal como el ASCII y el EBCDIC."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "conseguir la portabilidad de los programas."}, "result": {"right": 1, "total": 1}}]	304	2023-01-18 15:38:10.839526+00	2023-01-18 15:38:10.839526+00
67	\N	3	{"es": "Cuando queremos expresar una expresión aritmética con valores constantes reales, por ejemplo: 3.14, ¿tenemos algún mecanismo de distinguir de forma explícita cuando queremos utilizar \\"float\\"?"}	\N	[{"text": {"es": "Con la técnica del casting, poniendo (float) justo delante de la constante, dependiendo de su tipo."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Poniendo la letra F justo detrás para indicar que es un \\"float\\": 3.14F"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Las dos anteriores"}, "result": {"right": 1, "total": 1}}]	305	2023-01-18 15:38:41.123247+00	2023-01-18 15:38:41.123247+00
67	\N	4	{"es": "Decimos que una clase A es abstracta cuando:"}	\N	[{"text": {"es": "aun no existe, pero deberíamos tener."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "cuando al menos tiene un método virtual o abstracto, que deberá ser definido por alguna subclase."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "cuando esta clase A define un método virtual o abstracto de una superclase."}, "result": {"right": 0, "total": 1}}]	306	2023-01-18 15:39:30.978509+00	2023-01-18 15:39:30.978509+00
67	\N	5	{"es": "En una matriz o array unidimensional, los elementos:"}	\N	[{"text": {"es": "deben ser todos del mismo tipo primitivo o exactamente de la misma clase"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "pueden ser de cualquier tipo o clase (mezclados)"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "deben ser todos del mismo tipo primitivo, aunque pueden ser de clases distintas (siempre y cuando tengan todas hereden de la clase base del array)"}, "result": {"right": 1, "total": 1}}]	307	2023-01-18 15:40:06.9032+00	2023-01-18 15:40:06.9032+00
67	\N	6	{"es": "En una aplicación en modo gráfico, ¿qué es un \\"contenedor\\"?"}	\N	[{"text": {"es": "un componente más, pero que puede contener a otros componentes"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "es una librería de componentes"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "donde se depositan los objetos no utilizados, resultado del proceso de \\"recolección de basura\\"."}, "result": {"right": 0, "total": 1}}]	308	2023-01-18 15:40:39.13426+00	2023-01-18 15:40:39.13426+00
67	\N	7	{"es": "Si queremos capturar eventos para poder saber cuándo pulsamos los botones del ratón tenemos que:"}	\N	[{"text": {"es": "implementar MouseListener"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "implementar MouseMotionListener"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "heredar de MouseListener"}, "result": {"right": 0, "total": 1}}]	309	2023-01-18 15:41:25.51442+00	2023-01-18 15:41:25.51442+00
65	\N	10	{"es": "¿Con qué otro nombre se conoce a la base de datos relacional JavaDB?"}	\N	[{"text": {"es": "Apache Derby"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Java Derby"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Apache DB"}, "result": {"right": 1, "total": 1}}]	288	2022-12-22 16:26:58.204127+00	2022-12-22 16:26:58.204127+00
65	\N	5	{"es": "¿Es necesario habilitar la comprobación de aserciones para poder utilizarlas?"}	\N	[{"text": {"es": "No, si se utiliza la sentencia ’assert’ ya se habilitan automáticamente."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, con unos argumentos a la hora de invocar a la JVM (java -ea ...)"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, invocando a la función enableAssert(true) al comienzo."}, "result": {"right": 1, "total": 1}}]	283	2022-12-22 16:22:12.889328+00	2022-12-22 16:22:12.889328+00
67	\N	8	{"es": "¿Es necesario compilar un programa java para ejecutarlo como applet?"}	\N	[{"text": {"es": "Depende del navegador del usuario"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "No, porque los navegadores son capaces de interpretar código fuente de java"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Si, como cualquier otro programa escrito en java"}, "result": {"right": 1, "total": 1}}]	310	2023-01-18 15:42:01.088963+00	2023-01-18 15:42:01.088963+00
67	\N	9	{"es": "El mecanismo que nos permite comunicar dos hilos mediante flujos se llama:"}	\N	[{"text": {"es": "Tubería (o pipe)"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Socket"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Programación URL"}, "result": {"right": 0, "total": 1}}]	311	2023-01-18 15:42:37.012137+00	2023-01-18 15:42:37.012137+00
67	\N	10	{"es": "¿Con qué otro nombre se conoce a la base de datos relacional JavaDB?"}	\N	[{"text": {"es": "Apache Derby"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Java Derby"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Apache DB"}, "result": {"right": 0, "total": 1}}]	312	2023-01-18 15:43:13.320439+00	2023-01-18 15:43:13.320439+00
68	\N	3	{"es": "Si un método se declara como \\"public\\", éste será visible"}	\N	[{"text": {"es": "desde cualquier método de cualquier clase o subclase"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "sólo desde métodos de la misma clase"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "desde cualquier método de la misma clase y subclases de ella"}, "result": {"right": 0, "total": 1}}]	316	2023-01-18 16:00:02.902199+00	2023-01-18 16:00:02.902199+00
68	\N	5	{"es": "AI utilizar this() para invocar a otro constructor, ¿cómo podemos distinguir al constructor que se está invocando?"}	\N	[{"text": {"es": "por el contexto."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "En ese caso se invocará a/ constructor por defecto."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "No hay forma, se invocará al siguiente constructor escrito en el código."}, "result": {"right": 0, "total": 1}}]	318	2023-01-18 16:01:48.914222+00	2023-01-18 16:01:48.914222+00
68	\N	1	{"es": "En una aplicación gráfica, ¿de qué clase son los distintos objetos de las opciones de un menú?"}	\N	[{"text": {"es": "Menultem"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "CheckboxMenultem"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Las dos anteriores."}, "result": {"right": 1, "total": 1}}]	322	2023-01-18 16:05:11.653156+00	2023-01-18 16:05:11.653156+00
68	\N	2	{"es": "¿Con qué otro nombre se conoce a la base de datos relacional JavaDB?"}	\N	[{"text": {"es": "v=0"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "v=false"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "v=true"}, "result": {"right": 1, "total": 1}}]	315	2023-01-18 15:53:26.589132+00	2023-01-18 15:53:26.589132+00
68	\N	4	{"es": "Decimos que una clase A es abstracta cuando"}	\N	[{"text": {"es": "aun no existe, pero deberíamos tener."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "cuando al menos tiene un método virtual o adsracto, que dederá ser definido por alguna subclase"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "cuando esta clase A define un método virtual o abstracto de una superclase."}, "result": {"right": 0, "total": 1}}]	317	2023-01-18 16:00:52.725513+00	2023-01-18 16:00:52.725513+00
68	\N	6	{"es": "En las aplicaciones gráficas, ¿es posible que un contenedor sea también un componente?"}	\N	[{"text": {"es": "No, los componentes AWT que se han estudiado (Button, etc.) no pueden contener a su vez más componentes"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, la clase Container Vereda de Component (por ejemplo los objetos de la clase Panel)."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "No, un contenedor no puede ser un componente (sólo contiene componentes)"}, "result": {"right": 0, "total": 1}}]	319	2023-01-18 16:03:01.631082+00	2023-01-18 16:03:01.631082+00
68	\N	7	{"es": "Para poder marcar sólo una de entre un grupo de casillas seleccionables utilizaremos el componente:"}	\N	[{"text": {"es": "Checkbox"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "CheckboxGroup"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Las dos anteriores"}, "result": {"right": 0, "total": 1}}]	320	2023-01-18 16:03:51.484708+00	2023-01-18 16:03:51.484708+00
68	\N	8	{"es": "¿Qué significa que un cuadro de diálogo se muestre en modo \\"modal\\"?."}	\N	[{"text": {"es": "Que se bloquean las acciones sobre cualquier otra ventana, hasta que el usuario cierre dicho diálogo."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Que se permite al usuario cambiar a a otra ventana o diálogo de la misma aplicación."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Que puede cerrarse ocultándose, sin descargarse de la memoria."}, "result": {"right": 0, "total": 1}}]	323	2023-01-18 16:05:55.714758+00	2023-01-18 16:05:55.714758+00
68	\N	9	{"es": "¿Es posible escribir algún dato de tipo primitivo con la clase FileOutputStream?"}	\N	[{"text": {"es": "No"}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Sí, tiene funciones específicas para escribir cada uno los tipos primitivos"}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Sí, aunque sólo el tipo int."}, "result": {"right": 0, "total": 1}}]	324	2023-01-18 16:06:32.747955+00	2023-01-18 16:06:32.747955+00
67	\N	1	{"es": "El compilador de Java del JDK:"}	\N	[{"text": {"es": "Genera bytecodes independientes de la plataforma."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Genera bytecodes en código nativo según la plataforma de desarrollo."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Interpreta bytecodes"}, "result": {"right": 0, "total": 1}}]	303	2023-01-18 15:37:34.682302+00	2023-01-18 15:37:34.682302+00
68	\N	10	{"es": "Cuando desarrollamos aplicaciones de tipo gráfico, ¿para qué se utilizan los gestores de esquemas?"}	\N	[{"text": {"es": "Para distribuir los componentes de forma automática en un contenedor."}, "result": {"right": 1, "total": 1}}, {"text": {"es": "Para distribuir los componentes de forma manual mediante coordenadas (pixels)."}, "result": {"right": 0, "total": 1}}, {"text": {"es": "Para distribuir los componentes de forma manual mediante coordenadas (pixels)."}, "result": {"right": 0, "total": 1}}]	321	2023-01-18 16:04:39.424931+00	2023-01-18 16:04:39.424931+00
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

COPY public.tests (dimentions, id, path_id, name, "desc", created, updated, priority, questions_last, questions_day, key) FROM stdin;
\N	2	2	{"es": "Todo programador Javascript que se precide debe tener un buen conocimiento de los tipos de datos que puede manejar"}	{"es": "vamos a empezar con algo sencillo para ir calentando motores 🚀"}	2021-08-24 20:25:08.290341+00	2021-08-24 20:25:08.290341+00	9000	2021-08-24	5	js-data_types-basic
\N	65	40	{"es": "Test Java Febrero 2022"}	{"es": "Test del examen de febrero de 2022"}	2022-12-21 19:02:15.941208+00	2022-12-21 19:02:15.941208+00	0	2022-12-21	5	\N
{"a": {"name": {"es": "Necesidad de logro"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "b": {"name": {"es": "Necesidad de pertenecer a grupos"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "c": {"name": {"es": "Orden"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "d": {"name": {"es": "Atención a los detalles"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "e": {"name": {"es": "Contención emocional"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "f": {"name": {"es": "Necesidad de apoyar a sus superiores"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "g": {"name": {"es": "Rol del trabajador duro"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "h": {"name": {"es": "Planificación"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "i": {"name": {"es": "Facilidad para tomar decisiones"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "k": {"name": {"es": "Necesidad de imponerse a los demás"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "l": {"name": {"es": "Rol de líder"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "n": {"name": {"es": "Necesidad de terminar una tarea"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "o": {"name": {"es": "Necesidad de intimidad y afecto"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "p": {"name": {"es": "Necesidad de controlar a los demás"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "r": {"name": {"es": "Pensamiento teórico"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "s": {"name": {"es": "Cordialidad"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "t": {"name": {"es": "Ritmo de trabajo"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "v": {"name": {"es": "Persistencia"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "w": {"name": {"es": "Necesidad de normas"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "x": {"name": {"es": "Necesidad de protagonismo"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}, "z": {"name": {"es": "Necesidad de cambio"}, "evaluations": [{"max": 3, "min": 0, "message": {"es": "Por debajo de la media"}, "importance": 1}, {"max": 6, "min": 4, "message": {"es": "En la media"}, "importance": 0}, {"max": 10, "min": 7, "message": {"es": "Por encima de la media"}, "importance": 1}]}}	1	1	{"es": "Me gustaría continuar con el Test PAPI, que viene del inglés \\"Personality and Preference Inventory\\""}	{"es": "Es uno de los test más utilizados en RRHH porque es bastante fiables y rápido de hacer. Normalmente se utiliza para saber si una persona encaja en un determinado puesto. Ten en cuenta que este test no se puede aprobar o suspender. Sólo indica como eres. Te interesa saber como te ven las empresas?"}	2020-12-17 17:20:54.872029+00	2020-12-17 17:20:54.872029+00	1000	2020-12-22	5	papi
\N	6	1	{"es": "Prueba"}	{"es": "desc de prueba"}	2021-10-02 11:48:14.22895+00	2021-10-02 11:48:14.22895+00	0	2021-10-02	5	\N
\N	0	\N	{"es": "Que te parece si empezamos por algunas preguntas básicas"}	{"es": "y así nos vamos conociendonos"}	2020-12-20 20:49:59.461751+00	2020-12-20 20:49:59.461751+00	10000	2020-12-22	100	basic
\N	30	40	{"es": "Test Java septiembre 2022"}	{"es": "Test del examen de septiembre de 2022"}	2022-12-04 14:17:50.724736+00	2022-12-04 14:17:50.724736+00	0	2022-12-04	5	\N
\N	68	40	{"es": "Test Java septiembre 2016"}	{"es": "Test del examen septiembre 2016"}	2023-01-18 15:01:14.076835+00	2023-01-18 15:01:14.076835+00	0	2023-01-18	5	\N
\N	67	40	{"es": "Test Java convocatoria extraordinaria"}	{"es": "Test del examen convocatoria extraordinaria."}	2023-01-18 14:59:50.102864+00	2023-01-18 14:59:50.102864+00	0	2023-01-18	5	\N
\N	69	2	{"es": "Java Test 2 edited"}	{"es": "Este es el segundo test de Java edited"}	2023-01-23 09:25:48.927598+00	2023-01-23 09:25:48.927598+00	0	2023-01-23	5	\N
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
-- Data for Name: user_paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_paths (path_id, user_id, status, created, updated) FROM stdin;
40	233	active	2022-12-14 13:43:43.244748+00	2022-12-14 13:43:43.244748+00
1	233	active	2022-12-14 13:43:45.652292+00	2022-12-14 13:43:45.652292+00
2	233	active	2022-12-14 13:43:39.818252+00	2022-12-14 13:43:39.818252+00
\.


--
-- Data for Name: user_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_questions (question_id, status, answer, test_id, user_id, created, updated, skip_conditions, skip_text) FROM stdin;
280	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:34.135504+00	2023-01-01 11:54:34.135504+00	[]	{}
282	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:35.55975+00	2023-01-01 11:54:35.55975+00	[]	{}
106	active	{"right": 1, "total": 1}	2	233	2022-12-30 11:14:00.969746+00	2022-12-30 11:14:00.969746+00	[]	{}
283	active	{"right": 1, "total": 1}	65	19	2023-01-01 11:54:35.883847+00	2023-01-01 11:54:35.883847+00	[]	{}
284	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:36.946849+00	2023-01-01 11:54:36.946849+00	[]	{}
285	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:38.217837+00	2023-01-01 11:54:38.217837+00	[]	{}
286	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:38.856278+00	2023-01-01 11:54:38.856278+00	[]	{}
287	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:56:24.428349+00	2023-01-01 11:56:24.428349+00	[]	{}
288	active	{"right": 0, "total": 1}	65	19	2023-01-01 11:54:40.581459+00	2023-01-01 11:54:40.581459+00	[]	{}
105	skipped	{"right": 0, "total": 1}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[{"value": "{{user.initialized}}", "expected": "true"}]	{"es": "Peeeeerfecto 👌"}
103	skipped	{"right": 0, "total": 1}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
102	skipped	{"right": 0, "total": 1}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
104	skipped	{"right": 0, "total": 1}	0	19	2021-09-25 10:13:57.340159+00	2021-09-25 10:13:57.340159+00	[]	{}
106	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
107	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
108	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
109	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
110	done	{"right": 0, "total": 1}	2	19	2021-09-25 10:14:20.695041+00	2021-09-25 10:14:20.695041+00	[]	{}
279	active	{"right": 1, "total": 1}	65	19	2023-01-01 11:54:33.524804+00	2023-01-01 11:54:33.524804+00	[]	{}
288	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:55:26.936697+00	2022-12-29 15:55:26.936697+00	[]	{}
279	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:37:33.996383+00	2022-12-29 15:37:33.996383+00	[]	{}
280	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:40:23.552825+00	2022-12-29 15:40:23.552825+00	[]	{}
281	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:43:08.225678+00	2022-12-29 15:43:08.225678+00	[]	{}
282	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:45:39.71738+00	2022-12-29 15:45:39.71738+00	[]	{}
283	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:45:45.306327+00	2022-12-29 15:45:45.306327+00	[]	{}
284	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:45:48.385648+00	2022-12-29 15:45:48.385648+00	[]	{}
285	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:45:50.923872+00	2022-12-29 15:45:50.923872+00	[]	{}
286	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:55:22.798274+00	2022-12-29 15:55:22.798274+00	[]	{}
287	active	{"right": 1, "total": 1}	65	233	2022-12-29 15:55:24.052478+00	2022-12-29 15:55:24.052478+00	[]	{}
306	active	{"right": 1, "total": 1}	67	233	2023-01-18 16:08:03.329771+00	2023-01-18 16:08:03.329771+00	[]	{}
307	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:04.370747+00	2023-01-18 16:08:04.370747+00	[]	{}
308	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:05.189168+00	2023-01-18 16:08:05.189168+00	[]	{}
309	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:06.228384+00	2023-01-18 16:08:06.228384+00	[]	{}
310	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:07.041291+00	2023-01-18 16:08:07.041291+00	[]	{}
311	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:08.189609+00	2023-01-18 16:08:08.189609+00	[]	{}
312	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:09.537192+00	2023-01-18 16:08:09.537192+00	[]	{}
303	active	{"right": 1, "total": 1}	67	233	2023-01-18 16:08:00.258215+00	2023-01-18 16:08:00.258215+00	[]	{}
304	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:01.245113+00	2023-01-18 16:08:01.245113+00	[]	{}
305	active	{"right": 0, "total": 1}	67	233	2023-01-18 16:08:02.088071+00	2023-01-18 16:08:02.088071+00	[]	{}
315	active	{"right": 0, "total": 1}	68	233	2023-01-18 16:28:24.638853+00	2023-01-18 16:28:24.638853+00	[]	{}
316	active	{"right": 0, "total": 1}	68	233	2023-01-18 16:30:21.916743+00	2023-01-18 16:30:21.916743+00	[]	{}
317	active	{"right": 0, "total": 1}	68	233	2023-01-18 16:30:23.126973+00	2023-01-18 16:30:23.126973+00	[]	{}
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
7	1	233	\N	{}	2023-01-10 20:48:16.078981+00	2023-01-10 20:48:16.078981+00	0	5
1	65	233	complete	{"right": 10, "total": 10}	2023-01-10 20:30:45.893555+00	2023-01-10 20:30:45.893555+00	0	5
28	67	233	complete	{"right": 2, "total": 10}	2023-01-18 16:06:54.009244+00	2023-01-18 16:06:54.009244+00	0	5
29	68	233	\N	{}	2023-01-18 16:28:10.969612+00	2023-01-18 16:28:10.969612+00	0	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, surname, nickname, lang, initialized, created, updated, today_questions, average_questions, email, password, is_admin) FROM stdin;
19	Jovi	Sogorb	Jovi	es	t	2020-12-20 21:38:39.383+00	2020-12-20 21:38:39.383+00	5	5	frangalo34@gmail.com	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeZA8ZO/UAIm5jEcWfD5v6ooyAh1lzQbe	t
233	user	user	user	es	f	2022-12-12 17:49:14.903951+00	2022-12-12 17:49:14.903951+00	5	5	user@user.es	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeWMxotDfIpSLSUH8GNj7D6LrEMx1Ckv2	f
51	Maria	López	Maria	es	f	2022-02-21 12:32:38.299142+00	2022-02-21 12:32:38.299142+00	5	5	maria@gmail.com	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeppMvQcaFbiaWqIExL4j9dOKc5Tj14LC	t
244	admin	admin	admin	es	f	2023-01-23 09:37:31.832251+00	2023-01-23 09:37:31.832251+00	5	5	admin@admin.es	$2a$10$fz7KW7q9Yw31TA/Jb5FZJeCftiIXAwlPTaJTzMLMZxvjGZBiDgZTG	t
245	admineng	admineng	admineng	en	f	2023-01-23 09:38:27.377548+00	2023-01-23 09:38:27.377548+00	5	5	admineng@admin.es	$2a$10$fz7KW7q9Yw31TA/Jb5FZJenYqcVvoZkS8qKQgeJJmYkaipzN2e.H.	t
\.


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paths_id_seq', 89, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 324, true);


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

SELECT pg_catalog.setval('public.tests_id_seq', 73, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 8, true);


--
-- Name: user_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_test_id_seq', 177, true);


--
-- Name: user_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tests_id_seq', 31, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 250, true);


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
-- Name: user_tests user_tests_user_id_test_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tests
    ADD CONSTRAINT user_tests_user_id_test_id_key UNIQUE (user_id, test_id);


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

