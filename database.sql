--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    brand_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rate integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
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
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (quantity, created_at, updated_at, basket_id, product_id) FROM stdin;
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, created_at, updated_at) FROM stdin;
3	2021-12-06 16:15:36.763+03	2021-12-06 16:15:36.763+03
4	2021-12-06 16:16:19.377+03	2021-12-06 16:16:19.377+03
5	2021-12-06 16:17:50.942+03	2021-12-06 16:17:50.942+03
6	2021-12-06 16:19:17.509+03	2021-12-06 16:19:17.509+03
7	2021-12-06 16:21:17.856+03	2021-12-06 16:21:17.856+03
8	2021-12-06 16:39:34.386+03	2021-12-06 16:39:34.386+03
9	2021-12-06 16:40:23.737+03	2021-12-06 16:40:23.737+03
10	2021-12-06 16:41:47.306+03	2021-12-06 16:41:47.306+03
11	2021-12-06 16:43:01.965+03	2021-12-06 16:43:01.965+03
12	2021-12-06 16:47:43.839+03	2021-12-06 16:47:43.839+03
13	2021-12-06 16:52:17.305+03	2021-12-06 16:52:17.305+03
14	2021-12-06 16:55:47.192+03	2021-12-06 16:55:47.192+03
15	2022-01-06 14:52:26.859+03	2022-01-06 14:52:26.859+03
16	2022-01-06 14:54:31.701+03	2022-01-06 14:54:31.701+03
17	2022-01-06 14:54:39.164+03	2022-01-06 14:54:39.164+03
18	2022-01-06 14:55:34.705+03	2022-01-06 14:55:34.705+03
19	2022-01-06 14:55:41.728+03	2022-01-06 14:55:41.728+03
20	2022-01-06 14:55:52.828+03	2022-01-06 14:55:52.828+03
21	2022-01-06 14:56:15.76+03	2022-01-06 14:56:15.76+03
22	2022-01-06 15:01:25.607+03	2022-01-06 15:01:25.607+03
23	2022-01-06 15:05:02.88+03	2022-01-06 15:05:02.88+03
24	2022-01-06 15:05:23.058+03	2022-01-06 15:05:23.058+03
25	2022-01-06 15:07:59.899+03	2022-01-06 15:07:59.899+03
26	2022-01-06 15:08:02.705+03	2022-01-06 15:08:02.705+03
27	2022-01-06 15:08:11.787+03	2022-01-06 15:08:11.787+03
28	2022-01-06 15:08:16.727+03	2022-01-06 15:08:16.727+03
29	2022-01-06 15:08:19.7+03	2022-01-06 15:08:19.7+03
30	2022-01-07 09:52:09.273+03	2022-01-07 09:52:09.273+03
31	2022-01-07 12:04:17.392+03	2022-01-07 12:04:17.392+03
32	2022-01-07 12:04:23.891+03	2022-01-07 12:04:23.891+03
33	2022-01-07 12:06:45.405+03	2022-01-07 12:06:45.405+03
34	2022-01-07 12:06:55.065+03	2022-01-07 12:06:55.065+03
35	2022-01-07 12:07:28.213+03	2022-01-07 12:07:28.213+03
36	2022-01-07 12:08:05.64+03	2022-01-07 12:08:05.64+03
37	2022-01-07 12:25:15.763+03	2022-01-07 12:25:15.763+03
38	2022-01-08 12:22:00.939+03	2022-01-08 12:22:00.939+03
39	2022-01-17 16:49:50.526+03	2022-01-17 16:49:50.526+03
40	2022-01-17 16:50:21.6+03	2022-01-17 16:50:21.6+03
41	2022-01-17 16:56:55.263+03	2022-01-17 16:56:55.263+03
42	2022-01-17 16:59:35.304+03	2022-01-17 16:59:35.304+03
43	2022-01-17 17:02:56.956+03	2022-01-17 17:02:56.956+03
44	2022-01-17 17:09:55.318+03	2022-01-17 17:09:55.318+03
45	2022-01-17 17:10:06.146+03	2022-01-17 17:10:06.146+03
46	2022-01-17 17:13:24.91+03	2022-01-17 17:13:24.91+03
47	2022-01-17 17:14:28.474+03	2022-01-17 17:14:28.474+03
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, created_at, updated_at) FROM stdin;
3	Siemens	2021-12-31 11:51:17.575+03	2021-12-31 11:51:17.575+03
4	Xiaomi	2021-12-31 11:53:03.331+03	2021-12-31 11:53:03.331+03
1	Samsung	2021-12-31 11:50:47.963+03	2022-02-05 11:21:22.579+03
2	Hitachi	2021-12-31 11:51:04.816+03	2022-03-08 10:57:00.226+03
18	Toshiba	2022-03-08 11:29:06.427+03	2022-03-08 11:29:06.427+03
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
2	Телевизоры	2021-12-31 11:48:04.716+03	2022-02-05 13:28:09.126+03
3	Смартфоны	2021-12-31 11:48:46.955+03	2022-02-14 09:36:07.926+03
4	Планшеты	2021-12-31 11:48:56.816+03	2022-03-07 11:52:50.458+03
1	Холодильники	2021-12-31 11:47:48.122+03	2022-03-07 11:57:47.561+03
16	Стиральные машины	2022-03-08 11:06:14.264+03	2022-03-08 11:06:14.264+03
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, name, price, quantity, created_at, updated_at, order_id) FROM stdin;
2	Galaxy A12 64GB	15999	1	2022-03-16 14:58:07.629+03	2022-03-16 14:58:07.629+03	2
3	40HB6T62	43733	1	2022-03-16 14:58:07.633+03	2022-03-16 14:58:07.633+03	2
4	RB37A5290SA	112290	1	2022-03-16 14:59:59.515+03	2022-03-16 14:59:59.515+03	3
5	Galaxy Tab A7 Lite	16499	1	2022-03-16 14:59:59.518+03	2022-03-16 14:59:59.518+03	3
6	QE55QN700AUXRU	239190	2	2022-03-16 16:22:44.773+03	2022-03-16 16:22:44.773+03	4
7	X 11T 8GB+128GB	44999	3	2022-03-16 16:22:44.776+03	2022-03-16 16:22:44.776+03	4
8	Mi Pad 2 64GB	15000	3	2022-03-16 16:22:44.777+03	2022-03-16 16:22:44.777+03	4
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) FROM stdin;
2	Сергей Петров	user@mail.ru	+7 (123) 456-78-90	г Москва, ул Строителей, дом 123, кв. 456	59732	0	\N	2022-03-16 14:58:07.621+03	2022-03-16 14:58:07.621+03	3
3	Сергей Петров	user@mail.ru	+7 (123) 456-78-90	г Москва, ул Строителей, дом 123, кв. 456	128789	0	Позвонить перед доставкой	2022-03-16 14:59:59.507+03	2022-03-16 14:59:59.507+03	3
4	Николай Семенов	admin@mail.ru	+7 (987) 654-32-10	г Москва, ул Космонавтов, дом 456, кв. 789	658377	0	\N	2022-03-16 16:22:44.765+03	2022-03-16 16:22:44.765+03	4
\.


