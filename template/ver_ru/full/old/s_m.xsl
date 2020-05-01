<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="ver_ru/full/user_menu.xsl"/>
<xsl:include href="ver_ru/full/nav.xsl"/>

<xsl:template match="/ru_full">

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

<title>Orgspace<xsl:if test="$content/container_view/container_db/@title!=''"> - <xsl:value-of select="$content/container_view/container_db/@title"/></xsl:if>
<xsl:if test="$content/container_pview/container_db/@title!=''"> - <xsl:value-of select="$content/container_pview/container_db/@title"/></xsl:if>
<xsl:if test="$content/*/title/@title!=''"> - <xsl:value-of select="$content/*/title/@title"/></xsl:if>
</title>

<meta name="keywords">
<xsl:attribute name="content">
<xsl:if test="$content/container_view/container_db/@keywords!=''">
<xsl:value-of select="$content/container_view/container_db/@keywords"/>
</xsl:if>
<xsl:if test="$content/container_pview/container_db/@keywords!=''">
<xsl:value-of select="$content/container_pview/container_db/@keywords"/>
</xsl:if>
<xsl:if test="$wrapper/container_db/@keywords!=''">
<xsl:value-of select="$wrapper/container_db/@keywords"/>
</xsl:if>
</xsl:attribute>
</meta>

<meta name="description">
<xsl:attribute name="content">
<xsl:if test="$content/container_view/container_db/@description!=''">
<xsl:value-of select="$content/container_view/container_db/@description"/>
</xsl:if>
<xsl:if test="$content/container_pview/container_db/@description!=''">
<xsl:value-of select="$content/container_pview/container_db/@description"/>
</xsl:if>
<xsl:if test="$wrapper/container_db/@description!=''">
<xsl:value-of select="$wrapper/container_db/@description"/>
</xsl:if>
</xsl:attribute>
</meta>

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


<xsl:choose>
 <xsl:when test="$content/goods_shview/child::*">

	<xsl:apply-templates select="content"/>

 </xsl:when>

 <xsl:otherwise>

<xsl:choose>
 <xsl:when test="$content/container_pview/child::* or $content/manager_pall/child::* or $content/feedback_padd/child::* or ($content/*/@mod='print')">
   <xsl:call-template name="simple_nav"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="nav"/>
 </xsl:otherwise>
</xsl:choose>

<xsl:apply-templates select="content"/>


<!-- End Content -->

<xsl:if test="not($content/container_pview/child::*) and not($content/welcome_view) and not($content/manager_pall/child::*) and not($content/feedback_padd/child::*) and not($content/*/@mod='print')">

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
</xsl:if>

<xsl:if test="$content/welcome_view">
<script language="JavaScript1.2" src="/scp/menu_main.js"></script>
</xsl:if>

<xsl:call-template name="copy"/>

<xsl:apply-templates select="$user_menu"/>

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
<title>
Orgspace
<xsl:if test="$content/container_view/container_db/@title!=''">
- <xsl:value-of select="$content/container_view/container_db/@title"/>
</xsl:if>
<xsl:if test="$content/container_pview/container_db/@title!=''">
- <xsl:value-of select="$content/container_pview/container_db/@title"/>
</xsl:if>
<xsl:if test="$content/*/title/@title!=''">
- <xsl:value-of select="$content/*/title/@title"/>
</xsl:if>
</title>
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

   <xsl:call-template name="simple_nav"/>

<xsl:apply-templates select="content"/>


<!-- End Content -->

<xsl:call-template name="copy"/>

 </xsl:otherwise>
</xsl:choose>


</body>
</html>

</xsl:template>


</xsl:stylesheet>
