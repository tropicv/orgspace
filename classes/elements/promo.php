<?

/** banner operation */

class promo_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("type",new dictselect_type(1,0,"promo","action"));            

     $this->tadd("image",new image_type(0,1));
     $this->tadd("alt",new str_type(0,"",255));
     $this->tadd("link",new str_type(0,"",255));
     $this->tadd("flash",new image_type(0,2));

     $this->tadd("sizex",new int_type(0,0,0,INTEGER_MAX_INT));                  
     $this->tadd("sizey",new int_type(0,0,0,INTEGER_MAX_INT));                  
     $this->tadd("aligment",new dictselect_type(1,0,"promo","aligment"));            
     $this->tadd("textbody",new text_type(0,"",get_max_clob_size()));

     $this->tadd("open_date",new date_type(0,date_type::sql_date_string_now()));
     $this->tadd("is_public",new chk_type(0));            
  }


  function get_count(){
    $this->query("select count(*) as cnt from promo;");   
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }

  function get_public(){
    $this->query("select count(*) as cnt from promo where is_public=1;");   
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }

  function list_public(){
    $this->query("select *  from promo where is_public=1 order by id;");   
  }

  function list_all(){
    $this->query("select *  from promo order by is_public,id;");   
  }

 
};


class promo_editor extends basic_editor {   
};

class promo extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add");  
      $this->tadd("edit");  
      $this->tadd("del");  
      $this->tadd("view",PUBLICT);  
      $this->tadd("abc");  
      $this->tadd("test");  
  }

  function add($state){
     $e=new promo_editor($this);
     return $e->add($state,new promo_db());
  }

  function edit($state){
     $e=new promo_editor($this);
     return $e->edit($state,new promo_db());
  }

  function del($state){
     $e=new promo_editor($this);
     return $e->del($state,new promo_db());
  }

  function abc($state){
     $n=new promo_db();
     $n->list_all();

     $e=new promo_editor($this);
     $e->show_item_list("promo",$n,get_viewing_page(),get_viewing_page_size());
     set_ret_point();
     return $this->exit_code(EXIT_OK);
  }

  function view($state){
     $c=new promo_db();
     $num=$c->get_public();

     mt_srand(make_seed());

     $randval = mt_rand(0,$num);
     $c->list_public();
     $n=0;

     while($c->lst() && $n!=$randval) $n++;
     d_put($c);      
     return $this->exit_code(EXIT_OK);	      
  }

  function test($state){
     $prm=get_params();
     reset($prm);

     $x=0;
     $mas[$x]=0;

     while (list($pname, $p) = each($prm)) {
       if(strstr($pname,"promo_")){
         $mas[$x++]=substr($pname,strlen("promo_"));
       }
     }

     if(count($mas)==0){
       return $this->man->exit_code(RETURN_TO_POINT);
     }
    
     mt_srand(make_seed());
     $randval = mt_rand(0,$x-1);
     $c=new promo_db($mas[$randval]);
     d_put($c);      
     return $this->exit_code(EXIT_OK);	      
  }

}

?>