<?

/** Class for Text checking */

class text_type extends basic_type {

  /** maximum length of data string */
  var $max_len;

  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param max_len - maximum length of string
  */

  function text_type($reqired,$default_value,$max_len){
    parent::basic_type($reqired,$default_value);
    $this->max_len=$max_len;
  }

  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

  function cast_type($test){
    $this->err=false;

    $test=trim($test);
    if(strlen($test)<=$this->max_len) {
       if($this->dont_test($test)) return $test;
    }

    if(strlen($test)>$this->max_len)
      $this->err=new err_vect(VALUE_TOO_LENGTH,$this);
    else if(strlen($test)==0)
      $this->err=new err_vect(VALUE_NOT_FILLED,$this);
    else
      return $test;
    return $this->default_value;
  }

  function get_type_string($db_type){ return "text NOT NULL"; }

  function need_apos(){ return true; }

}

?>