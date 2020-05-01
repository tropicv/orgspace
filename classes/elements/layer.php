<?

/** make place for stuff elements in templates */

class layer_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("title",new str_type(0,"",512));            
      $this->tadd("number",new int_type(0,0,0,INTEGER_MAX_INT));            
  }
}


class layer_editor extends basic_editor {   
}

class layer extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }

  function view($state){ 
     $e=new layer_editor($this);
     return $e->view($state,new layer_db());
  }

  function add($state){
     $e=new layer_editor($this);
     return $e->add($state,new layer_db());
  }

  function edit($state){
     $e=new layer_editor($this);
     return $e->edit($state,new layer_db());
  }

  function del($state){
     $e=new layer_editor($this);
     return $e->del($state,new layer_db());
  }
  
 
}



?>