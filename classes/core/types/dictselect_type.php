<?

/** Class for String checking */

class dictselect_type extends text_type {
   var $dict_name; 

  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @dict_name - name of dicts
  */

  function dictselect_type($reqired,$default,$dict_category,$dict_name){
    parent::basic_type($reqired,$default);
    $this->dict_name=$dict_name;
    $this->dict_category=$dict_category;
  }

  function cast_type_with_data($field_name,$test,$params){     
    $this->err=false;
    if($this->dont_test($test)) return $test;
    return $test;
  }


  function get_type_string($db_type){ return "character int4 NOT NULL"; }

  function render_field($value,&$outp,$data_provider){     
     if(!isset($value)) return false;

     $name=data_model::get_list_name($this->dict_category,$this->dict_name,$value);

     if($name) $outp->put_node("name",null,$name);
     else $outp->put_node("name",null,"");   

     if($data_provider->is_expand_dictonary()){
        $l=data_model::get_list($this->dict_category,$this->dict_name);
        reset($l);
        while (list($keyname, $val) = each($l)) {
           $param["value"]=$keyname;
           $param["is_current"]=0;
           if($value==$keyname) $param["is_current"]=1;
           $outp->put_node("word",$param,$val);
        }
     }
     return $value;
  }

}

?>