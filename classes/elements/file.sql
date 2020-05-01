
\connect - pm

drop table file;

CREATE SEQUENCE file_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE file (
    id integer DEFAULT nextval('file_id_seq'::text) NOT NULL,
    title character varying(512) NOT NULL,
    file character varying(64)
);

CREATE INDEX i_file ON page USING btree (id);

