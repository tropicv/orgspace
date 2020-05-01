<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template match="album_del"> 

<xsl:call-template name="del_yes_no">
 <xsl:with-param name="title" select="string('Удалить фото?')"/>
 <xsl:with-param name="action" select="string('album-del')"/>
 <xsl:with-param name="data" select="imagegal_db/@id"/>
</xsl:call-template>

</xsl:template>

</xsl:stylesheet>
