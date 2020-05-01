
\connect - pm

drop table nav;

CREATE SEQUENCE nav_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE nav (
    id integer DEFAULT nextval('nav_id_seq'::text) NOT NULL,
    type    int4 NOT NULL,
    start   int4 NOT NULL,
    bush_id int4 NOT NULL,
    start_level int4 NOT NULL,
    PRIMARY KEY(id)
);

drop index i_nav;
CREATE INDEX i_nav ON bush USING btree (id,type,start,start_level);
