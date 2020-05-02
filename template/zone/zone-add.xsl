<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../zone/zonedlg.xsl"/>

<xsl:template match="zone_add"> 

<h2>Мастер рабочей зоны</h2>

 <form method="POST" action="zone-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="zonedlg">
	<xsl:with-param name="zone" select="zone_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
