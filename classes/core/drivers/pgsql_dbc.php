<?

class pgsql_result_set extends result_set {
  var $current_row;
  var $num_rows;
  var $cur_data;

  function pgsql_result_set($res) {
    parent::result_set($res);
    $this->num_rows=pg_num_rows($res);    
    $this->current_row=0;
    $this->cur_data=false;
  }

  function lst(){
     if($this->current_row >= $this->num_rows) return false;
     $this->current_row++;
     $this->cur_data=pg_fetch_array($this->res);     
     return $this->cur_data;
  }

  function get(){ return $this->cur_data;  } 
  
  function close(){  pg_free_result($this->res);  } 

}

class pgsql_dbc extends basic_dbc  {

  function pgsql_dbc($prop){
    parent::basic_dbc($prop);
  }

  function connect(){
     return pg_pconnect($this->prop["pg_connect"]);
  }

  function query($sql){
     $res=pg_exec($sql);
     dbg_db($sql);
     if(!$res) dbg_err(pg_errormessage());
     return new pgsql_result_set($res);
  }

  function update($sql){
     $res=pg_exec($sql);
     dbg_db($sql);
     return new pgsql_result_set($res);
  }

  function insert($table,$sql){
     dbg_db($sql);
     $res=pg_exec($sql);
     if(!$res) dbg_err(pg_errormessage());
     else {
       $r=pg_exec("select id from $table where oid=".pg_last_oid($res).";");
       $d=pg_fetch_array($r);
       return $d["id"];
     }
     return 0;
  }

 
}

?>