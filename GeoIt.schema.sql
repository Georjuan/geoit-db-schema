--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-02-07 20:26:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 228 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 228
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

--
-- Name: EXTENSION pgcrypto;
--

CREATE EXTENSION pgcrypto; 


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 212 (class 1259 OID 33084)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL,
    street_id integer NOT NULL,
    number integer,
    block character varying(10),
    lot character varying(10),
    address_type_id integer NOT NULL,
    floor character varying(10),
    flat character varying(10),
    room character varying(10),
    store character varying(10),
    complement character varying,
    latitude numeric(10,6) NOT NULL,
    longitude numeric(10,6) NOT NULL
);


ALTER TABLE address OWNER TO postgres;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE address IS 'Cadastro de endereços de estabelecimentos.';


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.id IS 'Código do endereço.';


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.street_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.street_id IS 'CEP/Rua.';


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.number IS 'Número do endereço na rua.';


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.block; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.block IS 'Quadra/Bloco.';


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.lot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.lot IS 'Lote.';


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.address_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.address_type_id IS 'Tipo de endereço.';


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.floor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.floor IS 'Andar/Piso.';


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.flat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.flat IS 'Apartamento.';


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.room; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.room IS 'Sala.';


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.store; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.store IS 'Loja.';


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.complement; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.complement IS 'Complemento, ponto de referência etc.';


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.latitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.latitude IS 'Posição geográfica (latitude).';


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN address.longitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address.longitude IS 'Posição geográfica (longitude).';


--
-- TOC entry 211 (class 1259 OID 33082)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_id_seq OWNER TO postgres;

--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 211
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 173 (class 1259 OID 32770)
-- Name: address_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE address_types OWNER TO postgres;

--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE address_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE address_types IS 'Tipos de logradouro.';


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN address_types.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address_types.id IS 'Código do tipo de endereço.';


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN address_types.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN address_types.name IS 'Nome do tipo de endereço.';


--
-- TOC entry 172 (class 1259 OID 32768)
-- Name: address_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_types_id_seq OWNER TO postgres;

--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 172
-- Name: address_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_types_id_seq OWNED BY address_types.id;


--
-- TOC entry 206 (class 1259 OID 33018)
-- Name: bag_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bag_products (
    product_is integer NOT NULL,
    establishment_type_id integer NOT NULL
);


ALTER TABLE bag_products OWNER TO postgres;

--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE bag_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bag_products IS 'Pacote de produtos pré definidos para um determinado tipo de estabelecimento (vincula estes produtos automáticamente no cadastro de um novo estabelecimento).';


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN bag_products.product_is; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_products.product_is IS 'Código do produto.';


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN bag_products.establishment_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_products.establishment_type_id IS 'Tipo de estabelecimento.';


--
-- TOC entry 207 (class 1259 OID 33034)
-- Name: bag_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bag_services (
    service_id integer NOT NULL,
    establishment_type_id integer NOT NULL
);


ALTER TABLE bag_services OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE bag_services; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bag_services IS 'Pacote de serviços pré definidos para um determinado tipo de estabelecimento (vincula estes serviços automáticamente no cadastro de um novo estabelecimento).';


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN bag_services.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_services.service_id IS 'Código do serviço.';


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN bag_services.establishment_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_services.establishment_type_id IS 'Código do estabelecimento.';


--
-- TOC entry 208 (class 1259 OID 33050)
-- Name: bag_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bag_tags (
    tag_id integer NOT NULL,
    establishment_type_id integer NOT NULL
);


ALTER TABLE bag_tags OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE bag_tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bag_tags IS 'Pacote de tags pré definidas para um determinado tipo de estabelecimento (vincula estas tags automáticamente no cadastro de um novo estabelecimento).';


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN bag_tags.tag_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_tags.tag_id IS 'Código da tag.';


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN bag_tags.establishment_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bag_tags.establishment_type_id IS 'Código do estabelecimento.';


--
-- TOC entry 193 (class 1259 OID 32890)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    state_id integer NOT NULL,
    name character varying NOT NULL,
    ddd integer NOT NULL
);


ALTER TABLE cities OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE cities; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cities IS 'Cadastro de cidades.';


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN cities.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cities.id IS 'Código da cidade.';


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN cities.state_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cities.state_id IS 'Código do estado.';


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN cities.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cities.name IS 'Nome da cidade.';


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN cities.ddd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cities.ddd IS 'DDD padrão da cidade.';


--
-- TOC entry 192 (class 1259 OID 32888)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 192
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- TOC entry 214 (class 1259 OID 33105)
-- Name: establishment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    type_id integer NOT NULL,
    icon_id integer,
    address_id integer NOT NULL,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE establishment OWNER TO postgres;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE establishment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment IS 'Cadastro de estabelecimentos.';


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.id IS 'Código do estabelecimento.';


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.name IS 'Nome.';


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.description IS 'Descrição.';


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.type_id IS 'Tipo de estabelecimento.';


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.icon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.icon_id IS 'Código do ícone/foto de identificação.';


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.address_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.address_id IS 'Código do endereço.';


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN establishment.active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment.active IS 'Considerar estabelecimento nas pesquisas?.';


