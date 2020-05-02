CREATE TABLE formstorage (
  id int(4) NOT NULL auto_increment,
  form varchar(255) default NULL,
  body text,
  postdate timestamp NOT NULL,
  PRIMARY KEY  (id),
  KEY i_chairs (id)
) TYPE=MyISAM;

