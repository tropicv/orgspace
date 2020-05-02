
\connect - pm

drop table gtype;

CREATE SEQUENCE gtype_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE gtype (
    id integer DEFAULT nextval('gtype_id_seq'::text) NOT NULL,
    name character varying(512),
    walias character varying(512),
    description text,
    foto character varying(64),
    thumb character varying(64),
    PRIMARY KEY(id)
);

CREATE INDEX i_gtype ON layer USING btree (id);