--
-- TOC entry 213 (class 1259 OID 33103)
-- Name: establishment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establishment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE establishment_id_seq OWNER TO postgres;

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 213
-- Name: establishment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establishment_id_seq OWNED BY establishment.id;


--
-- TOC entry 216 (class 1259 OID 33132)
-- Name: establishment_phones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_phones (
    id integer NOT NULL,
    establishment_id integer NOT NULL,
    type_id integer NOT NULL,
    ddd integer NOT NULL,
    phone character varying(10) NOT NULL
);


ALTER TABLE establishment_phones OWNER TO postgres;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE establishment_phones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_phones IS 'Telefones de contato de estabelecimentos.';


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN establishment_phones.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_phones.id IS 'Código do telefone.';


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN establishment_phones.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_phones.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN establishment_phones.type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_phones.type_id IS 'Tipo de telefone.';


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN establishment_phones.ddd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_phones.ddd IS 'Número DDD.';


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN establishment_phones.phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_phones.phone IS 'Número telefone.';


--
-- TOC entry 215 (class 1259 OID 33130)
-- Name: establishment_phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establishment_phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE establishment_phones_id_seq OWNER TO postgres;

--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 215
-- Name: establishment_phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establishment_phones_id_seq OWNED BY establishment_phones.id;


--
-- TOC entry 217 (class 1259 OID 33148)
-- Name: establishment_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_products (
    establishment_id integer NOT NULL,
    product_id integer NOT NULL,
    cost integer NOT NULL,
    unity_id integer NOT NULL
);


ALTER TABLE establishment_products OWNER TO postgres;

--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE establishment_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_products IS 'Produtos cadastrados para os estabelecimentos.';


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN establishment_products.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_products.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN establishment_products.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_products.product_id IS 'Codigo do produto.';


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN establishment_products.cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_products.cost IS 'Custo do produto (centavos).';


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN establishment_products.unity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_products.unity_id IS 'Unidade de medida que representa o custo apresentado.';


--
-- TOC entry 218 (class 1259 OID 33168)
-- Name: establishment_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_services (
    establishment_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE establishment_services OWNER TO postgres;

--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE establishment_services; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_services IS 'Serviços cadastrados para os estabelecimentos.';


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN establishment_services.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_services.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN establishment_services.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_services.service_id IS 'Código do serviço.';


--
-- TOC entry 220 (class 1259 OID 33185)
-- Name: establishment_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_settings (
    establishment_id integer NOT NULL,
    use_products_list boolean DEFAULT true NOT NULL,
    show_products_list boolean DEFAULT false NOT NULL,
    use_services_list boolean DEFAULT true NOT NULL,
    show_services_list boolean DEFAULT false NOT NULL,
    use_working_schedule boolean DEFAULT true NOT NULL
);


ALTER TABLE establishment_settings OWNER TO postgres;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE establishment_settings; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_settings IS 'Configurações do estabelecimento.';


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.use_products_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.use_products_list IS 'O estabelecimento tem uma lista de produtos para venda?';


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.show_products_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.show_products_list IS 'Se tiver, mostrar a lista de produtos do estabelecimento no app?';


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.use_services_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.use_services_list IS 'O estabelecimento tem uma lista de serviços para venda?';


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.show_services_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.show_services_list IS 'Se tiver, mostrar a lista de serviços do estabelecimento no app?';


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN establishment_settings.use_working_schedule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_settings.use_working_schedule IS 'Usar/Mostrar horário de funcionamento do estabelecimento?';


--
-- TOC entry 219 (class 1259 OID 33183)
-- Name: establishment_settings_establishment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establishment_settings_establishment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE establishment_settings_establishment_id_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 219
-- Name: establishment_settings_establishment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establishment_settings_establishment_id_seq OWNED BY establishment_settings.establishment_id;


--
-- TOC entry 221 (class 1259 OID 33201)
-- Name: establishment_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_tags (
    tag_id integer NOT NULL,
    establishment_id integer NOT NULL
);


ALTER TABLE establishment_tags OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE establishment_tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_tags IS 'Tags para filtro de busca de estabelecimento.';


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN establishment_tags.tag_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_tags.tag_id IS 'Código da tag.';


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN establishment_tags.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_tags.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 195 (class 1259 OID 32906)
-- Name: establishment_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    icon_id integer NOT NULL
);


ALTER TABLE establishment_types OWNER TO postgres;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE establishment_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_types IS 'Tipo de estabelecimento';


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN establishment_types.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_types.id IS 'Código do tipo de estabelecimento.';


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN establishment_types.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_types.name IS 'Nome do tipo de estabelecimento.';


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN establishment_types.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_types.description IS 'Descrição do tipo de estabelecimento.';


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN establishment_types.icon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_types.icon_id IS 'Icone padrão do tipo de estabelecimento.';


