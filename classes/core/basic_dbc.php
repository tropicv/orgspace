<?

class result_set {
  var $res;

  function result_set($res){
    $this->res=$res;
  }

  function lst(){ return false;  }
  function get(){ return false;  }
  function close(){ $res=false;  }

};

class basic_dbc {
  var $prop;
  
  function basic_dbc($prop) {
    $this->prop=$prop;
  }
  function connect(){ return false; }   
  function query($sql){ return ""; }

  function set_param($name,$val){ 
      $this->prop[$name]=$val;
  }
  function get_param($name){ 
      return $this->prop[$name];
  }

  function get_res_path(){ 
      return $this->prop["res_path"];
  }

  function LIKE($fld,$keyword){

     $keyword=trim($keyword);      
     $words=split(" ",$keyword);
     if(!$words) return "";

     $res=" (";
 
     for($i=0;$i<sizeof($words);$i++){
          $res.=$fld." like '%".$words[$i]."%'";
          if($i<sizeof($words)-1) $res.=" or ";
          else $res.=" ) ";
     }
     return $res;
  }

}

?>