<?

class timestamp_type extends date_type {

  function timestamp_type($reqired,$default_value){
    parent::date_type($reqired,$default_value);
  }

  function get_type_string($db_type){ return "character timestamp NOT NULL"; }

}

?>