<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="ver_ru/full/user_menu.xsl"/>
<xsl:include href="ver_ru/full/nav.xsl"/>

<xsl:template match="/ru_full | /en_full">

<html>
<head>

<xsl:if test="$content/container_view/container_db/@noi!='0' or $content/container_view/container_db/@nof!='0'">
<meta name="ROBOTS">
<xsl:attribute name="content">
<xsl:choose>
 <xsl:when test="$content/container_view/container_db/@noi=1">NOINDEX</xsl:when>
 <xsl:otherwise>INDEX</xsl:otherwise>
</xsl:choose>, <xsl:choose>
 <xsl:when test="$content/container_view/container_db/@nof=1">NOFOLLOW</xsl:when>
 <xsl:otherwise>FOLLOW</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
</meta>
</xsl:if>

<xsl:call-template name="show_tkd"/>

<link rel="stylesheet" type="text/css" href="/scp/main.css"/>
<link rel="stylesheet" type="text/css" href="/scp/mifors.css"/>

<script language="JavaScript1.2" src="/scp/m.js"></script>
<script>

var pup = null;

  function openwin(url,w,h){
    if(pup != null &amp;&amp; !pup.closed) pup.close();
    pup=window.open(url,"Orgspace","height="+h+",width="+w+",left=10,top=10,scrollbars=no,resizable=yes");
    pup.focus();
  }

  function PreloadImages() { 
    var d=document; if(d.images){ if(!d.p) d.p=new Array();
      var i,j=d.p.length,a=PreloadImages.arguments; for(i=0; i&lt;a.length; i++)
      if (a[i].indexOf("#")!=0){ d.p[j]=new Image; d.p[j++].src=a[i];}}
  }

</script>

</head>
<body bgColor="#FFFFFF">
<xsl:attribute name="onLoad">PreloadImages('images/m1-l.gif','images/m1-r.gif','images/m2-l.gif','images/m2-r.gif','images/m3-l.gif','images/m3-r.gif','images/m4-l.gif','images/m4-r.gif','images/m5-l.gif','images/m5-r.gif','images/m7-l.gif','images/m7-r.gif','images/am1-l.gif','images/am1-r.gif','images/am2-l.gif','images/am2-r.gif','images/am3-l.gif','images/am3-r.gif','images/am4-l.gif','images/am4-r.gif','images/am5-l.gif','images/am5-r.gif','images/am7-l.gif','images/am7-r.gif')</xsl:attribute>

<div style="position: absolute; top: 5px; right: 10px;" class="langsw">
<xsl:choose>
 <xsl:when test="$lc/@lang!='en'"><a href="http://www.orgspace-consulting.com">english</a></xsl:when>
 <xsl:otherwise><a href="http://www.orgspace.ru">русский</a></xsl:otherwise>
</xsl:choose>

</div>


<div style="position: absolute; top: 1px;">


<xsl:choose>
 <xsl:when test="$content/welcome_view">

