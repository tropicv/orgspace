<?

/** Work predmet */

class predmet_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(0,"",512));
      $this->tadd("short_name",new str_type(0,"",512));
      $this->tadd("walias",new str_type(1,"",128));
      $this->tadd("foto",new image_type(0,1));
      $this->tadd("thumb",new image_type(0,2));
      $this->tadd("baner",new image_type(0,3));
      $this->tadd("slogan",new text_type(0,"",get_max_clob_size()));
      $this->tadd("description",new text_type(0,"",get_max_clob_size())); 
      $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
      $this->tadd("sh_tmb",new chk_type(0));            
      $this->tadd("sh_type",new chk_type(0));            
      $this->tadd("sh_assort",new chk_type(0));
      $this->tadd("sh_fotogal",new chk_type(0));
      $this->tadd("fototitle",new str_type(0,"",128));
      $this->tadd("sh_promo",new chk_type(0));            
      $this->tadd("block",new chk_type(0));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." where block=0 order by srt,name,id;");
  }

  function list_abc_all(){
    $this->query("select * from ".table_name($this)." order by block, srt,name,id;");
  }

  function get_by_alias($alias){
    $this->query("select * from ".table_name($this)." where walias='".$alias."';");
  }

  function search($keywords){
    $this->query("select *  from predmet where (".$this->LIKE("description",$keywords)." or ".$this->LIKE("name",$keywords)." or ".$this->LIKE("slogan",$keywords).") and block=0  order by name;");   
  }

  
}


/** kernel base manager for all documents */

class predmet_editor extends basic_editor {   
}

class predmet extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("del");        
      $this->tadd("edit");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("all",PUBLICT);  
      $this->tadd("gallery",PUBLICT);  
      $this->tadd("assortment",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
     $se=new predmet_editor($this);
     return $se->add($state,new predmet_db());
  }

  function edit($state){
     $se=new predmet_editor($this);
     return $se->edit($state,new predmet_db());
  }

  function del($state){
     $se=new predmet_editor($this);
     return $se->del($state,new predmet_db());
  }

  function list_all(){
     $a=new predmet_db();
     $a->list_abc();	  
     d_open_node("list_all","");
     while($a->lst()){
        $tmp["name"]=$a->getf("short_name");
        $tmp["walias"]=$a->getf("walias");
        d_put_node("list_one",$tmp);
     }
     d_close();  
  }

  function list_goods_or_type_short($s){
     if($s->getf("sh_type")==1){
      $a=new gtype_db();
      $a->list_by_predmet($s->getf("id"));	  
      d_open_node("list_goods_or_type","");
      while($a->lst()){
        if($a->is_public()){
        $tmp["name"]=$a->getf("name");
        $tmp["id"]=$a->getf("id");
        d_put_node("gtype",$tmp);
	}
      }
      d_close();  
     } else {
      $a=new goods_db();
      $a->list_predmet($s->getf("id"));	  
      d_open_node("list_goods_or_type","");
      while($a->lst()){
        $tmp["name"]=$a->getf("name");
        $tmp["id"]=$a->getf("id");
        d_put_node("goods",$tmp);
      }
      d_close();  
     }
  }

  function list_goods_or_type($s){
     if($s->getf("sh_type")==1){
      $a=new gtype_db();
      $a->list_by_predmet($s->getf("id"));	  
      d_open_list();
      while($a->lst()){
        if($a->is_public()) d_put($a);
      }
      d_close();  
     } else {
      $a=new goods_db();
      $a->list_predmet($s->getf("id"));	  
      d_open_list();
      while($a->lst()){
        d_put($a);
      }
      d_close();  
     }
  }

  function view($state){ 
     $this->list_all();
     $s=new predmet_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
     } else {
	$s->get_obj(get_obj());
     }
     d_put($s);

     $this->list_goods_or_type($s);

     set_title("ןנוהלועû - ".$s->getf("short_name"));	
     set_ret_point();
     return $this->exit_code(EXIT_OK);	

  }

  function assortment($state){ 
     set_ret_point();
     $this->list_all();
     $s=new predmet_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
     } else {
	$s->get_obj(get_obj());
     }
     d_put($s);

     $this->list_goods_or_type_short($s);

     set_title("ןנוהלועû - ".$s->getf("short_name")." - מבחמנ אססמנעטלוםעא");	
     return $this->exit_code(EXIT_OK);	
  }
 

  function gallery($state){ 
     set_ret_point();
     $this->list_all();
     $s=new predmet_db();
     if(get_param("walias")!=null){ 
        $s->get_by_alias(get_param("walias"));
        $s->lst();
     } else {
	$s->get_obj(get_obj());
     }
     d_put($s);

     $this->list_goods_or_type_short($s);

     $gt=new gtype_db();
     $gt->list_by_predmet($s->getf("id"));
     d_open_list();
     while($gt->lst()){
       if($gt->is_public()){
         $tmp["id"]=$gt->getf("id");
         $tmp["name"]=$gt->getf("name");
         $tmp["walias"]=$gt->getf("walias");
         d_open_node("gtype",$tmp);
           $a=new goods_db();
           $a->list_predmet_gtype($s->getf("id"),$gt->getf("id"));	            
           while($a->lst()) d_put($a);
         d_close();         
       }
     }
     d_close();
  

/*     $a=new goods_db();
     $a->list_predmet($s->getf("id"));	  
     d_open_list();
     $old_type=0;
     $show_goods=false;

     while($a->lst()){

       if($a->getf("type")!=$old_type){
         $gt=new gtype_db($a->getf("type"));

echo "AAA".$gt->getf("id");

         if($old_type!=0 && $show_goods){ d_close();  echo "XXXXXXXXXXX";}

         $tmp["name"]=$gt->getf("name");
         $tmp["walias"]=$gt->getf("walias");

echo "BBB".$show_goods;

         $show_goods=false;
 
	 if($gt->is_public()) {
           d_open_node("gtype",$tmp);
           $show_goods=true; 
         }
 	 $old_type=$gt->getf("id");
	 
       }
       if($show_goods) d_put($a);
     }
     if($show_goods) d_close();  
     d_close();  */

     set_title("ןנוהלועû - ".$s->getf("short_name")." - פמעמדאכונוÿ - ".$s->getf("fototitle"));	
     return $this->exit_code(EXIT_OK);	

  }

  function all($state){ 
     $a=new predmet_db();
     $a->list_abc_all();	  
     d_open_list();
     while($a->lst()){
       d_put($a);
     }
     d_close();  

     set_title("ןנוהלועû");	
     return $this->exit_code(EXIT_OK);	
  }

}

?>