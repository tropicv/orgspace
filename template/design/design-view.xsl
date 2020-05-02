<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../design/designblock.xsl"/>
<xsl:include href="../layout/layoutblock.xsl"/> 


<xsl:template match="design_view"> 

<xsl:variable name="design" select="design_db"/>

<div class="path">
<xsl:call-template name="designpath"/>
<a href="design-all"><xsl:value-of select="$lc/design/@name"/></a> : 
<xsl:value-of select="$design/@short_name"/>
</div>


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">

<tr>
<td rowspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat($design/@id,'_3'))"/>
          <xsl:with-param name="type" select="$design/baner"/>
          <xsl:with-param name="max" select='string("358")'/>
          <xsl:with-param name="alt" select='$design/@name'/>
   </xsl:call-template><br/>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>

<td class="wtext" valign="top" width="100%" >
<div class="wtitle" style="float: left;">
<xsl:value-of select="$design/@short_name"/>
</div>

<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="design-all"><xsl:value-of select="$lc/design/@name"/></a>
</div>
<br/>
<h1><xsl:value-of select="$design/@slogan"/></h1>
<xsl:value-of select="$design/@baner_text" disable-output-escaping="yes"/>
<br/>
<xsl:value-of select="$design/@description" disable-output-escaping="yes"/>
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
<xsl:if test="$design/@sh_sol!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
<xsl:if test="$design/@walias='workplaces'">
<td class="wmenu" nowrap="nowrap"><div ><a href="/container-view?obj=711">bench-системы</a></div></td>
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
</xsl:if>
<td class="wmenu" nowrap="nowrap"><div ><a href="design-solution?walias={$design/@walias}"><xsl:value-of select="$lc/design/solution"/></a></div></td>
</xsl:if>
<xsl:if test="$design/@sh_ex!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wmenu" nowrap="nowrap"><div ><a href="design-example?walias={$design/@walias}"><xsl:value-of select="$lc/design/example"/></a></div></td>
</xsl:if>
<xsl:if test="$design/@sh_arr!=0">
<td><img src="/images/dot.gif" width="13" height="1" border="0"/><br/></td>
<td class="wmenu" nowrap="nowrap"><div ><a href="design-arrange?walias={$design/@walias}"><xsl:value-of select="$lc/design/arrange"/></a></div></td>
</xsl:if>
<td width="100%"><img src="/images/dot.gif" width="13" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="13" height="1" border="0" name="dot11" id="dot11"/><br/></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" /><br/></td>
<td class="wmenu" nowrap="nowrap"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="design-all"><xsl:value-of select="$lc/design/other"/></a></div></td>
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


<xsl:if test="design_db/@sh_fotogal=1">

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

<xsl:call-template name="designspacer"/>

</table>
</xsl:if>


<xsl:if test="design_db/@sh_promo=1">
 <xsl:call-template name="bottom_promo"/>
</xsl:if>

<br/>
<xsl:if test="$admin=1">
<xsl:if test="design_db/@sh_fotogal=1">
  [<a href="album-add?obj={$design/@id}&amp;type=design">Добавить фото в альбом</a>]<br/>
</xsl:if>

[<a href="design-edit?obj={$design/@id}">Редактировать зону</a>]<br/>
[<a href="container-managewrapper?i=design&amp;m=view&amp;walias={$design/@walias}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]

</xsl:if>

<xsl:call-template name="designmenu">
 <xsl:with-param name="design" select="design_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('main')"/>
</xsl:call-template>

</xsl:template>
</xsl:stylesheet>
