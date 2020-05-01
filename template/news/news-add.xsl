<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../news/news-edit.xsl"/> 

<xsl:template match="news_add"> 

<h2>Добавить новость</h2>

<form name="composeForm" id="composeForm" onsubmit="return copydata('body');" method="POST" action="news-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="newsdlg">
	<xsl:with-param name="news" select="news_db"/>
	</xsl:call-template>

</form>

</xsl:template>

</xsl:stylesheet>
