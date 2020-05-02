<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../chairs/chairsdlg.xsl"/>

<xsl:template match="chairs_add"> 

<h2>Мастер креслел</h2>

 <form method="POST" action="chairs-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="chairsdlg">
	<xsl:with-param name="chairs" select="chairs_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