<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('main');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='products'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('products');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='services'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('services');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='services']">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Md=document;Mnv=navigator;Mp=1;
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mrn=Math.random();
Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&tl=0&ls=0&ln=0&t="+Mt;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mz+='&c='+Mc;
Mz+='&title='+escape(Md.title)+'&partname='+escape('services');
if(self!=top){Mfr=1;} else{Mfr=0;}
Msl="1.0";
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script>
<script language="javascript1.2"><!--         
Msl="1.2";
Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
Mu="u6229.97.spylog.com";My="";
My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&pg="+escape(window.location.href)+"' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='knowhow'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('knowhow');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 
 
 <xsl:when test="$content/container_view/list/bush_db[@walias='knowhow'] or $content/project_all or $content/project_search or $content/project_view or $content/project_reviews">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Md=document;Mnv=navigator;Mp=1;
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mrn=Math.random();
Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&tl=0&ls=0&ln=0&t="+Mt;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mz+='&c='+Mc;
Mz+='&title='+escape(Md.title)+'&partname='+escape('knowhow');
if(self!=top){Mfr=1;} else{Mfr=0;}
Msl="1.0";
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script>
<script language="javascript1.2"><!--         
Msl="1.2";
Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
Mu="u6229.97.spylog.com";My="";
My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&pg="+escape(window.location.href)+"' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='how2buy'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('how2buy');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='how2buy']">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Md=document;Mnv=navigator;Mp=1;
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mrn=Math.random();
Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&tl=0&ls=0&ln=0&t="+Mt;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mz+='&c='+Mc;
Mz+='&title='+escape(Md.title)+'&partname='+escape('how2buy');
if(self!=top){Mfr=1;} else{Mfr=0;}
Msl="1.0";
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script>
<script language="javascript1.2"><!--         
Msl="1.2";
Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
Mu="u6229.97.spylog.com";My="";
My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&pg="+escape(window.location.href)+"' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='about'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Mu="u6229.97.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&tl=0&ls=0&ln=0&t="+Mt;
Mz+='&title='+escape(Md.title)+'&partname='+escape('about');
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--         
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=0" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='about'] or $content/container_view/*/container_db/@walias='sitemap' or $content/container_view/*/container_db/@walias='ppolicy' or $content/container_view/*/container_db/@walias='faq' or $content/news_abc/child::* or $content/news_view/child::* or $content/usr_login or $content/usr_forgot or $content/register_add or $content/feedback_add or $content/manager_all">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Md=document;Mnv=navigator;Mp=1;
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mrn=Math.random();
Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&tl=0&ls=0&ln=0&t="+Mt;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mz+='&c='+Mc;
Mz+='&title='+escape(Md.title)+'&partname='+escape('about');
if(self!=top){Mfr=1;} else{Mfr=0;}
Msl="1.0";
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script>
<script language="javascript1.2"><!--         
Msl="1.2";
Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
Mu="u6229.97.spylog.com";My="";
My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&pg="+escape(window.location.href)+"' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:when> 

 <xsl:otherwise>
<xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0210 -->
<div STYLE="behavior:url(#default#clientCaps)" ID="MC"></div>
<script language="javascript"><!--
Md=document;Mnv=navigator;Mp=1;
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mrn=Math.random();
Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&tl=0&ls=0&ln=0&t="+Mt;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mz+='&c='+Mc;
Mz+='&title='+escape(Md.title)+'&partname='+escape('products');
if(self!=top){Mfr=1;} else{Mfr=0;}
Msl="1.0";
if(!Mn&&Mnv.userAgent.indexOf("Opera")<0&&Mnv.userAgent.indexOf("Mac")<0&&
(Mnv.appVersion.indexOf("MSIE 5")>-1||Mnv.appVersion.indexOf("MSIE 6")>-1))
{Mid="{D27CDB6E-AE6D-11CF-96B8-444553540000}";Midn="ComponentID";
Mfl=MC.getComponentVersion(Mid,Midn);Mct=MC.connectionType;Mz+='&fl='+Mfl+'&ct='+Mct;}
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script>
<script language="javascript1.2"><!--         
Msl="1.2";
Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
Mw=window;if(Mw.innerWidth){MwIW=Mw.innerWidth;MwIH=Mw.innerHeight;Mz+="&rwh="+MwIW+'x'+MwIH;} 
else if(Md.body.clientWidth){MwIW=Md.body.clientWidth;MwIH=Md.body.clientHeight;Mz+="&rwh="+MwIW+'x'+MwIH;}
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
Mu="u6229.97.spylog.com";My="";
My+="<img src='http://"+Mu+"/cnt?cid=622997&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&pg="+escape(window.location.href)+"' border=0  width=1 height=1  alt='SpyLOG'>";
Md.write(My);//--></script><noscript>
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1" alt='SpyLOG' border='0'  width=1 height=1 >
</noscript>
<!-- SpyLOG  -->
]]></xsl:text>
 </xsl:otherwise>
</xsl:choose>

<xsl:text disable-output-escaping="yes"><![CDATA[
<!--begin of Top100--> 
<a href="http://top100.rambler.ru/top100/"><img src="http://counter.rambler.ru/top100.cnt?683505" alt="Rambler's Top100" width=1 height=1 border=0></a>
<!--end of Top100 code--> 
]]></xsl:text>

