bLoad=false
cl=null;
bTextMode=false

// Paragraph Styles
ps2=new ps("Комментарий","note");
ps3=new ps("Заголовок","head");
ps4=new ps("Удалить стиль","none");

parast= new initArray(ps2,ps3,ps4);

// Table Styles
tbl1= new table("Equipment","/images/mifors/ws/equipment.xsl");
tbl2= new table("branches","/images/mifors/ws/branches.xsl");

tables= new initArray(tbl1,tbl2);

public_description=new Editor

preserve = new initArray(tbl1.name,tbl2.name,"header","topLine","bottomLine","note","head","topLinefirst","bottomLinefirst","headerfirst",ps2.styleName,ps3.styleName);

//Array of special character
specChars = new initArray(
"&copy;",
"&deg;",
"&reg;",
"&trade;",
"&laquo;",
"&raquo;",
"&euro;",
"&iexcl;",
"&cent;",
"&pound;",
"&curren;",
"&yen;",
"&brvbar;",
"&nbsp;",
"&sect;",
"&macr;",
"&plusmn;",
"&acute;",
"&micro;",
"&para;",
"&middot;",
"&frac14;",
"&frac12;",
"&frac34;",
"&iquest;",
"&times;",
"&divide;",
"&fnof;",
"&circ;",
"&tilde;",
"&Alpha;",
"&Beta;",
"&Gamma;",
"&Delta;",
"&Epsilon;",
"&Zeta;",
"&Eta;",
"&Theta;",
"&Iota;",
"&Kappa;",
"&Lambda;",
"&Mu;",
"&Nu;",
"&Xi;",
"&Omicron;",
"&Pi;",
"&Sigma;",
"&Tau;",
"&Upsilon;",
"&Phi;",
"&Chi;",
"&Psi;",
"&Omega;",
"&alpha;",
"&beta;",
"&gamma;",
"&delta;",
"&epsilon;",
"&zeta;",
"&eta;",
"&theta;",
"&iota;",
"&kappa;",
"&lambda;",
"&mu;",
"&nu;",
"&xi;",
"&omicron;",
"&pi;",
"&rho;",
"&sigmaf;",
"&sigma;",
"&tau;",
"&upsilon;",
"&phi;",
"&chi;",
"&psi;",
"&omega;",
"&ndash;",
"&mdash;",
"&lsquo;",
"&rsquo;",
"&ldquo;",
"&rdquo;",
"&bdquo;",
"&bull;",
"&hellip;",
"&prime;",
"&Prime;",
"&oline;",
"&loz;",
"&larr;",
"&uarr;",
"&rarr;",
"&darr;",
"&harr;");



// Makes array from elements, which are argument of this function
function initArray() {
  this.length = initArray.arguments.length;
  for (var i = 0; i < this.length; i++)   
  	this[i] = initArray.arguments[i];
}

// Table style object
function table(name,source){
	this.name=name;
	this.source=source;
}

//Paragraph style object
function ps(name,styleName){
	this.name=name;
	this.styleName=styleName;
}

var smr=0;
var tEdit;

function use0() {
        if (!Composition.document.body.BehaviorStyleSheet)
                Composition.document.body.BehaviorStyleSheet = Composition.document.createStyleSheet()
        tEdit = Composition.document.body.BehaviorStyleSheet
}

function showhide() {
        if (smr == 0) {
		use0();
                tEdit.addRule('TD','border:red dotted 1px;')
                tEdit.addRule('TABLE','border:red dotted 1px;')
                smp = 1
        }
        if (smr == 1) {
                tEdit = Composition.document.body.BehaviorStyleSheet
                tEdit.removeRule('TD','border:red dotted 1px;')
                tEdit.removeRule('TABLE','border:red dotted 1px;')
                smp = 0
        }
        smr = smp
}

function constrStyles(){
	ins=document.getElementById("parastyle");
	for(i=0;i<parast.length;i++){
		ins.options[i+1]=new Option(parast[i].name,parast[i].styleName)
	}
}

/*****************************
 Power Editor class
 member function:
 SetHtml
 GetHtml
 SetText
 GetText
 GetCompFocus()
 *****************************/
function Editor() {
	this.put_html=SetHtml;
	this.get_html=GetHtml;
	this.put_text=SetText;
	this.get_text=GetText;
	this.CompFocus=GetCompFocus;
}

function GetCompFocus() {
	Composition.focus();
}

function GetText() {
	return Composition.document.body.innerText;
}

