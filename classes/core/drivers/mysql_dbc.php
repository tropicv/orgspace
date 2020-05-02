<?

class mysql_result_set extends result_set {
  var $current_row;
  var $num_rows;
  var $cur_data;

  function mysql_result_set($res) {
    parent::result_set($res);
    $this->num_rows=mysql_num_rows($res);    
    $this->current_row=0;
    $this->cur_data=false;
  }

  function lst(){
     if($this->current_row >= $this->num_rows) return false;
     $this->current_row++;
     $this->cur_data=mysql_fetch_array ($this->res);     
     return $this->cur_data;
  }

  function get(){ return $this->cur_data;  } 
  
  function close(){  mysql_free_result($this->res);  } 

}

class mysql_dbc extends basic_dbc  {

  function mysql_dbc($prop){
    parent::basic_dbc($prop);
  }

  function connect(){
     $con=mysql_pconnect ($this->prop["mysql_server"],$this->prop["mysql_user"],$this->prop["mysql_password"]);
     mysql_select_db($this->prop["mysql_dbname"], $con);
     $ch="SET NAMES '".$this->prop["mysql_charset"]."'";
     mysql_query($ch, $con); 
  }

  function query($sql){
     $res=mysql_query($sql);
     dbg_db($sql);
     if(!$res) dbg_err(mysql_error());
     return new mysql_result_set($res);
  }

  function update($sql){
     $res=mysql_query($sql);
     dbg_db($sql);
     return true;
  }


  function insert($table,$sql){
     dbg_db($sql);
     $res=mysql_query($sql);
     if(!$res){
         dbg_err(mysql_error());
         return 0;
     }
     return mysql_insert_id();
  }

 
}

?>