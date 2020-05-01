<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../tobj/tobj-edit.xsl"/> 

<xsl:template match="tobj_add"> 

<h2>Добавление текста</h2>

<xsl:choose>
<xsl:when test="@creator='tobj.view.html'">
 <form method="POST" action="tobj-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="tobjdlg_html">
	<xsl:with-param name="tobj" select="tobj_db"/>
	</xsl:call-template>

 </form>
</xsl:when>
<xsl:otherwise>
 <form name="composeForm" id="composeForm" onsubmit="return copydata('title');" method="POST" action="tobj-add?state=1" enctype="multipart/form-data">

	<xsl:call-template name="tobjdlg">
	<xsl:with-param name="tobj" select="tobj_db"/>
	</xsl:call-template>

 </form>
</xsl:otherwise>
</xsl:choose>


</xsl:template>

</xsl:stylesheet>
