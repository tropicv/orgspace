<?


/** root obj enity */

class file_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("file",new file_type(0,1));
      $this->tadd("title",new str_type(0,"",512));                  
  }
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by id;");
  }
}


/** root base manager for all documents */

class file_editor extends basic_editor {   
}

class file extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }


  function view($state){ 
     $e=new file_editor($this);
     return $e->view($state,new file_db());
  }

  function add($state){
     $e=new file_editor($this);
     return $e->add($state,new file_db());
  }

  function edit($state){
     $e=new file_editor($this);
     return $e->edit($state,new file_db());
  }

  function del($state){
     $e=new file_editor($this);
     return $e->del($state,new file_db());
  }
  
 
}



?>