<?

/** Form Storage  */

class formstorage_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("form",new str_type(0,"",512));
      $this->tadd("body",new text_type(0,"",get_max_clob_size()));
      $this->tadd("postdate",new date_type(0,date_type::sql_date_string_now_with_time()));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by postdate DESC;");
  }


  function list_by_date($params){
    $this->query("select * from ".table_name($this)." where postdate>='".date_type::str_to_db($params["from"])."' and postdate<='".date_type::str_to_db($params["to"])."' order by form;");
  }

}


/** kernel base manager for all documents */

class formstorage_editor extends basic_editor {   
}

class formstorage extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("abc");  
      $this->tadd("flist");  
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $ge=new formstorage_editor($this);
     return $ge->add($state,new formstorage_db());
  }

  function edit($state){
     $ge=new formstorage_editor($this);
     return $ge->edit($state,new formstorage_db());
  }

  function del($state){
     $ge=new formstorage_editor($this);
     return $ge->del($state,new formstorage_db());
  }
 

  function view($state){ 
     $ge=new formstorage_editor($this);
     return $ge->view($state,new formstorage_db());
  }

  function abc($state){
     $a=new formstorage_db();
     $a->list_abc();	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }


  function flist($state){
    set_title("запросы");	

    $f=new formstorage_db();
    $f->create_default();
    d_put($f);

    switch ($state){

      case INIT_STATE:
       return $this->exit_code(EXIT_OK);

      case SAVE_STATE:

       $f->list_by_date($this->env->get_post_data());	  
       d_open_list();
       while($f->lst()){
         d_put($f);
       }
       d_close();  
       d_put_node("param",$this->env->get_post_data());

       return $this->exit_code(EXIT_OK);

    }
    return $this->man->exit_code(NOT_SUPPORT);

  }
 
}

?>
