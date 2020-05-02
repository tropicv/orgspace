<?


class pcat extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("view",PUBLICT);  
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
  }


  function add($state) {
    set_last_object(1);
    return $this->exit_code(RETURN_TO_POINT);
  }


  function edit($state){ 
    set_last_object(1);
    return $this->exit_code(RETURN_TO_POINT);
  }

  function del($state){ 
    set_last_object(1);       
    return $this->exit_code(RETURN_TO_POINT);
  }

  function view($state){ 
     $a=new zone_db();
     $a->list_abc();	  
     d_open_node("zone_all","");
     while($a->lst()){
        d_put($a);
     }
     d_close();  

     $a=new design_db();
     $a->list_abc();	  
     d_open_node("design_all","");
     while($a->lst()){
        d_put($a);
     }
     d_close();  

     $a=new serial_db();
     $a->list_abc();	  
     d_open_node("serial_all","");
     while($a->lst()){
        d_put($a);
     }
     d_close();  

     $a=new chairs_db();
     $a->list_abc();	  
     d_open_node("chairs_all","");
     while($a->lst()){
        d_open($a);
        chairs::list_chairsitem($a);
        d_close();  
     }
     d_close();  

     $a=new predmet_db();
     $a->list_abc();	  
     d_open_node("predmet_all","");
     while($a->lst()){
        d_open($a);
        predmet::list_goods_or_type($a);
        d_close();  
     }
     d_close();  

     d_open_node("pg_all","");
       bush::show_tree(bush_db::get_root_node_id());
     d_close();  

     return $this->exit_code(EXIT_OK);
  }

  
 
}



?>