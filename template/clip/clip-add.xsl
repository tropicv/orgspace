<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../clip/clip-edit.xsl"/> 

<xsl:template match="clip_add"> 

<h2>�������� ����</h2>

 <form method="POST" action="clip-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="clipdlg">
	<xsl:with-param name="clip" select="clip_db"/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
