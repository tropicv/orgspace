<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
<!--<xsl:include href="../util/util.xsl"/> 
<xsl:include href="../layout/layoutblock.xsl"/> -->
<xsl:include href="../clip/clip-view.xsl"/>
<xsl:include href="../promo/promo-view.xsl"/> 
<xsl:include href="../layout/main.xsl"/> 

<xsl:template match="welcome_view"> 

<div class="path">Orgspace</div>

<!-- 26.10.16
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">

<tr><td  bgcolor="#747474"><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>
-->
<!-- <tr><td><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>  -->

<!-- 26.10.16
<tr>
<td>
-->
<!---
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
 WIDTH="780" HEIGHT="193">
 <PARAM NAME="movie" VALUE="/images/main.swf"/> 
 <PARAM NAME="quality" VALUE="high"/> 
 <PARAM NAME="bgcolor" VALUE="#FFFFFF"/> 
 <EMBED src="/images/main.swf" quality="high" bgcolor="#FFFFFF"  WIDTH="780" HEIGHT="193" TYPE="application/x-shockwave-flash" PLUGINSPAGE="//www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED>
</OBJECT>
-->
<!-- old banners vkluchen 27.10.2016 -->
<!-- off 15/12/2016 -->
<!-- <xsl:call-template name="promoview">
	<xsl:with-param name="promo" select="//promo_db"/>
 </xsl:call-template>-->

<div class="main-page-slider"></div>

<!-- 26.10.16
 <div align="center">
  <iframe src="/scp/banner12_9_3/banner12_9_3.html" width="1200" height="500" style="border:none;margin-top:1px;">
  </iframe>
 </div>
-->
<!-- 26.10.16
</td>
</tr>

<tr><td><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>
</table>
-->

 <xsl:if test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:if>

<xsl:call-template name="bottom_promo"/>

<xsl:if test="$admin=1">
<!-- [<a href="container-managewrapper?i=welcome&amp;m=view&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>] -->
[<a href="container-managewrapper?i=welcome&amp;m=view&amp;creator=container.view.mainnew" target="blank">Редактировать шаблон</a>]
</xsl:if>

</xsl:template>
</xsl:stylesheet>
