--
-- PostgreSQL database dump
--

-- Dumped from database version 16.5
-- Dumped by pg_dump version 16.5

-- Started on 2024-11-18 22:55:17

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: заказчики; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."заказчики" (
    "id_заказчика" bigint NOT NULL,
    "ФИО" character varying NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16401)
-- Name: заказчики_id_заказчика_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."заказчики" ALTER COLUMN "id_заказчика" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."заказчики_id_заказчика_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: заказы; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."заказы" (
    "тема_заказа" character varying,
    "описание_заказа" character varying NOT NULL,
    "срочность_выполнения" character varying NOT NULL,
    "id_заказа" bigint NOT NULL,
    "id_заказчика" bigint,
    "id_работника" bigint
);


--
-- TOC entry 221 (class 1259 OID 16430)
-- Name: заказы_id_заказа_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."заказы" ALTER COLUMN "id_заказа" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."заказы_id_заказа_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: работники; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."работники" (
    "id_работника" bigint NOT NULL,
    "ФИО" character varying NOT NULL,
    "область_работы" character varying NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16409)
-- Name: работники_id_работника_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."работники" ALTER COLUMN "id_работника" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."работники_id_работника_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4796 (class 0 OID 16398)
-- Dependencies: 216
-- Data for Name: заказчики; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."заказчики" ("id_заказчика", "ФИО") FROM stdin;
\.


--
-- TOC entry 4800 (class 0 OID 16417)
-- Dependencies: 220
-- Data for Name: заказы; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."заказы" ("тема_заказа", "описание_заказа", "срочность_выполнения", "id_заказа", "id_заказчика", "id_работника") FROM stdin;
\.


--
-- TOC entry 4799 (class 0 OID 16410)
-- Dependencies: 219
-- Data for Name: работники; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."работники" ("id_работника", "ФИО", "область_работы") FROM stdin;
\.


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 217
-- Name: заказчики_id_заказчика_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."заказчики_id_заказчика_seq"', 1, false);


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 221
-- Name: заказы_id_заказа_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."заказы_id_заказа_seq"', 1, false);


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 218
-- Name: работники_id_работника_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."работники_id_работника_seq"', 1, false);


--
-- TOC entry 4646 (class 2606 OID 16406)
-- Name: заказчики заказчики_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."заказчики"
    ADD CONSTRAINT "заказчики_pk" PRIMARY KEY ("id_заказчика");


--
-- TOC entry 4650 (class 2606 OID 16437)
-- Name: заказы заказы_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."заказы"
    ADD CONSTRAINT "заказы_pk" PRIMARY KEY ("id_заказа");


--
-- TOC entry 4648 (class 2606 OID 16416)
-- Name: работники работники_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."работники"
    ADD CONSTRAINT "работники_pk" PRIMARY KEY ("id_работника");


--
-- TOC entry 4651 (class 2606 OID 16438)
-- Name: заказы заказы_заказчики_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."заказы"
    ADD CONSTRAINT "заказы_заказчики_fk" FOREIGN KEY ("id_заказчика") REFERENCES public."заказчики"("id_заказчика");


--
-- TOC entry 4652 (class 2606 OID 16443)
-- Name: заказы заказы_работники_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."заказы"
    ADD CONSTRAINT "заказы_работники_fk" FOREIGN KEY ("id_работника") REFERENCES public."работники"("id_работника");


-- Completed on 2024-11-18 22:55:17

--
-- PostgreSQL database dump complete
--

