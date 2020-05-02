<?


/** root obj enity */

class climage_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("image",new image_type(0,1));
      $this->tadd("bigimage",new image_type(0,2));
      $this->tadd("title",new str_type(0,"",128));                  
      $this->tadd("pad",new chk_type(0));                  
      $this->tadd("first",new chk_type(0));                  
      $this->tadd("last",new chk_type(0));
      $this->tadd("is_slider",new chk_type(0));
      $this->tadd("link",new str_type(0,"",128));
  }
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by id;");
  }
}


/** root base manager for all documents */

class climage_editor extends basic_editor {   
}

class climage extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }


  function view($state){ 
     $e=new climage_editor($this);
     return $e->view($state,new climage_db());
  }

  function add($state){
     $e=new climage_editor($this);
     return $e->add($state,new climage_db());
  }

  function edit($state){
     $e=new climage_editor($this);
     return $e->edit($state,new climage_db());
  }

  function del($state){
     $e=new climage_editor($this);
     return $e->del($state,new climage_db());
  }
  
 
}



?>