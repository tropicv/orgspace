<?

/** Work Zone */

class design_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("short_name",new str_type(0,"",512));
      $this->tadd("walias",new str_type(1,"",128));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("baner",new image_type(0,3));
      $this->tadd("ex_foto",new image_type(0,4));
      $this->tadd("slogan",new text_type(0,"",get_max_clob_size()));
      $this->tadd("description",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("ex_description",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("sh_tmb",new chk_type(0));            
      $this->tadd("sh_fotogal",new chk_type(1));            
      $this->tadd("sh_arr",new chk_type(0));            
      $this->tadd("sh_sol",new chk_type(0));            
      $this->tadd("sh_ex",new chk_type(0));            
      $this->tadd("sh_promo",new chk_type(0));            
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }

  function get_by_alias($alias){
    $this->query("select * from ".table_name($this)." where walias='".$alias."';");
  }

  function search($keywords){
    $this->query("select *  from design where ".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords)." or ".$this->LIKE("ex_description",$keywords)." or ".$this->LIKE("slogan",$keywords)."order by name;");   
  }
  
}


/** kernel base manager for all documents */

class design_editor extends basic_editor {   
}

class design extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("example",PUBLICT);  
      $this->tadd("solution",PUBLICT);  
      $this->tadd("all",PUBLICT);  
      $this->tadd("arrange",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $se=new design_editor($this);
     return $se->add($state,new design_db());
  }

  function edit($state){
     $se=new design_editor($this);
     return $se->edit($state,new design_db());
  }

  function del($state){
     $se=new design_editor($this);
     return $se->del($state,new design_db());
  }


  function list_all(){
     $a=new design_db();
     $a->list_abc();	  
     d_open_node("list_all","");
     while($a->lst()){
        $tmp["name"]=$a->getf("short_name");
        $tmp["walias"]=$a->getf("walias");
        d_put_node("list_one",$tmp);
     }
     d_close();  
  }

  function sh_design(){
     $this->list_all();
     $s=new design_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
     } else {
	$s->get_obj(get_obj());
     }
     d_put($s);
     return $s;	
  }

  function view($state){ 
     set_ret_point();
     $s=$this->sh_design();

     $a=new imagegal_db();
     $a->list_album("design", $s->getf("id"), ALBUM);	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("зоны офиса - ".$s->getf("short_name"));	
     return $this->exit_code(EXIT_OK);	

  }
 

  function example($state){ 
     $s=$this->sh_design();

     set_title("зоны офиса - ".$s->getf("short_name")." - примеры интерьеров");	
     return $this->exit_code(EXIT_OK);	
  }

  function solution($state){ 
     $s=$this->sh_design();

     set_title("зоны офиса - ".$s->getf("short_name")." - решения Orgspace");	
     return $this->exit_code(EXIT_OK);	
  }

  function arrange($state){ 
     $s=$this->sh_design();

     set_title("зоны офиса - ".$s->getf("short_name")." - примеры компоновок");	
     return $this->exit_code(EXIT_OK);	
  }

  function all($state){ 
     set_title("зоны офиса");	
     $a=new design_db();
     $a->list_abc();	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     return $this->exit_code(EXIT_OK);	
  }

}

?>