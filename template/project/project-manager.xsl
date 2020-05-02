<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../project/projectblock.xsl"/>


<xsl:template match="project_manager"> 

<a name="top"/>

<div class="path">
<xsl:call-template name="projectpath"/>
<xsl:value-of select="$lc/project/example"/>
</div>

<!-- Line -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="khow">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:value-of select="$lc/project/@name"/>
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


<h2><xsl:value-of select="$lc/project/example"/>: 
"<xsl:value-of select="manager_db/team/name"/>",
<xsl:value-of select="$lc/project/manager"/>
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:value-of select="manager_db/@name"/>.
</h2>


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
 <tr>
  <td class="wnav1" nowrap="nowrap" valign="top">
<xsl:variable name="num">
<xsl:choose>
<xsl:when test="count(list/project_db)=4">2</xsl:when>
<xsl:when test="count(list/project_db)=6">3</xsl:when>
<xsl:when test="count(list/project_db)=8">4</xsl:when>
<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
</xsl:variable>
   <xsl:for-each select="list/project_db">
     <a href="project-view?walias={@walias}"><xsl:value-of select="@short_name"/></a><br/>
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
<td class="wtext"><div class="rmenu"><a href="javascript:history.back()">&lt;&lt; <xsl:value-of select="$lc/back"/></a></div></td>
</tr>


<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

  </td>
 </tr>
</table>



<img src="/images/dot.gif" width="1" height="5" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="khow">
<tr>
<td><img src="/images/dot.gif" width="760" height="2" border="0"/><br/></td>
</tr>

</table>




<!-- End Line -->

<br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<xsl:for-each select="list/project_db">

<td>
<a name="{@walias}"/>

<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
<a href="project-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('project_',concat(@id,'_1'))"/>
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

<br/>
</td>
<td width="50%" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cattext">
<tr class="link">
<td><a href="project-view?walias={@walias}"><xsl:value-of select="@name"/></a></td>
<td align="right"><a href="project-view?walias={@walias}"><img src="/images/cat-arr.gif" width="6" height="9" border="0" align="absmiddle"/></a><br/></td>
</tr>

<tr>
<td colspan="2" class="hr"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"  class="text">
<xsl:value-of select="@short_description" disable-output-escaping="yes"/>
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

<xsl:if test="$admin=1">
[<a href="project-add">Добавить</a>]<br/>
[<a href="album-add?obj=0&amp;type=project">Добавить отзыв</a>]<br/>
</xsl:if>
<br/>

</xsl:template>
</xsl:stylesheet>