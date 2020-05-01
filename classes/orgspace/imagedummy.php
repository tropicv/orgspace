<?


class imagedummy_db extends basic_db {
  function load_class(){
      $this->tadd("supp_type",new str_type(0,"",512));
      $this->tadd("supp_id",new int_type(0,0,0,INTEGER_MAX_INT));            
  }    
  
  function list_abc($table){
    $this->query("select supp_id, supp_type from ".$table." group by supp_id, supp_type order by supp_type, supp_id;");
  }
 
}


?>
