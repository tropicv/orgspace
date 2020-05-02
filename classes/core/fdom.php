<?

define("XCMD_START",0);
define("XCMD_END",1);
define("XCMD_DOWN",2);
define("XCMD_UP",3);

define("XCUR_NODE",4);
define("XBEGIN_ROOT",5);
define("XNODE_NAME",6);
define("XANY_NODE",7);


class list_node {
}


class fdom extends dom {
  var $tree;
  var $ind;
 
  var $up;
  
  /** iterator start_list,has_next,next */
  var $cur_ind,$cur_up;
   
  
  function make_node($name,$att,$up,$down,$next,$prev){
    $node["name"]=$name;
    $node["att"]=$att;
    $node["up"]=$up;
    $node["down"]=$down;
    $node["next"]=$next;
    $node["prev"]=$prev;
    return $node;    
  }
  
  function fdom(){ 
     $this->ind=0;
     $this->up=0;     
     $this->tree[$this->ind]=$this->make_node("root",false,-1,-1,-1,-1); 
  }
 
  function fill_node($name,$class){
    $node=$this->make_node($name,$class,-1,-1,-1,-1);
    $this->tree[$this->ind]=$node;
  }

  function put($class){ return $this->put_node(get_class($class),$class); }

  function put_node($name,$class){ 
    $first_node=$this->tree[$this->up]["down"];
    $last_node=$this->get_last_node($first_node);

    $this->ind++;  
    $this->fill_node($name,$class);        
    $this->tree[$this->ind]["up"]=$this->up;    
    
    
    if($this->tree[$this->up]["down"]==-1) 
           $this->tree[$this->up]["down"]=$this->ind;    

    if($first_node!=-1 && $last_node!=-1 && $first_node!=$this->ind){
         $this->tree[$last_node]["next"]=$this->ind;
         $this->tree[$this->ind]["prev"]=$last_node;
    }
  } 

  function put_disp($pdom){
      if(count($pdom->tree)<2) return;

      $offset=$this->ind;
      
      for($i=1;$i<count($pdom->tree);$i++){
         $expnode=&$pdom->tree[$i];         	 
	 if($expnode["up"]!=-1)   $expnode["up"]+=$offset;
	 if($expnode["down"]!=-1) $expnode["down"]+=$offset;
	 if($expnode["next"]!=-1) $expnode["next"]+=$offset;
	 if($expnode["prev"]!=-1) $expnode["prev"]+=$offset;
      }
  
      $this->tree[$this->ind]["down"]=$this->ind+1;      
      $this->ind++;
      for($i=1;$i<count($pdom->tree);$i++){
	 $this->tree[$this->ind++]=&$pdom->tree[$i];         
      }

      $cur=$offset+1;
      while($cur!=-1){
         $expnode=&$this->tree[$cur];         
         $expnode["up"]=$this->up;
	 $cur=$this->tree[$cur]["next"];	 
      }       
      $this->ind--;
  }



  function get_last_node($first_node){
     if($first_node==-1) return -1;
     $s=$first_node;
     while($this->tree[$s]["next"]!=-1) $s=$this->tree[$s]["next"];
     return $s;     
  }

  function open($class){ return $this->open_node(get_class($class),$class); }

  
  function open_node($name,$class){   

    $first_node=$this->tree[$this->up]["down"];
    $last_node=$this->get_last_node($first_node);

    $this->ind++;  
    $this->fill_node($name,$class);
    $this->tree[$this->ind]["up"]=$this->up;
//    dbg_o("SET OPEN $name ".$this->up);

    if($this->tree[$this->up]["down"]==-1) 
           $this->tree[$this->up]["down"]=$this->ind;    


//    if($first_node!=-1 && $last_node!=-1 && $first_node!=$this->ind){
    if($first_node!=-1 && $last_node!=-1){
         $this->tree[$last_node]["next"]=$this->ind;
         $this->tree[$this->ind]["prev"]=$last_node;
    }
    
    $this->up=$this->ind;       
//    dbg_o("CUR UP ".$this->up);
    
  } 

  function open_list(){ 
    $this->open(new list_node());
  } 

  function close(){     
    if($this->tree[$this->ind]["up"]==0){
      $this->up=0;
//      dbg_o("ROOT UP ".$this->ind);
    }else{
//      $this->up=$this->tree[$this->tree[$this->ind]["up"]]["up"];
      $this->up=$this->tree[$this->up]["up"];
//      dbg_o("CLOSE UP ".$this->up." ".$this->ind);
      }
      
  }  

