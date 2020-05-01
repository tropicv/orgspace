<?


/** register */

class register_db extends basic_db {
  function load_class(){
      parent::load_class();

      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("org_type",new str_type(0,"",512));
      $this->tadd("town",new str_type(1,"",512));
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("cod",new str_type(0,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("fax",new str_type(0,"",512));
      $this->tadd("email",new mail_type(1,""));
      $this->tadd("job_type",new str_type(1,"",512));
      $this->tadd("hear_type",new dictselect_type(0,0,"feedback","htype"));            
      $this->tadd("quest",new text_type(0,"",get_max_clob_size()));
  }    
  
  function list_abc(){
    $this->query("select * from ".table_name($this)." order by name,id;");
  }
  
}


/** kernel base manager for all documents */

class register_editor extends basic_editor {   
}

class register extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  /** static function, return specifed obj_id from obj or walias */
  

  function add($state){
    set_title("Форма для регистрации");	

    $f=new register_db();
    $f->create_default();
    $f->set_expand_dictonary(true);

    switch ($state){

      case INIT_STATE:

       d_put($f);

       return $this->exit_code(EXIT_OK);

      case SAVE_STATE:

       d_put($f);

       $errs=$f->make_obj($this->env->get_post_data());
       if($errs) return $this->exit_code(EXIT_ERR,$errs);

       $f->insert();

       $res="<html><body><h3>Форма для регистрации</h3><br>";
       $res.="<b>* Название организации</b>: " .$f->getf("company")."<br>";
       $res.="<b>Форма собственности</b>: " .$f->getf("org_type")."<br>";
       $res.="<b>* Город</b>: " .$f->getf("town")."<br>";
       $res.="<b>* Контактное лицо</b>: " .$f->getf("name")."<br>";
       $res.="<b>Код города</b>: " .$f->getf("cod")."<br>";
       $res.="<b>* Телефон</b>: " .$f->getf("tel")."<br>";
       $res.="<b>Факс</b>: " .$f->getf("fax")."<br>";
       $res.="<b>* Адрес E-Mail</b>: " .$f->getf("email")."<br>";
       $res.="<b>* Род деятельности</b>: " .$f->getf("job_type")."<br>";
       $res.="<b>Где Вы получили информацию о нас</b>: " .data_model::get_list_name("feedback","htype",$f->getf("hear_type"))."<br>";
       $res.="<br><b>Дополнительно</b>: <br>" .str_replace("&#13;&#10;","<br>",$f->getf("quest"))."<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("Форма для регистрации",$res);

       mail_msg_html(get_proper("mail_to"),"Регистрация нового пользователя на www.orgspace.ru",$res);

       go_to("register-add?state=2");	
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }
 
}



?>