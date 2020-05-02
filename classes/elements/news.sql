\connect - pm

CREATE SEQUENCE news_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE news (
    id integer DEFAULT nextval('news_id_seq'::text) NOT NULL,
    grp int4 NOT NULL,
    topic text NOT NULL,
    body text NOT NULL,
    link varchar(255) NOT NULL,
    event_date timestamp NOT NULL,
    PRIMARY KEY(id)
);

CREATE INDEX i_news ON page USING btree (id);
CREATE INDEX i_news_grp ON page USING btree (grp);

