
\connect - pm

drop table feedback;

CREATE SEQUENCE feedback_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 2147483647
    MINVALUE 1
    CACHE 1;


CREATE TABLE feedback (
    id integer DEFAULT nextval('feedback_id_seq'::text) NOT NULL,
    name character varying(512),
    company character varying(512),
    town character varying(512),
    email character varying(512),
    tel character varying(512),
    fax character varying(512),
    hear_type int4,
    quest text,
    PRIMARY KEY(id)
);

CREATE INDEX i_feedback ON layer USING btree (id);

