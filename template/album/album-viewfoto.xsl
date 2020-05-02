<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="album_viewfoto"> 

<h2><xsl:value-of select="$lc/photo"/></h2>

 <b><xsl:value-of select="imagegal_db/@name"/></b><br/>
 <p><xsl:value-of select="imagegal_db/@description"/></p><br/>

</xsl:template>
</xsl:stylesheet>
