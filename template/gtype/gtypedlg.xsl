<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../tobj/ws1.xsl"/> 

<xsl:template name="gtypedlg">
<xsl:param name="gtype"/>
<xsl:param name="product"/>
<xsl:param name="add"/>

<table class="MIFdlg">


<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$gtype/@name}"/></td>
</tr>


<tr>
<td class="title">Другое название</td>
<td><input type="text" name="short_name" value="{$gtype/@short_name}"/></td>
</tr>

<tr>
<td class="title">Alias</td>
<td><input type="text" name="walias" value="{$gtype/@walias}"/></td>
</tr>

<tr>
<td class="title">Группа</td>
<td>
<select name="predmet_id">
<xsl:for-each select="$product/list/predmet_db">
 <option value="{@id}">
   <xsl:if test="@id=$gtype/@predmet_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
</select>
</td>
</tr>


<!--
<tr>
<td class="title">Описание</td>
<td>
<xsl:call-template name="edit_visual">
       <xsl:with-param name="data" select="$gtype/@description"/>
       <xsl:with-param name="pname" select="string('description')"/>
</xsl:call-template>
</td>
</tr>
-->

<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$gtype/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('gtype_',concat($gtype/@id,'_1'))"/>
          <xsl:with-param name="type" select="$gtype/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое</td>
<td>
  <xsl:if test='$gtype/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('gtype_',concat($gtype/@id,'_2'))"/>
          <xsl:with-param name="type" select="$gtype/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="MIFdlg">Блокировать</td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$gtype/@block=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

<!--
<xsl:call-template name="edit_visual_end">
       <xsl:with-param name="data" select="$gtype/@description"/>
       <xsl:with-param name="pname" select="string('description')"/>
</xsl:call-template>
-->

</table>

</xsl:template>

</xsl:stylesheet>
