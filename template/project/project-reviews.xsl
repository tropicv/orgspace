<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../project/projectblock.xsl"/>


<xsl:template match="project_reviews"> 

<a name="top"/>

<div class="path">
<xsl:call-template name="projectpath"/>
<xsl:value-of select="$lc/project/recomend"/>
</div>

<!-- Line -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="khow">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<a href="container-view?walias=projects" class="white"><xsl:value-of select="$lc/project/@name"/></a>
</TD>

<td  valign="top">
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td valign="bottom">
<div><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
</td>
<td  valign="bottom">
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="748" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>

</table>


<h2><xsl:value-of select="$lc/project/recomend"/></h2>


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
 <tr>
  <td class="wnav1" nowrap="nowrap" valign="top">
<xsl:variable name="num">
<xsl:choose>
<xsl:when test="count(list/imagegal_db)=4">2</xsl:when>
<xsl:when test="count(list/imagegal_db)=6">3</xsl:when>
<xsl:when test="count(list/imagegal_db)=8">4</xsl:when>
<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
</xsl:variable>
   <xsl:for-each select="list/imagegal_db">
<xsl:choose>
 <xsl:when test="foto/child::*">
  <a href="" onclick="javascript:openwin('{$res_path}/{concat('imagegal_',concat(@id,'_1'))}{foto/extension}',{number(foto/width)+20},{number(foto/height)+30}); return false;">
  <xsl:value-of select="@name"/></a>
 </xsl:when>
 <xsl:otherwise>
  <a href="#review{@id}"><xsl:value-of select="@name"/></a>
 </xsl:otherwise>
</xsl:choose><br/>

       <xsl:if test="(position() mod $num = 0) and (position()!=last())">
        <xsl:text disable-output-escaping="yes">&lt;/td>&lt;td class="wnav1" valign="top"></xsl:text>
       </xsl:if>
   </xsl:for-each>
  </td>
  <td align="right" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="205" class="khow">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="container-view?obj=643">список клиентов</a></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="project-all"><xsl:value-of select="$lc/project/example"/></a></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><xsl:value-of select="$lc/project/recomend"/></div></td>
</tr>


<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

  </td>
 </tr>
</table>

<br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="khow">
<tr>
<td><img src="/images/dot.gif" width="760" height="2" border="0"/><br/></td>
</tr>

</table>




<!-- End Line -->

<br/>

<div class="pic_wrap">
<ul class="pic1">
<xsl:for-each select="list/imagegal_db">
<li>

<a name="review{@id}"/>

<table border="0" cellspacing="0" cellpadding="0" class="cattext">

<tr>
<td class="p5" height="60" >
<xsl:choose>
 <xsl:when test="foto/child::*">
  <a href="" onclick="javascript:openwin('{$res_path}/{concat('imagegal_',concat(@id,'_1'))}{foto/extension}',{number(foto/width)+20},{number(foto/height)+30}); return false;">
  <xsl:value-of select="@name"/></a>
 </xsl:when>
 <xsl:otherwise>
  <div class="head"><b><xsl:value-of select="@name"/></b></div>
 </xsl:otherwise>
</xsl:choose>
</td>
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
<xsl:choose>
 <xsl:when test="foto/child::*">
   <xsl:call-template name="res_image_stuff_pup">
          <xsl:with-param name="id" select="concat('imagegal_',concat(@id,'_2'))"/>
          <xsl:with-param name="idb" select="concat('imagegal_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="typeb" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('imagegal_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>

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
<xsl:value-of select="@description" disable-output-escaping="yes"/>
</td>
</tr>
</table>

<xsl:if test="$admin=1">
<br/>
[<a href="album-edit?obj={@id}">Edit</a>]
[<a href="album-del?obj={@id}">Del</a>]
<br/>
</xsl:if>

</li>
</xsl:for-each>
</ul>
</div>

<div style="clear:both;">
</div>

<div align="right">
<a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a>
</div>

<br/>

<!--
<br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<xsl:for-each select="list/imagegal_db">

<td>

<a name="review{@id}"/>

<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
<xsl:choose>
 <xsl:when test="foto/child::*">
   <xsl:call-template name="res_image_stuff_pup">
          <xsl:with-param name="id" select="concat('imagegal_',concat(@id,'_2'))"/>
          <xsl:with-param name="idb" select="concat('imagegal_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="typeb" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('imagegal_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>

</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<xsl:if test="$admin=1">
<br/>
[<a href="album-edit?obj={@id}">Edit</a>]
[<a href="album-del?obj={@id}">Del</a>]
<br/>
</xsl:if>

<br/>
</td>
<td width="50%" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cattext">
<tr class="link">
<td>

<xsl:choose>
 <xsl:when test="foto/child::*">
  <a href="" onclick="javascript:openwin('{$res_path}/{concat('imagegal_',concat(@id,'_1'))}{foto/extension}',{number(foto/width)+20},{number(foto/height)+30}); return false;">
  <xsl:value-of select="@name"/></a>
 </xsl:when>
 <xsl:otherwise>
  <div class="head"><b><xsl:value-of select="@name"/></b></div>
 </xsl:otherwise>
</xsl:choose>

</td>
<td align="right"><img src="/images/cat-arr.gif" width="6" height="9" border="0" align="absmiddle"/><br/></td>
</tr>

<tr>
<td colspan="2" class="hr"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"  class="text">
<xsl:value-of select="@description" disable-output-escaping="yes"/>

</td>
</tr>
</table>

</td>

<xsl:if test="position() mod 2 != 0">
<td><img src="/images/dot.gif" width="70" height="1" border="0"/><br/></td>
</xsl:if>

<xsl:if test="(position() mod 2 = 0) and (position()!=last())">
      <xsl:text disable-output-escaping="yes">&lt;/tr></xsl:text>
<tr>
<td colspan="5" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>
      <xsl:text disable-output-escaping="yes">&lt;tr></xsl:text>
</xsl:if>

</xsl:for-each>
</tr>

<tr>
<td colspan="5" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>

</table>
-->

<!--
<xsl:if test="$admin=1">
[<a href="album-add?obj=0&amp;type=project">Добавить отзыв</a>]<br/>
</xsl:if>
-->
<br/>

</xsl:template>
</xsl:stylesheet>