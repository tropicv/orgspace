<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../serial/serialdlg.xsl"/>

<xsl:template match="serial_edit"> 

<h2>�������� �����</h2>

 <form method="POST" action="serial-edit?state=1&amp;obj={serial_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="serialdlg">
	<xsl:with-param name="serial" select="serial_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
