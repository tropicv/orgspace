<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../album/albumdlg.xsl"/>

<xsl:template match="album_add"> 

<h2>Мастер Альбома</h2>

 <form method="POST" action="album-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="albumdlg">
	<xsl:with-param name="image" select="imagegal_db"/>
	<xsl:with-param name="album" select="."/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
