<?

/** element kernel database object for all show enity */

class element_db extends basic_db {
  function load_class(){
      parent::load_class();

      $this->tadd("creator",new str_type(1,"",512));        // string from use model
      $this->tadd("container_id",new id_type());             // container object
      $this->tadd("obj_id",new id_type());                   // id of object expandet this document
      
      $this->tadd("layer",new int_type(0,0,0,INTEGER_MAX_INT));   // template layer id
      $this->tadd("vpos",new int_type(0,0,0,INTEGER_MAX_INT));   // template layer position    
      $this->tadd("hpos",new int_type(0,0,0,INTEGER_MAX_INT));   // template layer position    
  } 
  
  function get_by_container($container_id){
    return $this->query("select * from ".table_name($this)." where container_id=$container_id order by layer,vpos,hpos,id;");
  }
  
}


/** container of elements */

class container_db extends element_db {
  function load_class(){
      parent::load_class();
      $this->tadd("title",new str_type(0,"",512));                   // id of object expandet this document
      $this->tadd("bwtitle",new str_type(0,"",1024));
      $this->tadd("walias",new str_type(0,"",64));                   // id of object expandet this document
      $this->tadd("keywords",new text_type(0,"",get_max_clob_size()));                   // id of object expandet this document
      $this->tadd("description",new text_type(0,"",get_max_clob_size()));                   // id of object expandet this document
      $this->tadd("is_glossary",new chk_type(0));            
      $this->tadd("glossary_text1",new text_type(0,"",get_max_clob_size()));            
      $this->tadd("glossary_text2",new text_type(0,"",get_max_clob_size()));            
      $this->tadd("block",new chk_type(0));                  
      $this->tadd("noi",new chk_type(0));                  
      $this->tadd("nof",new chk_type(0));                  
      $this->tadd("nomenu",new chk_type(0));                  
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by title,id;");
  }
  
  function list_layred(){
    $this->query("select container.* from container,element where container.id=element.container_id and element.creator='layer.view.default' order by container.title;");
  }

  function get_by_alias($alias){
    $this->query("select * from container where walias='$alias';");
    return $this->lst();
  }

  function get_count_glossary(){
    $this->query("select count(*) as cnt from container where is_glossary=1;");   
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }

  function list_glossary(){
    $this->query("select *  from container where is_glossary=1;");   
  }

  function search($keywords){
    $this->query("select *  from container where (".$this->LIKE("description",$keywords)." or ".$this->LIKE("keywords",$keywords)." or ".$this->LIKE("title",$keywords).") and block=0 order by title;");   
  }
  
}


/** kernel base manager for all documents */

class container_editor extends basic_editor {   
   function add_init(){ 
     $c=new container_db();
     $c->list_layred();
     d_open_list();
     while($c->lst()){
        d_put($c);
     }
     d_close();  

   }
   function edit_after_event(&$obj){ 
        $bid=bush_db::find_container_node($obj->getf("id"));
        $b=new bush_db($bid);
        $b->setf("walias",$obj->getf("walias")); 
        $b->setf("title",$obj->getf("title")); 
        $b->setf("block",$obj->getf("block")); 
        $b->update();
        return true; 
   }

   function edit_init(){ $this->add_init(); }
}

class wrapper_db extends basic_db {
  function load_class(){
      parent::load_class();

      $this->tadd("item",new str_type(1,"",255));        
      $this->tadd("meth",new str_type(1,"",255));        
      $this->tadd("params",new str_type(1,"",255));        
      $this->tadd("container_id",new id_type());             // container object
  } 

  function create($item,$meth,$options,$container_id){
     $this->setf("item",$item);
     $this->setf("meth",$meth);

     $res="";
     if($options){      
      reset($options);
      $res="?"; 
      while (list($keyname, $val) = each($options)) {
         if($keyname!="ver") $res.=$keyname."=".$val."?";
      }
     } 
     $this->setf("params",$res);
     $this->setf("container_id",$container_id);
  }

  
  /** return container_id or false 
      container-managewrapper?i=[name|*]&m=[name|*]&[parname]=[val|*]&[parname]=[val|*]...
      i=goods&m=view&obj=5
  */

  function get_wrapper($item,$meth,$options){
     dbg_o("===== item = ".$item." meth = ".$meth);
     $p=""; 
     if($options){
      reset($options);
      while (list($keyname, $val) = each($options)) {
         dbg_o("===== key = ".$keyname." val = ".$val);
         
         if($keyname=="ver") continue;
         if($keyname=="yclid") continue;
         if($p=="") $p=" and ("; 
         else $p.=" and ";
         $p.="params LIKE '%?".$keyname."=".$val."?%'";
      }
      if($p!=""){ $p.=")"; }
     }
     $this->query("select * from wrapper where item='$item' and meth='$meth' $p;");
     if($this->lst()) 
        return $this->getf("container_id");
     else {
    	dbg_o("==== Prev list empty (container.php/get_wrapper) =====");
    	$this->query("select * from wrapper where item='$item' and meth='$meth';");
    	if($this->lst()) return $this->getf("container_id");
     }
  }
  
}

