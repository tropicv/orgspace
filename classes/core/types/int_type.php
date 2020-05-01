<?

/** Class for Int checking */

define("INTEGER_MAX_INT",1000000);

class int_type extends basic_type {

  /** minimal int value */
  var $min_value;

  /** maximal int value */
  var $max_value;


  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param min_value - minimal value
    @param max_value - maximal value
  */

  function int_type($reqired,$default_value,$min_value,$max_value){
    parent::basic_type($reqired,$default_value );
    $this->min_value=$min_value;
    $this->max_value=$max_value;
  }

  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

  function cast_type($test){
    $this->err=false;

    if($this->dont_test((String)$test)) return (int)0;

    if($test==""){
          $this->err=new err_vect(VALUE_NOT_FILLED,$this);
          return $this->default_value;
    }
    $i=$test;
    if(settype($i,"integer")){
        if($i >= $this->min_value && $i <= $this->max_value ) return $i;
    }
    $this->err=new err_vect(INVALID_INPUT_TYPE,$this);
    return $this->default_value;
  }

  function get_type_string($db_type){ return "int4 NOT NULL"; }

  function sql_render($data){ 
    if(is_string($data)) $data=(int)$data;
    if($data==0) return "0"; 
    return $data;
  }

}

?>