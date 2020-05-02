<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../climage/climage-edit.xsl"/> 

<xsl:template match="climage_add"> 

<h2>Добавление изображения</h2>

 <form method="POST" action="climage-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="climagedlg">
	<xsl:with-param name="climage" select="climage_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