--
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_props (id, name, value, created_at, updated_at, product_id) FROM stdin;
82	Тип компрессора	инверторный	2022-03-06 10:54:02.511+03	2022-03-06 10:54:02.511+03	76
83	Количество компрессоров	1	2022-03-06 10:54:02.515+03	2022-03-06 10:54:02.515+03	76
84	Количество камер	2	2022-03-06 10:54:02.516+03	2022-03-06 10:54:02.516+03	76
85	Общий полезный объем	367 л	2022-03-06 10:54:02.518+03	2022-03-06 10:54:02.518+03	76
86	Тип компрессора	инверторный	2022-03-06 11:12:18.026+03	2022-03-06 11:12:18.026+03	77
87	Количество компрессоров	1	2022-03-06 11:12:18.029+03	2022-03-06 11:12:18.029+03	77
88	Количество камер	2	2022-03-06 11:12:18.03+03	2022-03-06 11:12:18.03+03	77
89	Общий полезный объем	385 л	2022-03-06 11:12:18.032+03	2022-03-06 11:12:18.032+03	77
90	Объем холодильной камеры	273 л	2022-03-06 11:12:18.034+03	2022-03-06 11:12:18.034+03	77
91	Объем морозильной камеры	112 л	2022-03-06 11:12:18.035+03	2022-03-06 11:12:18.035+03	77
92	Тип компрессора	инверторный	2022-03-06 11:17:03.93+03	2022-03-06 11:17:03.93+03	78
93	Количество компрессоров	1	2022-03-06 11:17:03.934+03	2022-03-06 11:17:03.934+03	78
94	Количество камер	2	2022-03-06 11:17:03.936+03	2022-03-06 11:17:03.936+03	78
95	Общий полезный объем	340 л	2022-03-06 11:17:03.937+03	2022-03-06 11:17:03.937+03	78
96	Объем холодильной камеры	228 л	2022-03-06 11:17:03.939+03	2022-03-06 11:17:03.939+03	78
97	Объем морозильной камеры	112 л	2022-03-06 11:17:03.94+03	2022-03-06 11:17:03.94+03	78
98	Тип компрессора	инверторный	2022-03-06 11:21:38.324+03	2022-03-06 11:21:38.324+03	79
99	Количество компрессоров	1	2022-03-06 11:21:38.326+03	2022-03-06 11:21:38.326+03	79
100	Количество камер	2	2022-03-06 11:21:38.328+03	2022-03-06 11:21:38.328+03	79
101	Общий полезный объем	367 л	2022-03-06 11:21:38.33+03	2022-03-06 11:21:38.33+03	79
102	Объем холодильной камеры	269 л	2022-03-06 11:21:38.333+03	2022-03-06 11:21:38.333+03	79
103	Объем морозильной камеры	98 л	2022-03-06 11:21:38.335+03	2022-03-06 11:21:38.335+03	79
104	Тип компрессора	инверторный	2022-03-06 11:27:47.344+03	2022-03-06 11:27:47.344+03	80
105	Количество компрессоров	1	2022-03-06 11:27:47.346+03	2022-03-06 11:27:47.346+03	80
106	Количество камер	2	2022-03-06 11:27:47.348+03	2022-03-06 11:27:47.348+03	80
107	Общий полезный объем	535 л	2022-03-06 11:27:47.349+03	2022-03-06 11:27:47.349+03	80
108	Объем холодильной камеры	356 л	2022-03-06 11:27:47.351+03	2022-03-06 11:27:47.351+03	80
109	Объем морозильной камеры	179 л	2022-03-06 11:27:47.353+03	2022-03-06 11:27:47.353+03	80
110	Тип компрессора	инверторный	2022-03-06 11:34:29.532+03	2022-03-06 11:34:29.532+03	81
111	Количество компрессоров	1	2022-03-06 11:34:29.535+03	2022-03-06 11:34:29.535+03	81
112	Количество камер	3	2022-03-06 11:34:29.537+03	2022-03-06 11:34:29.537+03	81
113	Общий полезный объем	634 л	2022-03-06 11:34:29.539+03	2022-03-06 11:34:29.539+03	81
114	Объем холодильной камеры	405 л	2022-03-06 11:34:29.541+03	2022-03-06 11:34:29.541+03	81
115	Объем морозильной камеры	229 л	2022-03-06 11:34:29.543+03	2022-03-06 11:34:29.543+03	81
116	Тип	Neo QLED	2022-03-06 11:40:14.976+03	2022-03-06 11:40:14.976+03	82
117	Диагональ	55" (140 см)	2022-03-06 11:40:14.979+03	2022-03-06 11:40:14.979+03	82
118	Разрешение	8K UHD	2022-03-06 11:40:14.98+03	2022-03-06 11:40:14.98+03	82
119	Разрешение, пикс	7680x4320	2022-03-06 11:40:14.983+03	2022-03-06 11:40:14.983+03	82
120	Формат экрана	21:9, 32:9	2022-03-06 11:40:14.985+03	2022-03-06 11:40:14.985+03	82
121	Поверхность экрана	антибликовая	2022-03-06 11:40:14.987+03	2022-03-06 11:40:14.987+03	82
122	Технология затемнения	Ultimate 8K Dimming Pro	2022-03-06 11:40:14.988+03	2022-03-06 11:40:14.988+03	82
123	Частота обновления экрана	120 Гц	2022-03-06 11:40:14.99+03	2022-03-06 11:40:14.99+03	82
124	Тип	LED	2022-03-07 13:47:42.005+03	2022-03-07 13:47:42.005+03	89
125	Диагональ	 55" (140 см)	2022-03-07 13:47:42.01+03	2022-03-07 13:47:42.01+03	89
126	Тип матрицы	LED	2022-03-07 13:47:42.014+03	2022-03-07 13:47:42.014+03	89
127	Разрешение	4K UHD	2022-03-07 13:47:42.016+03	2022-03-07 13:47:42.016+03	89
128	Разрешение, пикс	3840x2160	2022-03-07 13:47:42.018+03	2022-03-07 13:47:42.018+03	89
129	Формат экрана	 16:9	2022-03-07 13:47:42.02+03	2022-03-07 13:47:42.02+03	89
130	Технология затемнения	UHD Dimming	2022-03-07 13:47:42.022+03	2022-03-07 13:47:42.022+03	89
131	Тип	QLED	2022-03-07 13:52:17.736+03	2022-03-07 13:52:17.736+03	90
132	Диагональ	75" (191 см)	2022-03-07 13:53:15.304+03	2022-03-07 13:53:15.304+03	90
133	Тип матрицы	QLED	2022-03-07 13:53:35.355+03	2022-03-07 13:54:06.842+03	90
156	Установка	отдельностоящая	2022-03-08 11:13:51.368+03	2022-03-08 11:13:51.368+03	96
134	Разрешение	4K UHD	2022-03-07 13:55:17.065+03	2022-03-07 13:55:17.065+03	90
135	Формат экрана	16:9	2022-03-07 13:56:01.206+03	2022-03-07 13:56:01.206+03	90
136	Тип LED-подсветки	DUAL LED	2022-03-07 13:57:00.877+03	2022-03-07 13:57:00.877+03	90
144	Тип	LED	2022-03-08 10:47:19.14+03	2022-03-08 10:47:19.14+03	91
145	Диагональ	32" (81 см)	2022-03-08 10:47:19.145+03	2022-03-08 10:47:19.145+03	91
146	Тип матрицы	LED	2022-03-08 10:47:19.147+03	2022-03-08 10:47:19.147+03	91
147	Разрешение	HD	2022-03-08 10:47:19.149+03	2022-03-08 10:47:19.149+03	91
148	Разрешение, пикс	1366x768	2022-03-08 10:47:19.152+03	2022-03-08 10:47:19.152+03	91
149	Частота обновления экрана	60 Гц	2022-03-08 10:47:19.154+03	2022-03-08 10:47:19.154+03	91
150	Тип	Side by Side	2022-03-08 11:01:38.345+03	2022-03-08 11:01:38.345+03	94
151	Тип установки	отдельностоящий	2022-03-08 11:01:38.348+03	2022-03-08 11:01:38.348+03	94
152	Тип компрессора	стандартный	2022-03-08 11:01:38.35+03	2022-03-08 11:01:38.35+03	94
153	Количество компрессоров	1	2022-03-08 11:01:38.352+03	2022-03-08 11:01:38.352+03	94
154	Количество камер	5	2022-03-08 11:01:38.354+03	2022-03-08 11:01:38.354+03	94
155	Общий полезный объем	525 л	2022-03-08 11:01:38.356+03	2022-03-08 11:01:38.356+03	94
157	Конструкция стиральной машины	узкая	2022-03-08 11:13:51.371+03	2022-03-08 11:13:51.371+03	96
158	Количество барабанов	1	2022-03-08 11:13:51.374+03	2022-03-08 11:13:51.374+03	96
159	Тип двигателя	инверторный	2022-03-08 11:13:51.376+03	2022-03-08 11:13:51.376+03	96
160	Тип загрузки	фронтальная	2022-03-08 11:13:51.377+03	2022-03-08 11:13:51.377+03	96
161	Максимальная загрузка белья	7 кг	2022-03-08 11:13:51.379+03	2022-03-08 11:13:51.379+03	96
162	Максимальная скорость отжима	до 1200 об/мин	2022-03-08 11:13:51.381+03	2022-03-08 11:13:51.381+03	96
163	Установка	отдельностоящая	2022-03-08 11:17:40.216+03	2022-03-08 11:17:40.216+03	97
164	Конструкция стиральной машины	узкая	2022-03-08 11:17:40.218+03	2022-03-08 11:17:40.218+03	97
165	Количество барабанов	1	2022-03-08 11:17:40.22+03	2022-03-08 11:17:40.22+03	97
166	Тип двигателя	инверторный	2022-03-08 11:17:40.222+03	2022-03-08 11:17:40.222+03	97
167	Тип загрузки	фронтальная	2022-03-08 11:17:40.224+03	2022-03-08 11:17:40.224+03	97
168	Максимальная загрузка белья	6.5 кг	2022-03-08 11:17:40.226+03	2022-03-08 11:17:40.226+03	97
169	Максимальная скорость отжима	до 1000 об/мин	2022-03-08 11:17:40.228+03	2022-03-08 11:17:40.228+03	97
170	Установка	отдельностоящая	2022-03-08 11:22:13.453+03	2022-03-08 11:22:13.453+03	98
171	Конструкция стиральной машины	узкая	2022-03-08 11:22:13.455+03	2022-03-08 11:22:13.455+03	98
172	Количество барабанов	1	2022-03-08 11:22:13.457+03	2022-03-08 11:22:13.457+03	98
173	Тип двигателя	инверторный	2022-03-08 11:22:13.459+03	2022-03-08 11:22:13.459+03	98
174	Тип загрузки	фронтальная	2022-03-08 11:22:13.46+03	2022-03-08 11:22:13.46+03	98
175	Максимальная загрузка белья	7 кг	2022-03-08 11:22:13.463+03	2022-03-08 11:22:13.463+03	98
176	Максимальная скорость отжима	до 1200 об/мин	2022-03-08 11:22:13.464+03	2022-03-08 11:22:13.464+03	98
177	Экран	1768x2208 пикс	2022-03-08 13:03:18.036+03	2022-03-08 13:03:18.036+03	114
178	Процессор	Qualcomm	2022-03-08 13:03:18.053+03	2022-03-08 13:03:18.053+03	114
179	Оперативная память	12 ГБ	2022-03-08 13:03:18.063+03	2022-03-08 13:03:18.063+03	114
180	Встроенная память	512 ГБ	2022-03-08 13:03:18.071+03	2022-03-08 13:03:18.071+03	114
181	Технология NFC	Да	2022-03-08 13:03:18.082+03	2022-03-08 13:03:18.082+03	114
182	Поддержка стандартов	2G/3G/4G LTE	2022-03-08 13:03:18.09+03	2022-03-08 13:03:18.09+03	114
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, image, created_at, updated_at, category_id, brand_id) FROM stdin;
76	RB37A5290EL	100990	0	2880f5a0-192c-4d4b-807d-0d6861ad3773.jpeg	2022-03-06 10:54:02.387+03	2022-03-06 10:54:02.387+03	1	1
77	RB38T676FSA	129090	0	eeb81cef-192e-4362-bfb5-de6a3d96e409.jpeg	2022-03-06 11:12:17.917+03	2022-03-06 11:12:17.917+03	1	1
79	RB37A5290SA	112290	0	ba114b09-f5a6-4928-b818-47a45a2e3a38.jpeg	2022-03-06 11:21:38.213+03	2022-03-06 11:21:38.213+03	1	1
80	RS54N3003WW	123490	0	2cd51ccf-18c8-4d3e-9e7e-6d40b4df7d4d.jpeg	2022-03-06 11:27:47.232+03	2022-03-06 11:27:47.232+03	1	1
78	RB34T670FBN	78590	0	a64c638c-b1e3-4382-a92a-4eba808dbe4b.jpeg	2022-03-06 11:17:03.817+03	2022-03-06 11:30:03.357+03	1	1
82	QE55QN700AUXRU	239190	0	e1f2d58c-2469-4385-b030-ad8b7762e1c7.jpeg	2022-03-06 11:40:14.835+03	2022-03-06 12:57:32.588+03	2	1
102	TW-BJ90M4RU(WK)	38990	0	b74fff2a-08ca-4f30-a146-b6926df9c863.jpeg	2022-03-08 11:34:27.552+03	2022-03-08 11:34:27.552+03	16	18
103	50U5069	47999	0	a7a45b60-b057-405f-bf05-59c901ff2192.jpeg	2022-03-08 11:40:53.628+03	2022-03-08 11:40:53.628+03	2	18
104	65X8900KE	199999	0	d8fe3a9b-ef0c-4b91-bbe0-cbcceed926f7.jpeg	2022-03-08 11:43:07.08+03	2022-03-08 11:43:07.08+03	2	18
105	50C350KE	49999	0	d6546248-a7df-40fc-898b-d6b3595c3638.jpeg	2022-03-08 11:45:27.076+03	2022-03-08 11:45:27.076+03	2	18
106	X 11 Lite 5G NE 8	29999	0	cb28f13e-1b88-4963-afe5-80d3632c55f7.jpeg	2022-03-08 11:49:31.313+03	2022-03-08 11:49:31.313+03	3	4
107	X 11T 8GB+128GB	44999	0	0627f706-fffc-49b0-b3c0-7ef23a7282fd.jpeg	2022-03-08 11:52:16.906+03	2022-03-08 11:52:16.906+03	3	4
108	Redmi Note 8 (2021)	17999	0	c861e152-f8a5-41f6-aca1-a8ab307eff7a.jpeg	2022-03-08 12:42:48.245+03	2022-03-08 12:42:48.245+03	3	4
109	Redmi Note 9 64GB	16999	0	6c78a5a4-8377-4750-88c4-a615f3cb27a2.jpeg	2022-03-08 12:46:06.048+03	2022-03-08 12:46:06.048+03	3	4
110	Mi 11 256GB Cloud	85990	0	8e97c69d-6355-4180-a479-78f0d6832b23.jpeg	2022-03-08 12:49:05.099+03	2022-03-08 12:49:05.099+03	3	4
81	RS63R5571F8	205890	0	ce7a27a1-245f-4682-b0c1-7aae88104e16.jpeg	2022-03-06 11:34:29.403+03	2022-03-06 13:28:31.298+03	1	1
89	UE55AU7140UXRU	75990	0	141979a3-fb17-42b8-9f51-a46a07674c08.jpeg	2022-03-07 13:47:41.884+03	2022-03-07 13:47:41.884+03	2	1
111	Galaxy A52 128GB	33999	0	a2a442d1-365a-4642-b941-116613e3adee.jpeg	2022-03-08 12:51:13.396+03	2022-03-08 12:51:13.396+03	3	1
112	Galaxy A12 64GB	15999	0	47010c8f-3b8f-456f-9d2e-53d3cfc9b600.jpeg	2022-03-08 12:54:18.577+03	2022-03-08 12:54:18.577+03	3	1
113	Galaxy S21 128GB	74999	0	e26a9a4a-b0b3-4756-a1eb-04c21cc33a26.jpeg	2022-03-08 12:56:33.654+03	2022-03-08 12:58:02.906+03	3	1
114	Galaxy Z Fold3 512GB	169999	0	19c1e397-0ea0-4b9f-9c0c-a86f0a43e12d.jpeg	2022-03-08 13:00:12.582+03	2022-03-08 13:03:18.105+03	3	1
115	Galaxy Tab A8 64GB	22999	0	06c4881f-3d2e-4bab-953c-fe1ab374b13f.jpeg	2022-03-08 13:06:39.593+03	2022-03-08 13:06:39.593+03	4	1
116	Galaxy Tab A7 Lite	16499	0	d012a222-d7b0-43e2-b00d-2eb79ed6348d.jpeg	2022-03-08 13:09:11.79+03	2022-03-08 13:09:34.725+03	4	1
117	Galaxy Kids Tab	15899	0	385f527a-4636-4b7d-9d9e-17cb541139b7.jpeg	2022-03-08 13:12:02.791+03	2022-03-08 13:12:02.791+03	4	1
118	Pad 5 128GB	39999	0	0f1bc77b-971b-4404-b232-7379e7444d72.jpeg	2022-03-08 13:14:39.045+03	2022-03-08 13:14:39.045+03	4	4
119	65HZ6W69	49990	0	b25fa313-6f10-40d4-9066-f73e9c59ca07.jpeg	2022-03-08 13:20:59.463+03	2022-03-08 13:20:59.463+03	2	2
120	40HB6T62	43733	0	9069bfdf-1ab7-43a6-b372-e24e201c4336.jpeg	2022-03-08 13:26:15.619+03	2022-03-08 13:26:15.619+03	2	2
121	Mi Pad 2 64GB	15000	0	f0ad8bfc-63df-4678-a54b-818c080b12e7.jpeg	2022-03-08 13:37:58.351+03	2022-03-16 16:21:03.962+03	4	4
90	QE75Q70AAUXRU	239990	0	40ff04e7-6c4a-4ddf-ae75-efd843b9ae86.jpeg	2022-03-07 13:50:11.343+03	2022-03-07 14:08:52.479+03	2	1
92	L43M5-5ARU	33990	0	b850ebef-adc6-4fa1-bda1-5ebd2a943e5c.jpeg	2022-03-08 10:50:28.388+03	2022-03-08 10:50:28.388+03	2	4
91	L32M6-6ARG	26990	0	557ec262-c9d0-4925-8252-a54d4b819f2e.jpeg	2022-03-08 10:47:19.009+03	2022-03-08 10:51:42.784+03	2	4
93	L55M5-5ARU	49990	0	44fcf22b-4b6c-4de7-9567-db2b72e59858.jpeg	2022-03-08 10:54:21.459+03	2022-03-08 10:54:21.459+03	2	4
94	R-G 690 GU XK	1040590	0	629801e8-3af5-4aab-b66d-99f400fc0c41.jpeg	2022-03-08 11:01:38.158+03	2022-03-08 11:01:38.158+03	1	2
95	R-WX 630 KU	399950	0	172599fa-f7c4-4ea3-9a17-acb584e3589d.jpeg	2022-03-08 11:03:39.988+03	2022-03-08 11:03:39.988+03	1	2
96	WW70A6S23AX	65490	0	6b107de1-b18f-4078-87d9-23ab77617f37.jpeg	2022-03-08 11:13:51.208+03	2022-03-08 11:13:51.208+03	16	1
97	WW65A4S00EE	50590	0	7b4b2f8d-d069-4218-87f4-8f1005a1138f.jpeg	2022-03-08 11:17:40.095+03	2022-03-08 11:17:40.095+03	16	1
98	WW80AFS28AE	71	0	dbee3ee2-dc05-4cf5-a016-2fccbce2a88e.jpeg	2022-03-08 11:22:13.338+03	2022-03-08 11:22:13.338+03	16	1
99	WS12WL40OE	129090	0	5d5b485a-4cfa-4c2e-9b0e-8aa4119f548a.jpeg	2022-03-08 11:24:43.743+03	2022-03-08 11:26:54.002+03	16	3
100	WM16XDH1OE	129990	0	fc3c6f65-2b6d-4885-ac3f-992de326ad26.jpeg	2022-03-08 11:28:04.207+03	2022-03-08 11:28:04.207+03	16	3
101	TW-BJ80S2RU(WK)	61690	0	55bbecb5-5412-4870-8be8-7c37cecd2546.jpeg	2022-03-08 11:31:43.308+03	2022-03-08 11:31:43.308+03	16	18
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rate, created_at, updated_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, created_at, updated_at) FROM stdin;
3	user@mail.ru	$2b$05$33KYYLYkDqkqlwru0eHev.Wp9t47/176gW0OCdwIndgagn7QU6Lde	USER	2021-12-25 13:56:40.236+03	2021-12-25 13:56:40.236+03
4	admin@mail.ru	$2b$05$3i6B3E6ns0zqXgZsSNDHc.K0W3mnss6lJ0C46P2uaZXb3q2iwhsX6	ADMIN	2021-12-29 13:10:01.557+03	2021-12-29 13:10:01.557+03
6	user2@mail.ru	$2b$05$yWp3WEcYdJB7/DjmycrbBeeQ0hsG6klGQx5BRHDw80eE9KCEZijxq	USER	2021-12-29 13:22:52.966+03	2021-12-29 13:22:52.966+03
5	admin2@mail.ru	$2b$05$o9l/.S2YTcox/yo1/9zlNebDbTkUnz.F83N4rA24HZSLQVYREUtFu	ADMIN	2021-12-29 13:11:01.522+03	2021-12-29 13:11:01.522+03
\.


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 47, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 18, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 16, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 8, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 182, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 121, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

