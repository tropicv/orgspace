<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../bush/bushdlg.xsl"/>

<xsl:template match="bush_edit"> 

<h2>�������� ���������</h2>

 <form method="POST" action="bush-edit?state=1&amp;obj={bush_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="bushdlg">
	<xsl:with-param name="bush" select="bush_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
