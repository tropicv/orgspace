<?

/** type of goods */

define("TABLE",0);
define("RACK",1);
define("ATTIC",2);
define("TUMBA",3);
define("CLOSET",4);
define("SHELF",5);


/** Goods */

class goods_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("code",new str_type(0,"",512));
      $this->tadd("serial_id",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("predmet_id",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("type",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("short_description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("size",new str_type(0,"",128));
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("block",new chk_type(0));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by srt,name,id;");
  }

  function list_predmet($obj){
    $this->query("select * from ".table_name($this)." where predmet_id=".$obj." order by srt,type,name,id;");
  }

  function list_predmet_gtype($predmet_id,$gtype_id){
    $this->query("select * from ".table_name($this)." where predmet_id=".$predmet_id." and type=".$gtype_id." order by srt,name,id;");
  }

  function search($keywords){
    $this->query("select *  from goods where (".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords)." or ".$this->LIKE("short_description",$keywords)." ) and block=0 order by name;");   
  }
  
}


/** kernel base manager for all documents */

class goods_editor extends basic_editor {   
   function add_init(){ 
     $c=new gtype_db();
     $c->list_abc();
     d_open_list();
     while($c->lst()){
        d_put($c);
     }
     d_close();  

     d_open_node("serial","");
     $s=new serial($this);
     $s->list_all();
     d_close();  

   }
   function edit_init(){ $this->add_init(); }
}

class goods extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("shview",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $ge=new goods_editor($this);
     return $ge->add($state,new goods_db());
  }

  function edit($state){
     $ge=new goods_editor($this);
     return $ge->edit($state,new goods_db());
  }

  function del($state){
     $ge=new goods_editor($this);
     return $ge->del($state,new goods_db());
  }

  function list_all_predmet(){
     $a=new predmet_db();
     $a->list_abc();	  
     d_open_node("list_all_predmet","");
     while($a->lst()){
        $tmp["name"]=$a->getf("short_name");
        $tmp["walias"]=$a->getf("walias");
        d_put_node("list_one",$tmp);
     }
     d_close();  
  }

  function view($state){
     $this->list_all_predmet();
     $g=new goods_db();
     $g->get_obj(get_obj());
     d_put($g);

     $s=new predmet_db();
     $s->get_obj($g->getf("predmet_id"));
     d_put($s);

     set_title("ןנוהלועû - ".$s->getf("short_name")." - ".$g->getf("name"));	

     $g->list_predmet($g->getf("predmet_id"));
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

  function shview($state){
     $g=new goods_db();
     $g->get_obj(get_obj());
     d_put($g);

     $s=new serial_db();
     $s->get_obj($g->getf("serial_id"));
     d_put($s);

     set_title("ןנוהלועû - ".$g->getf("name"));	
     return $this->exit_code(EXIT_OK);     
  }

 
 
}



?>