
\connect - pm

drop table tobj;

CREATE SEQUENCE tobj_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE tobj (
    id integer DEFAULT nextval('tobj_id_seq'::text) NOT NULL,
    title character varying(512) NOT NULL
);

CREATE INDEX i_tobj ON page USING btree (id);

