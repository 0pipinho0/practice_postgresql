--
-- PostgreSQL database dump
--

\restrict cjCPDzP5bM5xJ8EmLoRs3eMcusf5Cx3XgC98EwfB2SCOZIImTmrPE3lFsWQAhWc

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-10-21 13:46:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16388)
-- Name: culture_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA culture_data;


ALTER SCHEMA culture_data OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 75221)
-- Name: culture_palaces_clubs; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.culture_palaces_clubs (
    "data.general.name" character varying(128) NOT NULL,
    "data.general.locale.name" character varying(50) NOT NULL,
    "data.general.locale.timezone" character varying(50),
    "data.general.address.street" character varying(128),
    "data.general.address.comment" character varying(1024),
    "data.general.address.fullAddress" character varying(128),
    "data.general.address.mapPosition" jsonb,
    "data.general.description" text,
    "data.general.contacts.website" character varying(256),
    "data.general.contacts.email" character varying(50),
    "data.general.contacts.phones" jsonb,
    "data.general.image" jsonb,
    "data.general.gallery" jsonb,
    "data.general.category.type" character varying(50),
    "data.general.category.name" character varying(32767),
    "data.general.organization.name" character varying(256),
    "data.general.organization.locale.name" character varying(128),
    "data.general.organization.locale.timezone" character varying(50),
    "data.general.organization.address.street" character varying(128),
    "data.general.organization.address.comment" character varying(128),
    "data.general.organization.address.fullAddress" character varying(128),
    "data.general.organization.address.mapPosition" character varying(32767),
    "data.general.organization.inn" bigint,
    "data.general.organization.type" character varying(50),
    "data.general.organization.subordination.name" character varying(50),
    "data.general.organization.subordination.timezone" character varying(64),
    "data.general.organization.socialGroups" character varying(32767),
    "data.general.organization.id" character varying(128),
    "data.general.tags" jsonb,
    "data.general.videoHostings" character varying(32767),
    "data.general.workingSchedule.0" jsonb,
    "data.general.workingSchedule.1" jsonb,
    "data.general.workingSchedule.2" jsonb,
    "data.general.workingSchedule.3" jsonb,
    "data.general.workingSchedule.4" jsonb,
    "data.general.workingSchedule.5" jsonb,
    "data.general.workingSchedule.6" jsonb,
    "data.general.extraFields.artType" character varying(50),
    "data.general.extraFields.audienceType" character varying(50),
    "data.general.extraFields.language" character varying(128),
    "data.general.extraFields.professionalLevel" character varying(50),
    "data.general.extraFields.virtualTour" character varying(50),
    "data.general.extraFields.types" character varying(50),
    "data.general.seances" character varying(50),
    "data.general.id" bigint NOT NULL,
    "data.general.externalInfo" text,
    "data.general.externalIds.eipskId" character varying(50),
    "data.general.externalIds.culturarf" character varying(50),
    "data.general.externalIds.goscatalogId" character varying(50),
    "data.general.externalIds.statistic" character varying(4096),
    "data.info.createDate" timestamp with time zone,
    "data.info.updateDate" timestamp with time zone,
    geom public.geometry(Point,4326)
);


ALTER TABLE culture_data.culture_palaces_clubs OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 112243)
-- Name: m2m_culture_palaces_clubs_tags; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.m2m_culture_palaces_clubs_tags (
    id integer NOT NULL,
    culture_palace_id integer,
    tag_id integer
);


ALTER TABLE culture_data.m2m_culture_palaces_clubs_tags OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 112242)
-- Name: m2m_culture_palaces_clubs_tags_id_seq; Type: SEQUENCE; Schema: culture_data; Owner: postgres
--

CREATE SEQUENCE culture_data.m2m_culture_palaces_clubs_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE culture_data.m2m_culture_palaces_clubs_tags_id_seq OWNER TO postgres;

--
-- TOC entry 5955 (class 0 OID 0)
-- Dependencies: 231
-- Name: m2m_culture_palaces_clubs_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: culture_data; Owner: postgres
--

ALTER SEQUENCE culture_data.m2m_culture_palaces_clubs_tags_id_seq OWNED BY culture_data.m2m_culture_palaces_clubs_tags.id;


--
-- TOC entry 230 (class 1259 OID 112224)
-- Name: tags; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.tags (
    id integer NOT NULL,
    tag character varying(255) NOT NULL,
    description text
);


