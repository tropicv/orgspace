<?

/** type of bush */

define("SAME_PAGE",0);
define("LINK_INTERNAL",1);
define("LINK_EXTERNAL",2);


/** global vars */
$root_node=0;
$bush_index=false;
$bush_alias=false;
$bush_parent=false;

class bush_db extends basic_db {
  var $up=0;
  var $down=0;
  var $next=0;
  
  function load_class(){
      parent::load_class();
      $this->tadd("title",new str_type(0,"",512));                  
      $this->tadd("walias",new str_type(0,"",512));                  
      $this->tadd("parent",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("type",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("pos",new int_type(0,0,0,INTEGER_MAX_INT));            
      
      $this->tadd("url",new url_type(0,"",512));                  
      $this->tadd("link",new id_type());                  
      $this->tadd("block",new chk_type(0));                  
      $this->tadd("notshow",new chk_type(0));                  
      $this->tadd("container",new int_type(0,0,0,INTEGER_MAX_INT));                  
  }
 

  function list_all(){
    $this->query("select * from ".table_name($this)." order by parent,pos,title;");    
  }

  /** static load all bush in mem (serialize in future) */
  
  function load_tree(){
    global $bush_index,$bush_alias,$root_node,$bush_parent;

    $prev=-1;    
    $b=new bush_db();
    $b->list_all();

    
    while($b->lst()){
      $parent=$b->getf("parent");
      $id=$b->getid();
      
      if($parent==0) $root_node=$id;

      if($prev!=$parent){ 
         $prev_node=false;
	 $bush_parent[$parent]=$id;
      }
      
      $b->up=$parent;
            
      // save indexs
      $bush_index[$id]=clone_obj($b);      
      $bush_alias[$b->getf("walias")]=$id;      
      $prev=$parent;     
      if($prev_node)        
         $bush_index[$prev_node]->next=$id;
      $prev_node=$id; 	 
    }

   
    $node=reset($bush_index);
    while($node){
      $id=$node->getf("id");      
      if(isset($bush_parent[$id])) 
         $bush_index[$node->getf("id")]->down=$bush_parent[$id];
	 
      if($node->getf("type")==LINK_INTERNAL){ // make links
         $nit=20;
	 $x=$bush_index[$node->getf("link")];
	 while($nit && $x){
	    if($x->getf("type")==SAME_PAGE){
	       $bush_index[$node->getid()]->addf("target_type",SAME_PAGE);
	       $bush_index[$node->getid()]->addf("target_container",$x->getf("container"));
	       break;
	    }
	    if($x->getf("type")==LINK_EXTERNAL){
	       $bush_index[$node->getid()]->addf("target_type",LINK_EXTERNAL);
	       $bush_index[$node->getid()]->addf("target_url",$x->getf("url"));
	       break;
	    }
	    if($x->getf("type")==LINK_INTERNAL) {
               $x=$bush_index[$x->getf("link")];
	    }
	    $nit--;
	 }
	 if(!$nit){
	   dbg_err("not found internal link ".$node->getf("title"));
	 }
	 
      }	 
      $node=next($bush_index);
    }

  
   
  }  
  
  function get_node($ind){
    global $bush_index,$bush_alias,$root_node,$bush_parent;
//    if(sizeof($bush_index)<=$ind) return false;
    if(isset($bush_index[$ind])) return clone_obj($bush_index[$ind]);
    return false;
  }

  function get_root_node(){
    global $root_node;  
    return bush_db::get_node($root_node);
  }

  function get_root_node_id(){
    global $root_node;  
    dbg_o("===========3-".$root_node);
    return $root_node;
  }
  

  function get_by_alias($alias){
    global $bush_index,$bush_alias,$root_node,$bush_parent;
    if(isset($bush_alias[$alias])) return $bush_index[$bush_alias[$alias]];
    return false;
  }

  function get_path($ind){

    $node=bush_db::get_node($ind);

    while($node){
      $res[]=clone_obj($node);
      $node=bush_db::get_node($node->up);
    }    

    for($i=sizeof($res)-1;$i>=0;$i--){
      $path[]=$res[$i];
    }
    return $path; 
  }      

  //function is_public(){ return $this->getf("block")=="1" ? false : true;  }
  function is_public(){ 
    dbg_o("----------------------".$this->getf("block"));
    //2020-04-01 not worhing  main navugation
    // if($this->getf("block")=="1") return false;
    return true;
  }


  function find_container_node($container_id){
    global $bush_index;

    reset($bush_index);
    while (list($keyname, $bush) = each($bush_index)) {
       if($bush->getf("type")==SAME_PAGE && $bush->getf("container")==$container_id){
           return $bush->getf("id"); 
       }
    }
    
    return bush_db::get_root_node_id(); 
  }      


}


class bush_editor extends basic_editor {   
   function add_init(){ 
     $b=bush::get_req_node();
     d_open_node("parent","");
      d_put($b);
     d_close();

     d_open_node("tree","");
       bush::show_tree(bush_db::get_root_node_id());
     d_close();
   }

   function edit_init(){ 
     d_open_node("tree","");
       bush::show_tree(bush_db::get_root_node_id());
     d_close();
   }

   function add_keys(&$obj){ 
     $obj->setf("parent",get_param("parent")); 
   }

   function add_after_event(&$obj){
    if($obj->getf("type")==SAME_PAGE){
       $p=new container_db();
       $p->create_default();
       $p->setf("title",$obj->getf("title"));
       $p->setf("walias",$obj->getf("walias"));
       $p->setf("creator","container.view.sample");
       $p->insert();
       $obj->setf("container",$p->getid());
       $obj->update();
    }
   }
   

}

class bush extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
      $this->tadd("level");  
      $this->tadd("rubr",PUBLICT);  
  }

