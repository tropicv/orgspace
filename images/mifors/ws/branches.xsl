<?xml version="1.0" encoding="WINDOWS-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="WINDOWS-1251"/>
<xsl:template match="/TABLE">
<table>
<xsl:attribute name="class">branches</xsl:attribute>
<xsl:copy-of select="@*"/>
<xsl:copy-of select="TBODY"/>
</table>
</xsl:template>
</xsl:stylesheet>