
\connect - pm

drop table bush;

CREATE SEQUENCE bush_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;



CREATE TABLE bush (
    id integer DEFAULT nextval('bush_id_seq'::text) NOT NULL,
    title character varying(512) NOT NULL,
    walias character varying(512) NOT NULL,    
    url text NOT NULL,    
    parent int4 NOT NULL,
    type int4 NOT NULL,
    pos int4 NOT NULL,
    link int4 NOT NULL,    
    PRIMARY KEY(id)
);

drop index i_bush;
CREATE INDEX i_bush ON bush USING btree (id,parent,link,type,pos);
