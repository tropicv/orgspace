<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../chairs/chairsblock.xsl"/>
<xsl:include href="../layout/layoutblock.xsl"/> 


<xsl:template match="chairs_view"> 

<xsl:variable name="chairs" select="chairs_db"/>

<div class="path">
<xsl:call-template name="chairspath"/>
<xsl:choose>
    <xsl:when test="chairs_db/@ch_type=1">
<!--	<a href="container-view?obj=579">Orgspace</a> :-->
    </xsl:when>
    <xsl:otherwise>
        <!--<a href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a> :-->
    </xsl:otherwise>
</xsl:choose>
<!--<a href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a> : -->
<xsl:value-of select="$chairs/@name"/>
</div>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">

<tr>
<td rowspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat($chairs/@id,'_3'))"/>
          <xsl:with-param name="type" select="$chairs/baner"/>
          <xsl:with-param name="max" select='string("358")'/>
          <xsl:with-param name="alt" select='$chairs/@name'/>
   </xsl:call-template><br/>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td class="wtext" valign="top" width="100%" >

<div class="wtitle" style="float:left">
    <xsl:value-of select="$chairs/@short_name" disable-output-escaping="yes"/>
</div>

<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<!--
<a class="white" href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a>
-->
<a class="white" href="container-view?walias=chairs"><xsl:value-of select="$lc/chairs/chairs_path"/></a>
</div>
<br/>
<xsl:choose>
  <xsl:when test="$chairs/@walias='wchairs'">
    <noindex><h1><xsl:value-of select="$chairs/@slogan"/></h1></noindex>
  </xsl:when>
  <xsl:otherwise>
    <h1><xsl:value-of select="$chairs/@slogan"/></h1>
  </xsl:otherwise>
</xsl:choose>
<xsl:value-of select="$chairs/@baner_text" disable-output-escaping="yes"/>
<br/><br/><br/>

<xsl:value-of select="$chairs/@short_description" disable-output-escaping="yes"/>

<!-- list of childs -->
<xsl:if test="$chairs/@walias='ergonomiq' or $chairs/@walias='about giroflex' or $chairs/@walias='service'">
  <br/>
  <br/>
  <xsl:for-each select="list/chairsitem_db">
    <xsl:if test="@block=0">
      <div class="fleft" style="margin: 0.5em 0 0 0;padding-left:0; float:none;">
        <a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a>
      </div>
      <!--br/-->
    </xsl:if>
  </xsl:for-each>
</xsl:if>
<!-- end list of childs -->

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

<!-- if catalog -->
<xsl:if test="not($chairs/@walias='ergonomiq' or $chairs/@walias='about giroflex' or $chairs/@walias='service')">
<table border="0" cellspacing="0" cellpadding="0" width="100%">

<tr>
<td><img src="/images/dot.gif" width="20" height="1" border="0" name="dot14" id="dot14"/><br/></td>

<td class="wmenu" nowrap="nowrap" width="100%">
  <div class="fleft" style="padding-left:0">
    <a href="chairs-example?walias={$chairs/@walias}&amp;obj={list/chairsitem_db[@block=1]/@id}">обзор ассортимента</a>
  </div>
</td>

<!--
<td class="wmenu" nowrap="nowrap" width="100%" >

<xsl:if test="$chairs/@example!=''"><div class="fleft" style="padding-left:0"><xsl:value-of select="$chairs/@example"/><img src="/images/dot.gif" width="13" height="1" border="0" /></div></xsl:if> 

<xsl:for-each select="list/chairsitem_db[@block!=1]">
<div class="fleft"><a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a><img src="/images/dot.gif" width="13" height="1" border="0" /></div>
</xsl:for-each> 

</td>
-->
<td align="right" class="wmenu" nowrap="nowrap" valign="bottom">
<div name="orgmenu11head" id="orgmenu11head">
<img src="/images/dot.gif" width="13" height="1" border="0" name="dot11" id="dot11"/>
<!--<a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="chairs-all"><xsl:value-of select="$lc/chairs/other"/></a>
-->
<a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="container-view?walias=chairs"><xsl:value-of select="$lc/chairs/other"/></a>
<img src="/images/dot.gif" width="10" height="1" border="0" />
</div>
</td>
</tr>
	</table>
</xsl:if><!-- end if catalog -->
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

<xsl:if test="chairs_db/@sh_fotogal=1">

<br/>
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

<xsl:call-template name="chairsspacer"/>

</table>
</xsl:if>

<!-- chairs list for catalogs only -->
<xsl:if test="not($chairs/@walias='ergonomiq' or $chairs/@walias='about giroflex' or $chairs/@walias='service') or $admin=1">
<br/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="catimg">
<tr>

<xsl:for-each select="list/chairsitem_db">
<xsl:if test="@block='0' or $admin=1">
<td>

<table border="0" cellspacing="0" cellpadding="0" class="tmbimg">
<tr><td>
<a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairsitem_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
</td></tr>
<tr><td align="center">
<a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a>
</td></tr>
<xsl:if test="$admin=1">
  <tr>
    <td align="center">
      <a href="chairsitem-edit?obj={@id}" style="font-weight:normal;">[Редактировать экземпляр]</a><br/>
      <a href="container-managewrapper?i=chairs&amp;m=example&amp;walias={$chairs/@walias}&amp;obj={@id}&amp;creator=container.view.goodsl4" style="font-weight:normal;">[Редактировать шаблон]</a>
      <br/>
      <a href="chairsitem-del?obj={@id}" style="font-weight:normal;">[Удалить экземпляр]</a><br/>
    </td>
  </tr>
</xsl:if>
</table>

</td>
</xsl:if>
</xsl:for-each> 

</tr>

</table>
<br/>
</xsl:if>
<!-- end chairs list -->

<xsl:if test="chairs_db/@sh_promo=1">
 <xsl:call-template name="bottom_promo"/>
</xsl:if>

<br/>
<xsl:if test="$admin=1">
 <xsl:if test="chairs_db/@sh_fotogal=1">
   [<a href="album-add?obj={$chairs/@id}&amp;type=chairs">Добавить фото в альбом</a>]<br/>
 </xsl:if>
[<a href="chairs-edit?obj={$chairs/@id}">Редактировать кресла</a>]<br/>
[<a href="chairsitem-add?obj={$chairs/@id}">Добавить экземпляр</a>]<br/>

[<a href="container-managewrapper?i=chairs&amp;m=view&amp;walias={chairs_db/@walias}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:if>

<xsl:call-template name="chairsmenu">
 <xsl:with-param name="chairs" select="chairs_db/@walias"/>
 <xsl:with-param name="list" select="list_all"/>
 <xsl:with-param name="type" select="string('main')"/>
</xsl:call-template>

</xsl:template>
</xsl:stylesheet>
