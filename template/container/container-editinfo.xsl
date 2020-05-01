<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../container/containerdlg.xsl"/>


<xsl:template match="container_editinfo"> 

<h2>Редактор Страницы</h2>

 <form method="POST" action="container-editinfo?state=1&amp;obj={container_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="containerdlg">
	<xsl:with-param name="container" select="container_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
