
\connect - pm

drop table predmet;

CREATE SEQUENCE predmet_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE predmet (
    id integer DEFAULT nextval('predmet_id_seq'::text) NOT NULL,
    name character varying(512),
    short_name character varying(512),
    walias character varying(128),
    foto character varying(64),
    thumb character varying(64),
    baner character varying(64),
    slogan text,
    description text,
    srt int4,
    PRIMARY KEY(id)
);

CREATE INDEX i_predmet ON layer USING btree (id);
