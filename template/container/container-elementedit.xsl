<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_elementedit"> 


<h2>Редактор элемента</h2>

<xsl:variable name="element" select="element_db"/>

 <form method="POST" action="container-elementedit?state=1&amp;obj={element_db/@id}" enctype="multipart/form-data">

<table class="MIFdlg">

<tr>
<td class="title">VPOS</td>
<td><input type="text" name="vpos" value="{$element/@vpos}"/></td>
</tr>

<tr>
<td class="title">HPOS</td>
<td><input type="text" name="hpos" value="{$element/@hpos}"/></td>
</tr>


<tr>
<td class="title">Layer</td>
<td><input type="text" name="layer" value="{$element/@layer}"/></td>
</tr>

<tr>
<td class="title">Шаблон</td>
<td>

<select name="creator">
<xsl:variable name="creator"><xsl:value-of select="template_list/@class"/>.<xsl:value-of select="template_list/@method"/>.</xsl:variable>
<xsl:for-each select="template_list/template">
<option value="{concat($creator,@name)}">
<xsl:if test="concat($creator,@name)=$element/@creator"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
<xsl:value-of select="@title"/>
</option>
</xsl:for-each>
</select>

</td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>

 </form>

</xsl:template>

</xsl:stylesheet>
