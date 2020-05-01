<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="predmetdlg">
<xsl:param name="predmet"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$predmet/@name}"/></td>
</tr>

<tr>
<td class="title">Краткое название</td>
<td><input type="text" name="short_name" value="{$predmet/@short_name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$predmet/@walias}"/></td>
</tr>

<tr>
<td class="title">Изображение (158х158)</td>
<td>
  <xsl:if test='$predmet/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('predmet_',concat($predmet/@id,'_1'))"/>
          <xsl:with-param name="type" select="$predmet/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое (42х42)</td>
<td>
  <xsl:if test='$predmet/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('predmet_',concat($predmet/@id,'_2'))"/>
          <xsl:with-param name="type" select="$predmet/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="MIFdlg">Не показывать малое изображение</td>
<td>
  <input type="checkbox" name="sh_tmb">
  <xsl:if test='$predmet/@sh_tmb=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>


<tr>
<td class="title">Банер (358х209)</td>
<td>
  <xsl:if test='$predmet/baner/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('predmet_',concat($predmet/@id,'_3'))"/>
          <xsl:with-param name="type" select="$predmet/baner"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="baner"/></td>
</tr>

<tr>
<td class="title">Слоган</td>
<td><input type="text" size="50" name="slogan" value="{$predmet/@slogan}"/></td>
</tr>

<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$predmet/@description"/>
</textarea></td>
</tr>

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$predmet/@srt}"/></td>
</tr>

<tr>
<td class="MIFdlg">Показывать типы предметов</td>
<td>
  <input type="checkbox" name="sh_type">
  <xsl:if test='$predmet/@sh_type=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Заголовок для фотогалереи</td>
<td><input type="text" name="fototitle" value="{$predmet/@fototitle}" size="50"/></td>
</tr>

<tr>
<td class="MIFdlg">Показывать фотогалерею</td>
<td>
  <input type="checkbox" name="sh_fotogal">
  <xsl:if test='$predmet/@sh_fotogal=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Показывать ассортимент</td>
<td>
  <input type="checkbox" name="sh_assort">
  <xsl:if test='$predmet/@sh_assort=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать промо-блок</td>
<td>
  <input type="checkbox" name="sh_promo">
  <xsl:if test='$predmet/@sh_promo=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Блокировать</td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$predmet/@block=1'>
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
