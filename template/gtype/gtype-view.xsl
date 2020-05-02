<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../gtype/gtypeblock.xsl"/>
<xsl:include href="../predmet/predmetblock.xsl"/>


<xsl:template match="gtype_view"> 

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
[<a href="gtype-edit?obj={gtype_db/@id}">Редактировать тип</a>]
[<a href="gtype-add">Добавить тип</a>]
<xsl:choose>
<xsl:when test="predmet_db/child::*">
[<a href="container-managewrapper?i=gtype&amp;m=view&amp;obj={gtype_db/@id}&amp;predmet={predmet_db/@id}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=gtype&amp;m=view&amp;obj={gtype_db/@id}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


<xsl:if test="$print!=1">
<xsl:call-template name="predmetmenu">
 <xsl:with-param name="predmet" select="predmet_db/@walias"/>
 <xsl:with-param name="list" select="list_all_predmet"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>
</xsl:if>

</xsl:template>

<xsl:template match="gtype_view" mode="title"> 
<a class="white" href="predmet-view?walias={predmet_db/@walias}"><xsl:value-of select="predmet_db/@short_name"/></a>
</xsl:template>

<xsl:template match="gtype_view" mode="path"> 

<xsl:variable name="gtype" select="gtype_db"/>
<xsl:variable name="predmet" select="predmet_db"/>

<div class="path">
<xsl:call-template name="gtypepath"/>
<a href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a> : 
<xsl:if test="predmet_db/child::*">
<a href="predmet-view?walias={$predmet/@walias}"><xsl:value-of select="$predmet/@short_name"/></a> : 
</xsl:if>
<xsl:value-of select="$gtype/@name"/>
</div>

</xsl:template>

<xsl:template match="gtype_view" mode="left_start"> 
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('gtype_',concat(gtype_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="gtype_db/foto"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='gtype_db/@name'/>
   </xsl:call-template>
</xsl:template>

<xsl:template match="gtype_view" mode="left_end"> 
</xsl:template>

<xsl:template match="gtype_view" mode="content_title"> 
<!--predmet_db-->
 <xsl:value-of disable-output-escaping="yes" select="gtype_db/@name"/>
</xsl:template>

<xsl:template match="gtype_view" mode="content_start"> 
<!-- <h2><xsl:value-of select="gtype_db/@name"/>: дополнительная информация</h2>
 <xsl:value-of select="gtype_db/@description" disable-output-escaping="yes"/>-->
</xsl:template>

<xsl:template match="gtype_view" mode="content_end"> 
</xsl:template>

<xsl:template match="gtype_view" mode="right_start"> 


<xsl:choose>
<xsl:when test="predmet_db/child::*">
<xsl:variable name="predmet" select="predmet_db"/>
 <xsl:for-each select="list_all_gtype/list_one">

<xsl:choose>
<xsl:when test="@id=../../gtype_db/@id">
 <!--div class="current"><xsl:value-of select="@name"/></div-->
 <tr>
  <td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
  <td class="wtext">
   <div class="rmenu">
    <xsl:value-of select="@name"/>
   </div>
  </td>
 </tr>
</xsl:when>
<xsl:otherwise>
 <!--div><a href="gtype-view?obj={@id}&amp;predmet={$predmet/@id}"><xsl:value-of select="@name"/></a></div-->
 <tr>
  <td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
  <td class="wtext">
   <div class="rmenu">
    <a href="gtype-view?obj={@id}&amp;predmet={$predmet/@id}"><xsl:value-of select="@name"/></a>
   </div>
  </td>
 </tr>
</xsl:otherwise>
</xsl:choose>

 </xsl:for-each>
</xsl:when>
<xsl:otherwise>
 <xsl:for-each select="list_all_gtype/list_one">

<xsl:choose>
<xsl:when test="@id=../../gtype_db/@id">
 <!--div class="current"><xsl:value-of select="@name"/></div-->
 <tr>
  <td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
  <td class="wtext">
   <div class="rmenu">
    <xsl:value-of select="@name"/>
   </div>
  </td>
 </tr>
</xsl:when>
<xsl:otherwise>
 <!--div><a href="gtype-view?obj={@id}"><xsl:value-of select="@name"/></a></div-->
  <tr>
  <td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
  <td class="wtext">
   <div class="rmenu">
    <a href="gtype-view?obj={@id}"><xsl:value-of select="@name"/></a>
   </div>
  </td>
 </tr>
</xsl:otherwise>
</xsl:choose>

 </xsl:for-each>
</xsl:otherwise>
</xsl:choose>




<xsl:if test="predmet_db/@sh_fotogal=1">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div class="rmenu"><a href="predmet-gallery?walias={predmet_db/@walias}"><xsl:value-of select="$lc/predmet/gallery"/></a></div></td>
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
 <td class="wtext">
  <div name="orgmenu11head" id="orgmenu11head">
   <a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="predmet-all">
    <xsl:value-of select="$lc/predmet/other"/>
   </a>
  </div>
 </td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
</tr>


</xsl:template>

<xsl:template match="gtype_view" mode="right_end"> 
</xsl:template>

<xsl:template match="gtype_view" mode="under_start"> 

<!--
<xsl:choose>
<xsl:when test="predmet_db/child::*">
<xsl:variable name="predmet" select="predmet_db"/>
 <xsl:for-each select="list_all_gtype/list_one">

<xsl:choose>
<xsl:when test="@id=../../gtype_db/@id">
 <div class="current"><xsl:value-of select="@name"/></div>
</xsl:when>
<xsl:otherwise>
 <div><a href="gtype-view?obj={@id}&amp;predmet={$predmet/@id}"><xsl:value-of select="@name"/></a></div>
</xsl:otherwise>
</xsl:choose>

 </xsl:for-each>
</xsl:when>
<xsl:otherwise>
 <xsl:for-each select="list_all_gtype/list_one">

<xsl:choose>
<xsl:when test="@id=../../gtype_db/@id">
 <div class="current"><xsl:value-of select="@name"/></div>
</xsl:when>
<xsl:otherwise>
 <div><a href="gtype-view?obj={@id}"><xsl:value-of select="@name"/></a></div>
</xsl:otherwise>
</xsl:choose>

 </xsl:for-each>
</xsl:otherwise>
</xsl:choose>
-->


</xsl:template>

<xsl:template match="gtype_view" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>