function SetText(text) {
	text = text.replace(/\n/g, "<br>");
	Composition.document.body.innerHTML=text;
}


function GetHtml() {
	if (bTextMode) 
		return Composition.document.body.innerText;
	else {
		cleanHtml();
		var base = Composition.document.all.tags('BASE')[0].href;
		var inner=Composition.document.body.innerHTML;
		var re = new RegExp("("+base+")","gi");
		inner=inner.replace(re,"");
		return inner;
	}
}

function SetHtml(sVal) {
	if (bTextMode) Composition.document.body.innerText=sVal;
	else Composition.document.body.innerHTML=sVal;
}
//End  of Editor Class

/***********************************************
 Initialize everything when the document is ready
 ***********************************************/
var YInitialized = false;

function document.onreadystatechange(){
	if (YInitialized) return;
	YInitialized = true;

	var i, s, curr;

//	Composition.document.open()
//	Composition.document.write(bodyTag);
//	Composition.document.close()
//	Composition.document.designMode="On"
	Composition.document.onmousedown = mousedown_handler;
	Composition.document.onkeydown = keydown_handler;
	Composition.document.ondblclick = dblclick_handler;
	Composition.focus();
//	SetHtml(hiddencomposeForm.hiddencomposeFormTextArea.value);
}

function keydown_handler(){
   var sel = Composition.document.selection.createRange();
	switch(this.parentWindow.event.keyCode){
	case 67:
		if(this.parentWindow.event.ctrlKey){
			if(this.parentWindow.event.altKey)
				sel.pasteHTML("&copy;");
		}
	break;
	case 82:
		if(this.parentWindow.event.altKey){
			if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&reg;");
			}
		}
	break;
	case 84:
		if(this.parentWindow.event.altKey){
			if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&trade;");
			}
		}
	break;
	case 192:
		if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&lsquo;");
		}
	break;
	case 222:
		if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&rsquo;");
		}
	break;
	case 190:
		if(this.parentWindow.event.altKey){
			if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&hellip;");
			}
		}
	break;
	case 109:
		if(this.parentWindow.event.altKey){
			if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&mdash;");
			}
		}else{
			if(this.parentWindow.event.ctrlKey){
				sel.pasteHTML("&ndash;");
			}
		}
	break;
	}

}


function mousedown_handler()
{
  if (this.parentWindow.event.srcElement.tagName=="TABLE" || this.parentWindow.event.srcElement.tagName=="TD")
    cl = this.parentWindow.event.srcElement;
  else
    cl = null;
}

function dblclick_handler()
{  

  if (this.parentWindow.event.srcElement.tagName=="TABLE")
    setTable(this.parentWindow.event.srcElement);
  if (this.parentWindow.event.srcElement.tagName=="TD")
    setCell(this.parentWindow.event.srcElement);
}

function validateMode() {
  if (! bTextMode) return true;
  alert('Переключитесь в режим "Редактирование в текстовом виде"');
  Composition.focus();
  return false;
}

function sendHtml(){
	if(bTextMode){
		document.composeForm.body.value = public_description.get_text();
		return true;
	}
	else{
		document.composeForm.body.value = public_description.get_html();
		return true;
	}
}

function paste(){
  if (!validateMode()) return;
   sel = Composition.document.selection.createRange();
   if(Composition.document.selection.type=="Control") return;
   sel.execCommand("Paste");
   optim(sel.parentElement());
   Composition.focus();   
}


//Formats text in composition.
function formatC(what,opt) {
  if (!validateMode()) return;
   sel = Composition.document.selection.createRange();
   if(Composition.document.selection.type=="Control"){
    if (opt==null){
		sel.execCommand(what);
	}else{
		sel.execCommand(what,"",opt);
	}
   }else{
    Par=sel.parentElement();
    if(((Par.tagName=="LI") || (Par.tagName=="OL") || (Par.tagName=="UL")) && (what=="forecolor")){
		Par.style.color=opt;
    }else{
     if (opt==null){
		sel.execCommand(what);
	}else{
		sel.execCommand(what,"",opt);
     }
    }
   }
  Composition.focus();
}

//Switches between text and html mode.
function setMode(newMode) {
  bTextMode = newMode;
  var cont;
  if (bTextMode) {
// show html
    cleanHtml();
    cleanHtml();
    cont= Composition.document.body.innerHTML;
    Composition.document.body.innerText=cont;
  } else {
    cont=Composition.document.body.innerText;
    Composition.document.body.innerHTML=cont;
  }
  Composition.focus();
}


