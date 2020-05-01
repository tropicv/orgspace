<?

/** banner operation */

class banner_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("image",new image_type(0,1));
     $this->tadd("alt",new str_type(0,"",255));
     $this->tadd("link",new str_type(0,"",255));
     $this->tadd("is_public",new chk_type(0));            
     $this->tadd("target",new dictselect_type(1,0,"banner","target"));            
  }

  function get_count_target_banners($bush){
    $q="";
    $node=bush_db::get_node($bush);
    while($node){
       if($q!="") $q.=" or ";
       $q.=" target=".$node->getf("id");
       $node=bush_db::get_node($node->up);
    }    

    if($q!="") $this->query("select count(*) as cnt from banner where is_public=1 and ($q);");   
    else $this->query("select count(*) as cnt from banner where is_public=1;");   
	
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }


  function get_count_banners(){
    $this->query("select count(*) as cnt from banner where is_public=1;");   
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }

  function list_target_banners($bush){
    $q="";
    $node=bush_db::get_node($bush);
    while($node){
       if($q!="") $q.=" or ";
       $q.=" target=".$node->getf("id");
       $node=bush_db::get_node($node->up);
    }    

    if($q!="") $this->query("select * from banner where is_public=1 and ($q);");   
    else $this->query("select * from banner where is_public=1;");   
  }

  function list_banners(){
    $this->query("select *  from banner where is_public=1 order by id;");   
  }

  function list_all(){
    $this->query("select *  from banner order by is_public,id;");   
  }

 
};


class banner_editor extends basic_editor {   
};

class banner extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
      $this->tadd("get",PUBLICT);  
      $this->tadd("abc");  
  }

  function add($state){
     $e=new banner_editor($this);
     return $e->add($state,new banner_db());
  }

  function edit($state){
     $e=new banner_editor($this);
     return $e->edit($state,new banner_db());
  }

  function del($state){
     $e=new banner_editor($this);
     return $e->del($state,new banner_db());
  }

  function abc($state){
     $n=new banner_db();
     $n->list_all();

     $e=new banner_editor($this);
     $e->show_item_list("banner",$n,get_viewing_page(),get_viewing_page_size());
     set_ret_point();
     return $this->exit_code(EXIT_OK);
  }

  function get($state){
     $c=container::get_req_node();
     if(!$c){ 
      $c=new banner_db();
      $num=$c->get_count_banners();

      mt_srand(make_seed());
      $randval = mt_rand(0,$num);
      $c->list_banners();
      $n=0;

      while($c->lst() && $n!=$randval) $n++;
      d_put($c);      
     } else{
      $bid=bush_db::find_container_node($c->getf("id"));

      $c=new banner_db();
//     $num=$c->get_count_banners();
      $num=$c->get_count_target_banners($bid);

      mt_srand(make_seed());
      $randval = mt_rand(0,$num);
//     $c->list_banners();
      $c->list_target_banners($bid);
      $n=0;

      while($c->lst() && $n!=$randval) $n++;
      d_put($c);      
     }
     return $this->exit_code(EXIT_OK);	      
  }

}

?>