class container extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("abc");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("pview",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("editinfo");  
      $this->tadd("edit");  
      $this->tadd("elementadd");  
      $this->tadd("elementdel");  
      $this->tadd("elementedit");  
      $this->tadd("elementview");  
      $this->tadd("elementlink");  
      $this->tadd("elementdellink");  
      $this->tadd("elementchange");  
      $this->tadd("glossary",PUBLICT);  
      $this->tadd("managewrapper");  
      $this->tadd("wrapper",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  
  function get_req_node(){
    $c=new container_db();
    if(get_param("walias")){ 
      if(!$c->get_by_alias(get_param("walias"))) return false;
      return $c;
    }
    if(get_param("obj")){
      if(!$c->get_obj(get_param("obj")))return false;
      return $c;
    }
    return false;     
  }  

  function abc($state){
     $p=new container_db();
     $p->list_abc();
     d_open_list();
     while($p->lst()){
        d_put($p);
     }
     d_close();  

     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }


  function view($state){
     $c=$this->get_req_node();
     if(!$c) return $this->exit_code(EXIT_ERR);	

     d_open_list();
       bush::show_path(bush_db::get_node(bush_db::find_container_node($c->getf("id"))));
     d_close();  


     $this->render_container($c,VIEW);
     set_ret_point();
     return $this->exit_code(EXIT_OK);	
  }

  function pview($state){
     $c=$this->get_req_node();
     if(!$c) return $this->exit_code(EXIT_ERR);	

     d_open_list();
       bush::show_path(bush_db::get_node(bush_db::find_container_node($c->getf("id"))));
     d_close();  

     $this->render_container($c,VIEW);
     set_ret_point();
     return $this->exit_code(EXIT_OK);	
  }

  function add($state){
     $ce=new container_editor($this);
     return $ce->add($state,new container_db());
  }

  function get_template($class_name,$method_name){
     $l=use_model::get_template_list($class_name,$method_name);
     $x=reset($l);
     d_open_node("template_list","");
     while($x){
       d_put_node("template",$x);
       $x=next($l);
     }
     d_close();
  }

  function editinfo($state){
     $this->get_template("container","view");
     $ce=new container_editor($this);
     return $ce->edit($state,new container_db());
  }

  function del($state){
     $ce=new container_editor($this);
     return $ce->del($state,new container_db());
  }

  function render_element(&$e){
	    d_open($e);
            $blk=use_model::get_creator($e->getf("creator"));     
 	    $class=$blk["class"];
	    $obj=0;

            if($blk["type"]==INSTANCE){
	      $meth="view";
	      $obj=$e->getf("obj_id");
            }else
            if($blk["type"]==LINK_METH){
	      $meth=$blk["method"];
	      $params="";
            }else     
            if($blk["type"]==LINK_OBJ){
	      $meth="view";
	      $obj=$e->getf("obj_id");
            }    

	    $env=new env_box(get_cur_disp(),$this->env);
	    $env->set_item($class);
	    $env->set_meth($meth);
	    $env->set_obj($obj);
	    push_env($env);
  	      $man=basic_manager::instance_manager($env); 
              $disp=$man->process();
	    pop_env();

	    $templ=use_model::get_template($e->getf("creator"));
	    dbg_o(" TEMPL NAME ".$templ["name"]);

	    d_open_node($templ["tname"],$env->get_params());
               d_put_disp($disp);
	    d_close();   
	    d_close();  
  }
  
  function render_container($c,$mode){
          $elems=false;

	  $e=new element_db();
	  $e->get_by_container($c->getid());	  
	  while($e->lst()){
            $e->addf("is_template",0);
//            $templ=use_model::get_template($e->getf("creator"));
//            $e->addf("name",$templ["name"]);
//var_dump($e);
	    $elems[]=clone_obj($e);
	  }
	
	  if($c->getf("container_id")!=0){
	    $et=new element_db();
  	    $et->get_by_container($c->getf("container_id"));	  
	    while($et->lst()){
	      $et->addf("is_template",1);
	      $elems[]=clone_obj($et);
  	    }
	    $ct=new container_db($c->getf("container_id"));
  	    $templ=use_model::get_template($ct->getf("creator"));	    
	  }else
  	    $templ=use_model::get_template($c->getf("creator"));
	    
	  if($mode==EDIT) d_open_node($templ["tname"]."_edit","");
	  else d_open_node($templ["tname"],"");
	  d_open($c);	  
	  
	  if(is_array($elems)){
 	   $e=reset($elems);
	   while($e){
  	    $this->render_element($e);
	    $e=next($elems);
	   }
	  }
	  	  
	  d_close();	  
	  d_close();	  	  
	  d_put($c);  
  }
  
  function get_block_categories(){
     $l=use_model::get_block_categories();
     $x=reset($l);
     d_open_node("block_categories","");
     while($x){
       $cls=use_model::get_blocks_by_category($x["name"]);
       if($cls){
        d_open_node("category",$x);
        $blk=reset($cls);
        while($blk){
          d_open_node("block",$blk);
          $tmp=reset($blk["template"]);
          while($tmp){
            d_put_node("template",$tmp);
            $tmp=next($blk["template"]);
          }      
          d_close();
          $blk=next($cls);
        }
        d_close();
       }   
       $x=next($l);
     }
     d_close();
  }

  function edit($state){

     $this->get_block_categories();

     $c=new container_db(get_obj());
     switch($state){
        case INIT_STATE:
	  $this->render_container($c,EDIT);
	  set_ret_point();
          return $this->exit_code(EXIT_OK);	
        case SAVE_STATE:	  
          return $this->exit_code(RETURN_TO_POINT);
	
     }
     return $this->exit_code(EXIT_OK);
  }


  function elementadd($state){
     $c=new container_db(get_param("container"));
     $e=new element_db();
     $e->create_default();
     $e->setf("creator",get_param("creator"));
     $e->setf("container_id",$c->getf("id"));
     set_ses_param("elem",$e->getall());
     set_end_process("container-elementlink");
    
     $blk=use_model::get_creator($e->getf("creator"));     

     if($blk["type"]==INSTANCE){
         go_to($blk["class"]."-add?creator=".$e->getf("creator"));
     }else
     if($blk["type"]==LINK_METH){
         return $this->exit_code(RETURN_TO_POINT);	 
     }else     
     if($blk["type"]==LINK_OBJ){
         go_to($blk["class"]."-select");	
     }     

     return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
  }
  
  function elementlink($state){
     $e=new element_db();
     $e->addall(get_ses_param("elem"));

     if($e){
      $e->setf("obj_id",get_param("last_obj"));
      $e->insert();     
      go_to("container-edit?obj=".$e->getf("container_id"));	     
     } else {
      go_to("welcome");
     }
     return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
  }


  function get_template_block($field_name,$creator){
     $block=use_model::get_creator($creator);
     
     $l=use_model::get_template_list($block["class"],$block["method"]);
     $x=reset($l);
     d_open_node("template_list",$block);
     while($x){
       d_put_node("template",$x);
       $x=next($l);
     }
     d_close();
  }


  function elementedit($state){
     $d=new element_db(get_obj());
     $this->get_template_block("creator",$d->getf("creator"));
     $ce=new basic_editor($this);
     return $ce->edit($state,new element_db());
  }

  function elementview($state){
     $d=new element_db(get_obj());
     $this->render_element($d);
     return $this->exit_code(EXIT_OK);	      
  }

  function elementdel($state){
     $e=new element_db(get_obj());
     
     $blk=use_model::get_creator($e->getf("creator"));     

     if($blk["type"]==INSTANCE){
         set_end_process("container-elementdellink?obj=".$e->getid());
         go_to($blk["class"]."-del?obj=".$e->getf("obj_id"));	
         return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
     }
     $e->delete();     
     return $this->exit_code(RETURN_TO_POINT);
  }

  function elementdellink($state){
     $e=new element_db(get_obj());
     go_to("container-edit?obj=".$e->getf("container_id"));	     
     $e->delete();     
     return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
  }

  function elementchange($state){
     $e=new element_db(get_obj());
     
     $blk=use_model::get_creator($e->getf("creator"));     

     if($blk["type"]==INSTANCE){
         go_to($blk["class"]."-edit?obj=".$e->getf("obj_id")."&creator=".$e->getf("creator"));	
         return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
     }
     return $this->exit_code(RETURN_TO_POINT);
  }

  function glossary($state){
     $c=new container_db();
     $num=$c->get_count_glossary();

     mt_srand(make_seed());
     $randval = mt_rand(0,$num);

     $c->list_glossary();
     $n=0;
     while($c->lst() && $n!=$randval) $n++;
     d_put($c);      
     return $this->exit_code(EXIT_OK);	      
  }

  function managewrapper($state){

     $params=get_url_params();
     $params=remove($params,"creator");
     $params=remove($params,"i");
     $params=remove($params,"m");

     $w=new wrapper_db();
// var_dump($w);

     if(!$w->get_wrapper(get_param("i"),get_param("m"),$params)){
       $c=new container_db();
       $c->create_default();
       if(get_param("creator")) $c->setf("creator",get_param("creator"));
       else $c->setf("creator","container.view.sample");
 
       $c->insert(); 

       $w->create(get_param("i"),get_param("m"),$params,$c->getf("id"));        
       $w->insert();
     }

     go_to("container-edit?obj=".$w->getf("container_id"));	
     return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
  } 

  function wrapper($state){
     $params=get_url_params();
     $w=new wrapper_db();

     if(!$w->get_wrapper(get_param("litem"),get_param("lmeth"),$params)) 
        return $this->exit_code(EXIT_OK);	

     $c=new container_db($w->getf("container_id"));
     if(!$c) return $this->exit_code(EXIT_ERR);	

     $this->render_container($c,VIEW);
     return $this->exit_code(EXIT_OK);	
  }
 
}



?>