//Finds and returns an element.
function getEl(sTag,start) {
  while ((start!=null) && (start.tagName!=sTag)) start = start.parentElement;
  return start;
}

//Makes preformatted text and removes it if it exists
function pre(){
  if (!validateMode()) return;

  var sel = Composition.document.selection.createRange();
  if(Composition.document.selection.type!='None'){

	par=sel.parentElement();
    if(par.tagName=="PRE"){
	ins=par.innerHTML;
	prev=par.previousSibling;

	if((prev.tagName=="P") || (prev.tagName=="PRE")){
		par.removeNode(true);
		prev.innerHTML=prev.innerHTML+" "+ins;
	}else{
		p=Composition.document.createElement("p");
		p.innerHTML=ins;
		par.replaceNode(p);
	}
	Composition.document.recalc();

    }else {
	sel.pasteHTML("<pre>"+sel.text+"</pre>");
    }
  }

  Composition.focus();
}

//Makes font of the selection larger
function fontL(){
  if (!validateMode()) return;
  
  var fsize=Composition.document.queryCommandValue("FontSize");
  fsize++;
  if(fsize>7){
		alert("Задан максимальный размер шрифта");
		Composition.focus();
		return;
  }

  formatC("FontSize",fsize);

  Composition.focus();  
}

//Makes font of the selection smaller
function fontS(){
  if (!validateMode()) return;
  
  
  var fsize=Composition.document.queryCommandValue("FontSize");
  fsize--;
  if(fsize<1){
		alert("Задан минимальный размер шрифта");
		Composition.focus();
		return;
  }

  formatC("FontSize",fsize);

  Composition.focus();  
}

//Makes paragraph with style, removes style with argument "none"
function makeStyle(styleName){
  if (!validateMode()) return;
	var sel=Composition.document.selection.createRange();
	Par=sel.parentElement();
	if(Par.tagName!="P"){
		Par=getEl("P",Par);
	}
	if(Par.tagName!="P" && styleName!="none"){
	    Par.innerHTML="<P class="+styleName+">"+Par.innerHTML+"</P>";
	}else{
	if(styleName=="none"){
		Par.removeAttribute("className");
	}else{
		Par.className=styleName;
	}
	}
	event.srcElement.options(0).selected=true;
	Composition.focus();
}

//Sets the color
function MyColor(colorMode){
  if (!validateMode()) return;
  User_Color = showModalDialog("/images/mifors/ws/w_color.htm","","dialogWidth:600px; dialogHeight:340px; center:1; help:0; resizable:0; status:0");
  if (!User_Color) return;

  formatC(colorMode, User_Color);
  Composition.focus();
}

//Creates Link if text is not selected - the address inserted into link as text
function createLink() {
  if (!validateMode()) return;
  
  var isA = getEl("A",Composition.document.selection.createRange().parentElement());
  if(isA==null){
	var str=prompt("Укажите адрес :","http:\/\/");
	  
	if ((str!=null) && (str!="http://")) {
		var sel=Composition.document.selection.createRange();
		if (Composition.document.selection.type=="None") {
			sel.pasteHTML('<A HREF="'+str+'">'+str+'</A>');
		}else {
			sel.execCommand('CreateLink',"",str);
	        }
		sel.select();
	}
  } else {
	var str=prompt("Укажите адрес :",isA.href);

	if ((str!=null) && (str!="http://")) isA.href=str;

  }

Composition.focus();
}

//removes Link
function deleteLink(){
  if (Composition.document.selection.type=="None") {
  	var isA = getEl("A",Composition.document.selection.createRange().parentElement());
	if(isA!=null){
		if (!confirm("Удалить эту ссылку?")) return;
		ct=isA.firstChild;
		isA.replaceNode(ct);
		
	}
  }else{

  if (!confirm("Удалить эту ссылку?")) return; // Выходим из процедуры, если не надо удалять ссылку

  formatC("unlink");

}
Composition.focus();
}

//Inserts special symbol
function insertSymbol(){
  if (!validateMode()) return;
	 symbol = showModalDialog("/images/mifors/ws/w_symbol.htm",specChars,"dialogWidth:540px; dialogHeight:340px; center:1; help:0; resizable:0; status:0");
	if(symbol==null) return;
	 var sel=Composition.document.selection.createRange();
	 sel.pasteHTML(symbol);
	 sel.select();
	Composition.focus();
}

//Makes selected table with style

