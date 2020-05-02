<?

$classes_model=false;

class layer_model {

  function add($class,$field_name,$typ){ 
     global $classes_model;
     $classes_model[get_class($this)][$class][$field_name]=$typ;
  } 
  
  function get($class,$field_name){ 
     global $classes_model;
     if(!isset($classes_model[get_class($this)][$class][$field_name])) return false;  
     return $classes_model[get_class($this)][$class][$field_name];  
  } 
  
  function get_class($class){ 
     global $classes_model;
     return $classes_model[get_class($this)][$class];  
  } 
  
  function is_load($cls_name){ return false; }
  
}


?>