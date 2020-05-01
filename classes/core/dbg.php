<?

/** debug and error output utilites */

 $debug_db=0;
 $debug_log=false;

 /** set debug properties */
 
 function dbg($prop){
  global $debug_db,$debug_log;

  if($prop["debug_db"]==1) $debug_db=1;
  if(isset($prop["debug_log"])) $debug_log=$prop["debug_log"];
  if(isset($prop["reset_log"])) { 
      trunc_file($debug_log); 
      trunc_file("debug/out1.xml"); 
      trunc_file("debug/out2.xml"); 
  }	
 }

 /** output message */

 function dbg_o($msg){
  global $debug_log;

  if($debug_log) accum_file($debug_log,$msg."\n");   
  else print($msg);

 }

 /** output back trace */

 function dbg_tr(){
  global $debug_db,$debug_log;

  $trc=debug_backtrace();
  $s=reset($trc);
  $line=$s["line"];
  $s=next($trc);

  if(!$debug_log) print("<ul>");   

  while($s){ 
    if(!isset($s["class"])) $s["class"]="";
    if(!$debug_log) print($s["class"].".".$s["function"].".<font color='#ff0000'>". $line."</font><br/>");
    else accum_file($debug_log,$s["class"].".".$s["function"]." [".$line."]\n");

    if(isset($s["line"])) $line=$s["line"];
    else $line=false;
    $s=next($trc);   
  }
  if(!$debug_log) print("</ul>");   

  reset($trc);
 }

 /** output error with back trace */

 function dbg_err($msg){
  global $debug_db,$debug_log;

  if(!$debug_log) print("<p><b>".$msg."</b></p>");   
  else {
    accum_file($debug_log,"trace error $msg\n");
  }
  dbg_tr();

 }

 /** output message from dbc level */

 function dbg_db($msg){
  global $debug_db,$debug_log;

  if($debug_db){
    if(!$debug_log) print("<p><b>query:</b><br/>".$msg."</p>");   
    else accum_file($debug_log,$msg."\n");
  }
 }

 function dbg_dump($v,$msg=""){
   global $debug_db,$debug_log;

   if(!$debug_log) {
     print("<pre>");
     var_dump($v);
     print("</pre>");
   }else{
     ob_start();
     var_dump($v);
     accum_file($debug_log,$msg." ".ob_get_contents());
     ob_end_clean();
   }
 }

 function echo_dump($v,$msg=""){
   global $debug_db,$debug_log;

     print("<pre>");
     var_dump($v);
     print("</pre>");

 }



?>