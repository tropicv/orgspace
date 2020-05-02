<?

/** type of goods */

define("ALBUM",0);
define("EXAMPLE",1);



/** Image gallery */

class imagegal_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("supp_type",new str_type(0,"",512));
      $this->tadd("supp_id",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("ftype",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
  }    
  
  function list_abc(){
    $this->query("select supp_id, supp_type from ".table_name($this)." group by supp_id, supp_type order by srt, supp_type, supp_id;");
  }

  function list_album($type, $obj, $ftype){
    $this->query("select * from ".table_name($this)." where supp_type='".$type."' and supp_id=".$obj." and ftype=".$ftype." order by srt,name,id;");
  }

  function list_album_by_type($type){
    $this->query("select * from ".table_name($this)." where supp_type='".$type."' order by srt, supp_type, name, id;");
  }
  
}


/** kernel base manager for all documents */

class imagegal_editor extends basic_editor {   
}

class album extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("abc");  
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("viewfoto",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $ge=new imagegal_editor($this);
     return $ge->add($state,new imagegal_db());
  }

  function edit($state){
     $ge=new imagegal_editor($this);
     return $ge->edit($state,new imagegal_db());
  }

  function del($state){
     $ge=new imagegal_editor($this);
     return $ge->del($state,new imagegal_db());
  }
 
  function view($state){
     $a=new imagegal_db();

     if(get_param("type") && get_param("obj")){ 
      $a->list_album(get_param("type"), get_param("obj"));	  
      d_open_list();
      while($a->lst()){
        d_put($a);
      }
      d_close();  
     }

     return $this->exit_code(EXIT_OK);	
  }

  function viewfoto($state){ 
     $ge=new imagegal_editor($this);
     return $ge->view($state,new imagegal_db());
  }

  function abc($state){
     $i=new imagedummy_db();
     $i->list_abc("imagegal");
     d_open_list();
     while($i->lst()){
        if($i->getf("supp_type")=="goods"){
	 $g=new goods_db($i->getf("supp_id"));
	 d_put($g);
	} else {
	 $s=new serial_db($i->getf("supp_id"));
	 d_put($s);
	}
     }
     d_close();  

     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }
 
}

?>
