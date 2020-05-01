<?

define("PUBLIC","public");
define("PUBLICT","public");
define("ADMIN","admin");

class comp_model extends layer_model {

  function add($class,$field_name,$typ=ADMIN){ 
     global $classes_model;
     $classes_model["comp_model"][$class][$field_name]=$typ;
  } 
  
  function get($class,$field_name){ 
     global $classes_model;
     if(!isset($classes_model["comp_model"][$class][$field_name])) return false;  
     return $classes_model["comp_model"][$class][$field_name];  
  } 
  
  function get_class($class){ 
     global $classes_model;
     return $classes_model["comp_model"][$class];  
  } 
  
  function is_load($cls_name){ return false; }

}


?>