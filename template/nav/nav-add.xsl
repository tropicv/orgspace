<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../nav/nav-edit.xsl"/> 

<xsl:template match="nav_add"> 

<h2>Добавление ссылок</h2>

 <form method="POST" action="nav-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="navdlg">
	<xsl:with-param name="nav" select="nav_db"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
