<?

define("RUN_PROCESS",-34);
define("END_PROCESS",-35);
define("EXIT_ERR",33);
define("NOT_SUPPORT",6);
define("EXIT_OK",-4);
define("EXIT_EXTERNAL_REDIRECT",-30);
define("RETURN_TO_POINT",-7);
define("METHOD_ACCESS_DENIED",-8);
define("OBJECT_ACCESS_DENIED",-80);
define("EXIT_WITH_XML",-13);
define("EXIT_WITH_TEXT_PLAIN",-15);
define("INIT_STATE",0);
define("SAVE_STATE",1);
define("STEP0",0);
define("STEP1",1);
define("STEP2",2);
define("STEP3",3);
define("STEP4",4);
define("STEP5",5);
define("STEP6",6);
define("STEP7",7);

$ses_data=array();

class env_box  {

  var $usr=false;
  var $con=false;
  var $disp=false;
  var $lang="ru";
  var $ver="full";


  var $proper=array();
  var $params=array();
  var $url_params=array();
  var $redirect_url="";
  var $redirected=false;


  function env_box($disp,$par_env=false) {
    global $_REQUEST,$_POST,$_FILES,$_SERVER,$_GET;
    if($par_env!=false){

      $this->disp=$disp;
      $this->set_params($par_env->get_params());
      $this->proper=$par_env->proper;
      $this->url_params=$par_env->get_url_params();

    } else{

     $this->disp=$disp;
     if(isset($_GET["ver"])) $this->set_ver($_GET["ver"]);

     $this->params=array_merge($_GET,$_POST,$_FILES);
 
     if(!$this->get_param("state")){
      $this->set_param("state",INIT_STATE);
      $this->set_state(INIT_STATE);
     }

     if(!$this->get_param("obj")){
      $this->set_param("obj",0);
     }

     $cur_path=$_SERVER["SCRIPT_NAME"];
     if($cur_path[0]=="/") $cur_path=substr($cur_path,1);


     $this->set_item_meth_from_path($this->get_param("rurl"));
     $this->set_param("base_path",$cur_path);
     $this->set_param("port",$_SERVER["SERVER_PORT"]);
     $this->set_param("server_name",$_SERVER["HTTP_HOST"]);
     $this->set_param("req_url",$_SERVER["REQUEST_URI"]);
     $this->set_param("proto","http");

     reset($this->params);
     while (list($pname, $p) = each($this->params)) {
      $val=$this->params[$pname];
      if(gettype($val)=="string"){
        $this->params[$pname]=chars_filter(stripslashes($val));
      }

/*      if(gettype($val)=="array"){
        reset($val);
        while (list($pn, $p) = each($val)) {
         $v=$val[$pn];
         if(gettype($v)=="string"){
          $this->params[$pname].=chars_filter(stripslashes($v)).";";
         }
        }
      }*/

     }

     $prm=remove($_GET,"rurl");
     if($prm){
      reset($prm);
      while (list($pname, $p) = each($prm)) {
       $val=$this->params[$pname];
       if(gettype($val)=="string"){
        $this->url_params[$pname]=chars_filter(stripslashes($val));
       }
      }
     }
    }     
  }

  function get_url_params(){ return $this->url_params; }
  function get_ver(){ return $this->ver; }
  function get_lang(){ return $this->lang; }
  function set_ver($ver){ $this->ver=$ver; }
  function set_lang($lang){ $this->lang=$lang; }



  function set_item_meth_from_path($pth){
     if($pth) $mti=split("-",$pth);
     else $mti=false;

     if(!$mti){
         if(!$this->get_item()) $this->set_item("welcome");
         if(!$this->get_meth()) $this->set_meth("view");
         return;
     }
     
     $ind=sizeof($mti)-1;
     if(strrpos($mti[$ind],".")) $mti[$ind]=substr($mti[$ind],0,strrpos($mti[$ind],'.'));
     
     if(sizeof($mti)==1){
         if(!$this->get_item()) $this->set_item($mti[0]);
         if(!$this->get_meth()) $this->set_meth("view");
         return;
     }
     if(!$this->get_item()) $this->set_item($mti[0]);
     if(!$this->get_meth()) $this->set_meth($mti[1]);

  }


  function set_disp($disp){ $this->disp=$disp; }
  function set_con($con){ $this->con=$con; }
  function get_con(){ return $this->con;  }

