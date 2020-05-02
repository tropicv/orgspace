<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="tobj_view"> 
<xsl:value-of select="tobj_db/@title" disable-output-escaping="yes"/>
</xsl:template>

<xsl:template match="tobj_view_html"> 
<xsl:value-of select="tobj_db/@title" disable-output-escaping="yes"/>
</xsl:template>

</xsl:stylesheet>
