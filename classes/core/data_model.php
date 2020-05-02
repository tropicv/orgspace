<?

class data_model extends layer_model {

  function get_connection(){
     global $default_connection;
     return $default_connection;
  }
  
  function set_connection($con){
     global $default_connection;
     $default_connection=$con;
  }

  function add($class,$field_name,$typ){ 
     global $classes_model;
     $classes_model["data_model"][$class][$field_name]["type"]=$typ;
  } 

  
  function get($class,$field_name){ 
     global $classes_model;
     if(!isset($classes_model["data_model"][$class][$field_name]["type"])) return false;  
     return $classes_model["data_model"][$class][$field_name]["type"];  
  } 

  function add_list($class,$field_name,$list){ 
     global $classes_model;
     $classes_model["data_model"][$class][$field_name]["list"]=$list;
  } 

  function get_list($class,$field_name){ 
     global $classes_model;
     if(!isset($classes_model["data_model"][$class][$field_name]["list"])) return false;  
     return $classes_model["data_model"][$class][$field_name]["list"];  
  } 


  function get_list_name($class,$field_name,$value){ 
     global $classes_model;
     if(!isset($classes_model["data_model"][$class][$field_name]["list"][$value])) return false;  
     return $classes_model["data_model"][$class][$field_name]["list"][$value];

  } 
  
  function get_class($class){ 
     global $classes_model;
     return $classes_model["data_model"][$class];  
  } 
  
  function is_load($cls_name){ return false; }
  
  
  
}


?>