  function set_usr($usr){ 
    $this->set_ses_param("usr",$usr->getf("nick"));
  }

  function get_usr() { 
    return $this->get_ses_param("usr");
  }

  function set_proper($proper){
      $this->proper=$proper;
      if(isset($proper["lang"])){
        $this->set_lang($proper["lang"]);
      }
  }

  function get_proper($key){
     return $this->proper[$key];
  }

  function get_viewing_page(){  return $this->get_param("pg"); }
  function get_viewing_page_size(){  return $this->get_proper("list_page_size");  }
  function get_viewing_news_page_size(){  return $this->get_proper("list_news_page_size");  }

  function set_item($item){ 
      $this->set_param("item",$item); 
  }
  function get_item(){ return $this->get_param("item"); }

  function set_meth($new_meth){ $this->set_param("meth",$new_meth); }
  function get_meth(){ return $this->get_param("meth"); }

  function set_obj($id){ $this->set_param("obj",$id); }
  function get_obj(){ return $this->get_param("obj");  }

  function set_state($newstate){
      $this->set_param("last_state",$this->get_param("state"));
      $this->set_param("state",$newstate);
      return $this->get_state();
  }

  function get_state(){ return $this->get_param("state"); }
  function get_last_state(){ return $this->get_param("last_state");   }

  function set_param($param_name,$param_val){ 
    $this->params[$param_name]=$param_val; 
  }
  
  function get_param($param){
      if(!isset($this->params[$param])) return false;
      return $this->params[$param];
  }


  function session_start($prop){
     global $ses_data;
     if($prop["start_ses"]=='true'){
        session_start();
     }
  }

  function load_usr(){
     if(!get_ses_param("usr")){ // load default user
         usr::load_default();
     }
  }

  function get_ses_id(){ 
          return session_id(); 
  }
  
  function set_ses_param($param_name,$param_val){ 
    global $ses_data;    
    dbg_o("set ses param $param_name=");

    $_SESSION[$param_name]=$param_val;
  }
  
  function get_ses_param($param){ 
    global $ses_data;

    if(!isset($_SESSION[$param])) return false;   
    return $_SESSION[$param];   
  }


  function get_url($part){   
    if($part[0]!="/") $part="/".$part;
    $p=$this->get_param("port") != 80 ? $this->get_param("port"):""; 
    return $this->get_param("proto")."://".$this->get_param("server_name").$part.$p;
  }

  function get_params(){ return $this->params; }
  function set_params($par){ $this->params=$par; }

  function get_post_data(){ return $this->params;   }
  function get_disp(){ return $this->disp;  }

  function set_ret_point(){
    if($this->get_param("no_return")=="yes"){} else
      $this->set_ses_param("ret_point",$this->get_param("req_url"));
  }

  function set_redirect($redirect_url){
    $this->redirect_url=$redirect_url;
  }

  function get_redirect(){
    return $this->redirect_url;
  }

  function go_to($method){
    $this->set_redirect($this->get_url($method));
  }

  function return_to_point(){
    $url=$this->get_ses_param("ret_point");
    $this->set_redirect($this->get_url($url));
    dbg_o("RETURN TO ".$this->get_ses_param("ret_point"));
    $this->redirect($url);
  }

  function redirect($url){
//    ob_end_clean();    
    dbg_o("REDIRECT TO $url");
    Header("Location: ".$url);    
  }

  function compile_document($path_to_template,$xmldisp){ 
	$xml="<?xml version=\"1.0\" encoding=\"windows-1251\"?>\n".$xmldisp->get_buffer();
	$xsl=load_text_file("template/".$path_to_template);

	$arguments = array(
     	'/_xml' => $xml,
	'/_xsl' => $xsl
	);

	$xh = xslt_create();

	$fileBase='file://'.getcwd ().'/template/';
	xslt_set_base($xh,$fileBase);
	$html = xslt_process($xh, 'arg:/_xml', 'arg:/_xsl', NULL, $arguments); 
	xslt_free($xh);

        return $html;
  } 

}


