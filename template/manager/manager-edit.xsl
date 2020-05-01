<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../manager/managerdlg.xsl"/>

<xsl:template match="manager_edit"> 

<h2>Редактор менеджера</h2>

 <form method="POST" action="manager-edit?state=1&amp;obj={manager_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="managerdlg">
	<xsl:with-param name="manager" select="manager_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