--
-- TOC entry 194 (class 1259 OID 32904)
-- Name: establishment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establishment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE establishment_types_id_seq OWNER TO postgres;

--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 194
-- Name: establishment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establishment_types_id_seq OWNED BY establishment_types.id;


--
-- TOC entry 223 (class 1259 OID 33219)
-- Name: establishment_working_schedule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establishment_working_schedule (
    id integer NOT NULL,
    establishment_id integer NOT NULL,
    week_day_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    is_working boolean DEFAULT true NOT NULL
);


ALTER TABLE establishment_working_schedule OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE establishment_working_schedule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE establishment_working_schedule IS 'Horário de funcionamento dos estabelecimentos.';


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.id IS 'Código do horário.';


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.establishment_id IS 'Código do estabelecimento.';


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.week_day_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.week_day_id IS 'Dia da semana.';


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.start_time IS 'Hora inicio.';


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.end_time IS 'Hora fim.';


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN establishment_working_schedule.is_working; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establishment_working_schedule.is_working IS 'Funciona neste dia? (estabelecimento estará operando?)';


--
-- TOC entry 222 (class 1259 OID 33217)
-- Name: establishment_working_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establishment_working_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE establishment_working_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 222
-- Name: establishment_working_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establishment_working_schedule_id_seq OWNED BY establishment_working_schedule.id;


--
-- TOC entry 175 (class 1259 OID 32781)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE images OWNER TO postgres;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE images; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE images IS 'Icones/Fotos de estabelecimentos, produtos e serviços.';


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN images.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN images.id IS 'Código da imagem.';


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN images.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN images.url IS 'URL/Path da imagem.';


--
-- TOC entry 174 (class 1259 OID 32779)
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO postgres;

--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 174
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- TOC entry 225 (class 1259 OID 33238)
-- Name: log_establishment_access; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE log_establishment_access (
    id bigint NOT NULL,
    log_search_id bigint NOT NULL,
    result_index smallint NOT NULL,
    establishment_id integer NOT NULL,
    datetime timestamp with time zone DEFAULT '2015-02-04 20:42:48.266-02'::timestamp with time zone NOT NULL
);


ALTER TABLE log_establishment_access OWNER TO postgres;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE log_establishment_access; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE log_establishment_access IS 'Log de acesso a descrição de estabelecimento que apareceu no resultado de pesquisa.';


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN log_establishment_access.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_establishment_access.id IS 'Código do registro.';


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN log_establishment_access.log_search_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_establishment_access.log_search_id IS 'Identificação da busca que o usuário efetuou para obter este resultado.';


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN log_establishment_access.result_index; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_establishment_access.result_index IS 'Indice/Ranking do resultado na lista de resultados.';


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN log_establishment_access.establishment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_establishment_access.establishment_id IS 'Estabelecimento que o usuário acessou.';


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN log_establishment_access.datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_establishment_access.datetime IS 'Data/Hora do acesso.';


--
-- TOC entry 224 (class 1259 OID 33236)
-- Name: log_establishment_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE log_establishment_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE log_establishment_access_id_seq OWNER TO postgres;

--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 224
-- Name: log_establishment_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE log_establishment_access_id_seq OWNED BY log_establishment_access.id;


--
-- TOC entry 227 (class 1259 OID 33257)
-- Name: log_map_access; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE log_map_access (
    id bigint NOT NULL,
    log_establishment_access_id bigint NOT NULL,
    datetime timestamp with time zone DEFAULT '2015-02-04 20:42:48.266-02'::timestamp with time zone NOT NULL
);


ALTER TABLE log_map_access OWNER TO postgres;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE log_map_access; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE log_map_access IS 'Log de acesso a mapa de rota até estabelecimento.';


--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN log_map_access.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_map_access.id IS 'Código do registro.';


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN log_map_access.log_establishment_access_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_map_access.log_establishment_access_id IS 'Referência do estabelecimento acessado antes de entrar no mapa.';


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN log_map_access.datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_map_access.datetime IS 'Data/Hora do acesso.';


--
-- TOC entry 226 (class 1259 OID 33255)
-- Name: log_map_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE log_map_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE log_map_access_id_seq OWNER TO postgres;

--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 226
-- Name: log_map_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE log_map_access_id_seq OWNED BY log_map_access.id;


--
-- TOC entry 197 (class 1259 OID 32922)
-- Name: log_search; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE log_search (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    word character varying NOT NULL,
    latitude numeric(10,6) NOT NULL,
    longitude numeric(10,6) NOT NULL,
    accuracy numeric(9,3) NOT NULL,
    qty_results smallint NOT NULL,
    datetime timestamp with time zone DEFAULT '2015-02-04 20:42:48.266-02'::timestamp with time zone NOT NULL
);


ALTER TABLE log_search OWNER TO postgres;

--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE log_search; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE log_search IS 'Log de pesquisas efetuadas.';


