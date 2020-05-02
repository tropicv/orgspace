<?

class id_type extends int_type {
  function id_type(){ parent::int_type(1,0,0,1000000); }
  function get_type_string($db_type){ return "int4 NOT NULL"; }
}

?>