  function is_list_node(){
    return is_sublass_of($this->tree[$this->cur_ind]["att"],"list_node");
  }
  
  function is_tree(){ 
   return $this->tree[$this->cur_ind]["down"]!=-1 ? true : false; 
  }


  function move_root(){
    $this->cur_ind=0;
    $this->cur_up_node=0;
  }
 

  /** node iterator */
  
  function start_list(){
    $this->cur_ind=$this->tree[$this->cur_up_node]["down"];
  }

  function has_next(){
    if($this->cur_ind==-1) return false;
    return true;
  }
  
  function &next(){
    $node=&$this->tree[$this->cur_ind];
    $this->cur_ind=$this->tree[$this->cur_ind]["next"];    
    return $node;    
  }

  function &current(){
    $node=&$this->tree[$this->cur_ind];
    return $node;    
  }

  function &att(){
    $node=&$this->tree[$this->cur_ind]["att"];
    return $node;    
  }
  
  function up(){ 
   $this->cur_ind=$this->cur_up_node;  
   $this->cur_up_node=$this->tree[$this->cur_ind]["up"];  
  }
  
  function down(){   
//   if($this->tree[$this->cur_ind]["down"]==-1) return;
   
   $this->cur_up_node=$this->cur_ind;  
   $this->cur_ind=$this->tree[$this->cur_ind]["down"];
  }

  function key(){
    return $this->cur_ind;
  }
  
  function up_key(){
    return $this->cur_up_node;
  }
  
  function iterator($node_ind,$mode=false){
    return new fdom_iterator($node_ind,&$this->tree,$mode);
  }

  function set_key($ind){
    $this->cur_ind=$ind;
//    dbg_tr();
    $this->cur_up_node=$this->tree[$ind]["up"];
  }

  function rewind(){
     while($this->tree[$this->cur_ind]["prev"]!=-1) $this->cur_ind=$this->tree[$this->cur_ind]["prev"];
  }

   
}

class fdom_iterator {
  var $cur_up_node;
  var $tree;
  var $cur_ind;
  var $prev_key;
  
  function fdom_iterator($up_node,&$tree,$mode=false){

    if(!$mode){
       $this->cur_up_node=$up_node;
    }
    else {
       $this->cur_up_node=$tree[$up_node]["up"];   
    }

    $this->cur_ind=$this->cur_up_node;    
    $this->tree=$tree;    
    $this->prev_key=$this->cur_ind;
    
//    dbg_dump($this);
  }


  function &has_next_node(){
    $this->prev_key=$this->cur_ind;
    if($this->cur_ind==-1 || $this->cur_up_node==-1) return false;
    $d=&$this->tree[$this->cur_ind];
    return $d;
  }

  function &has_next(){
    $this->prev_key=$this->cur_ind;
    if($this->cur_ind==-1 || $this->cur_up_node==-1) return false;
    $d=&$this->tree[$this->cur_ind];
    return $d["att"];
  }
  
  function &next_node(){
    $this->prev_key=$this->cur_ind;
    $node=&$this->tree[$this->cur_ind];
    $this->cur_ind=$this->tree[$this->cur_ind]["next"];    
    return $node;    
  }

  function &next(){
    $this->prev_key=$this->cur_ind;
    $node=&$this->tree[$this->cur_ind];
    $this->cur_ind=$this->tree[$this->cur_ind]["next"];    
    return $node["att"];    
  }

  function &next_pos(){
    $this->prev_key=$this->cur_ind;
    $this->cur_ind=$this->tree[$this->cur_ind]["next"];    
    $node=&$this->tree[$this->cur_ind];
    return $node["att"];    
  }

  function &current(){
    $node=&$this->tree[$this->cur_ind];
    return $node;    
  }
  
  function &current_up(){
    $node=&$this->tree[$this->cur_up_node];
    return $node;    
  }

  function &att(){
    $node=&$this->tree[$this->cur_ind];
    return $node["att"];    
  }

  
  function up(){ 
   $this->prev_key=$this->cur_ind;
   $this->cur_ind=$this->cur_up_node;  
   $this->cur_up_node=$this->tree[$this->cur_ind]["up"];  
  }
  
  function down(){   

   $this->prev_key=$this->cur_ind;

//   if($this->tree[$this->cur_ind]["down"]==-1) return;
  
   $this->cur_up_node=$this->cur_ind;  
   $this->cur_ind=$this->tree[$this->cur_ind]["down"];
  }
  
