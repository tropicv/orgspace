<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="projectpath">
<a href="/">Orgspace</a> :  
<a href="container-view?walias=knowhow"><xsl:value-of select="$lc/know_how"/></a> : 
<a href="container-view?walias=projects"><xsl:value-of select="$lc/project/@name"/></a> : 
</xsl:template>


<xsl:template name="projectaddspacer">
<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>
</xsl:template>


</xsl:stylesheet>
