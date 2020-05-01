<?

/** type of goods */

class gtype_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("predmet_id",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("short_name",new str_type(0,"",512));
      $this->tadd("walias",new str_type(0,"",512));
      $this->tadd("description",new text_type(0,"",get_max_clob_size()));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("block",new chk_type(0));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by name,id;");
  }
  function is_public(){ return $this->getf("block")==0 ? true : false; }

  function list_by_predmet($obj){

/*    $this->query("select type from goods where predmet_id=".$obj." group by type order by type;");   

    $q="";
    while($sql_data=$this->result->lst()){
       if($q!="") $q.=" or ";
       $q.=" id=".$sql_data["type"];
    }
    if($q!="") $this->query("select * from ".table_name($this)." where $q order by id;"); */

    $this->query("select * from ".table_name($this)." where predmet_id=".$obj." order by id;"); 
  }

  function search($keywords){
    $this->query("select *  from gtype where (".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords).") and block=0 order by name;");   
  }
  
}


/** kernel base manager for all documents */

class gtype_editor extends basic_editor {   

   function add_init(){ 
     $c=new predmet_db();
     $c->list_abc();
     d_open_list();
       while($c->lst())  d_put($c);
     d_close();  
   }
   function edit_init(){ $this->add_init(); }

}

class gtype extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $ge=new gtype_editor($this);
     return $ge->add($state,new gtype_db());
  }

  function edit($state){
     $ge=new gtype_editor($this);
     return $ge->edit($state,new gtype_db());
  }

  function del($state){
     $ge=new gtype_editor($this);
     return $ge->del($state,new gtype_db());
  }

  function view($state){
     $gd=new goods($this);
     $gd->list_all_predmet();

     $g=new gtype_db();

     if(get_param("predmet")!=null){
      $s=new predmet_db();
      $s->get_obj(get_param("predmet"));
      d_put($s);

      $g->list_by_predmet($s->getf("id"));	  
      d_open_node("list_all_gtype","");
      while($g->lst()){
        if($g->is_public()){
         $tmp["name"]=$g->getf("name");
         $tmp["id"]=$g->getf("id");
         d_put_node("list_one",$tmp);
        }
      }
      d_close();  

     }

     $g->get_obj(get_obj());
     d_put($g);


     if(get_param("predmet")!=null){
     set_title("ןנוהלועû - ".$s->getf("short_name")." - ".$g->getf("name"));	
     } else{
     set_title("ןנוהלועû - ".$g->getf("name"));	
     }
     set_ret_point();
     return $this->exit_code(EXIT_OK);     
  }

 
}



?>