<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../clip/clip-partedit.xsl"/> 

<xsl:template match="clip_partadd"> 

<h2>Добавить часть</h2>

 <form method="POST" action="clip-partadd?state=1&amp;story_id={@story_id}" enctype="multipart/form-data">

	<xsl:call-template name="partdlg">
	<xsl:with-param name="part" select="storypart_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