</div>

<xsl:choose>
 <xsl:when test="$content/goods_shview/child::*">

	<xsl:apply-templates select="content"/>

 </xsl:when>

 <xsl:otherwise>

<xsl:choose>
 <xsl:when test="$content/container_pview/child::* or $content/manager_pall/child::* or $content/feedback_padd/child::* or ($content/*/@mod='print')">
   <xsl:call-template name="nav">
	<xsl:with-param name="printver" select="string('1')"/>  
   </xsl:call-template>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="nav">
	<xsl:with-param name="printver" select="string('0')"/>  
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>

<xsl:apply-templates select="content"/>


<!-- End Content -->
<xsl:choose>
<xsl:when test="not($content/container_pview/child::*) and not($content/welcome_view) and not($content/manager_pall/child::*) and not($content/feedback_padd/child::*) and not($content/*/@mod='print')">

<script language="JavaScript1.2">
<xsl:for-each select="$upmenu/bush_db">
 <xsl:choose>
  <xsl:when test="@walias='products'">
prod=new menu();
prod.name="1"; 
prod.color="9DB9D3"; 
prod.acolor="C4D5E5"; 
i=0;
 <xsl:for-each select="bush_db">
   prod.title[i]="<xsl:value-of select="@title"/>"; 
   prod.link[i]="<xsl:call-template name="get_link"><xsl:with-param name="bush" select='.'/></xsl:call-template>"; 
   i++;
 </xsl:for-each>

  </xsl:when>

  <xsl:when test="@walias='services'">
uslg=new menu();
uslg.name="2"; 
uslg.color="BEB3D2"; 
uslg.acolor="D8D1E4"; 
i=0;
 <xsl:for-each select="bush_db">
   uslg.title[i]="<xsl:value-of select="@title"/>"; 
   uslg.link[i]="<xsl:call-template name="get_link"><xsl:with-param name="bush" select='.'/></xsl:call-template>"; 
   i++;
 </xsl:for-each>

  </xsl:when>

  <xsl:when test="@walias='knowhow'">
khow=new menu();
khow.name="3"; 
khow.color="9DC787"; 
khow.acolor="C4DDB7"; 
i=0;
 <xsl:for-each select="bush_db">
   khow.title[i]="<xsl:value-of select="@title"/>"; 
   khow.link[i]="<xsl:call-template name="get_link"><xsl:with-param name="bush" select='.'/></xsl:call-template>"; 
   i++;
 </xsl:for-each>

  </xsl:when>

  <xsl:when test="@walias='how2buy'">
buy=new menu();
buy.name="4"; 
buy.color="B89F97"; 
buy.acolor="D4C5C1"; 
i=0;
 <xsl:for-each select="bush_db">
   buy.title[i]="<xsl:value-of select="@title"/>"; 
   buy.link[i]="<xsl:call-template name="get_link"><xsl:with-param name="bush" select='.'/></xsl:call-template>"; 
   i++;
 </xsl:for-each>

  </xsl:when>

  <xsl:when test="@walias='about'">
org=new menu();
org.name="5"; 
org.color="DECA77"; 
org.acolor="EBDFAD"; 
i=0;
 <xsl:for-each select="bush_db">
   org.title[i]="<xsl:value-of select="@title"/>"; 
   org.link[i]="<xsl:call-template name="get_link"><xsl:with-param name="bush" select='.'/></xsl:call-template>"; 
   i++;
 </xsl:for-each>

  </xsl:when>

 </xsl:choose>
</xsl:for-each>

</script>

<script language="JavaScript1.2" src="/scp/menu.js"></script>
</xsl:when>

<xsl:otherwise>
<script language="JavaScript1.2" src="/scp/menu_main.js"></script>
</xsl:otherwise>
</xsl:choose>

<xsl:call-template name="copy"/>

<xsl:apply-templates select="$user_menu"/>

 </xsl:otherwise>
</xsl:choose>

