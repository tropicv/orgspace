<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../serial/serialblock.xsl"/>


<xsl:template match="serial_arrange"> 

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

<xsl:call-template name="serialmenu">
 <xsl:with-param name="serial" select="serial_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>

<xsl:if test="$admin=1">
[<a href="serial-edit?obj={serial_db/@id}">Редактировать серию</a>]
[<a href="container-managewrapper?i=serial&amp;m=arrange&amp;walias={serial_db/@walias}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:if>


</xsl:template>

<xsl:template match="serial_arrange" mode="title"> 
<a class="white" href="serial-view?walias={serial_db/@walias}"><xsl:value-of select="serial_db/@short_name"/></a>
</xsl:template>

<xsl:template match="serial_arrange" mode="path"> 

<xsl:variable name="serial" select="serial_db"/>

<div class="path">
<xsl:call-template name="serialpath"/>
<a href="serial-all"><xsl:value-of select="$lc/serial/@name"/></a> : 
<a href="serial-view?walias={$serial/@walias}"><xsl:value-of select="$serial/@name"/></a> :
<xsl:value-of select="$lc/serial/arrange"/>
</div>

</xsl:template>

<xsl:template match="serial_arrange" mode="left_start"> 
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat(serial_db/@id,'_4'))"/>
          <xsl:with-param name="type" select="serial_db/add_foto"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='serial_db/@name'/>
   </xsl:call-template>
</xsl:template>

<xsl:template match="serial_arrange" mode="left_end"> 
</xsl:template>

<xsl:template match="serial_arrange" mode="content_title"> 
 <xsl:value-of select="serial_db/@name"/>
</xsl:template>

<xsl:template match="serial_arrange" mode="content_start"> 
</xsl:template>

<xsl:template match="serial_arrange" mode="content_end"> 
</xsl:template>

<xsl:template match="serial_arrange" mode="right_start"> 

<xsl:variable name="serial" select="serial_db"/>

<xsl:call-template name="serialrmenu">
       <xsl:with-param name="cur" select='string("arrange")'/>
       <xsl:with-param name="serial" select='serial_db'/>
</xsl:call-template>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0"/><br/></td>
</tr>
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="serial-all"><xsl:value-of select="$lc/serial/other"/></a></div></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
</tr>


</xsl:template>

<xsl:template match="serial_arrange" mode="right_end"> 
</xsl:template>

<xsl:template match="serial_arrange" mode="under_start"> 
</xsl:template>

<xsl:template match="serial_arrange" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>

