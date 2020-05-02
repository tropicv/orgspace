\connect - pm

drop table container;
drop table element;


CREATE SEQUENCE element_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE element (
    id integer DEFAULT nextval('element_id_seq'::text) NOT NULL,
    creator character varying(512) NOT NULL,
    container_id int4 NOT NULL,
    obj_id int4 NOT NULL,
    layer int4 NOT NULL,
    hpos int4 NOT NULL,   
    PRIMARY KEY(id)    
);

CREATE INDEX i_element ON element USING btree (id,obj_id,container_id);


CREATE SEQUENCE container_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE container (
    id integer DEFAULT nextval('container_id_seq'::text) NOT NULL,    
    creator character varying(512) NOT NULL,
    container_id int4 NOT NULL,
    obj_id int4 NOT NULL,
    layer int4 NOT NULL,
    hpos int4 NOT NULL,       
    title varchar(512) NOT NULL,
    walias varchar(512) NOT NULL,
    PRIMARY KEY(id)    
);

CREATE INDEX i_container ON container USING btree (id,obj_id,container_id);


alter table container add nof int(11);
alter table container add noi int(11);
update container set noi=0, nof=0;