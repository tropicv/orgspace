<?

function load_prop($fname){
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

function accum_file($fname,$msg){
//  print("accum in ".$fname);
  $fp=fopen($fname,"a+");
  if(!$fp) return;
  fwrite($fp,$msg."");
  fclose($fp);
}

function trunc_file($fname){
  $fp=fopen($fname,"w");
  fclose($fp);
}


function sp($level,$sym=" "){
  $res="";
  for($i=0;$i<$level;$i++){
    $res.=$sym;
  }
  return $res;
}

function save_file($fname,$data){
  $fp=fopen($fname,"w+");
  if(!$fp) return;
  fwrite($fp,$data."");
  fclose($fp);
}

function load_text_file($fname){
  $fp=fopen($fname,"r");     
  if(!$fp) return;
  $str="";
  while(!feof($fp)){
     $str=$str.fgets($fp,4096); 
  }
  fclose($fp); 
  return $str;
}


?>