function createStyledTable(){
  if (!validateMode()) return;

    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl.parentElement.parentElement.parentElement;
    }else{
       elem=getEl("TABLE",Composition.document.selection.createRange().parentElement());
	if(elem!=null) obj = elem;
    }
    
    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");

    }else{
	dtbl = showModalDialog("/images/mifors/ws/w_stable.htm", tables,"dialogWidth:250px; dialogHeight:200px; center:1; help:0; resizable:0; status:0");
	if(dtbl==null) return;
	var xsltTable = new ActiveXObject("Microsoft.XMLDOM");
	xsltTable.async = false;
	xsltTable.load(dtbl);
	if (xsltTable.parseError.errorCode != 0) {
	   var myErr = xsltTable.parseError;
	  alert("You have error " + myErr.reason);
	return;
	} 
	var sxmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	sxmlDoc.async=false;
	tra=new String(obj.outerHTML);
	state=0;
	out="";
	for(i=0;i<tra.length;i++){
		ch=tra.charAt(i);
		switch (state){
			case 0:if(ch=='<') state=1; break;
			case 1:if(ch=='>') state=0;
				if(ch=='=') state=2;break;
			case 2:if(ch!='"'){ out+='"'; state=4} else state=3;break;
			case 3:if(ch=='"') state=1;break;
			case 4:if(ch==' ') {out+='"';state=1}
				if(ch=='>') {out+='"';state=0};break
		}
		out+=ch;
	}
	sxmlDoc.loadXML(out);
	if (sxmlDoc.parseError.errorCode != 0) {
	   var myErr = sxmlDoc.parseError;
	  alert("You have error " + myErr.reason);
	return;
	} 
	replacement=sxmlDoc.transformNode(xsltTable);
	obj.outerHTML=replacement;
	Composition.document.recalc();
	Composition.focus();
    }
}

//Creates table
function createTable(obj){
  if (!validateMode()) return;

      var dlg = new Array();
      dlg = showModalDialog("/images/mifors/ws/sm_table.htm","","dialogWidth:161px; dialogHeight:220px; center:1; help:0; resizable:0; status:0");
      if (!dlg) return;

      var oTable = document.createElement("TABLE");
      var oTBody = document.createElement("TBODY");
      var oRow, oCell;
      var i, j;

      oTable.appendChild(oTBody);
               
      oTable.style.width = "100%";
      oTable.width =  "100%";
	hei=dlg["table_row"]*40;
      oTable.style.height = hei + "px";
      oTable.height =  hei;
	

      if (dlg["table_cellspacing"]!="")
        oTable.cellSpacing = dlg["table_cellspacing"];
 
      if (dlg["table_cellpadding"]!="")
        oTable.cellPadding = dlg["table_cellpadding"];

      if (dlg["table_border"]!="")
        oTable.border = dlg["table_border"];

      if (dlg["table_color"]!="")
        oTable.bgColor = dlg["table_color"];

      if (dlg["table_align"]!="")
        oTable.align = dlg["table_align"];

      for (i=0;i<dlg["table_row"];i++){
        oRow = document.createElement("TR");
        oTBody.appendChild(oRow);
   
        for (j=0;j<dlg["table_column"];j++){
          oCell = document.createElement("TD");
//          oCell.innerHTML = " ";
          oRow.appendChild(oCell);
        }
      }
  
      if (dlg["table_row_color"]!="")
        oTBody.bgColor = dlg["table_row_color"];
  
      var range = Composition.document.selection.createRange();
      range.pasteHTML(oTable.outerHTML);
    
} 

//Change table settings
function setTable(obj){

  if (!validateMode()) return;
    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl.parentElement.parentElement.parentElement;
    }else{

       elem=getEl("TABLE",Composition.document.selection.createRange().parentElement());
	if(elem!=null) obj = elem;
	}
    
    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");

    }else{
      
      var dlg = new Array();
	mys= new initArray(tables,obj);
      dlg = showModalDialog("/images/mifors/ws/w_table.htm",mys,"dialogWidth:360px; dialogHeight:360px; center:1; help:0; resizable:0; status:0");
      if (!dlg) 
        return;

      if (dlg["table_width"]!="" && dlg["table_width"]!=0)
      {
        if (dlg["table_width2"]=="1"){
          obj.style.width = dlg["table_width"] + "%";
          obj.width = dlg["table_width"] + "%";
        }else{
          obj.style.width = dlg["table_width"] + "px";
          obj.width = dlg["table_width"];
	}
      }                                        

      if (dlg["table_height"]!="" && dlg["table_height"]!=0)
      {
        if (dlg["table_height2"]=="1"){
          obj.style.height = dlg["table_height"] + "%";
          obj.height = dlg["table_height"] + "%";
        }else{
          obj.style.height = dlg["table_height"] + "px";
          obj.height = dlg["table_height"];
	}
      }                                        

      if (dlg["table_cellspacing"]!="")
        obj.cellSpacing = dlg["table_cellspacing"];
 
      if (dlg["table_cellpadding"]!="")
        obj.cellPadding = dlg["table_cellpadding"];

      if (dlg["table_border"]!="")
        obj.border = dlg["table_border"];

      if (dlg["table_color"]!="")
        obj.bgColor = dlg["table_color"];

      if (dlg["table_align"]!="")
        obj.align = dlg["table_align"];

      if (dlg["table_class"]=="none"){
	obj.removeAttribute("className");
	}else{
      if (dlg["table_class"]!="")
        obj.className = dlg["table_class"];
	}      

      if (dlg["table_row_color"]!="")
        obj.tBodies[0].bgColor = dlg["table_row_color"];
    }
  
  Composition.focus();
}

