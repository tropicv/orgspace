<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="goodsdlg">
<xsl:param name="goods"/>
<xsl:param name="product"/>
<xsl:param name="add"/>

<table class="MIFdlg">


<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$goods/@name}"/></td>
</tr>

<tr>
<td class="title">Артикул</td>
<td><input type="text" name="code" value="{$goods/@code}"/></td>
</tr>

<tr>
<td class="title">Тип</td>
<td>
<select name="type">
<xsl:for-each select="$goods/../list/gtype_db">
 <option value="{@id}">
   <xsl:if test="@id=$goods/@type"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@short_name"/>
 </option>
</xsl:for-each>
</select>
</td>
</tr>

<tr>
<td class="title">Серия</td>
<td>
<select name="serial_id">
<xsl:for-each select="$goods/../serial/list_all/list_one">
 <option value="{@id}">
   <xsl:if test="@id=$goods/@serial_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
</select>
</td>
</tr>

<tr>
<td class="title">Размер</td>
<td><input type="text" name="size" value="{$goods/@size}"/></td>
</tr>

<tr>
<td class="title">Описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$goods/@description"/>
</textarea></td>
</tr>


<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="short_description">
<xsl:value-of select="$goods/@short_description"/>
</textarea></td>
</tr>


<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$goods/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('goods_',concat($goods/@id,'_1'))"/>
          <xsl:with-param name="type" select="$goods/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое</td>
<td>
  <xsl:if test='$goods/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('goods_',concat($goods/@id,'_2'))"/>
          <xsl:with-param name="type" select="$goods/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$goods/@srt}"/></td>
</tr>

<xsl:if test="$add=1">
<tr>
<td><input type="hidden" name="predmet_id" value="{$product/@obj}"/></td>
<td></td>
</tr>
</xsl:if>


<tr>
<td class="MIFdlg">Блокировать</td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$goods/@block=1'>
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
