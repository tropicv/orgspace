var init=0;

var on_header = new Array();
var on_menu = new Array();
var menu_class = new Array();

var menu_x_plus = new Array();
var menu_y_plus = new Array();

function make_obj(name){
return document.getElementById(name);
}

for(i=1;i<=5;i++) {
 on_header[i] = 0;
 on_menu[i] = 0; 
 menu_class[i] = "menu"; 
}

function img_on(imgName,imgTarg,imgName1,imgTarg1) {
  document[imgTarg].src = imgName;
  document[imgTarg1].src = imgName1;
}

function load_style () {
 if(document.layers){
  for(i=1;i<=5;i++) {
   menu_class[i] = eval("document.layers['orgmenu" + i + "head']").className; 
  }
 }
 else {
  for(i=1;i<=5;i++) {
   menu_class[i] = eval(make_obj("orgmenu" + i + "head")).className; 
  }
 }
}

function getX (el) {
  if(document.layers){
    return el.x;
  } else {
   var ol = el.offsetLeft;
   while ((el = el.offsetParent) != null)
    ol += el.offsetLeft;
   return ol;
  }
}

function getY (el) {
  if(document.layers){
    return el.y;
  } else {
   var ol = el.offsetTop;
   while ((el = el.offsetParent) != null)
    ol += el.offsetTop;
   return ol;
  }
}

function CreateLayer(text, id, t, l, w) {
if(document.layers)
 {
  var str="<LAYER ID=orgmenu" + id + " TOP=" + t + " LEFT=" + l + " onmouseover=\"on_menu[" + id + "]=1;\" onmouseout=\"Turn('" + id + "',0);on_menu[" + id + "]=0;\" VISIBILITY=hide>" + text + "</LAYER>";
  document.write(str);
 }
 else 
 {
  var string="<div id=orgmenu" + id + " style=\"position:absolute;top:" + t + ";left:" + l + ";visibility:hidden;width:" +w+ ";\" onmouseover=\"on_menu[" + id + "]=1;\" onmouseout=\"Turn('" + id + "',0);on_menu[" + id + "]=0;\">" + text + "</div>";
  document.write(string);
 }
 }
 
function Turn(id, mode) {
 if(init==1){
  on_header[id]=mode;
  if(mode){
   eval("setTimeout(\"On(" + id + ", " + mode + ");\",100)");}
  else {
   eval("setTimeout(\"Off(" + id + ", " + mode + ");\",100)");
   }
 }
}

 function On(id, mode){
  if(on_header[id])
   if(document.layers){
    eval("document.layers['orgmenu" + id + "']").style.top = getY(eval("document.dot"+id))+menu_y_plus[id];
    eval("document.layers['orgmenu" + id + "']").style.left = getX(eval("document.dot"+id))+menu_x_plus[id];
    eval("document.layers['orgmenu" + id + "']").visibility = "show";
    eval("document.layers['orgmenu" + id + "head']").className='head' + id;
   }
   else {
    eval(make_obj("orgmenu" + id)).style.top = getY(eval("document.dot"+id))+menu_y_plus[id];
    eval(make_obj("orgmenu" + id)).style.left = getX(eval("document.dot"+id))+menu_x_plus[id];
    eval(make_obj("orgmenu" + id)).style.visibility ="visible";
    eval(make_obj("orgmenu" + id + "head")).className="head" + id;
   }
 }
 
 function Off(id, mode){
  if(!on_menu[id] && !on_header[id])
   if(document.layers){
    eval("document.layers['orgmenu" + id + "']").visibility = "hide";
    eval("document.layers['orgmenu" + id + "head']").className = menu_class[id];
   }
   else {
    eval(make_obj("orgmenu" + id)).style.visibility ="hidden";
    eval(make_obj("orgmenu" + id + "head")).className= menu_class[id];
   }
 }


function make_txt(menu){
var str="<TABLE border=\"0\" cellPadding=\"0\" cellSpacing=\"0\" class=\"menu\">";
for(var i=0;i<menu.title.length;i++){  
str+="<tr><td><img src=\"/images/m"+menu.name+"-l.gif\" width=\"4\" height=\"15\" name=\"m"+menu.name+i+"l\" id=\"m"+menu.name+i+"l\"/><br/></td>";
str+="<td class=\"text"+menu.name+"\" onmouseout=\"this.style.backgroundColor='#"+menu.color+"'; img_on('/images/m"+menu.name+"-l.gif','m"+menu.name+i+"l','/images/m"+menu.name+"-r.gif','m"+menu.name+i+"r');\" onmouseover=\"this.style.backgroundColor='#"+menu.acolor+"'; img_on('/images/am"+menu.name+"-l.gif','m"+menu.name+i+"l','/images/am"+menu.name+"-r.gif','m"+menu.name+i+"r');\" onclick=\"document.location='"+menu.link[i]+"'\"><a href=\""+menu.link[i]+"\">"+menu.title[i]+"</a></td>";
str+="<td><img src=\"/images/m"+menu.name+"-r.gif\" width=\"4\" height=\"15\" name=\"m"+menu.name+i+"r\" id=\"m"+menu.name+i+"r\"/><br/></td></tr>";
}
str+="</TABLE>";
return str;
}

function menu(){
  var m=this; 
  m.name=""; 
  m.title=new Array(); 
  m.link=new Array(); 
}

function embedFlash(url,height,width) {
    document.write('<!--[if IE]>');
	document.write('<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
	document.write('		codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"');
	document.write('		width="' + width + '" height="' + height + '"');
	document.write('		id="flash"');
	document.write('		viewastext>');
	document.write('	<PARAM name="movie" value="' + url + '">');
	document.write('	<PARAM name="quality" value="high">');
    document.write('   <PARAM name="salign" VALUE="tr">');
	document.write('	<PARAM name="bgcolor" value="#FFFFFF">');
	document.write('	<PARAM name="wmode" value="transparent">');
	document.write('	<PARAM name="scale" value="exactfit">');
	document.write('</OBJECT>');
	document.write('<![endif]-->');
	document.write('<![if !IE]>');
	document.write('<EMBED src="' + url + '" ');
	document.write('		quality="high"');
	document.write('		bgcolor="#FFFFFF"');
	document.write('		width="' + width + '" ');
	document.write('		height="' + height + '"');
	document.write('		type="application/x-shockwave-flash"');
	document.write('		pluginspage="//www.macromedia.com/go/getflashplayer"');
	document.write('		salign="lt"');
	document.write('		wmode="transparent"');
	document.write('		scale="exactfit"');
	document.write('		id="flash">');
	document.write('</EMBED>');
	document.write('<![endif]>');
}
