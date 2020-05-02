<?

/** global vars */
$default_dom=false;
$styles=false;


function load_styles(){
  global $styles;
  
  $cls=get_declared_classes();
  $name=reset($cls);
  while($name){
    $pos=strpos($name,"templ_");
    if(is_integer($pos) && $pos==0) {
      $vars=get_class_vars($name);  
      $info["class"]=$name;
      $info["math"]=$vars["math"];      
      
      $styles[$vars["math"]]=$info;
    }
    $name=next($cls);
  }
}

/** set default dom for generate show document */

function set_style_context($dtree){
  global $default_dom;
  $default_dom=$dtree;
  $default_dom->move_root();
}

/** get default dom  */

function &gd(){
  global $default_dom;
  return $default_dom;
}

/** find matches and run template */

function find($math,&$process_all_nodes,$cur_iterator){
  
  $d=&gd();
$deb=0;
  

  if(!$cur_iterator) {
    $x=$d->iterator($d->up_key());
  }
  else {
    $x=$d->iterator($cur_iterator->key());
  }
  
  $fmath=$math;
  $prev_cmd=$cmd=XCMD_START;


  
//  dbg_o("input math '".$math."' up key ".$x->up_key()." ".$x->key()); 
 
  $process_all_nodes=false;
  
  $i=0;
  while($cmd!=XCMD_END){
   
   $cmd=xpath_next_cmd($fmath,$path_node_name,$prev_cmd);
   dbg_o("parse cmd $cmd buf '".$fmath."' node_name ".$path_node_name." glkey:".$d->key()); 
 
   
   switch ($cmd) {
    case XBEGIN_ROOT:
      $process_all_nodes=true;
      $x->move_root();
//      dbg_o("move root "); 
      break;
    case XCUR_NODE:    
      $process_all_nodes=false;
      break;    
    case XCMD_DOWN:
      $process_all_nodes=true;
      $x->down();
      break;    
    case XCMD_UP:
      $process_all_nodes=true;
      $x->up();
      $x->rewind();
//      dbg_o("UP");
//      dbg_dump($x);
      break;    
    case XNODE_NAME:
      $process_all_nodes=false;  

//      dbg_o("start find ".$path_node_name);      
//      dbg_dump($x->tree[$x->key()]["name"]);
      
      while($x->has_next_node()){
        $data=$x->current();        
	
        if($data["name"]==$path_node_name){
//            dbg_o("find ".$path_node_name); 
            break;
        }
        $x->next_node();
      }           
      if(!$x->has_next_node()){ return false;   }  
      break;
    case XANY_NODE:

      $tmpm=$fmath;

// dbg_o("START *");

      while($x->has_next_node()){
        $iter_down=$d->iterator($x->down());
        $proc_nodes=true; 

        $res=find($tmpm,$proc_nodes,$iter_down);

// var_dump($res);

        if($res){
          $cmd=XCMD_END;
          $x=$res; 
          break;
        }
        $x->next_node();
      }                  
// dbg_o("STOP *".$res);

      if(!$res){ return false; }  
      break;     

    case XCMD_END: 
      break;     
   }   
   $prev_cmd=$cmd;
  } 
 
  if($process_all_nodes){
//    dbg_o("process all nodes".$x->cur_up_node);
  }  
  return $x;
}

function apply($math="",$cur_iterator=false){
  global $styles;
  
  $d=&gd();
 
  
  $process_all_nodes=false;  


  $x=find($math,$process_all_nodes,$cur_iterator);
  if(!$x) return false;

 
  $context=$d->key();  

  if($x->key()==-1) return;
  $d->set_key($x->key());  
  $node=$d->current(); 

  
  $templ="";
 
  if( !isset($styles[$node["name"]]) ){
      dbg_err("not found template '".$node["name"]."'");
      exit(0);
  }
  $templ=$styles[$node["name"]];      
  $templ_class=$templ["class"]; 


//  dbg_o("apply '".$templ_class."' node name '".$node["name"]."'");


  $d->down();
  new $templ_class();


/*  dbg_tr();
  dbg_err("SAMPLE ERR");
  dbg_dump($d);*/

  $d->set_key($context);  
}

