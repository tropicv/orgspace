<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="zonedlg">
<xsl:param name="zone"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$zone/@name}"/></td>
</tr>

<tr>
<td class="title">Краткое название</td>
<td><input type="text" name="short_name" value="{$zone/@short_name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$zone/@walias}"/></td>
</tr>

<tr>
<td class="title">Изображение (158х158)</td>
<td>
  <xsl:if test='$zone/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat($zone/@id,'_1'))"/>
          <xsl:with-param name="type" select="$zone/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое (42х42)</td>
<td>
  <xsl:if test='$zone/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat($zone/@id,'_2'))"/>
          <xsl:with-param name="type" select="$zone/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="MIFdlg">Не показывать малое изображение</td>
<td>
  <input type="checkbox" name="sh_tmb">
  <xsl:if test='$zone/@sh_tmb=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Банер (358х209)</td>
<td>
  <xsl:if test='$zone/baner/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat($zone/@id,'_3'))"/>
          <xsl:with-param name="type" select="$zone/baner"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="baner"/></td>
</tr>

<tr>
<td class="title">Слоган</td>
<td><input type="text" size="50" name="slogan" value="{$zone/@slogan}"/></td>
</tr>

<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$zone/@description"/>
</textarea></td>
</tr>

<tr>
<td class="title">Изображение для примеров интерьера (358х209)</td>
<td>
  <xsl:if test='$zone/ex_foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('zone_',concat($zone/@id,'_4'))"/>
          <xsl:with-param name="type" select="$zone/ex_foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="ex_foto"/></td>
</tr>

<!--
<tr>
<td class="title">Описание для примеров интерьера</td>
<td><textarea cols="50" rows="7" name="ex_description">
<xsl:value-of select="$zone/@ex_description"/>
</textarea></td>
</tr>
-->

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$zone/@srt}"/></td>
</tr>

<tr>
<td class="title">Показывать фотогалерею</td>
<td>
  <input type="checkbox" name="sh_fotogal">
  <xsl:if test='$zone/@sh_fotogal=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать компоновки</td>
<td>
  <input type="checkbox" name="sh_arr">
  <xsl:if test='$zone/@sh_arr=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать примеры</td>
<td>
  <input type="checkbox" name="sh_ex">
  <xsl:if test='$zone/@sh_ex=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать промо-блок</td>
<td>
  <input type="checkbox" name="sh_promo">
  <xsl:if test='$zone/@sh_promo=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать решения</td>
<td>
  <input type="checkbox" name="sh_sol">
  <xsl:if test='$zone/@sh_sol=1'>
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
