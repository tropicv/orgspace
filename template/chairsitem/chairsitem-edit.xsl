<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../chairsitem/chairsitemdlg.xsl"/>

<xsl:template match="chairsitem_edit"> 

<h2>Редактор Кресла</h2>

 <form method="POST" action="chairsitem-edit?state=1&amp;obj={chairsitem_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="chairsitemdlg">
	<xsl:with-param name="chairsitem" select="chairsitem_db"/>
	<xsl:with-param name="product" select="."/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
