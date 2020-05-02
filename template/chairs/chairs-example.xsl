<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../chairs/chairsblock.xsl"/>


<xsl:template match="chairs_example"> 

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

<xsl:call-template name="chairsmenu">
 <xsl:with-param name="chairs" select="chairs_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>

<xsl:if test="$admin=1">
[<a href="chairs-edit?obj={chairs_db/@id}">Редактировать кресла</a>]
[<a href="chairsitem-edit?obj={chairsitem_db/@id}">Редактировать экземпляр</a>]
[<a href="container-managewrapper?i=chairs&amp;m=example&amp;walias={chairs_db/@walias}&amp;obj={chairsitem_db/@id}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:if>


</xsl:template>

<xsl:template match="chairs_example" mode="title"> 
<a class="white" href="chairs-view?walias={chairs_db/@walias}"><xsl:value-of select="chairs_db/@short_name"/></a>
</xsl:template>

<xsl:template match="chairs_example" mode="path"> 

<xsl:variable name="chairs" select="chairs_db"/>

<div class="path">
<xsl:call-template name="chairspath"/>
<!--<a href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a> : -->
<a href="chairs-view?walias={$chairs/@walias}"><xsl:value-of select="$chairs/@name"/></a> :
<xsl:value-of select="chairsitem_db/@name"/>
</div>

</xsl:template>

<xsl:template match="chairs_example" mode="left_start"> 
   <!-- 2017-06-07 
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat(chairs_db/@id,'_4'))"/>
          <xsl:with-param name="type" select="chairs_db/add_foto"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='chairs_db/@name'/>
   </xsl:call-template>
   -->
</xsl:template>

<xsl:template match="chairs_example" mode="left_end"> 
</xsl:template>

<xsl:template match="chairs_example" mode="content_title"> 
 <xsl:value-of select="chairs_db/@name"/>
</xsl:template>

<xsl:template match="chairs_example" mode="content_start"> 
</xsl:template>

<xsl:template match="chairs_example" mode="content_end"> 
</xsl:template>

<xsl:template match="chairs_example" mode="right_start"> 

<xsl:variable name="chairs" select="chairs_db"/>
<xsl:variable name="chairsitem" select="chairsitem_db"/>

<xsl:for-each select="list_all_goods/list_one[@block!=1]">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot14" id="dot14"/><br/></td>
<td class="wtext"><div class="rmenu" name="orgmenu14head" id="orgmenu14head">
<xsl:choose>
<xsl:when test="$chairsitem/@id=@id"><xsl:value-of select="@name"/></xsl:when>
<xsl:otherwise><a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:for-each>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0"/><br/></td>
</tr>
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<!--
<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="chairs-all"><xsl:value-of select="$lc/chairs/other"/></a></div></td>
-->
<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="container-view?walias=chairs"><xsl:value-of select="$lc/chairs/other"/></a></div></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
</tr>


</xsl:template>

<xsl:template match="chairs_example" mode="right_end"> 
</xsl:template>

<xsl:template match="chairs_example" mode="under_start"> 
</xsl:template>

<xsl:template match="chairs_example" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>

