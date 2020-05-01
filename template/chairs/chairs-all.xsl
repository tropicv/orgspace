<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../chairs/chairsblock.xsl"/>


<xsl:template match="chairs_all"> 

<a name="top"/>

<div class="path">
<xsl:call-template name="chairspath"/>
<xsl:value-of select="$lc/chairs/@name"/>
</div>

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
<tr>
<td rowspan="2" valign="top">
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
 <tr>
  <td class="abswtitle" nowrap="nowrap" valign="top"><xsl:value-of select="$lc/chairs/@name"/>:</td>
  <td class="wtext" nowrap="nowrap" valign="top">
<xsl:variable name="num">
<xsl:choose>
<xsl:when test="count(list/chairs_db[@sh_acs!=1])=4">2</xsl:when>
<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
</xsl:variable>
   <xsl:for-each select="list/chairs_db[@sh_acs!=1]">
     <a href="chairs-view?walias={@walias}"><xsl:value-of select="@short_name"/></a><br/>
       <xsl:if test="(position() mod $num = 0) and (position()!=last())">
        <xsl:text disable-output-escaping="yes">&lt;/td>&lt;td class="wtext" nowrap="nowrap" valign="top"></xsl:text>
       </xsl:if>
   </xsl:for-each>
  </td>
 </tr>
</table>
</td>
<td class="abswtitle" width="100%" align="right">
<div>
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a>
</div>
</td>
</tr>

<tr><td align="right">

<xsl:for-each select="list/chairs_db[@sh_acs!=1]">

<xsl:if test='@sh_tmb!=1'>
<a href="chairs-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="max" select='string("42")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
</xsl:if>
</xsl:for-each>

<img src="/images/dot.gif" width="50" height="42" border="0"/>
</td></tr>
</table>
</td></tr>

<tr><td>
<img src="/images/dot.gif" width="760" height="1" border="0"/>
</td></tr>

<tr><td>
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<!-- End Line -->

<br/>

<div class="pic_wrap">
<ul class="pic">
<xsl:for-each select="list/chairs_db">
<xsl:choose>
<xsl:when test="@sh_acs=1 and $admin=1">
<li>

<table border="0" cellspacing="0" cellpadding="0" class="cattext">
<tr>
<td class="p5" height="40">
<a href="chairs-view?walias={@walias}"><xsl:value-of select="@name"/></a>
<br/><br/><br/>
Заблокировано
</td>
</tr>
</table>
</li>

</xsl:when>
<xsl:otherwise>
<xsl:if test="@sh_acs!=1">
<li>

<a name="{@walias}"/>

<table border="0" cellspacing="0" cellpadding="0" class="cattext">

<tr>
<td class="p5" height="40"><a href="chairs-view?walias={@walias}"><xsl:value-of select="@name"/></a></td>
</tr>

<tr>
<td>

<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
<a href="chairs-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template><br/>
</a>

</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

</td>
</tr>

<tr>
<td class="p5">
<xsl:value-of select="@baner_text" disable-output-escaping="yes"/>
</td>
</tr>
</table>

</li>
</xsl:if>
</xsl:otherwise>
</xsl:choose>

</xsl:for-each>
</ul>
</div>

<div style="clear:both;">
</div>

<div align="right">
<a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a>
</div>

<br/>


<!-- End PIC BLOCK   -->



<xsl:if test="$admin=1">
[<a href="chairs-add">Добавить</a>]<br/>
[<a href="container-managewrapper?i=chairs&amp;m=all&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:if>
<br/>

</xsl:template>
</xsl:stylesheet>