<xsl:if test="$content/welcome_view">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!--begin of Top100 logo--> 
<a href="http://top100.rambler.ru/top100/"><img src="http://top100-images.rambler.ru/top100/banner-88x31-rambler-gray2.gif" alt="Rambler's Top100" width=88 height=31 border=0></a>
<!--end of Top100 logo --> 
]]></xsl:text>
</xsl:if>


<xsl:choose>
 <xsl:when test="$content/welcome_view">

<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>

 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='products'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='services'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='services']">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='knowhow'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 
 
 <xsl:when test="$content/container_view/list/bush_db[@walias='knowhow'] or $content/project_all or $content/project_search or $content/project_view or $content/project_reviews">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='how2buy'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='how2buy']">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/*/container_db/@walias='about'">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:when test="$content/container_view/list/bush_db[@walias='about'] or $content/container_view/*/container_db/@walias='sitemap' or $content/container_view/*/container_db/@walias='ppolicy' or $content/container_view/*/container_db/@walias='faq' or $content/news_abc/child::* or $content/news_view/child::* or $content/usr_login or $content/usr_forgot or $content/register_add or $content/feedback_add or $content/manager_all">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:when> 

 <xsl:otherwise>
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="javascript"><!--
Mrn=Math.random();Mz="";
My="<a href='http://u6229.97.spylog.com/cnt?cid=622997&f=3&rn="+Mrn+"' target='_blank'><img src='http://u6229.97.spylog.com/cnt?cid=622997&";
My+="p=1&f=4&rn="+Mrn+Mz+"' border=0  width=1 height=1   alt='SpyLOG'></a>";Md.write(My); 
//--></script><noscript>
<a href="http://u6229.97.spylog.com/cnt?cid=622997&f=3&p=1" target="_blank">
<img src="http://u6229.97.spylog.com/cnt?cid=622997&p=1&f=4" alt='SpyLOG' border='0'  width=1 height=1 ></a> 
</noscript>
]]></xsl:text>
 </xsl:otherwise>
</xsl:choose>


</body>
</html>

</xsl:template>

<xsl:template name="get_link">
<xsl:param name="bush"/>

<xsl:choose>
 <xsl:when test="$bush/@type=2"><xsl:value-of select="$bush/@url"/></xsl:when>
 <xsl:when test="$bush/@type=0">container-view?obj=<xsl:value-of select="$bush/@container"/></xsl:when>
 <xsl:when test="$bush/@type=1"> <!-- LINK_INTERNAL-->
  <xsl:choose>
   <xsl:when test="$bush/@target_type=2"><xsl:value-of select="$bush/@url"/></xsl:when>
   <xsl:otherwise>container-view?obj=<xsl:value-of select="$bush/@target_container"/></xsl:otherwise>
  </xsl:choose>
 </xsl:when>
</xsl:choose>

</xsl:template>

<xsl:template match="/ru_print">

<html>
<head>
<link rel="stylesheet" type="text/css" href="/scp/main.css"/>
<link rel="stylesheet" type="text/css" href="/scp/mifors.css"/>

<xsl:call-template name="show_tkd"/>

<script language="JavaScript1.2" src="/scp/m.js"></script>
<script>
  function openwin(url,w,h){
    var w; 
    w=window.open(url,"Orgspace","height="+h+",width="+w+",left=10,top=10,scrollbars=no,resizable=yes");
    w.focus();
  }
</script>
</head>
<body bgColor="#FFFFFF">


<xsl:choose>
 <xsl:when test="$content/goods_shview/child::*">

	<xsl:apply-templates select="content"/>

 </xsl:when>

 <xsl:otherwise>

   <xsl:call-template name="nav">
	<xsl:with-param name="printver" select="string('1')"/>  
   </xsl:call-template>

<xsl:apply-templates select="content"/>


<!-- End Content -->

<script language="JavaScript1.2" src="/scp/menu_main.js"></script>

<xsl:call-template name="copy"/>

 </xsl:otherwise>
</xsl:choose>

</body>
</html>

</xsl:template>

<xsl:template name="show_tkd">

