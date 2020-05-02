<?

class basic_manager  {

   /** enviroment of this manager */
   var $env;

   /** parent display of this manager */
   var $disp;
   
   /** error vector */
   var $err;

   function basic_manager(&$env){
      $this->set_env_box($env);
      $this->load_class();
   }


   function load_class(){
   }

   function tadd($method,$roles=ADMIN){
     comp_model::add(get_class($this),$method,$roles);
   }

   /** Export enviroment to this manager */

   function set_env_box($env){  $this->env=$env; }
   

   function &process() {
      $d=$this->env->get_disp();
      $this->disp=$d->create();

      set_cur_disp($this->disp);
                     
      $state=$this->env->get_state();

      while($state!=EXIT_OK &&
            $state!=NOT_SUPPORT &&
            $state!=EXIT_ERR &&
            $state!=EXIT_EXTERNAL_REDIRECT &&
            $state!=RETURN_TO_POINT &&
            $state!=EXIT_WITH_XML &&
            $state!=OBJECT_ACCESS_DENIED ){

	   $state=$this->env->get_state();          

           if(!usr::allow(get_class($this),$this->env->get_meth())){
   	      $this->env->set_state(METHOD_ACCESS_DENIED);
              break; 
           }

           $this->invoke_method($this->env->get_meth(),$state);  
	   $state=$this->env->get_state();
      }

      if($this->err){
        dbg_o("PROCESS ERR");
        $this->display_errors($this->err);
      }

      $this->disp=get_cur_disp();      
      set_cur_disp($d);
      return $this->disp;
   }

   function &process_internal() {
      $dsp=$this->process();
      return $dsp;
   }

   /** Invoke manager method
       @param func_name - method name
       @param func_name - method name
       @param state - invoked state
   */

   function invoke_method($func_name,$state) {
       $meth=comp_model::get(get_class($this),$func_name);
       if(!$meth) {
          dbg_o("CLASS METHOD ".get_class($this).".".$func_name." NOT FOUND");
          exit(0);
       }
 
       dbg_db("CALL ".get_class($this).".".$func_name);
       call_user_func_array(array(&$this,$func_name),array($state));
   }

   function display_errors($errs){
       if(is_subclass_of($errs,"err_vect")){
         d_put_node("err",$errs);          
       }else {
        $x=reset($errs);	
	while($x){
           d_put_node("error",$x);
	   $x=next($errs);
        }        
      }	
    }


   function instance_manager($env){
      $class_item=$env->get_item();
      $cls=new $class_item($env);
      if(!$cls){
          dbg_o("MANAGER NOT FOUND "+$class_item);
          exit(0);
      }
      return $cls;
   }
   
   function exit_code($state,$errs=false) {
      if($errs) {
         $this->err=$errs;
       }
      return $this->env->set_state($state);
   }
}


function run_manager($item,$meth,$params=null){
  $curd=get_cur_disp();
  $newd=$curd->create();


  $env=new env_box($newd,get_env());
  if($params!=null) $env->set_params($params);	    

  if($params!=null || !isset($params["state"])){
     $env->set_state(0);
  }

  $env->set_item($item);
  $env->set_meth($meth);

  push_env($env);	    	    
    $man=basic_manager::instance_manager($env); 

    $disp=$man->process(); 	    

  pop_env();



  $newd->open_node($item."_".$meth,$params);
     $newd->put_disp($disp);
  $newd->close();

  return $newd;
}

function run_manager_with_legacy($item,$meth,$params=null){
  $curd=get_cur_disp();
  $newd=$curd->create();

  $env=new env_box($newd,get_env());
  $env->set_item($item);
  $env->set_meth($meth);


  if($params!=null) $env->set_params($params);	    
  
  if($params!=null || !isset($params["state"])){
     $env->set_state(0);
  }
 
  $env->set_param("litem",get_item());
  $env->set_param("lmeth",get_meth());

  push_env($env);	    	    
    $man=basic_manager::instance_manager($env); 
    $disp=$man->process(); 	    
//  echo "RUN ".$item.$meth;
    $params=get_params();
    $params=$man->env->get_params();
  pop_env();

  $newd->open_node($item."_".$meth,$params);
     $newd->put_disp($disp);
  $newd->close();

  return $newd;
}


function set_title($title){ 
   $tmp["title"]=$title;
   d_put_node("title",$tmp);
}


function show_list($dict_category,$dict_name){
   d_open_node($dict_category."_".$dict_name,null);
   $l=data_model::get_list($dict_category,$dict_name);
   reset($l);
   while (list($keyname, $val) = each($l)) {
           $param["value"]=$keyname;
           d_put_node("word",$param,$val);
   }
   d_close();
}

function mail_msg_html($mail,$Subj,$body){
 $mail_from=get_proper("mail_from");

 $headers  = "MIME-Version: 1.0\r\n";
 $headers .= "Content-type: text/html; charset=windows-1251\r\n";
 $headers .= "From: $mail_from\r\n\r\n";

 $res=mail($mail,$Subj,$body,$headers);
 return $res;
}

?>