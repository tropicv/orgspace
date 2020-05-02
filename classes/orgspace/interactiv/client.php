<?


/** client */

class client_db extends basic_db {
  function load_class(){
      parent::load_class();
      $this->tadd("name",new str_type(1,"",512));
      $this->tadd("company",new str_type(1,"",512));
      $this->tadd("mail",new str_type(1,"",512));
      $this->tadd("tel",new str_type(1,"",512));
      $this->tadd("adr",new str_type(0,"",512));
      $this->tadd("coment",new text_type(0,"",get_max_clob_size()));
  }    

}


/** kernel base manager for all documents */

class client_editor extends basic_editor {   
}

class client extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("add",PUBLICT);  
  }

  

  function add($state){
    set_title("����������� ��� ��������� �������");  

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

       $res="<html><body><h3>����� ��� ����������� � �������� �������</h3><br>";
       $res.="<b>* ���</b>: " .$f->getf("name")."<br>";
       $res.="<b>* ��������</b>: " .$f->getf("company")."<br>";
       $res.="<b>* E-mail</b>: " .$f->getf("mail")."<br>";
       $res.="<b>* �������</b>: " .$f->getf("tel")."<br>";
       $res.="<b>�����</b>: " .$f->getf("adr")."<br>";
       $res.="<b>�����������</b>: <br>" .str_replace("&#13;&#10;","<br>",$f->getf("coment"))."<br><br>";
       $res.="<br><hr><br>Orgspace.ru</body></html>";

       form_to_db("����������� ��� ��������� �������",$res);

       mail_msg_html(get_proper("client_mail_to"),"����������� ��� ��������� ������� � www.orgspace.ru",$res);

       go_to("client-add?state=2");  
       return $this->exit_code(EXIT_EXTERNAL_REDIRECT);

      case STEP2:

       return $this->exit_code(EXIT_OK);

   }
   return $this->man->exit_code(NOT_SUPPORT);

  }

 
}



?>