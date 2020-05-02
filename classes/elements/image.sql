
\connect - pm

drop table image;

CREATE SEQUENCE image_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE image (
    id integer DEFAULT nextval('image_id_seq'::text) NOT NULL,
    image character varying(64)
);

CREATE INDEX i_image ON page USING btree (id);