  function view($state){ 
     $e=new bush_editor($this);
     return $e->view($state,new bush_db());
  }

  function add($state){
     $e=new bush_editor($this);
     return $e->add($state,new bush_db());
  }

  function edit($state){
     $e=new bush_editor($this);
     return $e->edit($state,new bush_db());
  }

  function del($state){
     $e=new bush_editor($this);
     return $e->del($state,new bush_db());
  }
  
  /** static function, return specifed obj_id from obj or walias */
  function get_req_node(){
    if(get_param("walias")) return bush_db::get_by_alias(get_param("walias"));
    if(get_param("obj")) return bush_db::get_node(get_param("obj"));
    $b=bush_db::get_root_node();     
    return $b;
  }  
  
  /** show tree level */
  function level($state){
     $b=bush::get_req_node();

     d_open_node("path","");
       $this->show_path($b);
     d_close();
     
     d_open($b);

     if($b->down){

      $level=bush_db::get_node($b->down);       
      while($level){        
        d_put($level);
	$level=bush_db::get_node($level->next);
      }      
     }
     d_close();  

     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }

  function show_level($b){
     d_open($b);          
     if($b->down){
      $level=bush_db::get_node($b->down);       
      while($level){        
        if($level->is_public()) d_put($level);
	$level=bush_db::get_node($level->next);
      }      
     }
     d_close();  
  }
  
  function show_path($node){
      $path=bush_db::get_path($node->getid());
      
      $node=reset($path);
      while($node){
        d_put($node);        
	$node=next($path);
      }
  }

  function show_tree($node_id){
      $node=bush_db::get_node($node_id);
      while($node){
        if($node->is_public()){
          d_open($node);
  	    if($node->down) bush::show_tree($node->down);
  	  d_close();
        }
	$node=bush_db::get_node($node->next);
      }
  }
  
  function show_rubr($b){
     d_open($b);          
     if($b->down){        
      $level=bush_db::get_node($b->down);       
      while($level){
        if(!$level->is_public()){
   	  $level=bush_db::get_node($level->next);	
          continue; 
        }

	d_open($level);	
        if($level->down){
            $level2=bush_db::get_node($level->down);       
            while($level2){        
             if($level2->is_public()) d_put($level2);
    	     $level2=bush_db::get_node($level2->next);
	    }
        }      
	d_close();	
	$level=bush_db::get_node($level->next);	
      }
     } 
     d_close($b);
  }
 
  function rubr($state){
     $b=bush::get_req_node();
     $this->show_rubr($b);
     return $this->exit_code(EXIT_OK);     
  }
 
}

?>