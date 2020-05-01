<?



/** Chairs Item */

class chairsitem_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("code",new str_type(0,"",512));
      $this->tadd("chairs_id",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("short_description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("block",new chk_type(0));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }

  function list_chairs($obj){
    $this->query("select * from ".table_name($this)." where chairs_id=".$obj." order by srt,name,id;");
  }
  
  //function list_chairs_by_name($name){
    //$this->query("select * from ".table_name($this)." where name='".$name."' order by srt,name,id;");
  //}

  function search($keywords){
    $this->query("select *  from chairsitem where (".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords)." or ".$this->LIKE("short_description",$keywords)." ) and block=0 order by name;");   
  }
  
}


/** kernel base manager for all documents */

class chairsitem_editor extends basic_editor {   
   function add_init(){ 
     d_open_node("chairs","");
     $s=new chairs($this);
     $s->list_all();
     d_close();  

   }
   function edit_init(){ $this->add_init(); }
}

class chairsitem extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $ge=new chairsitem_editor($this);
     return $ge->add($state,new chairsitem_db());
  }

  function edit($state){
     $ge=new chairsitem_editor($this);
     return $ge->edit($state,new chairsitem_db());
  }

  function del($state){
     $ge=new chairsitem_editor($this);
     return $ge->del($state,new chairsitem_db());
  }

  function list_all_chairs(){
     $a=new chairs_db();
     $a->list_abc();	  
     d_open_node("list_all_chairs","");
     while($a->lst()){
        $tmp["name"]=$a->getf("short_name");
        $tmp["walias"]=$a->getf("walias");
        d_put_node("list_one",$tmp);
     }
     d_close();  
  }

  function view($state){
     $this->list_all_chairs();
     $g=new chairsitem_db();
     $g->get_obj(get_obj());
     d_put($g);

     $s=new chairs_db();
     $s->get_obj($g->getf("chairs_id"));
     d_put($s);

     set_title("кресла и стулья - ".$s->getf("short_name")." - ".$g->getf("name"));	

     $g->list_chairs($g->getf("chairs_id"));
     d_open_node("list_all_goods","");
     while($g->lst()){
        $tmp["name"]=$g->getf("name");
        $tmp["id"]=$g->getf("id");
        d_put_node("list_one",$tmp);
     }
     d_close();  

//     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }

 
 
}



?>