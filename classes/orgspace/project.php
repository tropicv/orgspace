<?

/** Project */

class project_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("short_name",new str_type(0,"",512));
      $this->tadd("walias",new str_type(1,"",128));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("description",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("short_description",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("author",new str_type(0,"",255));
      $this->tadd("manager",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("zone",new str_type(0,"",128));
      $this->tadd("design",new str_type(0,"",128));
      $this->tadd("serial",new str_type(0,"",128));
      $this->tadd("otype",new dictselect_type(1,0,"project","otype"));            
      $this->tadd("sh_zone",new chk_type(0));
      $this->tadd("sh_otype",new chk_type(0));
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
  }    

  function list_by_manager($manager){
    $this->query("select * from ".table_name($this)." where manager=".$manager." order by srt,name,id;");
  }

  function list_abc(){
    $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }

  function get_by_alias($alias){
    $this->query("select * from ".table_name($this)." where walias='".$alias."';");
  }

  function search($keywords){
    $this->query("select *  from project where ".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords)." or ".$this->LIKE("short_description",$keywords)." order by name;");   
  }

  function list_by_search($params){
    $q="";
    if(isset($params["author"]) && $params["author"]!="") $q.=$this->LIKE("author",$params["author"]);
    if(isset($params["manager"]) && $params["manager"]!=""){ 
        if($q!="") $q.=" and ";
	$q.="manager=".$params["manager"];
    }

    if(isset($params["zone"]) && $params["zone"]!=""){ 
        if($q!="") $q.=" and ";
	$q.=$this->LIKE("zone",$params["zone"]);
    }

    if(isset($params["design"]) && $params["design"]!=""){ 
        if($q!="") $q.=" and ";
	$q.=$this->LIKE("design",$params["design"]);
    }

    if(isset($params["serial"]) && $params["serial"]!=""){ 
        if($q!="") $q.=" and ";
	$q.=$this->LIKE("serial",$params["serial"]);
    }

    if(isset($params["otype"]) && $params["otype"]!=""){ 
        if($q!="") $q.=" and ";
	$q.="otype=".$params["otype"];
    }

    if($q!="") $this->query("select * from ".table_name($this)." where $q order by srt,name,id;");
    else $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }
  
}


/** kernel base manager for all documents */

class project_editor extends basic_editor {   

   function add_init(){ 
     $c=new manager_db();
     $c->list_abc();
     d_open_list();
     while($c->lst()){
        $tmp["name"]=$c->getf("name");
        $tmp["id"]=$c->getf("id");
        d_put_node("manager",$tmp);
     }
     d_close();  

     $c=new zone_db();
     $c->list_abc();
     d_open_list();
     while($c->lst()){
        $tmp["name"]=$c->getf("short_name");
        $tmp["id"]=$c->getf("id");
        d_put_node("zone",$tmp);
     }
     d_close();  

     $c=new design_db();
     $c->list_abc();
     d_open_list();
     while($c->lst()){
        $tmp["name"]=$c->getf("short_name");
        $tmp["id"]=$c->getf("id");
        d_put_node("design",$tmp);
     }
     d_close();  

     $c=new serial_db();
     $c->list_abc();
     d_open_list();
     while($c->lst()){
        $tmp["name"]=$c->getf("short_name");
        $tmp["id"]=$c->getf("id");
        d_put_node("serial",$tmp);
     }
     d_close();  
   }
   function edit_init(){ $this->add_init(); }

   function add_keys(&$obj){ 
     $zones=get_param("zones");
     $str="";
     for($i=0;$i<count($zones);$i++){
        $str.=$zones[$i].";";
     }
     $obj->setf("zone",$str); 

     $designes=get_param("designes");
     $str="";
     for($i=0;$i<count($designes);$i++){
        $str.=$designes[$i].";";
     }
     $obj->setf("design",$str); 

     $serials=get_param("serials");
     $str="";
     for($i=0;$i<count($serials);$i++){
        $str.=$serials[$i].";";
     }
     $obj->setf("serial",$str);
   }

   function edit_keys(&$obj){ $this->add_keys(&$obj); }

}

class project extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("manager",PUBLICT);  
      $this->tadd("all",PUBLICT);  
      $this->tadd("reviews",PUBLICT);  
      $this->tadd("search",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $se=new project_editor($this);
     return $se->add($state,new project_db());
  }

  function edit($state){
// $zones=get_param("zones");
// var_dump($zones);

     $se=new project_editor($this);
     return $se->edit($state,new project_db());
  }

  function del($state){
     $se=new project_editor($this);
     return $se->del($state,new project_db());
  }


  function list_all(){
     $a=new project_db();
     $a->list_abc();	  
     d_open_node("list_all","");
     while($a->lst()){
        $tmp["id"]=$a->getf("id");
        $tmp["name"]=$a->getf("short_name");
        $tmp["walias"]=$a->getf("walias");
        d_put_node("list_one",$tmp);
     }
     d_close();  
  }

  function view($state){ 
     set_ret_point();
     $this->list_all();
     $s=new project_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
     } else {
	$s->get_obj(get_obj());
     }
     d_put($s);

     $a=new imagegal_db();
     $a->list_album("project", $s->getf("id"), ALBUM);	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("ноу-хау - проекты - примеры реализованных проектов - ".$s->getf("short_name"));	
     return $this->exit_code(EXIT_OK);	

  }
 

  function all($state){ 
     $a=new project_db();
     $a->list_abc();	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("ноу-хау - проекты - примеры реализованных проектов");	
     return $this->exit_code(EXIT_OK);	
  }

  function manager($state){ 
     $a=new project_db();
     $a->list_by_manager(get_obj());	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     $s=new manager_db();
     $s->get_obj($a->getf("manager"));
     d_put($s);

     set_title("ноу-хау - проекты - примеры реализованных проектов");	
     return $this->exit_code(EXIT_OK);	
  }

  function reviews($state){ 
     set_ret_point();
     $this->list_all();

     $s=new project_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
        d_put($s);

        $a=new imagegal_db();
        $a->list_album("project", $s->getf("id"), ALBUM);
        d_open_list();
        while($a->lst()){
          d_put($a);
        }
        d_close();  

     } else {

     $a=new imagegal_db();
     $a->list_album_by_type("project");	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     }

     set_title("ноу-хау - проекты - отзывы");	
     return $this->exit_code(EXIT_OK);	

  }

  function search($state){ 

     show_list("project","otype");
     $se=new project_editor($this);
     $se->add_init();
     set_title("ноу-хау - проекты - примеры реализованных проектов - поиск проекта");	
     
     switch ($state){
     
       case INIT_STATE:
        return $this->exit_code(EXIT_OK);
     
       case SAVE_STATE:
     
        $a=new project_db();
        $a->list_by_search($this->env->get_post_data());
        d_open_list();
        while($a->lst()){
          d_put($a);
        }
        d_close();  
        d_put_node("param",$this->env->get_post_data());

        return $this->exit_code(EXIT_OK);
     
     }
     return $this->man->exit_code(NOT_SUPPORT);
  }

}

?>