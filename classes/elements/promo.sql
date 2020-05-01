CREATE TABLE promo (
  id int(4) NOT NULL auto_increment,

  type int(4) default NULL,
  image varchar(255) NOT NULL,
  alt varchar(255) NOT NULL,
  link varchar(255) NOT NULL,
  sizex int(4) default NULL,
  sizey int(4) default NULL,
  aligment int(4) default NULL,
  image varchar(255) NOT NULL,
  textbody text,  
  is_public int4 NOT NULL,
  open_date timestamp;

  PRIMARY KEY  (id),
  KEY i_project (is_public)
) TYPE=MyISAM;

