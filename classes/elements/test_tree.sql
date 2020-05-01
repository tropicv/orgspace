
\connect - pm

delete from bush;

SELECT pg_catalog.setval ('bush_id_seq',1,true);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('Root node','root','',0,0,0,20);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('First node','first','',2,1,0,20);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('Second node','sec','',2,1,1,20);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('Third node','three','',2,1,2,20);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('First node 1','fn','',3,1,2,20);

insert into bush (title,walias,url,parent,type,pos,link)
 values ('First node 2','fn','',3,1,2,20);
