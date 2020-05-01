<?

class xmldom {
  var $level=0;
  var $res="";
  var $stk;


  function put($class){ 
    if(!$class){ 
     dbg_tr();
     var_dump($class);
    }
    return $class->disp_body(&$this);
  } 

  
  function open($class){ 
    return $class->disp_open(&$this);
  } 

  function open_node($tagname,$options){ 
    $keyname="";
    $c="";

    $c.=$this->level_str()."<".$tagname;

    if($options){ 
     reset($options);
     while (list($keyname, $val) = each($options)) {
         $c.=" ".$keyname."=\"".$val."\"";
     }
    }

    $c.=">\n";

    $this->res.=$c;

    $this->push_level($tagname);
  } 


  function put_node($tagname,$options,$body=false){ 
    $keyname="";
    $c="";

    $c.=$this->level_str()."<".$tagname;


    if($options){ 

     reset($options);
     while (list($keyname, $val) = each($options)) {
         $c.=" ".$keyname."=\"".$val."\"";
     }
    }
    if($body) $c.=">".$body."</".$tagname.">\n";  
    else $c.="/>\n";
    $this->res.=$c;
  } 

  
  function close(){ 
    $cls=$this->pop_level();
    $this->res.=$this->level_str()."</".$cls.">\n";
  } 

  function open_list(){ 
    $this->res.="<list>\n";
    $this->push_level("list");
  } 

  function close_list(){ 
    $this->pop_level("list");
    $this->res.=$this->level_str()."</list>\n";
  } 
  
  function create(){ 
     $cls_name=get_class($this);    
     $class=new $cls_name();  
     $class->level=$this->level;
     return $class;
  } 

  function level_str(){
    $s="";
    for($i=0;$i<$this->level;$i++) $s.="  ";
    return $s;
  }

  function push_level($name){
    $this->level++;
    $this->stk[$this->level]=$name;
  }

  function pop_level(){
    $name=$this->stk[$this->level];
    $this->level--;
    return $name;
  }

  function get_buffer(){ return $this->res;  }

  function put_disp($disp){ 
     $this->res.=$disp->get_buffer();
  }

  function add($str){ 
     $this->res.=$str;
  }
}


?>