/** function for operate under curent system enviroment */


  $env_stk=array();
  $cur_env=false;


  function push_env(&$env){
    global $env_stk,$cur_env;
    array_push($env_stk,$cur_env);
    $cur_env=$env;
  }

  function pop_env(){
    global $env_stk,$cur_env;
    $cur_env=array_pop($env_stk);
  }


  function set_usr($usr){ 
    global $cur_env;
    return $cur_env->set_usr($usr); 
  }


  function get_env() { 
    global $cur_env;
    return $cur_env; 
  }

  function get_usr() { 
    global $cur_env;
    return $cur_env->get_usr(); 
  }

  function set_proper($proper){
    global $cur_env;
    return $cur_env->set_proper($proper);
  }

  function get_proper($key){
    global $cur_env;
    return $cur_env->get_proper($key);
  }

  function get_max_clob_size(){
    return get_proper("max_clob_size");
  }

  function get_max_long_clob_size(){
    return get_proper("max_long_clob_size");
  }


  function get_viewing_page(){  
     global $cur_env;
     return $cur_env->get_viewing_page(); 
  }

  function get_viewing_page_size(){  
     global $cur_env;
     return $cur_env->get_viewing_page_size(); 
  }
  
  function get_viewing_news_page_size(){  
     global $cur_env;
     return $cur_env->get_viewing_news_page_size(); 
  }

  function set_item($item){ 
     global $cur_env;
     return $cur_env->set_item($item);
  }

  function get_item(){ 
     global $cur_env;
     return $cur_env->get_item(); 
  }

  function set_meth($new_meth){ 
     global $cur_env;
     return $cur_env->set_meth($new_meth); 
  }

  function get_meth(){ 
     global $cur_env;
     return $cur_env->get_meth(); 
  }

  function set_obj($id){ 
     global $cur_env;
     return $cur_env->set_obj($id); 
  }
  function get_obj(){ 
     global $cur_env;
     return $cur_env->get_obj(); 
 }

  function set_state($newstate){
     global $cur_env;
     return $cur_env->set_state($newstate); 
  }

  function get_state(){ 
     global $cur_env;
     return $cur_env->get_state(); 
  }

  function get_last_state(){ 
     global $cur_env;
     return $cur_env->get_last_state(); 
  }

  function set_param($param_name,$param_val){ 
     global $cur_env;
     return $cur_env->set_param($param_name,$param_val); 
  }
  
  function get_param($param_name){
     global $cur_env;
     return $cur_env->get_param($param_name); 
  }

  function set_ses_param($param_name,$param_val){ 
     global $cur_env;
     return $cur_env->set_ses_param($param_name,$param_val); 
  }

  function get_ses_param($param){ 
     global $cur_env;
     return $cur_env->get_ses_param($param); 
  }

  function get_params(){ 
     global $cur_env;
     return $cur_env->get_params(); 
  }

  function get_url_params(){ 
     global $cur_env;
     return $cur_env->get_url_params(); 
  }

  function set_params($par){ 
     global $cur_env;
     return $cur_env->set_params($par); 
  }

  function get_post_data(){ 
     global $cur_env;
     return $cur_env->get_post_data();
  }

  function get_disp(){ 
     global $cur_env;
     return $cur_env->get_disp();
  }

  function set_ret_point() {
     global $cur_env;
     return $cur_env->set_ret_point();
  }

  function go_to($method){
     global $cur_env;     
     return $cur_env->go_to($method);
  }

  function redirect($url){
     global $cur_env;
     return $cur_env->redirect($url);
  }

  function get_redirect(){
     global $cur_env;
     return $cur_env->get_redirect();
  }

  function set_last_object($obj){
     global $cur_env;
     return $cur_env->set_ses_param("last_object",$obj);
  }

  function set_end_process($url){
     global $cur_env;
     set_last_object(false);
     $cur_env->set_ses_param("end_process",$url);
  }

  function get_last_object(){
     global $cur_env;
     return $cur_env->get_ses_param("last_object");
  }

  function get_lang(){
     global $cur_env;
     return $cur_env->get_lang();
  }

  function get_ver(){
     global $cur_env;
     return $cur_env->get_ver();
  }

  function get_ses_id(){ 
     global $cur_env;
     return $cur_env->get_ses_id();
  } 

  function compile_document($path_to_template,$xmldisp){ 
     global $cur_env;
     return $cur_env->compile_document($path_to_template,$xmldisp);
  } 

  function is_phpses_hide($prop){
     global $_SERVER; 

     if($prop["start_ses"]!='true'){
        $url=$_SERVER["REQUEST_URI"];
        $pos=strpos($url,"PHPSESSID");

        if($pos!=false){
          $url=substr($url,0,$pos-1);
          Header("Location: ".$url);           
          return true; 
        }
 
//        Header("Location: ".$url);           
     }
     return false;  
  }

?>
