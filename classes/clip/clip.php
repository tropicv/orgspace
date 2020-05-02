<?

define("SLOGAN",1);
define("IMAGE",2);


/** clip operation */

class clip_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("name",new str_type(0,"",255));
     $this->tadd("walias",new str_type(0,"",255));
     $this->tadd("flash",new file_type(0,1));
     $this->tadd("w",new int_type(0,0,0,INTEGER_MAX_INT));            
     $this->tadd("h",new int_type(0,0,0,INTEGER_MAX_INT));            
  }

  function list_all(){
    $this->query("select * from clip order by id;");   
  }

  function delete(){
    $s=new story_db();
    $s->list_clip($this->getid());
    while($s->lst()) $s->delete(); 
    basic_db::delete();
  }

  function get_by_alias($alias){
    $this->query("select * from clip where walias='$alias';");
    return $this->lst();
  }

}

class story_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("clip_id",new int_type(0,0,0,INTEGER_MAX_INT));            
     $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
     $this->tadd("name",new str_type(0,"",255));
     $this->tadd("url",new url_type(0,""));
     $this->tadd("rotation",new int_type(0,0,1,1000));
  }

  function list_clip($clip_id){
    $this->query("select * from story where clip_id=$clip_id order by srt,id;");   
  }

  function get_count_stories(){
    $this->query("select count(*) as cnt from story;");   
    $sql_data=$this->result->lst();
    return $sql_data["cnt"];
  }

  function delete(){
    $s=new storypart_db();
    $s->get_story($this->getid());
    while($s->lst()) $s->delete(); 
    basic_db::delete();
  }

}


class storypart_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("story_id",new int_type(0,0,0,INTEGER_MAX_INT));            
     $this->tadd("type",new dictselect_type(1,0,"clip","type"));            
     $this->tadd("foto",new image_type(0,1));
     $this->tadd("slogan1",new str_type(0,"",255));
     $this->tadd("slogan2",new str_type(0,"",255));
     $this->tadd("srt",new int_type(0,0,0,INTEGER_MAX_INT));            
  }

  function get_story($story_id){
    $this->query("select *  from storypart where story_id=$story_id order by srt,id;");   
  }

  function get_by_type($type,$story_id){
    $this->query("select * from storypart where story_id=$story_id and type=$type order by srt,id;");   
  }


};



class clip_editor extends basic_editor {   
};
class story_editor extends basic_editor {   
};
class storypart_editor extends basic_editor {   
};

class clip extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",ADMIN);  
      $this->tadd("edit",ADMIN);  
      $this->tadd("del",ADMIN);  
      $this->tadd("manage",ADMIN);  
      $this->tadd("view",PUBLICT);  
      $this->tadd("entry",PUBLICT);  
      $this->tadd("abc",ADMIN);  
      $this->tadd("storyadd",ADMIN);  
      $this->tadd("storyedit",ADMIN);  
      $this->tadd("storydel",ADMIN);  
      $this->tadd("partadd",ADMIN);  
      $this->tadd("partedit",ADMIN);  
      $this->tadd("partdel",ADMIN);  
  }

  function get_req_node(){
    $c=new clip_db();
    if(get_param("walias")){ 
      if(!$c->get_by_alias(get_param("walias"))) return false;
      return $c;
    }
    if(get_param("obj")){
      if(!$c->get_obj(get_param("obj")))return false;
      return $c;
    }
    return false;     
  }  

  function add($state){
     $e=new clip_editor($this);
     return $e->add($state,new clip_db());
  }

  function edit($state){
     $e=new clip_editor($this);
     return $e->edit($state,new clip_db());
  }

  function del($state){
     $e=new clip_editor($this);
     return $e->del($state,new clip_db());
  }

  function show_clip($c){
     d_open($c);
       $s=new story_db();
       $s->list_clip($c->getid());
       while($s->lst()){
         d_open($s);
            $p=new storypart_db();
            $p->get_story($s->getid());
            while($p->lst()){
              d_put($p);          
            }          
         d_close();              
       } 
     d_close();    
  }
 

  function manage($state){
     $c=new clip_db(get_obj());
     $this->show_clip($c);
     set_ret_point();
     return $this->exit_code(EXIT_OK);	     
  }

  function view($state){
     $this->show_clip($this->get_req_node());
     return $this->exit_code(EXIT_OK);	     
  }

  function entry($state){
     $c=$this->get_req_node();  


     d_add("<xml>\n");

     $s=new story_db();
     $num=$s->get_count_stories();

     if($num==0)
       return $this->exit_code(EXIT_WITH_XML);	     

     mt_srand(make_seed());
     for($j=0;$j<$num;$j++) {

        do{
         $randval = mt_rand(0,$num-1);
         for($i=0;$i<$j;$i++){
            if($arr[$i]==$randval) break;
         }
        }while($i!=$j);

        $arr[$j]=$randval;
       
     }


     $s->list_clip($c->getid());
     $x=0;
     while($s->lst()){
       $stories[$x]=$s;
       $x++; 
     }

     for($n=1,$y=0;$y<$num;$y++){
         $s=$stories[$arr[$y]];


         d_add("<story$n value=\"".$s->getf("url")."\" name=\"".$s->getf("name")." \" rot=\"".$s->getf("rotation")."\" >\n");

         $p=new storypart_db();

         $p->get_by_type(SLOGAN,$s->getid());
         d_add("<slogan>\n");
         $x=1;
         while($p->lst()){
              d_add("<slogan$x part1=\"".$p->getf("slogan1")."\" part2=\"".$p->getf("slogan2")."\"/>\n");
              $x++;
         }          
         d_add("</slogan>\n");

         $p->get_by_type(IMAGE,$s->getid());
         d_add("<image>\n");
         $x=1;
         $res="<image1 ";
         while($p->lst()){
              $res.=" link$x=\"/res/".$p->make_part_res_file_name(1,$p->getf("foto"))."\" ";
              $x++;
         }          
         $res.="/>\n";
         d_add($res);
         d_add("</image>\n");

         d_add("</story$n>\n");
         $n++;
     } 
     d_add("</xml>\n");

     return $this->exit_code(EXIT_WITH_XML);	     
  }

  function abc($state){
     $n=new clip_db();
     $n->list_all();
     $e=new clip_editor($this);
     $e->show_item_list("clip",$n,get_viewing_page(),get_viewing_page_size());
     set_ret_point();
     return $this->exit_code(EXIT_OK);
  }

  function storyadd($state){
     $e=new story_editor($this);
     return $e->add($state,new story_db());
  }

  function storyedit($state){
     $e=new story_editor($this);
     return $e->edit($state,new story_db());
  }

  function storydel($state){
     $e=new story_editor($this);
     return $e->del($state,new story_db());
  }

  function partadd($state){
     $e=new storypart_editor($this);
     return $e->add($state,new storypart_db());
  }

  function partedit($state){
     $e=new storypart_editor($this);
     return $e->edit($state,new storypart_db());
  }

  function partdel($state){
     $e=new storypart_editor($this);
     return $e->del($state,new storypart_db());
  }


}

?>