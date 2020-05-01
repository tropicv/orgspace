<?

define("USER_NOT_FOUND","user_not_found");

/** banner operation */

class usr_db extends basic_db {

  function load_class(){
     parent::load_class();
     $this->tadd("nick",new str_type(0,"",255));
     $this->tadd("passwd",new str_type(0,"",255));
     $this->tadd("roles",new str_type(0,"",255));
  }

  function get_by_nick($nickname) { 
     $this->query("select * from usr where nick='".$nickname."';");
     return $this->lst();
  }

  /** get user by nickname and password, instance info in class
      @return user id if user exists, else return 0
  */

  function get_by_nick_passwd($nickname,$passwd) { 
     $this->query("select * from usr where nick='".$nickname."' and passwd='".$passwd."';");
     return $this->lst();
  }
 
};


class usr extends basic_manager {

  function load_class(){
      parent::load_class();
      $this->tadd("login",PUBLICT);  
      $this->tadd("logout",PUBLICT);  
      $this->tadd("accessinfo",PUBLICT);  
      $this->tadd("denied",PUBLICT);  
      $this->tadd("forgot",PUBLICT);  
  }


  function accessinfo($state){


     $nick=get_usr();

     $u=new usr_db();
     $u->get_by_nick($nick);
     $u->load_class();


     d_put($u);
     return $this->exit_code(EXIT_OK);
  }

  function login($state){
     $u=new usr_db();

     switch($state){
        case INIT_STATE:
          return $this->exit_code(EXIT_OK);
        case SAVE_STATE:	  
          if(!$u->get_by_nick_passwd(get_param("nick"),get_param("passwd"))){
            $errs[]=new err_vect(USER_NOT_FOUND,$this);
            return $this->exit_code(EXIT_ERR,$errs);
          }
          set_usr($u);
          go_to("welcome");
          return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
     }
     return $this->exit_code(EXIT_OK);
  }

  function logout($state){
     $this->load_default();
     go_to("welcome");
     return $this->exit_code(EXIT_EXTERNAL_REDIRECT);
  }

  function denied($state){
     return $this->exit_code(EXIT_OK);
  }

  function load_default(){
     $u=new usr_db();
     if($u->get_by_nick(get_proper("guest_user"))){
        set_usr($u);
     } else {
        echo "guest not found";
        exit(0);
     }
  }

  function allow($item,$meth){

    $perm=comp_model::get($item,$meth);
    $nick=get_usr();

    $u=new usr_db();
    $u->get_by_nick($nick);

    $roles=$u->getf("roles");

    if($meth && strstr($roles,$perm)) return true;
    return false;
     
  }

  function forgot($state){
     switch($state){
        case INIT_STATE:
          return $this->exit_code(EXIT_OK);	
        case SAVE_STATE:	  
          return $this->exit_code(EXIT_OK);	
     }
     return $this->exit_code(EXIT_OK);
  }

}

?>