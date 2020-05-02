<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="storydlg">
<xsl:param name="story"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$story/@name}"/></td>
</tr>

<tr>
<td class="title">URL</td>
<td><input type="text" name="url" value="{$story/@url}"/></td>
</tr>

<tr>
<td class="title">Количество циклов</td>
<td><input type="text" name="rotation" value="{$story/@rotation}"/></td>
</tr>

<tr>
<td class="title">Порядок</td>
<td><input type="text" name="srt" value="{$story/@srt}"/></td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>


</table>

</xsl:template>

<xsl:template match="clip_storyedit"> 

<h2>Редактор истории</h2>

 <form method="POST" action="clip-storyedit?state=1&amp;obj={story_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="storydlg">
	<xsl:with-param name="story" select="story_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
