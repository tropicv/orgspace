\connect - pm

CREATE SEQUENCE banner_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE banner (
    id integer DEFAULT nextval('banner_id_seq'::text) NOT NULL,
    image varchar(255) NOT NULL,
    alt varchar(255) NOT NULL,
    link varchar(255) NOT NULL,
    is_public int4 NOT NULL,
    PRIMARY KEY(id)
);

CREATE INDEX i_banner ON banner USING btree (id);
CREATE INDEX i_banner_pub ON banner USING btree (is_public);

