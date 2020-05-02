<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../manager/managerblock.xsl"/>


<xsl:template match="manager_all"> 

<a name="top"/>

<xsl:variable name="team" select="list/manager_db[1]/@team"/>

<div class="path">
<xsl:call-template name="managerpath"/>
<xsl:value-of select="manager_team/word[@value=$team]"/>
</div>

<!-- Line -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="org">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<a href="container-view?walias=team" class="white"><xsl:value-of select="$lc/manager/@name"/></a>
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

<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
 <tr>
  <td valign="top" width="20%">
	<h2><xsl:value-of select="manager_team/word[@value=$team]"/></h2>
  </td>
  <td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
  <td valign="top" width="60%" >

<table border="0" cellspacing="0" cellpadding="0" width="100%">
<xsl:for-each select="list/manager_db">
<tr>

<td>

<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('manager_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template><br/>

</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<xsl:if test="$admin=1">
<br/>
[<a href="manager-edit?obj={@id}">Редактировать</a>]
</xsl:if>

<br/>
</td>
<td width="100%" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cattext1">
<tr class="link">
<td><b><xsl:value-of select="@name"/></b></td>
</tr>

<tr>
<td class="hr"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>

<tr>
<td class="text">
<img src="/images/dot.gif" width="1" height="5" border="0"/><br/>
<xsl:value-of select="@slogan" disable-output-escaping="yes"/>
<br/><img src="/images/dot.gif" width="1" height="10" border="0"/><br/>
</td>
</tr>

<tr>
<td class="hr"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>

<tr>
<td class="text">
e-mail: <a href="mailto:{@email}"><xsl:value-of select="@email" disable-output-escaping="yes"/></a>
</td>
</tr>

<tr>
<td class="text">
tel/fax: <xsl:value-of select="@tel" disable-output-escaping="yes"/>

</td>
</tr>

<xsl:if test="@sh_prj=1">
<tr>
<td class="text">
<a href="project-manager?obj={@id}"><xsl:value-of select="$lc/manager/project"/></a>
</td>
</tr>
</xsl:if>

</table>

</td>
</tr>

<xsl:if test="position()!=last()">
<tr>
<td colspan="2" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>
</xsl:if>

</xsl:for-each>

<tr>
<td colspan="2" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>

</table>

  </td>
  <td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
  <td valign="top" width="20%">

<xsl:if test="$fin=1">

<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="205" class="org">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="container-view?walias=team"><xsl:value-of select="$lc/manager/@name"/></a></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="container-view?walias=companies"><xsl:value-of select="$lc/manager/company"/></a></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="usr-login"><xsl:value-of select="$lc/manager/for_diler"/></a></div></td>
</tr>


<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

</xsl:if>

<div class="print" align="right">
<xsl:if test="$fin=0">
<xsl:attribute name="style">position:relative; top: -6px; z-index: 1;</xsl:attribute>
</xsl:if>
<a href="manager-pall?obj={@obj}" target="blank"><xsl:value-of select="$lc/print_ver"/><img src="/images/print.gif" hspace="5" width="14" height="14" border="0" align="absmiddle"/></a>
</div>

<xsl:if test="$fin=1">

<table border="0" cellspacing="0" cellpadding="0" class="org">
<tr>
<td class="wnav">
<xsl:for-each select="manager_team/word">

<xsl:choose>
<xsl:when test="@value=../../@obj">
 <div class="current"><xsl:value-of select="."/> (<xsl:value-of select="@num"/>)</div>
</xsl:when>
<xsl:otherwise>
<div><a href="manager-all?obj={@value}"><xsl:value-of select="."/> (<xsl:value-of select="@num"/>)</a></div>
</xsl:otherwise>
</xsl:choose>

</xsl:for-each>
</td>
</tr>
</table>

</xsl:if>

  </td>
 </tr>
</table>


<br/>


<xsl:if test="$admin=1">
<br/>
[<a href="manager-add">Добавить</a>]<br/>
<xsl:choose>
<xsl:when test="@obj!='' and @obj!=0">
[<a href="container-managewrapper?i=manager&amp;m=all&amp;obj={@obj}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=manager&amp;m=all&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<br/>

</xsl:template>
</xsl:stylesheet>