
\connect - pm

drop table goods;

CREATE SEQUENCE goods_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::text) NOT NULL,
    name character varying(512),
    code character varying(512),
    predmet_id int4,
    type int4,
    description text,
    short_description text,
    foto character varying(64),
    thumb character varying(64),
    PRIMARY KEY(id)
);

CREATE INDEX i_goods ON layer USING btree (id);

