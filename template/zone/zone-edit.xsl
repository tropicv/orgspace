<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../zone/zonedlg.xsl"/>

<xsl:template match="zone_edit"> 

<h2>Редактор рабочей зоны</h2>

 <form method="POST" action="zone-edit?state=1&amp;obj={zone_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="zonedlg">
	<xsl:with-param name="zone" select="zone_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