<title>Orgspace 
<xsl:choose>
<xsl:when test="$content/container_view/container_db/@bwtitle!=''"> - <xsl:value-of select="$content/container_view/container_db/@bwtitle"/></xsl:when>
<xsl:when test="$content/container_view/container_db/@title!=''"> - <xsl:value-of select="$content/container_view/container_db/@title"/></xsl:when>
<xsl:when test="$content/container_pview/container_db/@bwtitle!=''"> - <xsl:value-of select="$content/container_pview/container_db/@bwtitle"/></xsl:when>
<xsl:when test="$content/container_pview/container_db/@title!=''"> - <xsl:value-of select="$content/container_pview/container_db/@title"/></xsl:when>
<xsl:when test="$wrapper/container_db/@bwtitle!=''"> - <xsl:value-of select="$wrapper/container_db/@bwtitle"/></xsl:when>
<xsl:when test="$wrapper/container_db/@title!=''"> - <xsl:value-of select="$wrapper/container_db/@title"/></xsl:when>
<!-- <xsl:when test="$content/*/title/@title!=''"> - <xsl:value-of select="$content/*/title/@title"/></xsl:when> -->
<xsl:otherwise>
   <xsl:call-template name="show_func_title">
	<xsl:with-param name="func" select="$content/*[1]"/>
   </xsl:call-template>
</xsl:otherwise>
</xsl:choose>

<!--
<xsl:if test="$content/container_view/container_db/@title!=''"> - <xsl:value-of select="$content/container_view/container_db/@title"/></xsl:if>
<xsl:if test="$content/container_pview/container_db/@title!=''"> - <xsl:value-of select="$content/container_pview/container_db/@title"/></xsl:if>
<xsl:if test="$content/*/title/@title!=''"> - <xsl:value-of select="$content/*/title/@title"/></xsl:if>
<xsl:if test="$wrapper/container_db/@title!=''"> - <xsl:value-of select="$wrapper/container_db/@title"/></xsl:if>
-->

</title>

<meta name="keywords">
<xsl:attribute name="content">
<xsl:choose>
<xsl:when test="$content/container_view/container_db/@keywords!=''">
<xsl:value-of select="$content/container_view/container_db/@keywords"/>
</xsl:when>
<xsl:when test="$content/container_pview/container_db/@keywords!=''">
<xsl:value-of select="$content/container_pview/container_db/@keywords"/>
</xsl:when>
<xsl:when test="$wrapper/container_db/@keywords!=''">
<xsl:value-of select="$wrapper/container_db/@keywords"/>
</xsl:when>
</xsl:choose>
</xsl:attribute>
</meta>

<meta name="description">
<xsl:attribute name="content">
<xsl:choose>
<xsl:when test="$content/container_view/container_db/@description!=''">
<xsl:value-of select="$content/container_view/container_db/@description"/>
</xsl:when>
<xsl:when test="$content/container_pview/container_db/@description!=''">
<xsl:value-of select="$content/container_pview/container_db/@description"/>
</xsl:when>
<xsl:when test="$wrapper/container_db/@description!=''">
<xsl:value-of select="$wrapper/container_db/@description"/>
</xsl:when>
</xsl:choose>
</xsl:attribute>
</meta>

</xsl:template>

<xsl:template name="show_func_title">
<xsl:param name="func"/>

<xsl:choose>
<xsl:when test="name($func)='serial_all'">
<xsl:value-of select="$lc/serial/@name"/>
</xsl:when>
<xsl:when test="name($func)='serial_view'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/>
</xsl:when>
<xsl:when test="name($func)='serial_addinf'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/description"/>
</xsl:when>
<xsl:when test="name($func)='serial_color'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/color"/>
</xsl:when>
<xsl:when test="name($func)='serial_example'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/example"/>
</xsl:when>
<xsl:when test="name($func)='serial_accessories'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/accessories"/>
</xsl:when>
<xsl:when test="name($func)='serial_elements'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/elements"/>
</xsl:when>
<xsl:when test="name($func)='serial_arrange'">
<xsl:value-of select="$lc/serial/@name"/> - <xsl:value-of select="$func/serial_db/@name"/> - <xsl:value-of select="$lc/serial/arrange"/>
</xsl:when>

