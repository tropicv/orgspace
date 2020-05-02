function lib_bwcheck(){ 
        this.ver=navigator.appVersion;
        this.agent=navigator.userAgent;
        this.dom=document.getElementById?1:0;
        this.opera5=this.agent.indexOf("Opera 5")>-1;
        this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom && !this.opera5)?1:0;
        this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom && !this.opera5)?1:0;
        this.ie4=(document.all && !this.dom && !this.opera5)?1:0;
        this.ie=this.ie4||this.ie5||this.ie6;
        this.mac=this.agent.indexOf("Mac")>-1;
        this.ns6=(this.dom && parseInt(this.ver) >= 5) ?1:0; 
        this.ns4=(document.layers && !this.dom)?1:0;
        this.bw=(this.ie6 || this.ie5 || this.ie4 || this.ns4 || this.ns6 || this.opera5);
        this.minns4=(navigator.appName.indexOf("Netscape") >= 0 && parseFloat(navigator.appVersion) >= 4) ? 1:0;
        this.minie4=(document.all) ? 1 : 0;
        this.minie5=(this.minie4 && navigator.appVersion.indexOf("5.")) >= 0 ? 1 : 0;
        return this
}

var bw=new lib_bwcheck()
var TempElem;

function setPointer(theRow, thePointerColor) {

  if (!bw.minns4) {

    if (typeof(theRow.style) == 'undefined') return false;
    theRow.bgColor = thePointerColor;
    return true;

  }
}

function del_bgr() {

for (var i=1; i < 5; i++) {
  for (var j=1; j < 6; j++) {

    TempElem = document.getElementById("cell" + i + j);
    if (TempElem != null) { setPointer(TempElem, "#ffffff"); }

  }
}

}

function show_bgr(y, x) {

for (var i=1; i <= y; i++) {
  for (var j=1; j <= x; j++) {

    TempElem = document.getElementById("cell" + i + j);
    if (TempElem != null) { setPointer(TempElem, "navy"); }

  }
}

}

function save(y, x) {

var valArray = new Array;

valArray['table_row'] = y;
valArray['table_column'] = x;
valArray['table_cellspacing'] = 0;
valArray['table_cellpadding'] = 3;
valArray['table_width'] = 100;
valArray['table_width2'] = 1;
valArray['table_border'] = 1;
valArray['table_align'] = 'center';

window.returnValue = valArray;
window.close();

}
