<?

/** manager */

class manager_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("slogan",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("email",new mail_type(1,""));
      $this->tadd("tel",new str_type(0,"",512));
      $this->tadd("sh_prj",new chk_type(0));
      $this->tadd("team",new dictselect_type(1,0,"manager","team"));            
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }

  function list_by_team($team){
    $this->query("select * from ".table_name($this)." where team=$team order by srt,name,id;");
  }

  function search($keywords){
    $this->query("select *  from manager where ".$this->LIKE("slogan",$keywords)." or ".$this->LIKE("name",$keywords)." order by name;");   
  }
  
}


/** kernel base manager for all documents */

class manager_editor extends basic_editor {   
}

class manager extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("all",PUBLICT);  
      $this->tadd("pall",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $se=new manager_editor($this);
     return $se->add($state,new manager_db());
  }

  function edit($state){
     $se=new manager_editor($this);
     return $se->edit($state,new manager_db());
  }

  function del($state){
     $se=new manager_editor($this);
     return $se->del($state,new manager_db());
  }

  function all($state){ 

     d_open_node("manager_team",null);
     $l=data_model::get_list("manager","team");
     reset($l);
     while (list($keyname, $val) = each($l)) {
             $param["value"]=$keyname;

	     $a=new manager_db();
	     $a->query("select count(*) as cnt from manager where team=$keyname;");   
	     $sql_data=$a->result->lst();

             $param["num"]=$sql_data["cnt"];
             d_put_node("word",$param,$val);
     }
     d_close();


//     show_list("manager","team");
     $a=new manager_db();
     $t=1;
     if(get_obj()) $t=get_obj();
     $a->list_by_team($t);	  
//     $a->list_abc();	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("об orgspace - структура Orgspace  - Orgspace Consulting");	
     return $this->exit_code(EXIT_OK);	
  }


  function pall($state){ 
     show_list("manager","team");
     $a=new manager_db();
     $t=1;
     if(get_obj()) $t=get_obj();
     $a->list_by_team($t);	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("об orgspace - структура Orgspace  - Orgspace Consulting");	
     return $this->exit_code(EXIT_OK);	
  }

}

?>