<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="designdlg">
<xsl:param name="design"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$design/@name}"/></td>
</tr>

<tr>
<td class="title">Краткое название</td>
<td><input type="text" name="short_name" value="{$design/@short_name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$design/@walias}"/></td>
</tr>

<tr>
<td class="title">Изображение (158х158)</td>
<td>
  <xsl:if test='$design/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat($design/@id,'_1'))"/>
          <xsl:with-param name="type" select="$design/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое (42х42)</td>
<td>
  <xsl:if test='$design/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat($design/@id,'_2'))"/>
          <xsl:with-param name="type" select="$design/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="MIFdlg">Не показывать малое изображение</td>
<td>
  <input type="checkbox" name="sh_tmb">
  <xsl:if test='$design/@sh_tmb=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Банер (358х209)</td>
<td>
  <xsl:if test='$design/baner/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat($design/@id,'_3'))"/>
          <xsl:with-param name="type" select="$design/baner"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="baner"/></td>
</tr>

<tr>
<td class="title">Слоган</td>
<td><input type="text" size="50" name="slogan" value="{$design/@slogan}"/></td>
</tr>

<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$design/@description"/>
</textarea></td>
</tr>

<tr>
<td class="title">Изображение для примеров интерьера (358х209)</td>
<td>
  <xsl:if test='$design/ex_foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat($design/@id,'_4'))"/>
          <xsl:with-param name="type" select="$design/ex_foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="ex_foto"/></td>
</tr>

<!--
<tr>
<td class="title">Описание для примеров интерьера</td>
<td><textarea cols="50" rows="7" name="ex_description">
<xsl:value-of select="$design/@ex_description"/>
</textarea></td>
</tr>
-->

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$design/@srt}"/></td>
</tr>

<tr>
<td class="title">Показывать фотогалерею</td>
<td>
  <input type="checkbox" name="sh_fotogal">
  <xsl:if test='$design/@sh_fotogal=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать компоновки</td>
<td>
  <input type="checkbox" name="sh_arr">
  <xsl:if test='$design/@sh_arr=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать примеры</td>
<td>
  <input type="checkbox" name="sh_ex">
  <xsl:if test='$design/@sh_ex=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать промо-блок</td>
<td>
  <input type="checkbox" name="sh_promo">
  <xsl:if test='$design/@sh_promo=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать решения</td>
<td>
  <input type="checkbox" name="sh_sol">
  <xsl:if test='$design/@sh_sol=1'>
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
