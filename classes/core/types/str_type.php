<?

/** Class for String checking */

class str_type extends text_type {


  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param max_len - maximum length of string
  */

  function str_type($reqired,$default_value,$max_len){
    parent::text_type($reqired,$default_value,$max_len);
  }

 function get_type_string($db_type){ return "character varying("+max_len+") NOT NULL"; }

}

?>