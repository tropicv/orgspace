<?


/** chairs */

class chairs_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("mail",new str_type(1,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("coment",new text_type(0,"",get_max_clob_size()));
  }    

}


/** kernel base manager for all documents */

class chairs_editor extends basic_editor {   
}

class chairs extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("order",PUBLICT);  
  }

  

  function add($state){
    set_title("Заказать кресло");  

    $f=new client_db();
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

       $res="<html><body><h3>Заказать кресло</h3><br>";
       $res.="<b>* Имя</b>: " .$f->getf("name")."<br>";
       $res.="<b>* E-mail</b>: " .$f->getf("mail")."<br>";
       $res.="<b>* Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Комментарии</b>: <br>" .str_replace("&#13;&#10;","<br>",$f->getf("coment"))."<br><br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("Заказать кресло",$res);

       mail_msg_html(get_proper("client_mail_to"),"Заказать кресло с www.orgspace.ru",$res);

       go_to("chairs-order?state=2");  
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>