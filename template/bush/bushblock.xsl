<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="bushpath">
<xsl:param name="bush"/>

<div class="path">
<xsl:for-each select="$bush">
     <a href="bush-level?obj={@id}"><xsl:value-of select="@title"/></a> 
<xsl:if test="position()!=last()"> / </xsl:if>
</xsl:for-each>
</div>
</xsl:template>

</xsl:stylesheet>