<xsl:when test="name($func)='zone_all'">
<xsl:value-of select="$lc/zone/@name"/>
</xsl:when>
<xsl:when test="name($func)='zone_view'">
<xsl:value-of select="$lc/zone/@name"/> - <xsl:value-of select="$func/zone_db/@name"/> 
</xsl:when>
<xsl:when test="name($func)='zone_example'">
<xsl:value-of select="$lc/zone/@name"/> - <xsl:value-of select="$func/zone_db/@name"/> - <xsl:value-of select="$lc/zone/example"/>
</xsl:when>
<xsl:when test="name($func)='zone_solution'">
<xsl:value-of select="$lc/zone/@name"/> - <xsl:value-of select="$func/zone_db/@name"/> - <xsl:value-of select="$lc/zone/solution"/>
</xsl:when>
<xsl:when test="name($func)='zone_arrange'">
<xsl:value-of select="$lc/zone/@name"/> - <xsl:value-of select="$func/zone_db/@name"/> - <xsl:value-of select="$lc/zone/arrange"/>
</xsl:when>

<xsl:when test="name($func)='design_all'">
<xsl:value-of select="$lc/design/@name"/>
</xsl:when>
<xsl:when test="name($func)='design_view'">
<xsl:value-of select="$lc/design/@name"/> - <xsl:value-of select="$func/design_db/@name"/> 
</xsl:when>
<xsl:when test="name($func)='design_example'">
<xsl:value-of select="$lc/design/@name"/> - <xsl:value-of select="$func/design_db/@name"/> - <xsl:value-of select="$lc/design/example"/>
</xsl:when>
<xsl:when test="name($func)='design_solution'">
<xsl:value-of select="$lc/design/@name"/> - <xsl:value-of select="$func/design_db/@name"/> - <xsl:value-of select="$lc/design/solution"/>
</xsl:when>
<xsl:when test="name($func)='design_arrange'">
<xsl:value-of select="$lc/design/@name"/> - <xsl:value-of select="$func/design_db/@name"/> - <xsl:value-of select="$lc/design/arrange"/>
</xsl:when>

<xsl:when test="name($func)='predmet_all'">
<xsl:value-of select="$lc/predmet/@name"/>
</xsl:when>
<xsl:when test="name($func)='predmet_view'">
<xsl:value-of select="$lc/predmet/@name"/> - <xsl:value-of select="$func/predmet_db/@name"/> 
</xsl:when>
<xsl:when test="name($func)='predmet_assortment'">
<xsl:value-of select="$lc/predmet/@name"/> - <xsl:value-of select="$func/predmet_db/@name"/> - <xsl:value-of select="$lc/predmet/assortment"/>
</xsl:when>
<xsl:when test="name($func)='predmet_gallery'">
<xsl:value-of select="$lc/predmet/@name"/> - <xsl:value-of select="$func/predmet_db/@name"/> - <xsl:value-of select="$lc/predmet/solution"/> - <xsl:value-of select="$lc/predmet/@gallery"/>
</xsl:when>

<xsl:when test="name($func)='goods_view'">
<xsl:value-of select="$lc/goods/@name"/> - <xsl:value-of select="$func/predmet_db/@short_name"/> - <xsl:value-of select="$func/goods_db/@name"/> 
</xsl:when>
<xsl:when test="name($func)='goods_shview'">
<xsl:value-of select="$lc/goods/@name"/> - <xsl:value-of select="$func/goods_db/@name"/> 
</xsl:when>

<xsl:when test="name($func)='gtype_view'">
<xsl:value-of select="$lc/gtype/@name"/> - <xsl:value-of select="$func/predmet_db/@short_name"/> - <xsl:value-of select="$func/gtype_db/@name"/> 
</xsl:when>
<xsl:when test="name($func)='gtype_shview'">
<xsl:value-of select="$lc/gtype/@name"/> - <xsl:value-of select="$func/gtype_db/@name"/> 
</xsl:when>

</xsl:choose>
</xsl:template>


</xsl:stylesheet>
