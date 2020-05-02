<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../zone/zoneblock.xsl"/>


<xsl:template match="zone_example"> 

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

<xsl:call-template name="zonemenu">
 <xsl:with-param name="zone" select="zone_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>

<xsl:if test="$admin=1">
[<a href="zone-edit?obj={zone_db/@id}">Редактировать зону</a>]
[<a href="container-managewrapper?i=zone&amp;m=example&amp;walias={zone_db/@walias}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:if>


</xsl:template>

<xsl:template match="zone_example" mode="title"> 
<a class="white" href="zone-view?walias={zone_db/@walias}"><xsl:value-of select="zone_db/@short_name"/></a>
</xsl:template>

<xsl:template match="zone_example" mode="path"> 

<xsl:variable name="zone" select="zone_db"/>

<div class="path">
<xsl:call-template name="zonepath"/>
<a href="zone-all"><xsl:value-of select="$lc/zone/@name"/></a> : 
<a href="zone-view?walias={$zone/@walias}"><xsl:value-of select="$zone/@short_name"/></a> :
<xsl:value-of select="$lc/zone/example"/>
</div>

</xsl:template>

<xsl:template match="zone_example" mode="left_start"> 
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat(zone_db/@id,'_4'))"/>
          <xsl:with-param name="type" select="zone_db/ex_foto"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='zone_db/@name'/>
   </xsl:call-template>
</xsl:template>

<xsl:template match="zone_example" mode="left_end"> 
</xsl:template>

<xsl:template match="zone_example" mode="content_title"> 
<xsl:value-of select="zone_db/@name"/>
</xsl:template>

<xsl:template match="zone_example" mode="content_start"> 
</xsl:template>

<xsl:template match="zone_example" mode="content_end"> 
</xsl:template>

<xsl:template match="zone_example" mode="right_start"> 

<xsl:call-template name="zonermenu">
       <xsl:with-param name="cur" select='string("example")'/>
       <xsl:with-param name="zone" select='zone_db'/>
</xsl:call-template>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0"/><br/></td>
</tr>
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="zone-all"><xsl:value-of select="$lc/zone/other"/></a></div></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
</tr>


</xsl:template>

<xsl:template match="zone_example" mode="right_end"> 
</xsl:template>

<xsl:template match="zone_example" mode="under_start"> 
</xsl:template>

<xsl:template match="zone_example" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>

