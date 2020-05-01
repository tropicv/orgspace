<?

class err_vect  {

  /** current error code */
  var $err_code;

  /** object where exception error */
  var $obj;

  /** map for error output */
  var $field;

  /** Construct error
      @param code - final error code
      @param obj - where error, if obj not null
      then calling create_class_hash() for obtain error place
  */

  function err_vect($code,$obj,$field=""){
      $this->err_code=$code;
      $this->obj=$obj;
      $this->field=$field;
  }


  function set_err_field($field){
      $this->err_field=$field;
  }

  /** Testing if this code
      @param code - error code
      @return true if this error code
  */

  function test_code($code){ return $this->err_code==$code; }

}

?>