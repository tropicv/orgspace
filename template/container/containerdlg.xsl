<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/layoutblock.xsl"/> 

<xsl:template name="containerdlg">
<xsl:param name="container"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input size="50" type="text" name="title" value="{$container/@title}"/></td>
</tr>

<tr>
<td class="title">Название (для браузера)</td>
<td><input size="50" type="text" name="bwtitle" value="{$container/@bwtitle}"/></td>
</tr>

<tr>
<td class="title">Псевдоним</td>
<td><input size="20"  type="text" name="walias" value="{$container/@walias}"/></td>
</tr>

<tr>
<td class="title">Описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$container/@description"/>
</textarea></td>
</tr>

<tr>
<td class="title">Ключевые слова</td>
<td><textarea cols="50" rows="7" name="keywords">
<xsl:value-of select="$container/@keywords"/>
</textarea></td>
</tr>

<tr>
<td class="title">Шаблон</td>
<td>

<select name="creator">
<xsl:variable name="creator">container.view.</xsl:variable>
<xsl:for-each select="template_list/template">
<option value="{concat($creator,@name)}">
<xsl:if test="concat($creator,@name)=$container/@creator"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
<xsl:value-of select="@title"/>
</option>
</xsl:for-each>
</select>

</td>
</tr>

<tr>
<td class="MIFdlg">Поместить страницу в глоссарий</td>
<td>
  <input type="checkbox" name="is_glossary">
  <xsl:if test='$container/@is_glossary=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Текст глоссария (без ссылки)</td>
<td><textarea cols="50" rows="2" name="glossary_text1">
<xsl:value-of select="$container/@glossary_text1"/>
</textarea></td>
</tr>

<tr>
<td class="title">Текст глоссария (ссылка)</td>
<td><textarea cols="50" rows="2" name="glossary_text2">
<xsl:value-of select="$container/@glossary_text2"/>
</textarea></td>
</tr>


<!--

<tr>
<td class="title">Шаблон контейнера</td>
<td>
   <xsl:call-template name="container_select">
    <xsl:with-param name="block" select="list/container_db"/>
    <xsl:with-param name="cur" select="$container/@container_id"/>
   </xsl:call-template>
</td>
</tr>
-->


<tr>
<td class="MIFdlg">Заблокировать страницу</td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$container/@block=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">META NOINDEX</td>
<td>
  <input type="checkbox" name="noi">
  <xsl:if test='$container/@noi=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">META NOFOLLOW</td>
<td>
  <input type="checkbox" name="nof">
  <xsl:if test='$container/@nof=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Не показывать меню</td>
<td>
  <input type="checkbox" name="nomenu">
  <xsl:if test='$container/@nomenu=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>

</xsl:template>

</xsl:stylesheet>