//Change cell settings
function setCell(obj){
  if (!validateMode()) return;
    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl;
    }else{

       elem=getEl("TD",Composition.document.selection.createRange().parentElement());
	if(elem!=null) obj = elem;
	}

    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");
    }else{

      str = obj.bgColor;
      str = str.replace("#","");
                                   
      var dlg = new Array();
      dlg = showModalDialog("/images/mifors/ws/w_tablecell.htm",obj,"dialogWidth:380px; dialogHeight:300px; center:1; help:0; resizable:0; status:0");
      if (!dlg) 
        return;
                                      
      if (dlg["cell_width"]!="" && dlg["cell_width"]!=0)
      {
        if (dlg["cell_width2"]=="1")
          obj.width = dlg["cell_width"] + "%";
        else
          obj.width = dlg["cell_width"];
      }                                        

      if (dlg["cell_height"]!="")
        obj.height = dlg["cell_height"];

      if (dlg["cell_color"]!="")
        obj.bgColor = dlg["cell_color"];

      if (dlg["cell_align"]!="")
        obj.align = dlg["cell_align"];

      if (dlg["cell_valign"]!="")
        obj.vAlign = dlg["cell_valign"];
                                           
      obj.noWrap = dlg["cell_nowrap"];
    }
  Composition.focus();
}

//Inserts Row into table
function insertRow(obj){

  if (!validateMode()) return;


    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl;
    }

    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");
    } else {

      var dlg = new Array();

      dlg = showModalDialog("/images/mifors/ws/w_insertrow.htm","","dialogWidth:260px; dialogHeight:145px; center:1; help:0; resizable:0; status:0");

      if (!dlg) 
        return;

      oTable = obj.parentElement.parentElement.parentElement;
      

      for (i=0;i<dlg["count"];i++)
      {
        oRow = oTable.insertRow(obj.parentElement.rowIndex+dlg["radio"]);
        if (oRow)
        {       
          for (j=0;j<oTable.rows(obj.parentElement.rowIndex).cells.length;j++)
          {
            oCell = oRow.insertCell(j);
            if (oCell)
            {
              oCell.innerHTML = "&nbsp;";
            }
          }
        }
      }
    }
  Composition.focus();
}

//Removes row from table
function deleteRow(obj){
  if (!validateMode()) return; 
    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl;
    }

    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");
    }
    else
    {
      if (confirm("Удалить эту строку?"))
      {
        oTable = obj.parentElement.parentElement.parentElement;
        if (oTable.rows.length>1)
          obj.parentElement.parentElement.deleteRow(obj.parentElement.rowIndex);
        else
          oTable.removeNode(true);
      }
    }
  
  Composition.focus();
}

//Inserts column into table
function insertColumn(obj)
{
  if (!validateMode()) return;  
    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl;
    }

    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");
    }
    else
    {
      var dlg = new Array();
      dlg = showModalDialog("/images/mifors/ws/w_insertcol.htm","","dialogWidth:260px; dialogHeight:145px; center:1; help:0; resizable:0; status:0");
      if (!dlg) 
        return;

      oTable = obj.parentElement.parentElement.parentElement;
      a = obj.cellIndex;

      for (i=0;i<oTable.rows.length;i++)
      {
        oRow = oTable.rows[i];
        for (j=0;j<dlg["count"];j++)
        {
          oCell = oRow.insertCell(a+dlg["radio"]);
          if (oCell)
          {
            oCell.innerHTML = "&nbsp;";
          }
        }
      }
    }
  
  Composition.focus();
}