--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.id IS 'Código do log.';


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.user_id IS 'Usuário que efetuou a busca.';


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.word; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.word IS 'Texto/Expressão que o usuário buscou.';


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.latitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.latitude IS 'Posição geográfica do usuário no momento da busca (latitude).';


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.longitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.longitude IS 'Posição geográfica do usuário no momento da busca (longitude).';


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.accuracy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.accuracy IS 'Posição geográfica do usuário no momento da busca (acurácia da posição identificada).';


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.qty_results; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.qty_results IS 'Quantidade de resultados obtidos.';


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN log_search.datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN log_search.datetime IS 'Data/Hora da busca.';


--
-- TOC entry 196 (class 1259 OID 32920)
-- Name: log_search_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE log_search_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE log_search_id_seq OWNER TO postgres;

--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 196
-- Name: log_search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE log_search_id_seq OWNED BY log_search.id;


--
-- TOC entry 177 (class 1259 OID 32792)
-- Name: measure_units; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE measure_units (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE measure_units OWNER TO postgres;

--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE measure_units; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE measure_units IS 'Unidades de medida para precificar produtos e/ou serviços';


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN measure_units.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN measure_units.id IS 'Código da unidade de medida.';


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN measure_units.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN measure_units.name IS 'Nome/Símbolo da unidade de medida.';


--
-- TOC entry 176 (class 1259 OID 32790)
-- Name: measure_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE measure_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measure_units_id_seq OWNER TO postgres;

--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 176
-- Name: measure_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE measure_units_id_seq OWNED BY measure_units.id;


--
-- TOC entry 199 (class 1259 OID 32939)
-- Name: neighborhoods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE neighborhoods (
    id integer NOT NULL,
    city_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE neighborhoods OWNER TO postgres;

--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE neighborhoods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE neighborhoods IS 'Cadastro de bairros.';


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN neighborhoods.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN neighborhoods.id IS 'Código do bairro.';


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN neighborhoods.city_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN neighborhoods.city_id IS 'Código da cidade.';


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN neighborhoods.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN neighborhoods.name IS 'Nome do bairro.';


--
-- TOC entry 198 (class 1259 OID 32937)
-- Name: neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE neighborhoods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE neighborhoods_id_seq OWNER TO postgres;

--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 198
-- Name: neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE neighborhoods_id_seq OWNED BY neighborhoods.id;


--
-- TOC entry 179 (class 1259 OID 32803)
-- Name: phone_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE phone_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE phone_types OWNER TO postgres;

--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE phone_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE phone_types IS 'Tipos de número de telefone para contato.';


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN phone_types.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN phone_types.id IS 'Código do tipo de telefone.';


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN phone_types.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN phone_types.name IS 'Nome do tipo de telefone.';


--
-- TOC entry 178 (class 1259 OID 32801)
-- Name: phone_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE phone_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phone_types_id_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 178
-- Name: phone_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE phone_types_id_seq OWNED BY phone_types.id;


--
-- TOC entry 201 (class 1259 OID 32955)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    id integer NOT NULL,
    name character varying NOT NULL,
    establishment_type_id integer NOT NULL,
    description character varying,
    icon_id integer
);


ALTER TABLE product OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE product IS 'Cadastro de produtos.';


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN product.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN product.id IS 'Código do produto.';


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN product.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN product.name IS 'Nome do produto.';


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN product.establishment_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN product.establishment_type_id IS 'Código do tipo de estabelecimento que representa o produto. Ex: Alcool/Farmácia, Alcool/Posto combustível, Alcool/Supermercado.';


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN product.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN product.description IS 'Descrição do produto.';


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN product.icon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN product.icon_id IS 'Ícone do produto.';


--
-- TOC entry 200 (class 1259 OID 32953)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_id_seq OWNER TO postgres;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 200
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- TOC entry 203 (class 1259 OID 32977)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service (
    id integer NOT NULL,
    name character varying NOT NULL,
    establishment_type_id integer NOT NULL,
    description character varying,
    icon_id integer
);


ALTER TABLE service OWNER TO postgres;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE service; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE service IS 'Cadastro de serviços.';


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN service.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN service.id IS 'Código do serviço.';


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN service.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN service.name IS 'Nome do serviço.';


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN service.establishment_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN service.establishment_type_id IS 'Código do tipo de estabelecimento que representa o serviço. Ex: Lavagem/Pet shop, Lavagem/Lava jato, Lavagem/Lavanderia.';


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN service.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN service.description IS 'Descrição do serviço.';


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN service.icon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN service.icon_id IS 'Ícone do serviço.';


--
-- TOC entry 202 (class 1259 OID 32975)
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_id_seq OWNER TO postgres;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 202
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 181 (class 1259 OID 32814)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    system_available boolean DEFAULT false NOT NULL,
    min_app_version smallint DEFAULT 0 NOT NULL,
    actual_app_version smallint DEFAULT 0 NOT NULL,
    request_login_access_app boolean DEFAULT true NOT NULL,
    max_results_per_search smallint DEFAULT 10 NOT NULL,
    max_user_distance_search_near smallint DEFAULT 1000 NOT NULL,
    max_user_distance_search_away smallint DEFAULT 1000 NOT NULL,
    show_establishment_only_during_work_hour boolean DEFAULT false NOT NULL,
    images_url_path character varying NOT NULL,
    app_search_method smallint DEFAULT 1 NOT NULL
);


