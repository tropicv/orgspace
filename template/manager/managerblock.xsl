<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="managerpath">
<a href="/">Orgspace</a> :  
<a href="container-view?walias=about"><xsl:value-of select="$lc/about_orgspace"/></a> : 
<a href="container-view?walias=structure"><xsl:value-of select="$lc/manager/struct"/></a> : 
<a href="container-view?walias=team"><xsl:value-of select="$lc/manager/@name"/></a> : 
</xsl:template>


<xsl:template name="manageraddspacer">
<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>
</xsl:template>


</xsl:stylesheet>
