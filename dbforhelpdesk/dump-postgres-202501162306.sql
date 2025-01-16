--
-- PostgreSQL database dump
--

-- Dumped from database version 16.5
-- Dumped by pg_dump version 16.5

-- Started on 2025-01-16 23:06:27

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
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: applicant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.applicant (
    applicant_id integer NOT NULL,
    applicant_num integer NOT NULL,
    applicant_name text,
    applicant_department integer
);


--
-- TOC entry 218 (class 1259 OID 16408)
-- Name: applicant_applicant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.applicant ALTER COLUMN applicant_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.applicant_applicant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16439)
-- Name: applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.applications (
    applications_id integer NOT NULL,
    application_reason text,
    application_description text,
    application_applicant integer,
    application_applicant_department integer,
    application_executor integer,
    application_executor_department integer,
    applications_open_time time without time zone,
    applications_close_time time without time zone
);


--
-- TOC entry 222 (class 1259 OID 16438)
-- Name: applications_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.applications ALTER COLUMN applications_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.applications_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_num integer NOT NULL,
    department_name text
);


--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.department ALTER COLUMN department_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16424)
-- Name: executor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.executor (
    executor_id integer NOT NULL,
    executor_num integer NOT NULL,
    executor_name text,
    executor_department integer
);


--
-- TOC entry 220 (class 1259 OID 16423)
-- Name: executor_executor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.executor ALTER COLUMN executor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.executor_executor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4816 (class 0 OID 16409)
-- Dependencies: 219
-- Data for Name: applicant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.applicant (applicant_id, applicant_num, applicant_name, applicant_department) FROM stdin;
\.


--
-- TOC entry 4820 (class 0 OID 16439)
-- Dependencies: 223
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.applications (applications_id, application_reason, application_description, application_applicant, application_applicant_department, application_executor, application_executor_department, applications_open_time, applications_close_time) FROM stdin;
\.


--
-- TOC entry 4814 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.department (department_id, department_num, department_name) FROM stdin;
\.


--
-- TOC entry 4818 (class 0 OID 16424)
-- Dependencies: 221
-- Data for Name: executor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.executor (executor_id, executor_num, executor_name, executor_department) FROM stdin;
\.


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 218
-- Name: applicant_applicant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.applicant_applicant_id_seq', 1, false);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 222
-- Name: applications_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.applications_applications_id_seq', 1, false);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 216
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.department_department_id_seq', 1, false);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 220
-- Name: executor_executor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.executor_executor_id_seq', 1, false);


--
-- TOC entry 4655 (class 2606 OID 16415)
-- Name: applicant applicant_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applicant
    ADD CONSTRAINT applicant_pk PRIMARY KEY (applicant_id);


--
-- TOC entry 4657 (class 2606 OID 16417)
-- Name: applicant applicant_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applicant
    ADD CONSTRAINT applicant_unique UNIQUE (applicant_num);


--
-- TOC entry 4663 (class 2606 OID 16445)
-- Name: applications applications_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pk PRIMARY KEY (applications_id);


--
-- TOC entry 4651 (class 2606 OID 16405)
-- Name: department department_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pk PRIMARY KEY (department_id);


--
-- TOC entry 4653 (class 2606 OID 16407)
-- Name: department department_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_unique UNIQUE (department_num);


--
-- TOC entry 4659 (class 2606 OID 16430)
-- Name: executor executor_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.executor
    ADD CONSTRAINT executor_pk PRIMARY KEY (executor_id);


--
-- TOC entry 4661 (class 2606 OID 16432)
-- Name: executor executor_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.executor
    ADD CONSTRAINT executor_unique UNIQUE (executor_num);


--
-- TOC entry 4664 (class 2606 OID 16418)
-- Name: applicant applicant_department_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applicant
    ADD CONSTRAINT applicant_department_fk FOREIGN KEY (applicant_department) REFERENCES public.department(department_num);


--
-- TOC entry 4666 (class 2606 OID 16446)
-- Name: applications applications_applicant_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_applicant_fk FOREIGN KEY (application_applicant) REFERENCES public.applicant(applicant_num);


--
-- TOC entry 4667 (class 2606 OID 16451)
-- Name: applications applications_department_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_department_fk FOREIGN KEY (application_applicant_department) REFERENCES public.department(department_num);


--
-- TOC entry 4668 (class 2606 OID 16461)
-- Name: applications applications_department_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_department_fk_1 FOREIGN KEY (application_executor_department) REFERENCES public.department(department_num);


--
-- TOC entry 4669 (class 2606 OID 16456)
-- Name: applications applications_executor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_executor_fk FOREIGN KEY (application_executor) REFERENCES public.executor(executor_num);


--
-- TOC entry 4665 (class 2606 OID 16433)
-- Name: executor executor_department_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.executor
    ADD CONSTRAINT executor_department_fk FOREIGN KEY (executor_department) REFERENCES public.department(department_num);


-- Completed on 2025-01-16 23:06:27

--
-- PostgreSQL database dump complete
--

