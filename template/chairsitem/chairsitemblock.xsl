<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="chairsitempath">
<a href="/">Orgspace</a> : 
<a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a> :
</xsl:template>

<xsl:template name="chairsitemaddspacer">
<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>
</xsl:template>

<xsl:template name="chairsitemmenu">
<xsl:param name="chairsitem"/>
<xsl:param name="list"/>


<xsl:for-each select="$list/list_one">
<!--
<xsl:choose>
 <xsl:when test="$chairsitem!=@walias">
-->
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div class="rmenu"><a href="predmet-view?walias={@walias}"><xsl:value-of select="@name"/></a></div></td>
</tr>
<!--
 </xsl:when>
 <xsl:otherwise>
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
<td class="wtext"><div class="rmenu"><xsl:value-of select="@name"/></div></td>
</tr>
 </xsl:otherwise>
</xsl:choose>
-->
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>
