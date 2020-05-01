<?
/** Error code - if unknown error */
define("INVALID_INPUT_TYPE","invalid_input_type");

/** Error code - if tested value not present in select list */
define("SELECT_VALUE_NOT_FOUND","select_value_not_found");

/** Error code - if tested value not present in support image */
define("INVALID_IMAGE_TYPE","invalid_image_type");

/** Error code - if tested value not present uploaded */
define("EMPTY_IMAGE_TYPE","empty_image_type");

/** Error code - if tested value not present uploaded */
define("EMPTY_FILE_TYPE","empty_file_type");

/** Error code - if tested value too length */
define("VALUE_TOO_LENGTH","value_too_length");

/** Error code - if tested value not filled */
define("VALUE_NOT_FILLED","value_not_filled");

/** Error code - if nick with spaces */
define("INVALID_NICK_CHARS","invalid_nick_chars");


class basic_type  {

  var $reqired;
  var $id=1;
  var $default_value;
  var $err=false;

  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
  */

  function  basic_type( $reqired,$default_value){
    $this->reqired=$reqired;
    $this->default_value=$default_value;
  }

  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

  function cast_type($test){
    $this->err=null;
    return $test;
  }

  function cast_type_with_data($field_name,$test,$params){     
    return $this->cast_type($test);
  }

  /**
    @return return current error
  */

  function get_err(){ 
     $err=$this->err;
     $this->err=false;
     return $err; 
  }

  function is_err(){
    return $this->err ? true : false;
  }
  
  /**
    @return return true if value not filled and not requred
  */

  function dont_test($obj){
    if($this->reqired==0 && $obj=="") return true;
    else return false;
  }

  /**
    @return return default value
  */

  function get_default(){ return $this->default_value; }

  function  get_id(){ return $this->id; }
  function get_type_string($db_type){ return "int4 NOT NULL"; }
  
  function need_apos(){ return false; }
  
  function sql_render($data){ return $data; }

  function render_field($value,&$outp,$data_provider){     
     return $value;
  }

}

?>