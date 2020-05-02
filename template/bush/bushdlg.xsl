<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="bushsel">
<xsl:param name="bush"/>
<xsl:param name="level"/>
<xsl:param name="cur"/>

<xsl:for-each select="$bush">
<option value="{@id}">
<xsl:if test="$cur=@id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
<xsl:value-of select="$level"/><xsl:value-of select="@title"/></option>
<xsl:if test="./child::*">

<xsl:call-template name="bushsel">
 <xsl:with-param name="bush" select="./bush_db"/>
 <xsl:with-param name="level" select="concat($level,'- ')"/>
 <xsl:with-param name="cur" select="$cur"/>
</xsl:call-template>

</xsl:if>

</xsl:for-each>

</xsl:template>

<xsl:template name="bushdlg">
<xsl:param name="bush"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="title" value="{$bush/@title}"/></td>
</tr>

<tr>
<td class="title">Псевдоним</td>
<td><input type="text" name="alias" value="{$bush/@alias}"/></td>
</tr>

<tr>
<td class="title">Тип</td>
<td><input type="text" name="type" value="{$bush/@type}"/></td>
</tr>

<tr>
<td class="title">ID (для внутренней ссылки)</td>
<td>
<select name="link">

<xsl:call-template name="bushsel">
 <xsl:with-param name="bush" select="tree/bush_db"/>
 <xsl:with-param name="level" select="string('')"/>
 <xsl:with-param name="cur" select="$bush/@link"/>
</xsl:call-template>

</select>
</td>
</tr>

<tr>
<td class="title">URL (для внешней ссылки)</td>
<td><input type="text" name="url" value="{$bush/@url}"/></td>
</tr>

<tr>
<td class="title">Позиция</td>
<td><input type="text" name="pos" value="{$bush/@pos}"/></td>
</tr>


<tr>
<td class="title">Страница</td>
<td><input type="text" name="container" value="{$bush/@container}"/></td>
</tr>

<tr>
<td class="MIFdlg">Заблокировать узел</td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$bush/@block=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Не показывать в структуре</td>
<td>
  <input type="checkbox" name="notshow">
  <xsl:if test='$bush/@notshow=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>

</table>

</xsl:template>

</xsl:stylesheet>
