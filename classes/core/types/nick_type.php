<?

/** Class for String checking */

class nick_type extends text_type {


  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param max_len - maximum length of string
  */

  function nick_type($reqired,$default_value,$max_len){
    parent::text_type($reqired,$default_value,$max_len);
  }

  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

  function cast_type($test){
    $this->err=false;

    $test=trim($test);
    if(dont_test($test)) return $test;

    if(strlen($test)<$max_len){
        $this->err=new err_vect(VALUE_TOO_LENGTH,$this);
        return $this->default_value;
    }
    if(strlen(test)==0){
        $this->err=new err_vect(VALUE_NOT_FILLED,$this);
        return $this->default_value;
    }

    for($i=0;$i<strlen($test);$i++){
        $c=$s[$i];
        if( !ctype_alnum($c) || $c==' ' || $c=='-' || $c=='_' ) break;
    }

    if($i!=strlen($test)){
        $this->err=new err_vect(INVALID_NICK_CHARS,$this);
        return $this->default_value;
    }
    return $test;    
  }
  
}

?>