ALTER TABLE settings OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE settings; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE settings IS 'Configurações do sistema.';


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.id IS 'Código da configuração.';


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.system_available; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.system_available IS 'Sistema disponível (setar esse valor false desativa todo sistema mobile, tornando o serviço indisponível!).';


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.min_app_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.min_app_version IS 'Versão mínima do APP para acessar o sistema.';


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.actual_app_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.actual_app_version IS 'Versão atual do APP.';


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.request_login_access_app; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.request_login_access_app IS 'Necessário fazer login para utilizar o app?';


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.max_results_per_search; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.max_results_per_search IS 'Número máximo de resultados para retornar no app por cada pesquisa.';


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.max_user_distance_search_near; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.max_user_distance_search_near IS 'Distância máxima entre o usuário e o local a ser considerado na busca próxima.';


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.max_user_distance_search_away; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.max_user_distance_search_away IS 'Distância máxima entre o usuário e o local a ser considerado na busca longe(metros).';


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.show_establishment_only_during_work_hour; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.show_establishment_only_during_work_hour IS 'Mostrar os estabelecimentos nos resultados no app somente quando estiverem em horário de funcionamento?';


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.images_url_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.images_url_path IS 'URL padrão do diretório de imagens.';


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN settings.app_search_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN settings.app_search_method IS 'Método de pesquisa disponível:
1 - Blocos com termos pré-sugeridos.
2 - Busca por termos digitados pelo usuário.
3 - Buscar por blocos com termos pré-sugeridos e busca com termos digitados pelo usuário.
';


--
-- TOC entry 180 (class 1259 OID 32812)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE settings_id_seq OWNER TO postgres;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 180
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- TOC entry 183 (class 1259 OID 32833)
-- Name: state; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE state (
    id integer NOT NULL,
    name character varying NOT NULL,
    code character varying(2) NOT NULL
);


ALTER TABLE state OWNER TO postgres;

--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE state IS 'Cadastro de estados(do país).';


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN state.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN state.id IS 'Código do estado.';


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN state.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN state.name IS 'Nome do estado.';


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN state.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN state.code IS 'Simbolo/Sigla do estado.';


--
-- TOC entry 182 (class 1259 OID 32831)
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE state_id_seq OWNER TO postgres;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 182
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE state_id_seq OWNED BY state.id;


--
-- TOC entry 210 (class 1259 OID 33068)
-- Name: streeties; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streeties (
    id integer NOT NULL,
    neighborhood_id integer NOT NULL,
    cep character varying(8) NOT NULL,
    street character varying NOT NULL,
    street_nickname character varying
);


ALTER TABLE streeties OWNER TO postgres;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE streeties; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE streeties IS 'Cadastros de CEPs/Ruas.';


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN streeties.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN streeties.id IS 'Código do endereço.';


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN streeties.neighborhood_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN streeties.neighborhood_id IS 'Código do bairro.';


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN streeties.cep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN streeties.cep IS 'Número do CEP/Código postal.';


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN streeties.street; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN streeties.street IS 'Nome da rua.';


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN streeties.street_nickname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN streeties.street_nickname IS 'Segundo nome da rua caso tenha mais de um nome diferente.';


--
-- TOC entry 209 (class 1259 OID 33066)
-- Name: streeties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streeties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE streeties_id_seq OWNER TO postgres;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 209
-- Name: streeties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streeties_id_seq OWNED BY streeties.id;


--
-- TOC entry 185 (class 1259 OID 32844)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE tags OWNER TO postgres;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tags IS 'Tags para filtro de busca.';


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tags.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tags.id IS 'Código da tag.';


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN tags.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tags.name IS 'Nome da tag.';


--
-- TOC entry 184 (class 1259 OID 32842)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 184
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- TOC entry 189 (class 1259 OID 32866)
-- Name: user_authentication; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_authentication (
    user_id integer NOT NULL,
    login_access_token character varying,
    facebook_access_token character varying
);


ALTER TABLE user_authentication OWNER TO postgres;

--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE user_authentication; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE user_authentication IS 'Armazena autenticação de acesso de usuários.';


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN user_authentication.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_authentication.user_id IS 'Usuário.';


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN user_authentication.login_access_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_authentication.login_access_token IS 'Último token gerado de acesso no app.';


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN user_authentication.facebook_access_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_authentication.facebook_access_token IS 'Token de acesso aos dados do facebook do usuário.';


--
-- TOC entry 188 (class 1259 OID 32864)
-- Name: user_authentication_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_authentication_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_authentication_user_id_seq OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 188
-- Name: user_authentication_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_authentication_user_id_seq OWNED BY user_authentication.user_id;


--
-- TOC entry 205 (class 1259 OID 32999)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_profile (
    user_id integer NOT NULL,
    city_id integer NOT NULL,
    birth_date date NOT NULL,
    facebook_id character varying
);


