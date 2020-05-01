<?


/** kmore */

class kmore_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(0,"",512));
      $this->tadd("town",new str_type(0,"",512));
      $this->tadd("email",new mail_type(1,""));
      $this->tadd("tel",new str_type(0,"",512));
      $this->tadd("fax",new str_type(0,"",512));
      $this->tadd("quest",new text_type(0,"",get_max_clob_size()));
  }    
  
  
}


/** kernel base manager for all documents */

class kmore_editor extends basic_editor {   
}

class kmore extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
    set_title("узнать больше");	

    $f=new kmore_db();
    $f->create_default();
    $f->set_expand_dictonary(true);

    switch ($state){

      case INIT_STATE:

       d_put($f);

       return $this->exit_code(EXIT_OK);

      case SAVE_STATE:


       $errs=$f->make_obj($this->env->get_post_data());
       d_put($f);
       if($errs) return $this->exit_code(EXIT_ERR,$errs);

       $f->insert();

       $res="<html><body><h3>Форма для вопроса</h3><br>";
       $res.="<b>Вопрос</b>: <br>" .str_replace("&#13;&#10;","<br>",$f->getf("quest"))."<br><br>";
       $res.="<b>* Имя</b>: " .$f->getf("name")."<br>";
       $res.="<b>* Адрес E-Mail</b>: " .$f->getf("email")."<br>";
       $res.="<b>Компания</b>: " .$f->getf("company")."<br>";
       $res.="<b>Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Город</b>: " .$f->getf("town")."<br>";
       $res.="<b>Факс</b>: " .$f->getf("fax")."<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("узнать больше",$res);

       mail_msg_html(get_proper("kmore_mail_to"),"Новый вопрос на www.orgspace.ru",$res);

       go_to("kmore-add?state=2");	
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }
 
}



?>