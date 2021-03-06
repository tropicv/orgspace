<?


/** ordgiro */

class ordgiro_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("adr",new str_type(1,"",512));
  }    
  
}


/** kernel base manager for all documents */

class ordgiro_editor extends basic_editor {   
}

class ordgiro extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  

  function add($state){
    set_title("����� ��������");   

    $f=new ordgiro_db();
    $f->create_default();

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
        go_to("ordgiro-add");
        return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
       }

       $res="<html><body><h3>����� ��� ������ �������� giroflex (������)</h3><br>";
       $res.="<b>* ���</b>: " .$f->getf("name")."<br>";
       $res.="<b>��������</b>: " .$f->getf("company")."<br>";
       $res.="<b>�������</b>: " .$f->getf("tel")."<br>";
       $res.="<b>* E-mail</b>: " .$f->getf("mail")."<br>";
       $res.="<b>����� �y�����</b>: " .$f->getf("adr")."<br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("����� �������� giroflex",$res);

       mail_msg_html(get_proper("ordgiro_mail_to"),"����� ������ �� ������� giroflex � www.orgspace.ru",$res);

       go_to("ordgiro-add?state=2");    
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>