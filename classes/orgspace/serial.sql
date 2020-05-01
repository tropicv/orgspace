
\connect - pm

drop table serial;

CREATE SEQUENCE serial_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE serial (
    id integer DEFAULT nextval('serial_id_seq'::text) NOT NULL,
    name character varying(512),
    short_name character varying(512),
    walias character varying(128),
    foto character varying(64),
    thumb character varying(64),
    baner character varying(64),
    add_foto character varying(64),
    baner_text text,
    description text,
    short_description text,
    add_description text,
    inf_page character varying(512),
    example character varying(512),
    PRIMARY KEY(id)
);

CREATE INDEX i_serial ON layer USING btree (id);

