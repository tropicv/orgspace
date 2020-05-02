<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../clip/clip-storyedit.xsl"/> 

<xsl:template match="clip_storyadd"> 

<h2>Добавить историю</h2>

 <form method="POST" action="clip-storyadd?state=1&amp;clip_id={@clip_id}" enctype="multipart/form-data">

	<xsl:call-template name="storydlg">
	<xsl:with-param name="story" select="story_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
