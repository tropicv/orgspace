
\connect - pm

drop table design;

CREATE SEQUENCE design_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE design (
    id integer DEFAULT nextval('design_id_seq'::text) NOT NULL,
    name character varying(512),
    short_name character varying(512),
    walias character varying(128),
    foto character varying(64),
    thumb character varying(64),
    baner character varying(64),
    ex_foto character varying(64),
    slogan text,
    description text,
    ex_description text,
    srt int4,
    sh_tmb int4,
    PRIMARY KEY(id)
);

CREATE INDEX i_design ON layer USING btree (id);

CREATE TABLE design (id integer(4) not null auto_increment primary key,name character varying(512),short_name character varying(512),walias character varying(128),foto character varying(64),thumb character varying(64),baner character varying(64),ex_foto character varying(64),slogan text,description text,ex_description text,srt integer(4), sh_tmb integer(4), sh_fotogal integer(4), sh_arr integer(4),sh_promo integer(4),sh_sol integer(4), sh_ex integer(4));