//Removes column from table
function deleteColumn(obj){
  if (!validateMode()) return;

    if (cl!=null)
    {  
      if (cl.tagName=="TD")
        obj = cl;
    }

    if (!obj)
    {
      alert("Установите курсор в ячееку таблицы!");
    }
    else
    {
      if (confirm("Удалить столбец?"))
      {
        oTable = obj.parentElement.parentElement.parentElement;
        a = obj.cellIndex;

        for (i=0;i<oTable.rows.length;i++)
        {
          if (oTable.rows[i].cells.length>1)
            oTable.rows[i].deleteCell(a);
          else
            oTable.removeNode(true);
        }
      }
    }
  
  Composition.focus();
}

function cleanHtml() {
  var fonts = Composition.document.body.all.tags("FONT");
  var curr;
  for (var i = fonts.length - 1; i >= 0; i--) {
    curr = fonts[i];
    if (curr.style.backgroundColor == "#ffffff") curr.outerHTML = curr.innerHTML;
  }
}

function getPureHtml() {
  var str = "";
  var paras = Composition.document.body.all.tags("P");
  if (paras.length > 0) {
    for (var i=paras.length-1; i >= 0; i--) str = paras[i].innerHTML + "\n" + str;
  } else {
    str = Composition.document.body.innerHTML;
  }
  return str;
}

function optimize(){
  if (!bTextMode) {
	optim(Composition.document.body);
  } 
  Composition.focus();
}

function optim(root) {
      clrattr("TD",root);
      clrattr("TH",root);
      clrattr("TR",root);
      clrattr("TABLE",root);
      clrattr("P",root);
      clrattr("SPAN",root);
      clrattr("B",root);
      clrattr("LI",root);
      clrattr("OL",root);
      clrattr("H1",root);
      clrattr("H2",root);
      clrattr("H3",root);
      clrattr("H4",root);
      clrattr("UL",root);
      clrattr("DIV",root);
      clrface(root);
      droptags("head",root);
      var text=root.innerHTML;

      text = text.replace(/(<\/o:p>)/gi,"");
      text = text.replace(/(<o:p>)/gi,"");
      text = text.replace(/(<\/SPAN>)/gi,"");
      text = text.replace(/(<SPAN>)/gi,"");
      text = text.replace(/(<\/body>)/gi,"");
      text = text.replace(/(<body(.*)>)/gi,"");
      text = text.replace(/(<html>)/gi,"");
      text = text.replace(/(<\/html>)/gi,"");
      text = text.replace(/(<(.?)xml(.+)\/>)/gi,"");


      root.innerHTML=text;

}


function clrface(root){
  if (!bTextMode) {
	var paras = root.all.tags("font");
	for(var i=paras.length-1; i >= 0; i--)
		paras[i].removeAttribute("face");
  }

}

function clrattr(aname,root){
  if (!bTextMode) {
      var tgs = root.all.tags(aname);
      if (tgs.length > 0) {
      	for (var i=tgs.length-1; i >= 0; i--){
		j=0;
		cl='';
		while(j<preserve.length){
			if(tgs[i].className==preserve[j]){
				j=preserve.length;
				cl=tgs[i].className;
			}
			j++;
		}
	        al=tgs[i].align;
		clsp=tgs[i].colSpan;
		rwsp=tgs[i].rowSpan;
		h=tgs[i].height;
		w=tgs[i].width;
		v=tgs[i].vAlign;
		cp=tgs[i].cellPadding;
		cs=tgs[i].cellSpacing;
		bg=tgs[i].bgColor;
		brdr=tgs[i].border;

               	tgs[i].clearAttributes();

		if(cl!='') tgs[i].className=cl;
	        if(al) tgs[i].align=al;
		if(h) tgs[i].height=h;
		if(w) tgs[i].width=w;
		if(v) tgs[i].vAlign=v;
		if(cp) tgs[i].cellPadding=cp;
		if(cs) tgs[i].cellSpacing=cs;
		if(clsp) tgs[i].colSpan=clsp;
		if(rwsp) tgs[i].rowSpan=rwsp;
		if(bg) tgs[i].bgColor=bg;
		if(brdr) tgs[i].border=brdr;
        }
      }
  } 
}


function droptags(tagname,root){
  if (!bTextMode) {
      var paras = root.all.tags(tagname);
      var cur;
      if (paras.length > 0) {
        for (var i=paras.length-1; i >= 0; i--){
               paras[i].removeNode(true);
        }
      }
  } 
}

