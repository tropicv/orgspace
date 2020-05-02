<?

/** Class for url checking */

class url_type extends text_type {


  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
  */

  function url_type( $reqired,$default_value){
   parent::text_type($reqired,$default_value,128);
  }

  function get_type_string($db_type){ return "character varying(512) NOT NULL"; }

}

?>