ALTER TABLE user_profile OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE user_profile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE user_profile IS 'Perfil de usuários.';


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN user_profile.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_profile.user_id IS 'Usuário.';


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN user_profile.city_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_profile.city_id IS 'Cidade de origem.';


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN user_profile.birth_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_profile.birth_date IS 'Data de nascimento.';


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN user_profile.facebook_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN user_profile.facebook_id IS 'ID do perfil do facebook.';


--
-- TOC entry 204 (class 1259 OID 32997)
-- Name: user_profile_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_profile_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_profile_user_id_seq OWNER TO postgres;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_profile_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_profile_user_id_seq OWNED BY user_profile.user_id;


--
-- TOC entry 187 (class 1259 OID 32855)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying,
    gender smallint NOT NULL,
    email character varying NOT NULL,
    password character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE users IS 'Cadastro de usuários.';


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.id IS 'Código.';


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.name IS 'Nome.';


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.surname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.surname IS 'Sobrenome.';


--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.gender IS 'Sexo.
0 - Female
1 - Male';


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.email IS 'E-mail.';


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN users.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.password IS 'Senha de acesso.';


--
-- TOC entry 186 (class 1259 OID 32853)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 186
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 191 (class 1259 OID 32882)
-- Name: week_days; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE week_days (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE week_days OWNER TO postgres;

--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE week_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE week_days IS 'Dias da semana.';


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN week_days.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN week_days.id IS 'Código do dia.';


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN week_days.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN week_days.name IS 'Nome do dia.';


--
-- TOC entry 190 (class 1259 OID 32880)
-- Name: week_days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE week_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE week_days_id_seq OWNER TO postgres;

--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 190
-- Name: week_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE week_days_id_seq OWNED BY week_days.id;


--
-- TOC entry 2096 (class 2604 OID 33087)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 32773)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address_types ALTER COLUMN id SET DEFAULT nextval('address_types_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 32893)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 33108)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment ALTER COLUMN id SET DEFAULT nextval('establishment_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 33135)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_phones ALTER COLUMN id SET DEFAULT nextval('establishment_phones_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 33188)
-- Name: establishment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_settings ALTER COLUMN establishment_id SET DEFAULT nextval('establishment_settings_establishment_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 32909)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_types ALTER COLUMN id SET DEFAULT nextval('establishment_types_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 33222)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_working_schedule ALTER COLUMN id SET DEFAULT nextval('establishment_working_schedule_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 32784)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 33241)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_establishment_access ALTER COLUMN id SET DEFAULT nextval('log_establishment_access_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 33260)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_map_access ALTER COLUMN id SET DEFAULT nextval('log_map_access_id_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 32925)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_search ALTER COLUMN id SET DEFAULT nextval('log_search_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 32795)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY measure_units ALTER COLUMN id SET DEFAULT nextval('measure_units_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 32942)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY neighborhoods ALTER COLUMN id SET DEFAULT nextval('neighborhoods_id_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 32806)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY phone_types ALTER COLUMN id SET DEFAULT nextval('phone_types_id_seq'::regclass);


--
-- TOC entry 2092 (class 2604 OID 32958)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 32980)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 32817)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- TOC entry 2082 (class 2604 OID 32836)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state ALTER COLUMN id SET DEFAULT nextval('state_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 33071)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streeties ALTER COLUMN id SET DEFAULT nextval('streeties_id_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 32847)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 32869)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_authentication ALTER COLUMN user_id SET DEFAULT nextval('user_authentication_user_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 33002)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile ALTER COLUMN user_id SET DEFAULT nextval('user_profile_user_id_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 32858)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 32885)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY week_days ALTER COLUMN id SET DEFAULT nextval('week_days_id_seq'::regclass);


--
-- TOC entry 2160 (class 2606 OID 33092)
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 32778)
-- Name: address_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address_types
    ADD CONSTRAINT address_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 33022)
-- Name: bag_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bag_products
    ADD CONSTRAINT bag_products_pkey PRIMARY KEY (product_is, establishment_type_id);


--
-- TOC entry 2153 (class 2606 OID 33038)
-- Name: bag_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bag_services
    ADD CONSTRAINT bag_services_pkey PRIMARY KEY (service_id, establishment_type_id);


--
-- TOC entry 2156 (class 2606 OID 33054)
-- Name: bag_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bag_tags
    ADD CONSTRAINT bag_tags_pkey PRIMARY KEY (tag_id, establishment_type_id);


--
-- TOC entry 2133 (class 2606 OID 32898)
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 33137)
-- Name: establishment_phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_phones
    ADD CONSTRAINT establishment_phones_pkey PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 33114)
-- Name: establishment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment
    ADD CONSTRAINT establishment_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 33152)
-- Name: establishment_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_products
    ADD CONSTRAINT establishment_products_pkey PRIMARY KEY (establishment_id, product_id);


