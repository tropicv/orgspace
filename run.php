<?

function ld_prop($fname){
  $fp=fopen($fname,"r");
  if(!$fp) return;

  while(!feof($fp)){
   $str=fgets($fp,4096);
   if($str=="" || $str[0]=='#') continue;
   $name=substr($str,0,strpos($str,'='));
   $res[ $name]=str_replace("\n","",substr($str,strpos($str,'=')+1));
  }
  fclose($fp);
  return $res;
}

 $prp=ld_prop("appconf/config_ru");
 if($prp["stat"]=='true'){
   include "/hsphere/local/home/karstula/orgspace.ru/cnstats/cnt.php";
 }
//ini_set('display_errors', 'On');
error_reporting(E_ALL);

// 11111111111111

register_shutdown_function('shutdownHandler');
 
function show404page() {
    header('HTTP/1.1 404 Not Found');
    header('Status: 404 Not Found');
    echo "<body'>
          <div align='center'>
	    <a href='/'><img src='/images/logo.gif' border='0' height='35' width='150'></a>
	  </div>
          <br/><br/><br/>
          <div align='center' style='font-size:32px;'>
	   404 Ошибка
	  </div>
	  <div align='center' style='font-size:24px;'>
	    Страница не найдена (Page not found) 
	  </div>
	  <br/>
	  <div align='center' style='font-size:20px; color:gray'>
            Вы перешли по неправильной ссылке <br/>
            или страница была удалена
	  </div>
	  <br/>
	  <div align='center' style='font-size:18px;'>
	    <a href='/'>перейти на главную</a>
	  </div>
	  </body>";
}
     
function logError($message, $file, $line) {
    //echo "222";
}
	 
function shutdownHandler() {
    $someError = error_get_last();
    if ($someError['type'] === E_ERROR) {
        logError($someError['message'], $someError['file'], $someError['line']);
        show404page();
    }
}

// 2222222222222222


include_once("classes/core/include_core.php");
include_once("classes/elements/include_elements.php");
include_once("classes/orgspace/include_org.php");
include_once("classes/clip/clip.php");


function main(){

 load_styles();

 // load properties
 $prop=load_prop("appconf/config_ru");

 dbg($prop);
// session_save_path("0;600;ses/");
 env_box::session_start($prop);

 if(is_phpses_hide($prop)) return;

 dbg_o("RET ".env_box::get_ses_param("ret_point"));
 
 // instance dbc inteface
 $db_class=$prop["db_type"]."_dbc";
 include_once("classes/core/drivers/".$db_class.".php");
 
 // connect
 $con=new $db_class($prop);
 $con->connect(); 
 $con->set_param("res_path",$prop["res_path"]); 

 data_model::set_connection($con);
 bush_db::load_tree();


 // init enviroment
 $env=new env_box("");


 dbg_o("call ".$env->get_param("req_url"));
 

 // open dom tree display
 $td=new xmldom();
 $env->set_disp(&$td); 
 $env->set_proper($prop);
 push_env($env);
 set_proper($prop);
 $env->load_usr();

include_once("template/include.templ");

 dbg_o("END ".get_ses_param("end_process")." ".get_last_object());
 
 if(get_ses_param("end_process") && get_last_object()){
    $ret=get_ses_param("end_process");
    set_ses_param("end_process",false);
    go_to($ret."&last_obj=".get_last_object());    
    set_last_object(false);
    redirect(get_redirect());
    exit(0);
 }

 
 // instance manager
 $page_man=basic_manager::instance_manager(&$env); 
 $disp=$page_man->process(); 

 switch ($page_man->env->get_state()){
    case RETURN_TO_POINT :
      $page_man->env->return_to_point();
      exit(0);
    case EXIT_EXTERNAL_REDIRECT :
      redirect(get_redirect());
      exit(0);
    case EXIT_WITH_XML :
      Header("Content-type: text/plain;charset=UTF-16;");
      echo iconv("Windows-1251","UTF-16",$disp->get_buffer());
      exit(0);
    case METHOD_ACCESS_DENIED:
      redirect("usr-denied");
      exit(0);
 }



 // output 
 $td->open_node(get_item()."_".get_meth(),get_params());
   $td->put_disp($disp);
 $td->close();

 save_file("debug/out1.xml",$td->get_buffer());


 Header("Content-type: text/html;charset=Windows-1251;");
 Header("cache-control: private");
 Header("Pragma: no-cache");

 dom_prepare($td);

}


main();


?>
