<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../predmet/predmetblock.xsl"/>
<xsl:include href="../layout/layoutblock.xsl"/> 


<xsl:template match="predmet_view"> 

<xsl:variable name="predmet" select="predmet_db"/>

<div class="path">
<xsl:call-template name="predmetpath"/>
<a href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a> : 
<xsl:value-of select="$predmet/@short_name"/>
</div>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">

<tr>
<td rowspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('predmet_',concat($predmet/@id,'_3'))"/>
          <xsl:with-param name="type" select="$predmet/baner"/>
          <xsl:with-param name="max" select='string("358")'/>
          <xsl:with-param name="alt" select='$predmet/@name'/>
   </xsl:call-template><br/>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td class="wtext" valign="top" width="100%" >
<div class="wtitle" style="float: left;">
<xsl:value-of select="$predmet/@short_name"/>
</div>

<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a>
</div>
<br/>
<h1><xsl:value-of select="$predmet/@slogan"/></h1>
<xsl:value-of select="$predmet/@baner_text" disable-output-escaping="yes"/>
<br/>
<xsl:value-of select="$predmet/@description" disable-output-escaping="yes"/>
</td>
<td align="right" valign="top">
<img src="/images/c-tr.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>


<tr>
<td valign="bottom">
<img src="/images/c-bl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td valign="bottom">

<table border="0" cellspacing="0" cellpadding="0">

<tr>

<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>

<xsl:if test="$predmet/@sh_fotogal=1">
<td class="wmenu" nowrap="nowrap"><div><a href="predmet-gallery?walias={$predmet/@walias}"><xsl:value-of select="$lc/predmet/gallery"/></a></div></td>
</xsl:if>

<xsl:if test="$predmet/@sh_assort=1">
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
<td class="wmenu" nowrap="nowrap"><div><a href="predmet-assortment?walias={$predmet/@walias}"><xsl:value-of select="$lc/predmet/assortment"/></a></div></td>
</xsl:if>

<td width="100%"><img src="/images/dot.gif" width="13" height="1" border="0" /><br/></td>

<td><img src="/images/dot.gif" width="13" height="1" border="0" name="dot11" id="dot11"/><br/></td>
<td><img src="/images/dot.gif" width="20" height="1" border="0" /><br/></td>
<td class="wmenu" nowrap="nowrap"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="predmet-all"><xsl:value-of select="$lc/predmet/other"/></a></div></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" /><br/></td>

<!--
<xsl:call-template name="predmetmenu">
 <xsl:with-param name="predmet" select="$predmet/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
</xsl:call-template>
-->
</tr>
</table>
<img src="/images/dot.gif" width="1" height="9" border="0"/><br/>
</td>
<td align="right" valign="bottom">
<img src="/images/c-br.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="358" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="390" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>

</table>

<!--xsl:if test="predmet_db/@sh_promo=0"-->

<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<xsl:choose>
<xsl:when test="$predmet/@sh_type=1">
<table border="0" cellspacing="0" cellpadding="0" class="catimg" width="100%">
<tr>

<xsl:for-each select="list/gtype_db">

<!-- <xsl:if test="@walias='table' or @walias='pedestal' or @walias='cupboard'"> -->

<td valign="top">

<table border="0" cellspacing="0" cellpadding="0" class="tmbimg" width="60">
<tr><td align="center">
<a href="gtype-view?obj={@id}&amp;predmet={$predmet/@id}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('gtype_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <!--xsl:with-param name="max" select='string("52")'/-->
	  <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
</td></tr>
<tr><td align="center">
<a href="gtype-view?obj={@id}&amp;predmet={$predmet/@id}"><xsl:value-of select="@name"/></a>
</td></tr>
</table>

</td>
<td><img src="/images/dot.gif" width="20" height="1" border="0" /><br/></td>

<!-- </xsl:if> -->

</xsl:for-each> 

</tr>

</table>


</xsl:when>
<xsl:otherwise>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="catimg">
<tr>

<xsl:for-each select="list/goods_db">
<td>

<table border="0" cellspacing="0" cellpadding="0" class="tmbimg">
<tr><td>
<a href="goods-view?obj={@id}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('goods_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <!--xsl:with-param name="max" select='string("52")'/-->
	  <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
</td></tr>
<tr><td align="center">
<a href="goods-view?obj={@id}"><xsl:value-of select="@name"/></a>
</td></tr>
</table>

</td>
</xsl:for-each> 

</tr>

</table>

</xsl:otherwise>
</xsl:choose>
<!--/xsl:if-->
<br/>

<xsl:if test="predmet_db/@sh_promo=1">
 <xsl:call-template name="bottom_promo"/>
</xsl:if>

<br/>
<xsl:if test="$admin=1">
[<a href="predmet-edit?obj={$predmet/@id}">Редактировать группу</a>]<br/>

<xsl:if test="$predmet/@sh_type=1">
[<a href="gtype-add">Добавить тип</a>]<br/>
</xsl:if>

[<a href="goods-add?obj={$predmet/@id}">Добавить предмет</a>]<br/>
[<a href="container-managewrapper?i=predmet&amp;m=view&amp;walias={$predmet/@walias}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]

</xsl:if>

<xsl:call-template name="predmetmenu">
 <xsl:with-param name="predmet" select="$predmet/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('main')"/>
</xsl:call-template>

</xsl:template>
</xsl:stylesheet>
