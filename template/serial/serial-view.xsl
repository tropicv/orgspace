<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../serial/serialblock.xsl"/>
<xsl:include href="../layout/layoutblock.xsl"/> 


<xsl:template match="serial_view"> 

<xsl:variable name="serial" select="serial_db"/>

<div class="path">
<xsl:call-template name="serialpath"/>
<a href="serial-all"><xsl:value-of select="$lc/serial/@name"/></a> : 
<xsl:value-of select="$serial/@name"/>
</div>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">

<tr>
<td rowspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat($serial/@id,'_3'))"/>
          <xsl:with-param name="type" select="$serial/baner"/>
          <xsl:with-param name="max" select='string("358")'/>
          <xsl:with-param name="alt" select='$serial/@name'/>
   </xsl:call-template><br/>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td class="wtext" valign="top" width="100%" >
<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="serial-all"><xsl:value-of select="$lc/serial/@name"/></a>
</div>

<h1><xsl:value-of select="$serial/@name"/></h1>
<xsl:value-of select="$serial/@baner_text" disable-output-escaping="yes"/>
<br/><br/><br/>
<xsl:value-of select="$serial/@short_description" disable-output-escaping="yes"/>
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

<table border="0" cellspacing="0" cellpadding="0" width="100%">

<tr>
<td><img src="/images/dot.gif" width="20" height="1" border="0" name="dot14" id="dot14"/><br/></td>
<td class="wmenu" nowrap="nowrap" width="100%">
<div class="fleft"><a  href="serial-addinf?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/description"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>

<xsl:if test="$serial/@sh_color!=0">
<div class="fleft"><a href="serial-color?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/color"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:if>

<xsl:if test="$serial/@sh_acs!=0">
<div class="fleft"><a href="serial-accessories?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/accessories"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:if>

<xsl:if test="$serial/@sh_elem!=0">
<div class="fleft"><a href="serial-elements?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/elements"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:if>

<xsl:if test="$serial/@sh_ex!=0">
<div class="fleft"><a href="serial-example?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/example"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:if>

<xsl:if test="$serial/@sh_arr!=0">
<div class="fleft"><a href="serial-arrange?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/arrange"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:if>

</td>

<td align="right" class="wmenu" nowrap="nowrap" valign="bottom">
<div name="orgmenu11head" id="orgmenu11head">
<img src="/images/dot.gif" width="13" height="1" border="0" name="dot11" id="dot11"/>
<a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="serial-all"><xsl:value-of select="$lc/serial/other"/></a>
<img src="/images/dot.gif" width="10" height="1" border="0" />
</div>
</td>
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

<xsl:if test="serial_db/@sh_fotogal=1">

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

<xsl:call-template name="serialspacer"/>

</table>
</xsl:if>

<xsl:if test="serial_db/@sh_promo=1">
 <xsl:call-template name="bottom_promo"/>
</xsl:if>

<br/>
<xsl:if test="$admin=1">
 <xsl:if test="serial_db/@sh_fotogal=1">
   [<a href="album-add?obj={$serial/@id}&amp;type=serial">Добавить фото в альбом</a>]<br/>
 </xsl:if>
[<a href="serial-edit?obj={$serial/@id}">Редактировать серию</a>]<br/>

[<a href="container-managewrapper?i=serial&amp;m=view&amp;walias={serial_db/@walias}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:if>

<xsl:call-template name="serialmenu">
 <xsl:with-param name="serial" select="serial_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('main')"/>
</xsl:call-template>

</xsl:template>
</xsl:stylesheet>
