<?

class welcome extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
  }

  function view($state){
     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }
 
}

?>