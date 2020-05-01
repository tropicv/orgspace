<?

/** Class for String checking */

class image_type extends text_type {
   var $id; 


  /**
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param max_len - maximum length of string
  */

  function image_type($reqired,$id){
    $this->id=$id;
  }

  function cast_type_with_data($field_name,$test,$params){     
    $this->err=false;

    if( (!$test || !$test["name"]) && $this->reqired) {
        $this->err=new err_vect(EMPTY_IMAGE_TYPE,$this);
        return "";
    }

    if(!$test["name"] && !$this->reqired){
      return "";
    }

    $file_name=$test["name"];
    $ext=strrchr($file_name,".");

    $size=GetImageSize($test["tmp_name"]);  

    if(!$size){
      $this->err=new err_vect(INVALID_IMAGE_TYPE,$this);
      return "";
    }

    $res=$ext.";".$size[0].";".$size[1];
    return $res;
  }


  function get_type_string($db_type){ return "character varying(255) NOT NULL"; }

  function render_field($value,&$outp,$data_provider){     
     if(!isset($value)) return false;
   
     $opt=split(";",$value);
     if($opt && sizeof($opt)>2){
        $outp->put_node("extension",null,$opt[0]);
        $outp->put_node("width",null,$opt[1]);
        $outp->put_node("height",null,$opt[2]);
        $outp->put_node("image_id",null,$this->id);
        $outp->put_node("obj_prefix",null,table_name($data_provider));
        $outp->put_node("obj_id",null,$data_provider->getid());
        $outp->put_node("name",null,$data_provider->make_part_res_file_name($this->id,$value));
     }

     return false;
  }

}

?>