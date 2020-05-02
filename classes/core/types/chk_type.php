<?

class chk_type extends int_type {

  /**
    @param default_value - default value
  */

  function chk_type($default_value ){
    parent::int_type(1,$default_value,0,1);
  }


  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

  function cast_type($test){
    $this->err=false;
    if($test=="") return 0;
    if($test=="on") return 1;
    else if($test=="off") return 0;
    else if($tests=="1") return 1;
    else if($test=="0") return 0;
    $this->err=new err_vect(INVALID_INPUT_TYPE,$this);
    return $this->default_value;
  }
}

?>