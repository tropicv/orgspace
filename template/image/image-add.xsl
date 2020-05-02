<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../image/image-edit.xsl"/> 

<xsl:template match="image_add"> 

<h2>Добавление изображения</h2>

 <form method="POST" action="image-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="imagedlg">
	<xsl:with-param name="image" select="image_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
