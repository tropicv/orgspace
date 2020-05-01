<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../gtype/gtypedlg.xsl"/>

<xsl:template match="gtype_add"> 

<h2>Мастер Типа предмета</h2>

 <form method="POST" action="gtype-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="gtypedlg">
	<xsl:with-param name="gtype" select="gtype_db"/>
	<xsl:with-param name="product" select="."/>
	<xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
