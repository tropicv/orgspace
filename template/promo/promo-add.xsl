<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../promo/promo-edit.xsl"/> 

<xsl:template match="promo_add"> 

<h2>Добавление промоблока</h2>

<form name="composeForm" id="composeForm" onsubmit="return copydata('textbody');" method="POST" action="promo-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="promodlg">
  	  <xsl:with-param name="promo" select="promo_db"/>
          <xsl:with-param name="add" select="number('1')"/>
	</xsl:call-template>

</form>

</xsl:template>

</xsl:stylesheet>
