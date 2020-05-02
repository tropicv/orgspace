<?

class search extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("keywords",PUBLICT);  
  }

  function keywords($state){
     set_title("поиск");	

     if(get_param("keywords")){
        set_ses_param("keywords",get_param("keywords"));
     }
     $kw=get_ses_param("keywords");

     d_open_node("search",null); 

     $s=new serial_db();
     $s->search($kw);
     while($s->lst()){
       d_put($s);
     }

     $z=new zone_db();
     $z->search($kw);
     while($z->lst()){
       d_put($z);
     }

     $z=new design_db();
     $z->search($kw);
     while($z->lst()){
       d_put($z);
     }

     $p=new predmet_db();
     $p->search($kw);
     while($p->lst()){
       d_put($p);
     }

     $g=new goods_db();
     $g->search($kw);
     while($g->lst()){
       d_put($g);
     }

     $gt=new gtype_db();
     $gt->search($kw);
     while($gt->lst()){
       d_put($gt);
     }

     $c=new container_db();
     $c->search($kw);
     while($c->lst()){
       d_put($c);
     }

     d_close();

     return $this->exit_code(EXIT_OK);	
  }
 
}



?>