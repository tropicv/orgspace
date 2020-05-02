<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="album_abc"> 

<h2>Альбомы</h2>

<xsl:for-each select="list/*">
 <a href="album-view?obj={@id}&amp;type={substring-before(name(.),'_db')}"><xsl:value-of select="@name"/></a><br/>
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>
