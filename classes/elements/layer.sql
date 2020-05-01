
\connect - pm

drop table layer;

CREATE SEQUENCE layer_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE layer (
    id integer DEFAULT nextval('layer_id_seq'::text) NOT NULL,
    title character varying(512) NOT NULL,
    number int4 NOT NULL,
    PRIMARY KEY(id)
);

CREATE INDEX i_layer ON layer USING btree (id);

