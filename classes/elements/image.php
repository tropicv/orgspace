<?


/** root obj enity */

class image_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("image",new image_type(0,1));
      $this->tadd("title",new str_type(0,"",255));
  }
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by id;");
  }
}


/** root base manager for all documents */

class image_editor extends basic_editor {   
}

class image extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }


  function view($state){ 
     $e=new image_editor($this);
     return $e->view($state,new image_db());
  }

  function add($state){
     $e=new image_editor($this);
     return $e->add($state,new image_db());
  }

  function edit($state){
     $e=new image_editor($this);
     return $e->edit($state,new image_db());
  }

  function del($state){
     $e=new image_editor($this);
     return $e->del($state,new image_db());
  }
  
 
}



?>