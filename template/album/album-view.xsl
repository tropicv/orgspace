<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="album_view"> 

<h2><xsl:value-of select="$lc/album"/></h2>

<xsl:for-each select="list/imagegal_db">
 <a href="album-viewfoto?obj={@id}"><xsl:value-of select="@name"/></a><br/>
 <p><xsl:value-of select="@description"/></p><br/>
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>
