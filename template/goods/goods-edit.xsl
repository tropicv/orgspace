<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../goods/goodsdlg.xsl"/>

<xsl:template match="goods_edit"> 

<h2>Редактор Предмета</h2>

 <form method="POST" action="goods-edit?state=1&amp;obj={goods_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="goodsdlg">
	<xsl:with-param name="goods" select="goods_db"/>
	<xsl:with-param name="product" select="."/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
