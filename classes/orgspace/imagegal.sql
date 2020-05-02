
\connect - pm

drop table imagegal;

CREATE SEQUENCE imagegal_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE imagegal (
    id integer DEFAULT nextval('imagegal_id_seq'::text) NOT NULL,
    name character varying(512),
    description text,
    supp_type character varying(512),
    supp_id int4,
    ftype int4,
    foto character varying(64),
    thumb character varying(64),
    PRIMARY KEY(id)
);

CREATE INDEX i_imagegal ON layer USING btree (id);

