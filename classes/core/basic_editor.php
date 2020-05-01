<?

class basic_editor {
   var $man;
   var $errs;

   function basic_editor(&$man){
      $this->man=&$man;
   }

   function edit_init(){ return true;}
   
   function edit_check(&$obj){ return false;}
   function edit_keys(&$obj){ return true; }
   function edit_after_event(&$obj){ return true; }


   function add_init(){ return true; }
   function add_check(&$obj) { return false; }
   function add_keys(&$obj){ return true; }
   function add_after_event(&$obj){ return true; }

   function del_keys(&$obj)  {
        $obj->delete();
   }

   function  del_check(&$obj) { return false; }
   function  del_before_event(&$obj){ return true;} 



   /** add dialog */
   
   function add($state,$obj) {

    $obj->create_default();
    $obj->set_expand_dictonary(true);

    switch ($state){

      case INIT_STATE:

       d_put($obj);
       $this->add_init();

       return $this->man->exit_code(EXIT_OK);

      case SAVE_STATE:
       $errs=$obj->make_obj($this->man->env->get_post_data());

       if($errs) return $this->man->exit_code(EXIT_ERR,$errs);

       $errs=$this->add_check($obj);
       if($errs) $this->man->exit_code(EXIT_ERR,$errs);

       $this->add_keys($obj);
       $this->insert_obj($obj);
       $this->add_after_event($obj);

       set_last_object($obj->getid());
       return $this->man->exit_code(RETURN_TO_POINT);
   }
   return $this->man->exit_code(NOT_SUPPORT);
  }

  function  insert_obj(&$obj) {
      $obj->insert();
  }

  function  update_obj(&$obj)  {
      $obj->update();
  }

  /** edit dialog */

  function  edit($state,$obj)  {

     $obj->set_expand_dictonary(true);

     switch ($state){

      case INIT_STATE:

       if(!$this->get_info(get_obj(),$obj)) return $this->man->exit_code(EXIT_ERR);
       $this->edit_init();
       return $this->man->exit_code(EXIT_OK);

      case SAVE_STATE:

       $obj->get_obj(get_obj());
       $errs=$obj->make_obj($this->man->env->get_post_data());
       if($errs){
        return $this->man->exit_code(EXIT_ERR,$errs);
       }

       $errs=$this->edit_check($obj);
       if($errs){
        return $this->man->exit_code(EXIT_ERR,$errs);
       }

       $this->edit_keys($obj);
       $this->update_obj($obj);
       $this->edit_after_event($obj);
       set_last_object($obj->getid());
       return $this->man->exit_code(RETURN_TO_POINT); 
    }

    return $this->man->exit_code(NOT_SUPPORT);
   }

   /** delete dialog */

   function  del($state,$obj)  {
    switch ($state){

      case INIT_STATE:

       $obj->get_obj(get_obj());
       d_put($obj);
       return $this->man->exit_code(EXIT_OK);

      case SAVE_STATE:

       $obj->get_obj(get_obj());

       $errs=$this->del_check($obj);
       if($errs) return $this->man->exit_code(env.EXIT_ERR,$errs);

       $this->del_before_event($obj);
       $this->del_keys($obj);
       set_last_object($obj->getid());
       
       return $this->man->exit_code(RETURN_TO_POINT);
    }
    return $this->man->exit_code(NOT_SUPPORT);
   }

   /** view dialog */

   function view($state,$obj) {
     $this->get_info(get_obj(),$obj);
     set_ret_point();
     return $this->man->exit_code(EXIT_OK);
   }

   function show_item_list($item_name,$object,$page,$page_size)  {
     $cur_pos=0;
     $beg_pos=0;

     $beg_pos=$page*$page_size;

     d_open_list();
     while($object->lst()){
       if($cur_pos>=$beg_pos && $cur_pos< $beg_pos+$page_size){
         $this->show_object_from_list(&$object);
       }
       $cur_pos++;
     }
     d_close();
     page_inf::show($item_name,$cur_pos,$page_size,$page);
   }

   function show_object_from_list(&$obj)  {
       d_put($obj);
   }

   function get_info($id,$obj) {
    $obj->get_obj($id);
    d_put($obj);
    return true;
   }

}


?>