function value_of($path,$cur_iterator=false){   
  return value_oftst($path,$cur_iterator);
/*
  $process_all_nodes=false;
  $x=find($path,$process_all_nodes,$cur_iterator);
  if(!$x) return false;

  if($process_all_nodes){
    $d=$x->current_up();
    dbg_o("RET UP ".$d["name"]);
  }
  else
   $d=$x->current();
  
  return $d["att"];*/
}


function for_each($path,$cur_iterator=false){   
  $process_all_nodes=false;
  return find($path,$process_all_nodes,$cur_iterator); 
/* echo "FOR ".$path." ".$cur_iterator;

  if($path[0]=="*") $path="./".$path;
  if($path[0]!="/") $path="./".$path;

  $d=&gd();
  if(!$cur_iterator) {
    $cur_iterator=$d->iterator($d->key(),1);
  }

  return find_val($path,$cur_iterator);*/
  
}


function name($path,$cur_iterator=false){   
  if($path[0]=="*") $path="./".$path;
  if($path[0]!="/") $path="./".$path;

  $process_all_nodes=false;
  $x=find($path,$process_all_nodes,$cur_iterator);
  if(!$x) return false;
  if($process_all_nodes){
    $d=$x->current_up();
  }
  else
    $d=$x->current();

  return $d["name"];
}



function value_oftst($path,$cur_iterator=false){   
  if($path[0]=="*") $path="./".$path;
  if($path[0]!="/") $path="./".$path;

  $d=&gd();

// if($cur_iterator) echo_dump($cur_iterator->current());

  if(!$cur_iterator) {
    $cur_iterator=$d->iterator($d->key(),1);
  }


  $x=find_val($path,$cur_iterator);

  if(!$x) return false;
  $res=$x->current();
  return $res["att"];
}

function xpath_get_sym($cmd_buf,&$pos,&$node){
  $ret=XCMD_END;
  $len=strlen($cmd_buf);
  $node="";
  $i=$pos;
  


  while($i<$len){
    if($cmd_buf[$i]=='/'){
      if($pos==0){
        $ret=XBEGIN_ROOT;
	$i++;
	break;
      }      
      $i++;
      $ret=XCMD_DOWN;
      break;      
    }else
    if(( $i+2)<$len && $cmd_buf[$i]=='.' && $cmd_buf[$i+1]=='.') {
      $ret=XCMD_UP;
      $i+=3;
      break;
    } else
    if($cmd_buf[$i]=='.'){
      $ret=XCUR_NODE;
      $i++;
      break;
    }else
    if($cmd_buf[$i]=='*'){
      $ret=XANY_NODE;
      $i+=2;
      break;
    }else{    
      
      while($i<$len && (ctype_alnum($cmd_buf[$i]) || 
            $cmd_buf[$i]=="_" || 
	    $cmd_buf[$i]=="-" )){  $node.=$cmd_buf[$i++]; } 
        $pos=$i;
        return XNODE_NAME;
    }
  }
  if($i>=$len ) $ret=XCMD_END;
  $pos=$i;
  return $ret;
}

function find_val($match,$cur_iterator){
  
  $x=$cur_iterator;


  $pos=0;
  $cmd=XCMD_START;
  $parse_node_name="";

  while($cmd!=XCMD_END){
   
   $cmd=xpath_get_sym($match,$pos,$parse_node_name);

//   echo "CMD ".$cmd." NODE ".$parse_node_name."<br/>";

   switch ($cmd) {

    case XBEGIN_ROOT:
      $x->move_root();
      break;

    case XCUR_NODE:    
      break;    

    case XCMD_DOWN:

      $x->down();
      break;    

    case XCMD_UP:
      $x->up();
      $x->rewind();

      break;    

    case XNODE_NAME:
      
      $fnd=false;

      while($x->has_next_node()){
        $data=$x->current();        
        if($data["name"]==$parse_node_name){
            $fnd=true; 
            break;
        }
        $x->next_node();
      }           
      if(!$fnd){ return false;   }  
      break;

    case XANY_NODE:

      $d=&gd();
      $iter_down=$d->iterator($x->key());
      $res=false;

      while($iter_down->has_next_node()){

       $res=find_val(substr($match,$pos),$iter_down);

        if($res){
          $cmd=XCMD_END;
          $x=$res; 
          break;
        } 

        $iter_down->next_node();          
      }                  
                                  
      if(!$res){ return false; }  
      break;     
                 
    case XCMD_END: 
      break;     
   }   
  } 
  return $x;
}


?>