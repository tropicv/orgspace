<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../zone/zoneblock.xsl"/>
<xsl:include href="../layout/layoutblock.xsl"/> 


<xsl:template match="zone_view"> 

<xsl:variable name="zone" select="zone_db"/>

<div class="path">
<xsl:call-template name="zonepath"/>
<a href="zone-all"><xsl:value-of select="$lc/zone/@name"/></a> : 
<xsl:value-of select="$zone/@short_name"/>
</div>


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">

<tr>
<td rowspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat($zone/@id,'_3'))"/>
          <xsl:with-param name="type" select="$zone/baner"/>
          <xsl:with-param name="max" select='string("358")'/>
          <xsl:with-param name="alt" select='$zone/@name'/>
   </xsl:call-template><br/>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>

<td class="wtext" valign="top" width="100%" >
<div class="wtitle" style="float: left;">
<xsl:value-of select="$zone/@short_name"/>
</div>

<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="zone-all"><xsl:value-of select="$lc/zone/@name"/></a>
</div>
<br/>
<h1><xsl:value-of select="$zone/@slogan"/></h1>
<xsl:value-of select="$zone/@baner_text" disable-output-escaping="yes"/>
<br/>
<xsl:value-of select="$zone/@description" disable-output-escaping="yes"/>
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
<xsl:if test="$zone/@sh_sol!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
<xsl:if test="$zone/@walias='workplaces'">
<td class="wmenu" nowrap="nowrap"><div ><a href="/container-view?obj=711">bench-системы</a></div></td>
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
</xsl:if>
<td class="wmenu" nowrap="nowrap"><div ><a href="zone-solution?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/solution"/></a></div></td>
</xsl:if>
<xsl:if test="$zone/@sh_ex!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wmenu" nowrap="nowrap"><div ><a href="zone-example?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/example"/></a></div></td>
</xsl:if>
<xsl:if test="$zone/@sh_arr!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
<td class="wmenu" nowrap="nowrap"><div ><a href="zone-arrange?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/arrange"/></a></div></td>
</xsl:if>
<td width="100%"><img src="/images/dot.gif" width="13" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="13" height="1" border="0" name="dot11" id="dot11"/><br/></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" /><br/></td>
<td class="wmenu" nowrap="nowrap"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="zone-all"><xsl:value-of select="$lc/zone/other"/></a></div></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" /><br/></td>
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


<xsl:if test="zone_db/@sh_fotogal=1">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="catimg">
<tr>

<xsl:for-each select="list/imagegal_db">

<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
   <xsl:call-template name="res_image_stuff_pup">
          <xsl:with-param name="id" select="concat('imagegal_',concat(@id,'_2'))"/>
          <xsl:with-param name="idb" select="concat('imagegal_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="typeb" select="foto"/>
          <xsl:with-param name="max" select='string("106")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>
<xsl:if test="$admin=1">
[<a href="album-edit?obj={@id}">Edit</a>]
[<a href="album-del?obj={@id}">Del</a>]
</xsl:if>
</td>

<xsl:if test="(position() mod 6 = 0) and (position()!=last())">
      <xsl:text disable-output-escaping="yes">&lt;/tr></xsl:text>
<tr>
    <td colspan="11" ><img src="/images/dot.gif" width="1" height="5" border="0"/><br/></td>
</tr>
<tr>
    <td colspan="11" bgcolor="#859A8C"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>
<tr>
    <td colspan="11" ><img src="/images/dot.gif" width="1" height="5" border="0"/><br/></td>
</tr>
      <xsl:text disable-output-escaping="yes">&lt;tr ></xsl:text>
</xsl:if>

<xsl:if test="(position() mod 6 != 0) and (position()!=last())">
<td width="20%"><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
</xsl:if>

</xsl:for-each> 

<xsl:if test="count(list/imagegal_db) mod 6 != 0">
  <xsl:call-template name="plashka">
    <xsl:with-param name="num" select="count(list/imagegal_db)"/>
  </xsl:call-template>
</xsl:if>

</tr>

<xsl:call-template name="zonespacer"/>

</table>
</xsl:if>


<xsl:if test="zone_db/@sh_promo=1">
 <xsl:call-template name="bottom_promo"/>
</xsl:if>

<br/>
<xsl:if test="$admin=1">
<xsl:if test="zone_db/@sh_fotogal=1">
  [<a href="album-add?obj={$zone/@id}&amp;type=zone">Добавить фото в альбом</a>]<br/>
</xsl:if>

[<a href="zone-edit?obj={$zone/@id}">Редактировать зону</a>]<br/>
[<a href="container-managewrapper?i=zone&amp;m=view&amp;walias={$zone/@walias}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]

</xsl:if>

<xsl:call-template name="zonemenu">
 <xsl:with-param name="zone" select="zone_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('main')"/>
</xsl:call-template>

</xsl:template>
</xsl:stylesheet>
