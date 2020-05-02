<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../bush/bushdlg.xsl"/>


<xsl:template name="navdlg">
<xsl:param name="nav"/>
<table class="MIFdlg">

<tr>
<td class="title">TYPE </td>
<td>
	<xsl:call-template name="show_select">
	<xsl:with-param name="name" select="string('type')"/>
	<xsl:with-param name="select" select="type_list/type"/>
	<xsl:with-param name="cur" select="$nav/@type"/>
	</xsl:call-template>
</td>
</tr>

<tr>
<td class="title">START </td>
<td>
	<xsl:call-template name="show_select">
	<xsl:with-param name="name" select="string('start')"/>
	<xsl:with-param name="select" select="start_list/start"/>
	<xsl:with-param name="cur" select="$nav/@start"/>
	</xsl:call-template>
</td>
</tr>

<tr>
<td class="title">START NODE</td>
<td>
<select name="bush_id">
	<xsl:call-template name="bushsel">
	 <xsl:with-param name="bush" select="tree/bush_db"/>
	 <xsl:with-param name="level" select="string('')"/>
	 <xsl:with-param name="cur" select="$nav/@bush_id"/>
	</xsl:call-template>
</select>
</td>
</tr>

<tr>
<td class="title">START LEVEL FROM NODE </td>
<td><input type="text" name="start_level" value="{$nav/@start_level}"/></td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>

</xsl:template>

<xsl:template match="nav_edit"> 

<h2>Редактор ссылок</h2>

 <form method="POST" action="nav-edit?state=1&amp;obj={nav_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="navdlg">
	<xsl:with-param name="nav" select="nav_db"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