ALTER TABLE culture_data.tags OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 112223)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: culture_data; Owner: postgres
--

CREATE SEQUENCE culture_data.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE culture_data.tags_id_seq OWNER TO postgres;

--
-- TOC entry 5956 (class 0 OID 0)
-- Dependencies: 229
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: culture_data; Owner: postgres
--

ALTER SEQUENCE culture_data.tags_id_seq OWNED BY culture_data.tags.id;


--
-- TOC entry 5783 (class 2604 OID 112246)
-- Name: m2m_culture_palaces_clubs_tags id; Type: DEFAULT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags ALTER COLUMN id SET DEFAULT nextval('culture_data.m2m_culture_palaces_clubs_tags_id_seq'::regclass);


--
-- TOC entry 5782 (class 2604 OID 112227)
-- Name: tags id; Type: DEFAULT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.tags ALTER COLUMN id SET DEFAULT nextval('culture_data.tags_id_seq'::regclass);


--
-- TOC entry 5945 (class 0 OID 75221)
-- Dependencies: 221
-- Data for Name: culture_palaces_clubs; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

COPY culture_data.culture_palaces_clubs ("data.general.name", "data.general.locale.name", "data.general.locale.timezone", "data.general.address.street", "data.general.address.comment", "data.general.address.fullAddress", "data.general.address.mapPosition", "data.general.description", "data.general.contacts.website", "data.general.contacts.email", "data.general.contacts.phones", "data.general.image", "data.general.gallery", "data.general.category.type", "data.general.category.name", "data.general.organization.name", "data.general.organization.locale.name", "data.general.organization.locale.timezone", "data.general.organization.address.street", "data.general.organization.address.comment", "data.general.organization.address.fullAddress", "data.general.organization.address.mapPosition", "data.general.organization.inn", "data.general.organization.type", "data.general.organization.subordination.name", "data.general.organization.subordination.timezone", "data.general.organization.socialGroups", "data.general.organization.id", "data.general.tags", "data.general.videoHostings", "data.general.workingSchedule.0", "data.general.workingSchedule.1", "data.general.workingSchedule.2", "data.general.workingSchedule.3", "data.general.workingSchedule.4", "data.general.workingSchedule.5", "data.general.workingSchedule.6", "data.general.extraFields.artType", "data.general.extraFields.audienceType", "data.general.extraFields.language", "data.general.extraFields.professionalLevel", "data.general.extraFields.virtualTour", "data.general.extraFields.types", "data.general.seances", "data.general.id", "data.general.externalInfo", "data.general.externalIds.eipskId", "data.general.externalIds.culturarf", "data.general.externalIds.goscatalogId", "data.general.externalIds.statistic", "data.info.createDate", "data.info.updateDate", geom) FROM stdin;
Володинский дом культуры	Вологодская область	Europe/Moscow	ул Набережная,д 7	\N	обл Вологодская,д Володино,ул Набережная,д 7	{"type": "Point", "coordinates": [35.827293, 59.407958]}	<p>Володинский дом культуры был открыт летом 1989 года в очень живописном месте. Несмотря на все трудности, он остается центром культурной жизни и общения как для взрослых, так и для детей. Здесь организуют досуг для сельчан, развивают творческие способности и открывают новые таланты. </p><p>Энтузиасты-культработники придумывают праздничные сценарии и развлекательные программы, находят сценические костюмы. Сами шьют, клеят, рисуют. По-свойски, с теплотой и душевной простотой выступают самодеятельные артисты. Народный вокальный ансамбль «Рябинушка» и вокально-танцевальная группа «Задоринка» постоянно радуют зрителей своими выступлениями. <br /> </p>	\N	\N	[]	{"url": "https://all.culture.ru/uploads/7a1decd2cf304c8bb7417910384fb322.jpg", "title": "OhtZrTbBPlM.jpg"}	\N	\N	Дворцы культуры и клубы	МАУК «Бабаевский центр культурного развития»	Бабаевский район	Europe/Moscow	пл Привокзальная,1	\N	обл Вологодская,р-н Бабаевский,г Бабаево,пл Привокзальная,1	\N	3501008870	mincult	Бабаевский район	Europe/Moscow	[{"network":"vk","name":"Володинский Дом культуры","networkId":"158838778","updateDate":"2018-10-12T11:09:38Z","createDate":"2018-10-12T11:09:38Z","accountId":22721,"postingGroupId":20087},{"network":"vk","name":"Кдц Бабаево","networkId":"275144982","isPersonal":true,"updateDate":"2018-10-12T11:09:46Z","createDate":"2018-10-12T11:09:46Z","accountId":22721,"postingGroupId":20088},{"network":"vk","name":"МБУК \\"Бабаевский центр культурного развития\\"","networkId":"23582611","updateDate":"2018-10-12T11:09:31Z","createDate":"2018-10-12T11:09:31Z","accountId":22721,"postingGroupId":20086}]	20369	[{"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 122, "name": "Искусство", "sysName": "iskusstvo"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}]	\N	\N	{"to": "18:00:00", "from": "10:00:00"}	{"to": "18:00:00", "from": "10:00:00"}	{"to": "18:00:00", "from": "10:00:00"}	{"to": "18:00:00", "from": "10:00:00"}	{"to": "18:00:00", "from": "10:00:00"}	\N	\N	\N	\N	\N	\N	\N	\N	57453	[{"url":"https://www.culture.ru/institutes/57158/volodinskii-dom-kultury","serviceName":"Культура.рф"},{"url":"https://map.funtam.ru/offer/poi?showMainEvent=false&shareId=6725bb65-65c0-4a7b-a41e-f8af2d2a2dd7&shareType=venue","serviceName":"ФанТам"}]	57453	\N	\N	\N	2021-10-13 15:05:22+03	2025-03-06 17:45:48+03	0101000020E6100000D89AADBCE4E941401F12BEF737B44D40
\.


--
-- TOC entry 5949 (class 0 OID 112243)
-- Dependencies: 232
-- Data for Name: m2m_culture_palaces_clubs_tags; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

COPY culture_data.m2m_culture_palaces_clubs_tags (id, culture_palace_id, tag_id) FROM stdin;
1	57453	1
2	57453	2
3	57453	3
\.


--
-- TOC entry 5947 (class 0 OID 112224)
-- Dependencies: 230
-- Data for Name: tags; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

COPY culture_data.tags (id, tag, description) FROM stdin;
1	{"id": 122, "name": "Искусство", "sysName": "iskusstvo"}	\N
2	{"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}	\N
3	{"id": 39, "name": "Для детей", "sysName": "dlya-detey"}	\N
\.


--
-- TOC entry 5957 (class 0 OID 0)
-- Dependencies: 231
-- Name: m2m_culture_palaces_clubs_tags_id_seq; Type: SEQUENCE SET; Schema: culture_data; Owner: postgres
--

SELECT pg_catalog.setval('culture_data.m2m_culture_palaces_clubs_tags_id_seq', 3, true);


--
-- TOC entry 5958 (class 0 OID 0)
-- Dependencies: 229
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: culture_data; Owner: postgres
--

SELECT pg_catalog.setval('culture_data.tags_id_seq', 3, true);


--
-- TOC entry 5785 (class 2606 OID 111120)
-- Name: culture_palaces_clubs culture_palaces_clubs_pk; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.culture_palaces_clubs
    ADD CONSTRAINT culture_palaces_clubs_pk PRIMARY KEY ("data.general.id");


--
-- TOC entry 5790 (class 2606 OID 112249)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_pkey; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5787 (class 2606 OID 112233)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5788 (class 1259 OID 112260)
-- Name: idx_m2m_culture_palaces_clubs_tags_tag_id; Type: INDEX; Schema: culture_data; Owner: postgres
--

CREATE INDEX idx_m2m_culture_palaces_clubs_tags_tag_id ON culture_data.m2m_culture_palaces_clubs_tags USING btree (tag_id);


--
-- TOC entry 5791 (class 2606 OID 112250)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_culture_palace_id_fkey; Type: FK CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_culture_palace_id_fkey FOREIGN KEY (culture_palace_id) REFERENCES culture_data.culture_palaces_clubs("data.general.id") ON DELETE CASCADE;


--
-- TOC entry 5792 (class 2606 OID 112255)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES culture_data.tags(id) ON DELETE CASCADE;


-- Completed on 2025-10-21 13:46:20

--
-- PostgreSQL database dump complete
--

\unrestrict cjCPDzP5bM5xJ8EmLoRs3eMcusf5Cx3XgC98EwfB2SCOZIImTmrPE3lFsWQAhWc