--
-- TOC entry 2168 (class 2606 OID 33172)
-- Name: establishment_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_services
    ADD CONSTRAINT establishment_services_pkey PRIMARY KEY (establishment_id, service_id);


--
-- TOC entry 2170 (class 2606 OID 33195)
-- Name: establishment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_settings
    ADD CONSTRAINT establishment_settings_pkey PRIMARY KEY (establishment_id);


--
-- TOC entry 2173 (class 2606 OID 33205)
-- Name: establishment_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_tags
    ADD CONSTRAINT establishment_tags_pkey PRIMARY KEY (tag_id, establishment_id);


--
-- TOC entry 2135 (class 2606 OID 32914)
-- Name: establishment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_types
    ADD CONSTRAINT establishment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 33225)
-- Name: establishment_working_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establishment_working_schedule
    ADD CONSTRAINT establishment_working_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 2115 (class 2606 OID 32789)
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 33244)
-- Name: log_establishment_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_establishment_access
    ADD CONSTRAINT log_establishment_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 33263)
-- Name: log_map_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_map_access
    ADD CONSTRAINT log_map_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 32931)
-- Name: log_search_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log_search
    ADD CONSTRAINT log_search_pkey PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 32800)
-- Name: measure_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measure_units
    ADD CONSTRAINT measure_units_pkey PRIMARY KEY (id);


--
-- TOC entry 2139 (class 2606 OID 32947)
-- Name: neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY neighborhoods
    ADD CONSTRAINT neighborhoods_pkey PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 32811)
-- Name: phone_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phone_types
    ADD CONSTRAINT phone_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 32963)
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 32985)
-- Name: service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 32830)
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 32841)
-- Name: state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 33076)
-- Name: streeties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streeties
    ADD CONSTRAINT streeties_pkey PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 32852)
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 2606 OID 32874)
-- Name: user_authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_authentication
    ADD CONSTRAINT user_authentication_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2147 (class 2606 OID 33007)
-- Name: user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2127 (class 2606 OID 32863)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2131 (class 2606 OID 32887)
-- Name: week_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY week_days
    ADD CONSTRAINT week_days_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 1259 OID 33033)
-- Name: bag_products_establishment_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bag_products_establishment_type_idx ON bag_products USING btree (establishment_type_id);


--
-- TOC entry 2151 (class 1259 OID 33049)
-- Name: bag_services_establishment_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bag_services_establishment_type_idx ON bag_services USING btree (establishment_type_id);


--
-- TOC entry 2154 (class 1259 OID 33065)
-- Name: bag_tags_establishment_type_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bag_tags_establishment_type_id_idx ON bag_tags USING btree (establishment_type_id);


--
-- TOC entry 2171 (class 1259 OID 33216)
-- Name: establishment_tags_establishment_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX establishment_tags_establishment_id_idx ON establishment_tags USING btree (establishment_id);


--
-- TOC entry 2140 (class 1259 OID 32974)
-- Name: product_establishment_type_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX product_establishment_type_id_idx ON product USING btree (establishment_type_id);


--
-- TOC entry 2143 (class 1259 OID 32996)
-- Name: service_establishment_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX service_establishment_id_idx ON service USING btree (establishment_type_id);


--
-- TOC entry 2199 (class 2606 OID 33098)
-- Name: address_address_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_address_type_id_fkey FOREIGN KEY (address_type_id) REFERENCES address_types(id);


--
-- TOC entry 2198 (class 2606 OID 33093)
-- Name: address_street_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_street_id_fkey FOREIGN KEY (street_id) REFERENCES streeties(id);


