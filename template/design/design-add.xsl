<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../design/designdlg.xsl"/>

<xsl:template match="design_add"> 

<h2>������ ������� ����</h2>

 <form method="POST" action="design-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="designdlg">
	<xsl:with-param name="design" select="design_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
