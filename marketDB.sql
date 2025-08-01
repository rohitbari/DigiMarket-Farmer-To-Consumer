toc.dat                                                                                             0000600 0004000 0002000 00000016471 15041412254 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   (                    }            marketDB    16.8    16.8                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    25412    marketDB    DATABASE     p   CREATE DATABASE "marketDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-GB';
    DROP DATABASE "marketDB";
                postgres    false         �            1259    25422    buyers    TABLE     �   CREATE TABLE public.buyers (
    b_id integer NOT NULL,
    b_name text,
    b_contact text,
    b_address text,
    b_email text,
    b_password text
);
    DROP TABLE public.buyers;
       public         heap    postgres    false         �            1259    25421    buyers_b_id_seq    SEQUENCE     �   ALTER TABLE public.buyers ALTER COLUMN b_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.buyers_b_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218         �            1259    25414    farmers    TABLE     �   CREATE TABLE public.farmers (
    f_id integer NOT NULL,
    f_name text,
    f_location text,
    f_contact text,
    f_email text,
    f_password text
);
    DROP TABLE public.farmers;
       public         heap    postgres    false         �            1259    25413    farmers_f_id_seq    SEQUENCE     �   ALTER TABLE public.farmers ALTER COLUMN f_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.farmers_f_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216         �            1259    25449    orders    TABLE     �   CREATE TABLE public.orders (
    o_id integer NOT NULL,
    buyer_id integer,
    product_id integer,
    quantity_ordered integer,
    order_date date,
    status text
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    25448    orders_o_id_seq    SEQUENCE     �   ALTER TABLE public.orders ALTER COLUMN o_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_o_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222         �            1259    25436    products    TABLE     �   CREATE TABLE public.products (
    p_id integer NOT NULL,
    farmer_id integer,
    product_name text,
    quantity integer,
    price double precision,
    post_date date
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    25435    products_p_id_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN p_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220         �          0    25422    buyers 
   TABLE DATA           Y   COPY public.buyers (b_id, b_name, b_contact, b_address, b_email, b_password) FROM stdin;
    public          postgres    false    218       4860.dat �          0    25414    farmers 
   TABLE DATA           [   COPY public.farmers (f_id, f_name, f_location, f_contact, f_email, f_password) FROM stdin;
    public          postgres    false    216       4858.dat            0    25449    orders 
   TABLE DATA           b   COPY public.orders (o_id, buyer_id, product_id, quantity_ordered, order_date, status) FROM stdin;
    public          postgres    false    222       4864.dat �          0    25436    products 
   TABLE DATA           ]   COPY public.products (p_id, farmer_id, product_name, quantity, price, post_date) FROM stdin;
    public          postgres    false    220       4862.dat            0    0    buyers_b_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.buyers_b_id_seq', 5, true);
          public          postgres    false    217                    0    0    farmers_f_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.farmers_f_id_seq', 9, true);
          public          postgres    false    215         	           0    0    orders_o_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.orders_o_id_seq', 16, true);
          public          postgres    false    221         
           0    0    products_p_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_p_id_seq', 12, true);
          public          postgres    false    219         b           2606    25428    buyers buyers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (b_id);
 <   ALTER TABLE ONLY public.buyers DROP CONSTRAINT buyers_pkey;
       public            postgres    false    218         `           2606    25420    farmers farmers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_pkey PRIMARY KEY (f_id);
 >   ALTER TABLE ONLY public.farmers DROP CONSTRAINT farmers_pkey;
       public            postgres    false    216         f           2606    25455    orders orders_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (o_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    222         d           2606    25447    products products_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (p_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    220         h           2606    25456    orders buyer_id    FK CONSTRAINT     |   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT buyer_id FOREIGN KEY (buyer_id) REFERENCES public.buyers(b_id) NOT VALID;
 9   ALTER TABLE ONLY public.orders DROP CONSTRAINT buyer_id;
       public          postgres    false    218    222    4706         g           2606    25441    products farmer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT farmer_id FOREIGN KEY (farmer_id) REFERENCES public.farmers(f_id) NOT VALID;
 <   ALTER TABLE ONLY public.products DROP CONSTRAINT farmer_id;
       public          postgres    false    220    4704    216         i           2606    25461    orders product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.products(p_id) NOT VALID;
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT product_id;
       public          postgres    false    4708    220    222                                                                                                                                                                                                               4860.dat                                                                                            0000600 0004000 0002000 00000000273 15041412254 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Lokesh Patil	1234567890	Jalgaon	lokesh@gmail.com	lokesh123
1	Pawan Patil	7777771234	Parola	pawan@gmail.com	pawan123
5	Jayesh Karankal	3792797923	Shirpur	jayesh@gmail.com	jayesh123
\.


                                                                                                                                                                                                                                                                                                                                     4858.dat                                                                                            0000600 0004000 0002000 00000000520 15041412254 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Kuldeep	Amalner	9898983434	kuldeep@gmail.com	kuldeep123
3	Tushar Patil	Dhule	1234567890	tushar@gmail.com	tushar
7	Harshal Bari	Parola	9898983434	harshal@gmail.com	harshal123
8	Mayur 	Parola	121348951	mayur@gmail.com	123
1	Ganesh Patil	Shirpur	9876543210	ganesh@gmail.com	123
9	Rohit	Parola	7821918040	rohitbari2020@gmail.com	123
\.


                                                                                                                                                                                4864.dat                                                                                            0000600 0004000 0002000 00000000703 15041412254 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	2	1	1	2025-07-15	decline
2	1	1	5	2025-07-15	confirm
8	1	7	8	2025-07-16	confirm
3	1	2	1	2025-07-15	decline
5	1	2	1	2025-07-15	confirm
6	1	1	1	2025-07-15	confirm
7	1	7	12	2025-07-16	decline
1	1	1	0	2025-07-15	confirm
10	5	8	20	2025-07-16	confirm
9	1	1	3	2025-07-16	confirm
11	1	2	2	2025-07-16	confirm
12	1	7	3	2025-07-16	decline
13	1	8	10	2025-07-17	pending
14	1	10	5	2025-07-18	confirm
15	1	1	10	2025-07-18	confirm
16	1	11	10	2025-07-18	pending
\.


                                                             4862.dat                                                                                            0000600 0004000 0002000 00000000350 15041412254 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	1	Tomato Sos	20	30	2025-07-17
8	7	Lemon	70	5	2025-07-16
10	1	Banana	30	5	2025-07-17
2	1	Tomato	40	20.9	2025-07-14
1	1	Carrot	1	50	2025-07-14
7	1	Onion	14	10	2025-07-16
12	1	Corn	40	48	2025-07-18
11	1	Banana 1	40	3	2025-07-18
\.


                                                                                                                                                                                                                                                                                        restore.sql                                                                                         0000600 0004000 0002000 00000015070 15041412254 0015365 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

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

DROP DATABASE "marketDB";
--
-- Name: marketDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "marketDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-GB';


ALTER DATABASE "marketDB" OWNER TO postgres;

\connect "marketDB"

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
-- Name: buyers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buyers (
    b_id integer NOT NULL,
    b_name text,
    b_contact text,
    b_address text,
    b_email text,
    b_password text
);


ALTER TABLE public.buyers OWNER TO postgres;

--
-- Name: buyers_b_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.buyers ALTER COLUMN b_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.buyers_b_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: farmers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.farmers (
    f_id integer NOT NULL,
    f_name text,
    f_location text,
    f_contact text,
    f_email text,
    f_password text
);


ALTER TABLE public.farmers OWNER TO postgres;

--
-- Name: farmers_f_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.farmers ALTER COLUMN f_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.farmers_f_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    o_id integer NOT NULL,
    buyer_id integer,
    product_id integer,
    quantity_ordered integer,
    order_date date,
    status text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_o_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN o_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_o_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    p_id integer NOT NULL,
    farmer_id integer,
    product_name text,
    quantity integer,
    price double precision,
    post_date date
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN p_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: buyers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buyers (b_id, b_name, b_contact, b_address, b_email, b_password) FROM stdin;
\.
COPY public.buyers (b_id, b_name, b_contact, b_address, b_email, b_password) FROM '$$PATH$$/4860.dat';

--
-- Data for Name: farmers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.farmers (f_id, f_name, f_location, f_contact, f_email, f_password) FROM stdin;
\.
COPY public.farmers (f_id, f_name, f_location, f_contact, f_email, f_password) FROM '$$PATH$$/4858.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (o_id, buyer_id, product_id, quantity_ordered, order_date, status) FROM stdin;
\.
COPY public.orders (o_id, buyer_id, product_id, quantity_ordered, order_date, status) FROM '$$PATH$$/4864.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (p_id, farmer_id, product_name, quantity, price, post_date) FROM stdin;
\.
COPY public.products (p_id, farmer_id, product_name, quantity, price, post_date) FROM '$$PATH$$/4862.dat';

--
-- Name: buyers_b_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buyers_b_id_seq', 5, true);


--
-- Name: farmers_f_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.farmers_f_id_seq', 9, true);


--
-- Name: orders_o_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_o_id_seq', 16, true);


--
-- Name: products_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_p_id_seq', 12, true);


--
-- Name: buyers buyers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (b_id);


--
-- Name: farmers farmers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_pkey PRIMARY KEY (f_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (o_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (p_id);


--
-- Name: orders buyer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT buyer_id FOREIGN KEY (buyer_id) REFERENCES public.buyers(b_id) NOT VALID;


--
-- Name: products farmer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT farmer_id FOREIGN KEY (farmer_id) REFERENCES public.farmers(f_id) NOT VALID;


--
-- Name: orders product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.products(p_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        