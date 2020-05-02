<?


/** subscribe mail */

class subscr_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("email",new mail_type(1,""));
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("tel",new str_type(0,"",512));
      $this->tadd("snews",new chk_type(0));
      $this->tadd("sdig",new chk_type(0));
  }    
  
}


/** kernel base manager for all documents */

class subscr_editor extends basic_editor {   
}

class subscr extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  

  function add($state){
    set_title("подписка");	

    $f=new subscr_db();
    $f->create_default();

    switch ($state){

      case INIT_STATE:

       d_put($f);

       return $this->exit_code(EXIT_OK);

      case SAVE_STATE:


       $errs=$f->make_obj($this->env->get_post_data());
       d_put($f);
       if($errs) return $this->exit_code(EXIT_ERR,$errs);

       $res="<html><body><h3>Форма для подписка</h3><br>";
       $res.="<b>E-mail</b>: " .$f->getf("email")."<br>";
       $res.="<b>Имя</b>: " .$f->getf("name")."<br>";
       $res.="<b>Компания</b>: " .$f->getf("company")."<br>";
       $res.="<b>Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Подписаться на </b>: ";
       if($f->getf("snews")==1) $res.=" новости ";
       if($f->getf("sdig")==1) $res.=" публикации ";
       $res.="<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("подписка",$res);

       mail_msg_html(get_proper("subscr_mail_to"),"Новая подписка с www.orgspace.ru",$res);

       go_to("subscr-add?state=2");	
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>