--
-- TOC entry 2192 (class 2606 OID 33028)
-- Name: bag_products_establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_products
    ADD CONSTRAINT bag_products_establishment_type_id_fkey FOREIGN KEY (establishment_type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2191 (class 2606 OID 33023)
-- Name: bag_products_product_is_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_products
    ADD CONSTRAINT bag_products_product_is_fkey FOREIGN KEY (product_is) REFERENCES product(id);


--
-- TOC entry 2194 (class 2606 OID 33044)
-- Name: bag_services_establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_services
    ADD CONSTRAINT bag_services_establishment_type_id_fkey FOREIGN KEY (establishment_type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2193 (class 2606 OID 33039)
-- Name: bag_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_services
    ADD CONSTRAINT bag_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES service(id);


--
-- TOC entry 2196 (class 2606 OID 33060)
-- Name: bag_tags_establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_tags
    ADD CONSTRAINT bag_tags_establishment_type_id_fkey FOREIGN KEY (establishment_type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2195 (class 2606 OID 33055)
-- Name: bag_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bag_tags
    ADD CONSTRAINT bag_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- TOC entry 2181 (class 2606 OID 32899)
-- Name: cities_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2202 (class 2606 OID 33125)
-- Name: establishment_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment
    ADD CONSTRAINT establishment_address_id_fkey FOREIGN KEY (address_id) REFERENCES address(id);


--
-- TOC entry 2201 (class 2606 OID 33120)
-- Name: establishment_icon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment
    ADD CONSTRAINT establishment_icon_id_fkey FOREIGN KEY (icon_id) REFERENCES images(id);


--
-- TOC entry 2203 (class 2606 OID 33138)
-- Name: establishment_phones_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_phones
    ADD CONSTRAINT establishment_phones_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2204 (class 2606 OID 33143)
-- Name: establishment_phones_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_phones
    ADD CONSTRAINT establishment_phones_type_id_fkey FOREIGN KEY (type_id) REFERENCES phone_types(id);


--
-- TOC entry 2205 (class 2606 OID 33153)
-- Name: establishment_products_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_products
    ADD CONSTRAINT establishment_products_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2206 (class 2606 OID 33158)
-- Name: establishment_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_products
    ADD CONSTRAINT establishment_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES product(id);


--
-- TOC entry 2207 (class 2606 OID 33163)
-- Name: establishment_products_unity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_products
    ADD CONSTRAINT establishment_products_unity_id_fkey FOREIGN KEY (unity_id) REFERENCES measure_units(id);


--
-- TOC entry 2208 (class 2606 OID 33173)
-- Name: establishment_services_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_services
    ADD CONSTRAINT establishment_services_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2209 (class 2606 OID 33178)
-- Name: establishment_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_services
    ADD CONSTRAINT establishment_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES service(id);


--
-- TOC entry 2210 (class 2606 OID 33196)
-- Name: establishment_settings_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_settings
    ADD CONSTRAINT establishment_settings_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2212 (class 2606 OID 33211)
-- Name: establishment_tags_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_tags
    ADD CONSTRAINT establishment_tags_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2211 (class 2606 OID 33206)
-- Name: establishment_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_tags
    ADD CONSTRAINT establishment_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- TOC entry 2200 (class 2606 OID 33115)
-- Name: establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment
    ADD CONSTRAINT establishment_type_id_fkey FOREIGN KEY (type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2182 (class 2606 OID 32915)
-- Name: establishment_types_icon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_types
    ADD CONSTRAINT establishment_types_icon_id_fkey FOREIGN KEY (icon_id) REFERENCES images(id);


--
-- TOC entry 2213 (class 2606 OID 33226)
-- Name: establishment_working_schedule_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_working_schedule
    ADD CONSTRAINT establishment_working_schedule_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2214 (class 2606 OID 33231)
-- Name: establishment_working_schedule_week_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establishment_working_schedule
    ADD CONSTRAINT establishment_working_schedule_week_day_id_fkey FOREIGN KEY (week_day_id) REFERENCES week_days(id);


--
-- TOC entry 2216 (class 2606 OID 33250)
-- Name: log_establishment_access_establishment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_establishment_access
    ADD CONSTRAINT log_establishment_access_establishment_id_fkey FOREIGN KEY (establishment_id) REFERENCES establishment(id);


--
-- TOC entry 2215 (class 2606 OID 33245)
-- Name: log_establishment_access_log_search_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_establishment_access
    ADD CONSTRAINT log_establishment_access_log_search_id_fkey FOREIGN KEY (log_search_id) REFERENCES log_search(id);


--
-- TOC entry 2217 (class 2606 OID 33264)
-- Name: log_map_access_log_establishment_access_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_map_access
    ADD CONSTRAINT log_map_access_log_establishment_access_id_fkey FOREIGN KEY (log_establishment_access_id) REFERENCES log_establishment_access(id);


--
-- TOC entry 2183 (class 2606 OID 32932)
-- Name: log_search_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_search
    ADD CONSTRAINT log_search_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2184 (class 2606 OID 32948)
-- Name: neighborhoods_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY neighborhoods
    ADD CONSTRAINT neighborhoods_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- TOC entry 2185 (class 2606 OID 32964)
-- Name: product_establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_establishment_type_id_fkey FOREIGN KEY (establishment_type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2186 (class 2606 OID 32969)
-- Name: product_icon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_icon_id_fkey FOREIGN KEY (icon_id) REFERENCES images(id);


--
-- TOC entry 2187 (class 2606 OID 32986)
-- Name: service_establishment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_establishment_type_id_fkey FOREIGN KEY (establishment_type_id) REFERENCES establishment_types(id);


--
-- TOC entry 2188 (class 2606 OID 32991)
-- Name: service_icon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_icon_id_fkey FOREIGN KEY (icon_id) REFERENCES images(id);


--
-- TOC entry 2197 (class 2606 OID 33077)
-- Name: streeties_neighborhood_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streeties
    ADD CONSTRAINT streeties_neighborhood_id_fkey FOREIGN KEY (neighborhood_id) REFERENCES neighborhoods(id);


--
-- TOC entry 2180 (class 2606 OID 32875)
-- Name: user_authentication_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_authentication
    ADD CONSTRAINT user_authentication_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2190 (class 2606 OID 33013)
-- Name: user_profile_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- TOC entry 2189 (class 2606 OID 33008)
-- Name: user_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-02-07 20:26:40

--
-- PostgreSQL database dump complete
--

