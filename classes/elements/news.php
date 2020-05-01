<?

/** news operation */

class news_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("grp",new dictselect_type(1,0,"news","grp"));            
     $this->tadd("topic",new text_type(0,"",get_max_clob_size()));
     $this->tadd("body",new text_type(0,"",get_max_clob_size()));
     $this->tadd("event_date",new date_type(0,""));
     $this->tadd("link",new str_type(0,"",255));
  }

  function get_last(){
     $this->query("select * from ".table_name($this)." order by event_date desc,topic;");    
  }

  function get_onelast(){
     $this->query("select * from ".table_name($this)." order by event_date desc,topic limit 1;");    
  }

  function get_last_by_grp($grp){
     $this->query("select * from ".table_name($this)." where grp=".$grp." order by event_date desc,topic;");
  }

 
};


class news_editor extends basic_editor {   
};

class news extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
      $this->tadd("last",PUBLICT);  
      $this->tadd("onelast",PUBLICT);  
      $this->tadd("abc",PUBLICT);  
  }

  function view($state){ 
     show_list("news","grp");
     $n=new news_db(get_obj());
     d_put($n);
     set_ret_point();
     return $this->exit_code(EXIT_OK);
  }

  function add($state){
     $e=new news_editor($this);
     return $e->add($state,new news_db());
  }

  function edit($state){
     $e=new news_editor($this);
     return $e->edit($state,new news_db());
  }

  function del($state){
     $e=new news_editor($this);
     return $e->del($state,new news_db());
  }

  function abc($state){
     show_list("news","grp");

     $n=new news_db();
     $n->get_last_by_grp(get_obj());
     $e=new news_editor($this);
//     $e->show_item_list("news",$n,get_viewing_page(),get_viewing_page_size());
     $e->show_item_list("news",$n,get_viewing_page(),get_viewing_news_page_size());
     set_ret_point();
     return $this->exit_code(EXIT_OK);
  }

  function last($state){
     $n=new news_db();
     $n->get_last();
     d_open_list();
     $num=0;
     while($n->lst() && $num<5){
       d_put($n);
       $num++;
     }
     d_close();
     return $this->exit_code(EXIT_OK);
  }

  function onelast($state){
     $n=new news_db();
     $n->get_onelast();
     if($n->lst()){
	d_put($n);

/*
      $par["meth"]="view"; 
      $par["item"]="news";
      $par["obj"]=$n->getf("id"); 
      d_put_disp(run_manager_with_legacy("container","wrapper",$par));
*/

        $params["obj"]=$n->getf("id");
        
        $w=new wrapper_db();
        
        if(!$w->get_wrapper("news","view",$params)) 
           return $this->exit_code(EXIT_OK);	
        
        $c=new container_db($w->getf("container_id"));
        if(!$c) return $this->exit_code(EXIT_ERR);	
        
	$cont=new container($this->env);
        $cont->render_container($c,VIEW);

     }
     return $this->exit_code(EXIT_OK);
  }

}

?>