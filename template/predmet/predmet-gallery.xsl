<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../predmet/predmetblock.xsl"/>

<xsl:template match="predmet_gallery"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="goodsl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('prod')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
[<a href="container-managewrapper?i=predmet&amp;m=gallery&amp;walias={predmet_db/@walias}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:if>

<xsl:if test="$print!=1">
<xsl:call-template name="predmetmenu">
 <xsl:with-param name="predmet" select="predmet_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>
</xsl:if>

</xsl:template>

<xsl:template match="predmet_gallery" mode="title"> 
<a class="white" href="predmet-view?walias={predmet_db/@walias}"><xsl:value-of select="predmet_db/@short_name"/></a>
</xsl:template>

<xsl:template match="predmet_gallery" mode="path"> 

<xsl:variable name="predmet" select="predmet_db"/>


<div class="path">
<xsl:call-template name="predmetpath"/>
<a href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a> : 
<xsl:if test="predmet_db/child::*">
<a href="predmet-view?walias={$predmet/@walias}"><xsl:value-of select="$predmet/@short_name"/></a> : 
</xsl:if>
<xsl:value-of select="$lc/predmet/gallery"/>
</div>

</xsl:template>

<xsl:template match="predmet_gallery" mode="left_start"> 
</xsl:template>

<xsl:template match="predmet_gallery" mode="left_end"> 
</xsl:template>

<xsl:template match="predmet_gallery" mode="content_title"> 
<xsl:value-of select="predmet_db/@name"/>
</xsl:template>

<xsl:template match="predmet_gallery" mode="content_start"> 
</xsl:template>

<xsl:template match="predmet_gallery" mode="content_end"> 
<!--
<br/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">

<xsl:for-each select="list/gtype">
<xsl:if test="child::*">
<tr>
<td class="btm">
<h1><xsl:value-of select="@name"/></h1>
<xsl:if test="$admin=1">
[<a href="gtype-edit?obj={@id}">Редактировать тип</a>]
</xsl:if>

</td>

<td width="100%" class="btm">
<xsl:for-each select="goods_db">

<xsl:choose>
 <xsl:when test="@description!=''">
   <div class="fleft" style="margin-right: 5px; margin-bottom: 5px; ">
<a href="" onclick="javascript:openwin('goods-shview?obj={@id}',450,300); return false;">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('goods_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="max" select='string("52")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
  </div>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="res_image_stuff_pup_element_gal">
          <xsl:with-param name="id" select="concat('goods_',concat(@id,'_2'))"/>
          <xsl:with-param name="idb" select="concat('goods_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="typeb" select="foto"/>
          <xsl:with-param name="max" select='string("52")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>

<xsl:if test="$admin=1">
<div class="fleft" >
[<a href="goods-edit?obj={@id}">Edit</a>]<br/>
[<a href="goods-del?obj={@id}">Del</a>]<br/>
</div>
</xsl:if>

</xsl:for-each>
</td>
</tr>

<tr>
<td colspan="2" style="background: #E2E4E3;"><img src="/images/dot.gif" width="1" height="2" /></td>
</tr>
</xsl:if>
</xsl:for-each>


<tr>
<td><img src="/images/dot.gif" width="60" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="260" height="1" border="0"/><br/></td>
</tr>

</table>
-->
</xsl:template>

<xsl:template match="predmet_gallery" mode="right_start"> 


<xsl:if test="predmet_db/@sh_fotogal=1">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div class="rmenu">фотогалерея</div></td>
</tr>
</xsl:if>

<xsl:if test="predmet_db/@sh_assort=1">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div class="rmenu"><a href="predmet-assortment?walias={predmet_db/@walias}"><xsl:value-of select="$lc/predmet/assortment"/></a></div></td>
</tr>
</xsl:if>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0"/><br/></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="predmet-all"><xsl:value-of select="$lc/predmet/other"/></a></div></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
</tr>

</xsl:template>

<xsl:template match="predmet_gallery" mode="right_end"> 
</xsl:template>

<xsl:template match="predmet_gallery" mode="under_start"> 

<xsl:choose>
<xsl:when test="predmet_db/@sh_type=1">
<xsl:for-each select="list_goods_or_type/gtype">
 <div><a href="gtype-view?obj={@id}&amp;predmet={../../predmet_db/@id}"><xsl:value-of select="@name"/></a></div>
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="list_goods_or_type/goods">
 <div><a href="goods-view?obj={@id}"><xsl:value-of select="@name"/></a></div>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>

</xsl:template>

<xsl:template match="predmet_gallery" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>


