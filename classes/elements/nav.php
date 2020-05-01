<?

/** type of nav */

define("NAV_LINK",0);
define("NAV_LEVEL",1);
define("NAV_TREE",2);
define("NAV_RUBR",3);
define("NAV_PATH",4);
define("BACK_LINK",5);
define("TOP_LINK",6);
define("NAV_OPATH",7);

/** start genereate type */

define("START_DYNAMIC",0);
define("START_STATIC",1);


class nav_db extends basic_db {
  
  function load_class(){
      parent::load_class();
             
      $this->tadd("type",new dictselect_type(1,0,"nav","type"));            
      $this->tadd("start",new int_type(0,0,0,INTEGER_MAX_INT));                  
      $this->tadd("bush_id",new id_type());                  
      $this->tadd("start_level",new int_type(0,0,0,INTEGER_MAX_INT));                        
  }
 
}


class nav_editor extends basic_editor {   
   function add_init(){ 
     d_open_node("tree","");
       bush::show_tree(bush_db::get_root_node_id());
     d_close();
   }

   function edit_init(){ 
    return $this->add_init();
   }

   function add_keys(&$obj){ 
   }

}

class nav extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("view1",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
      $this->tadd("level",PUBLICT);  
  }

  function view1($state){ 
     $n=new nav_db(get_obj());
     d_open($n);
     d_close();
     return $this->exit_code(EXIT_OK);
  }
  function view($state){ 
     $n=new nav_db(get_obj());
     d_open($n);

     if($n->getf("start")==START_STATIC){
        $node=bush_db::get_node($n->getf("bush_id"));     
     } else {
        $node=bush_db::get_node($n->getf("bush_id"));     
     }

     /** find start node */
     $level=$n->getf("start_level");
     for($i=0;$i<$level && $node;$i++){
       $node=bush_db::get_node($node->up);
     }

     switch($n->getf("type")){
      case NAV_LINK:
       if ($node)
         d_put($node);
       break;
      case NAV_LEVEL:
       if ($node)
         bush::show_level($node);
       break;
      case NAV_TREE:
       bush::show_tree($node->getid());
       break;
      case NAV_RUBR:
       bush::show_rubr($node);
       break;
      case NAV_PATH:
       if ($node)
         bush::show_path($node);
       break;
      case BACK_LINK:     
       break;
      case NAV_OPATH:     
       break;
     }

     d_close();
     return $this->exit_code(EXIT_OK);
  }

  function add($state){
     $this->get_model_select();
     $e=new nav_editor($this);
     return $e->add($state,new nav_db());
  }

  function get_model_select(){
     
     $l=data_model::get_list("nav","type");
     $x=reset($l);
     d_open_node("type_list","");
     while($x){
       $val=key($l);
       $z["id"]=key($l);
       $z["title"]=$x;
       d_put_node("type",$z);
       $x=next($l);
     }
     d_close();

     $l=data_model::get_list("nav","start");
     $x=reset($l);
     d_open_node("start_list","");
     while($x){
       $z["id"]=key($l);
       $z["title"]=$x;
       d_put_node("start",$z);
       $x=next($l);
     }
     d_close();
  }


  function edit($state){
     $this->get_model_select();
     $e=new nav_editor($this);
     return $e->edit($state,new nav_db());
  }

  function del($state){
     $e=new nav_editor($this);
     return $e->del($state,new nav_db());
  }

}

?>