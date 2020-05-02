<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../bush/bushblock.xsl"/>


<xsl:template match="bush_level"> 

<xsl:variable name="par" select="bush_db"/>

<xsl:call-template name="bushpath">
 <xsl:with-param name="bush" select="path/bush_db"/>
</xsl:call-template>


<table class="MIFcont">
<tr><td>
<ul>
<xsl:for-each select="bush_db/bush_db">
<li>
       <a href="bush-level?obj={@id}"><xsl:value-of select="@title"/></a>
<xsl:choose>
 <xsl:when test="@type=0">
	[<a href="container-edit?obj={@container}">Редактировать страницу</a>]
	[<a href="bush-edit?obj={@id}">Редактировать узел</a>]
	[<a href="bush-del?obj={@id}">del</a>]
 </xsl:when>
 <xsl:otherwise>
	[<a href="bush-edit?obj={@id}">Редактировать узел</a>]
	[<a href="bush-del?obj={@id}">del</a>]
 </xsl:otherwise>
</xsl:choose>

</li>
</xsl:for-each>
</ul>

<br/>
[<a href="bush-add?obj={$par/@id}">Add</a>]

</td></tr>
</table>


</xsl:template>
</xsl:stylesheet>
