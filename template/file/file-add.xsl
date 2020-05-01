<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../file/file-edit.xsl"/> 

<xsl:template match="file_add"> 

<h2>Добавление файла</h2>

 <form method="POST" action="file-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="filedlg">
	<xsl:with-param name="file" select="file_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
