<?


/** root obj enity */

class tobj_db extends basic_db {
  function load_class(){
      parent::load_class();
      /*$this->tadd("title",new text_type(0,"",get_max_clob_size()));*/
      $this->tadd("title",new text_type(0,"",get_max_long_clob_size()));
  }
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by title,id;");
  }
}


/** root base manager for all documents */

class tobj_editor extends basic_editor {   
}

class tobj extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("abc");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }

  function abc($state){
     $p=new tobj_db();
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
     $e=new tobj_editor($this);
     return $e->view($state,new tobj_db());
  }

  function add($state){
     $e=new tobj_editor($this);
     return $e->add($state,new tobj_db());
  }

  function edit($state){
     $e=new tobj_editor($this);
     return $e->edit($state,new tobj_db());
  }

  function del($state){
     $e=new tobj_editor($this);
     return $e->del($state,new tobj_db());
  }
  
 
}



?>