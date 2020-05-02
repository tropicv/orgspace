<?


/** ordpr */

class ordpr_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("mail",new str_type(1,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("adr",new str_type(0,"",512));
      $this->tadd("time",new str_type(0,"",512));
      $this->tadd("coment",new text_type(0,"",get_max_clob_size()));
      $this->tadd("hear_type",new dictselect_type(1,0,"feedback","htype"));            
  }    

}


/** kernel base manager for all documents */

class ordpr_editor extends basic_editor {   
}

class ordpr extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  

  function add($state){
    set_title("Заказать презентацию");	

    $f=new ordpr_db();
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

       // captcha error
       if(isset($_SESSION['captcha_keystring']) && $_SESSION['captcha_keystring'] === $_POST['keystring']) {
        ;
       }else{
        go_to("ordpr-add");   
        return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
       }

       $res="<html><body><h3>Форма для заказа презентации</h3><br>";
       $res.="<b>* Имя</b>: " .$f->getf("name")."<br>";
       $res.="<b>* Компания</b>: " .$f->getf("company")."<br>";
       $res.="<b>* E-mail</b>: " .$f->getf("mail")."<br>";
       $res.="<b>* Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Город</b>: " .$f->getf("adr")."<br>";
       $res.="<b>Желаемое время проведения</b>: " .$f->getf("time")."<br>";
       $res.="<b>Комментарии</b>: <br>" .str_replace("&#13;&#10;","<br>",$f->getf("coment"))."<br><br>";
       $res.="<b>* Вы узнали о нас</b>: " .data_model::get_list_name("feedback","htype",$f->getf("hear_type"))."<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("заказ презентации",$res);

       mail_msg_html(get_proper("ordpr_mail_to"),"Новый заказ презентации с www.orgspace.ru",$res);

       go_to("ordpr-add?state=2");	
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>