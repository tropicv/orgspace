<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../predmet/predmetdlg.xsl"/>

<xsl:template match="predmet_add"> 

<h2>������ ������ ���������</h2>

 <form method="POST" action="predmet-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="predmetdlg">
	<xsl:with-param name="predmet" select="predmet_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
