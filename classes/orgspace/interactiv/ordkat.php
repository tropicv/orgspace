<?


/** ordkat */

class ordkat_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("adr",new str_type(1,"",512));
  }    
  
}


/** kernel base manager for all documents */

class ordkat_editor extends basic_editor {   
}

class ordkat extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  

  function add($state){
    set_title("Заказать каталоги");    

    $f=new ordkat_db();
    $f->create_default();

    switch ($state){

      case INIT_STATE:

       d_put($f);

       return $this->exit_code(EXIT_OK);

      case SAVE_STATE:


       $errs=$f->make_obj($this->env->get_post_data());
       d_put($f);
       if($errs) return $this->exit_code(EXIT_ERR,$errs);

       $res="<html><body><h3>Форма для заказа каталога Katallina</h3><br>";
       $res.="<b>* Имя</b>: " .$f->getf("name")."<br>";
       $res.="<b>Компания</b>: " .$f->getf("company")."<br>";
       $res.="<b>Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Адрес доставки</b>: " .$f->getf("adr")."<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("заказ каталога Katallina",$res);

       mail_msg_html(get_proper("ordkat_mail_to"),"Новая заявка на каталог Katallina с www.orgspace.ru",$res);

       go_to("ordkat-add?state=2"); 
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>