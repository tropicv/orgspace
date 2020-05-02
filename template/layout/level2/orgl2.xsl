<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_view_orgl2_edit"> 

<xsl:call-template name="page_edit_l2">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
</xsl:call-template>

<xsl:call-template name="bottom_promo"/>

<xsl:call-template name="page_workplace">
     <xsl:with-param name="page" select="container_db"/>
</xsl:call-template>

</xsl:template>

<xsl:template match="container_view_orgl2"> 

<xsl:call-template name="page_cont_l2">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
</xsl:call-template>

<xsl:call-template name="bottom_promo"/>


</xsl:template>
</xsl:stylesheet>
