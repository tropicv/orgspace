<?

/** Class for parsed paragrafs checking */

class parsed_text_type extends text_type {

  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param max_len - maximum length of string
  */

  function parsed_text_type($reqired,$default_value,$max_len){
    parent::text_type($reqired,$default_value,$max_len);
  }

}

?>