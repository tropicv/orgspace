<?


$cur_block_class=false;
$cur_block_method=false;

define("INSTANCE",1);
define("LINK_OBJ",2);
define("LINK_METH",3);

define("EDIT",0);
define("VIEW",1);

class use_model {

  function add_block($class,$method_name,$typ,$title,$block_category){ 
     global $classes_model,$cur_block_class,$cur_block_method;     
     
     $classes_model["use_model"][$class][$method_name]["type"]=$typ;
     $classes_model["use_model"][$class][$method_name]["title"]=$title; 
     $classes_model["use_model"][$class][$method_name]["category"]=$block_category; 
     $classes_model["use_model"][$class][$method_name]["class"]=$class; 
     $classes_model["use_model"][$class][$method_name]["method"]=$method_name; 
     
     $cur_block_class=$class;
     $cur_block_method=$method_name;
  } 

  function add_block_template($name,$title){ 
     global $classes_model,$cur_block_class,$cur_block_method;     
     
     if(!isset($classes_model["use_model"][$cur_block_class][$cur_block_method])){
        dbg_o("UNTIED BLOCK TEMPLATE:$name:$title");
        return false;  
     }

     $classes_model["use_model"][$cur_block_class][$cur_block_method]["template"][$name]["name"]=$name; 
     $classes_model["use_model"][$cur_block_class][$cur_block_method]["template"][$name]["title"]=$title; 
     if($name=="default")
        $classes_model["use_model"][$cur_block_class][$cur_block_method]["template"][$name]["tname"]=$cur_block_class."_".$cur_block_method; 
     else 
        $classes_model["use_model"][$cur_block_class][$cur_block_method]["template"][$name]["tname"]=$cur_block_class."_".$cur_block_method."_".$name; 
  } 

  function add_block_category($name,$title){ 
     global $classes_model,$cur_block_class,$cur_block_method;     
     
     $classes_model["list"]["block_category"][$name]["name"]=$name; 
     $classes_model["list"]["block_category"][$name]["title"]=$title; 
  } 

  function &get_block_categories(){ 
     global $classes_model;     
     return $classes_model["list"]["block_category"];
  } 
  
  function get_blocks_by_category($category){
     global $classes_model;     
     $res=false;
     
     $cls=reset($classes_model["use_model"]);
     while($cls){ 
       $meth=reset($cls);
       while($meth){
        if($meth["category"]==$category){
	   $res[]=$meth;
	}
        $meth=next($cls);
       }       
       $cls=next($classes_model["use_model"]);
     }
//     dbg_o("GET BY CAT $category ");
//     dbg_dump($res);
     return $res;     
  }
  
  function &get_template_list($class_name,$method_name){
     global $classes_model;     
     
//     dbg_dump($classes_model);
     if(!isset($classes_model["use_model"][$class_name][$method_name]["template"])){ 
       dbg_o("template list not found for $class_name.$method_name");
       return false;
     }
     return $classes_model["use_model"][$class_name][$method_name]["template"];    
  }

  function &get_template($creator){
     global $classes_model;     
     $p=explode(".",$creator);
     return $classes_model["use_model"][$p[0]][$p[1]]["template"][$p[2]];    
  }

  function &get_creator($creator){
     global $classes_model;     
     $p=explode(".",$creator);
     return $classes_model["use_model"][$p[0]][$p[1]];    
  }  
  
}


?>