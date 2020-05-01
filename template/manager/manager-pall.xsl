<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../manager/managerblock.xsl"/>


<xsl:template match="manager_pall"> 

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
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:value-of select="$lc/manager/struct"/>
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


<br/>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
 <tr>
  <td valign="top" width="60%" >

	<h2><xsl:value-of select="manager_team/word[@value=$team]"/></h2>
<table border="0" cellspacing="0" cellpadding="0" width="50%">
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
<a href="manager-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('manager_',concat(@id,'_1'))"/>
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
<td width="100%" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cattext">
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
 </tr>
</table>


<br/>



</xsl:template>
</xsl:stylesheet>