<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../tobj/ws1.xsl"/> 

<xsl:template name="tobjdlg_html">
<xsl:param name="tobj"/>

<table class="MIFdlg">

<tr>
<td class="title">Текст</td>
<td><textarea cols="100" rows="20" name="title">
<xsl:value-of select="$tobj/@title"/>
</textarea></td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>

</xsl:template>

<xsl:template name="tobjdlg">
<xsl:param name="tobj"/>

<table class="MIFdlg">

<tr>
<td class="title">Текст</td>
<td>
<xsl:call-template name="edit_visual">
       <xsl:with-param name="data" select="$tobj/@title"/>
       <xsl:with-param name="pname" select="string('title')"/>
</xsl:call-template>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

<xsl:call-template name="edit_visual_end">
       <xsl:with-param name="data" select="$tobj/@title"/>
       <xsl:with-param name="pname" select="string('title')"/>
</xsl:call-template>

</table>

</xsl:template>

<xsl:template match="tobj_edit"> 

<h2>Редактор текста</h2>

<xsl:choose>
<xsl:when test="@creator='tobj.view.html'">
 <form method="POST" action="tobj-edit?state=1&amp;obj={tobj_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="tobjdlg_html">
	<xsl:with-param name="tobj" select="tobj_db"/>
	</xsl:call-template>

 </form>
</xsl:when>
<xsl:otherwise>
 <form name="composeForm" id="composeForm" onsubmit="return copydata('title');" method="POST" action="tobj-edit?state=1&amp;obj={tobj_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="tobjdlg">
	<xsl:with-param name="tobj" select="tobj_db"/>
	</xsl:call-template>

 </form>
</xsl:otherwise>
</xsl:choose>

</xsl:template>

</xsl:stylesheet>