  function key(){ return $this->cur_ind; }
  function prev_key(){ return $this->prev_key; }

  function up_key(){
    return $this->cur_up_node;
  }
  function down_key(){
    return $this->tree[$this->cur_ind]["down"];
  }

  function move_root(){
    $this->cur_up_node=0;
    $this->cur_ind=0;
    $this->prev_key=$this->cur_ind;
//    $this->down();
  }

  function rewind(){
     $this->prev_key=$this->cur_ind;
     while($this->tree[$this->cur_ind]["prev"]!=-1) $this->cur_ind=$this->tree[$this->cur_ind]["prev"];
  }
  
}

function show_dom($fname,$pdom,$level){
      if($level==0) trunc_file($fname);
      $pdom->start_list();   
      while($pdom->has_next()){
         $node=$pdom->current();
         $att=$node["att"];
         $res="";

         if($att){


          $att=(array)$att; 

          if(isset($att["data"])) { 
              $att=$att["data"]; 
          }

          $a=reset($att);
          while($a){
            $res.=key($att)."=\"".$a."\" ";
            $a=next($att);
          }
         }
 
//	 dbg_dump($node["att"]);
	 if($pdom->is_tree()) {
      	      accum_file($fname,sp($level*2)."<".$node["name"]." ".trim($res).">\n");
	      $pdom->down();
	      show_dom($fname,$pdom,$level+1);	 
	      $pdom->up();	     
      	      accum_file($fname,sp($level*2)."</".$node["name"].">\n");	      
	 }else 
      	      accum_file($fname,sp($level*2)."<".$node["name"]." ".trim($res)."/>\n");

         $pdom->next();	 
      }  

}


function xpath_next_cmd(&$cmd_buf,&$node,&$prev_cmd){
  $ret=XCMD_END;
  $len=strlen($cmd_buf);
  $pos=0;
  $node="";
  $i=0;
  
 
  while($i<$len){
    if($cmd_buf[$i]=='/'){
      if($prev_cmd==XCMD_START){
        $ret=XBEGIN_ROOT;
	$i++;
	break;
      }      
      $i++;
      $ret=XCMD_DOWN;
      break;      
    }else
    if(( $i+2)<$len && $cmd_buf[$i]=='.' && $cmd_buf[$i+1]=='.' && $cmd_buf[$i+2]=='/') {
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
      if($prev_cmd==XCMD_START){ // for name/name
       $ret=XCMD_DOWN;
       break;            
      }

      
      while($i<$len && (ctype_alnum($cmd_buf[$i]) || 
            $cmd_buf[$i]=="_" || 
	    $cmd_buf[$i]=="-" )){  $node.=$cmd_buf[$i++]; } 
      $ret=XNODE_NAME;

      if($i<$len
         && !(ctype_alnum($cmd_buf[$i]) || $cmd_buf[$i]=="_" || $cmd_buf[$i]=="-" ) 
         && $cmd_buf[$i]!="/" && $cmd_buf[$i]=="."
	 ){
         dbg_err("XPATH ERROR: unknown symbol '".$cmd_buf."' symbol '".$cmd_buf[$i]."'");
         $ret=XCMD_END;
         break;
      }      
      break;
    }
  }
  $cmd_buf=substr($cmd_buf,$i);
  $prev_cmd=$ret;
  return $ret;
}



/** function calls current display */

$cur_disp=false;

function set_cur_disp($disp){
 global $cur_disp; 
 $cur_disp=$disp;
}

function get_cur_disp(){
 global $cur_disp; 
 return $cur_disp;
}

function d_put($class){
 global $cur_disp;
 return $cur_disp->put($class);
}


function d_put_node($name,$class,$val=""){ 
 global $cur_disp;
 return $cur_disp->put_node($name,$class,$val);
}

function d_put_disp($class){ 
 global $cur_disp;
 return $cur_disp->put_disp($class);
}

function d_open($class){ 
 global $cur_disp;
 return $cur_disp->open($class);
}
 
function d_open_node($name,$class){   
 global $cur_disp;
 return $cur_disp->open_node($name,$class);
} 

function d_open_list(){ 
 global $cur_disp;
 return $cur_disp->open_list();
} 

function d_close(){     
 global $cur_disp;
 return $cur_disp->close();
}  

function d_add($str){     
 global $cur_disp;
 return $cur_disp->add($str);
}  


function vi($class,$field_name){
  if(is_subclass_of($class,"basic_db")) print($class->getf($field_name));
  else if($class) print($class[$field_name]);
}

?>
