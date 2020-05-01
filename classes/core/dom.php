<?

class dom {

  function put($class){ 
  } 
  
  function open($class){ 
  } 
  
  function close(){ 
  } 

  function open_list(){ 
  } 
  
  function create(){ 
     $cls_name=get_class($this);    
     return new $cls_name();  
  } 

  function put_disp(){ 
  } 
  
}


?>