<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../../layout/level5/level5.xsl"/> 

<xsl:template match="container_view_servicel5_edit"> 

<xsl:call-template name="page_edit_l5">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('usl')"/>
</xsl:call-template>


<xsl:call-template name="page_workplace">
     <xsl:with-param name="page" select="container_db"/>
</xsl:call-template>

</xsl:template>

<xsl:template match="container_view_servicel5"> 

<xsl:call-template name="page_cont_l5">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('usl')"/>
</xsl:call-template>



</xsl:template>
</xsl:stylesheet>
