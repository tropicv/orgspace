<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_view_buyl4"> 

<xsl:call-template name="page_cont_l4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('buy')"/>
</xsl:call-template>


</xsl:template>
</xsl:stylesheet>
