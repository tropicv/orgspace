<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../tobj/ws1.xsl"/> 

<xsl:template name="serialdlg">
<xsl:param name="serial"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$serial/@name}"/></td>
</tr>

<tr>
<td class="title">Краткое название</td>
<td><input type="text" name="short_name" value="{$serial/@short_name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$serial/@walias}"/></td>
</tr>

<tr>
<td class="title">Изображение (158x158)</td>
<td>
  <xsl:if test='$serial/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat($serial/@id,'_1'))"/>
          <xsl:with-param name="type" select="$serial/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое (42x42)</td>
<td>
  <xsl:if test='$serial/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat($serial/@id,'_2'))"/>
          <xsl:with-param name="type" select="$serial/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="title">Не показывать малое изображение</td>
<td>
  <input type="checkbox" name="sh_tmb">
  <xsl:if test='$serial/@sh_tmb=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>


<tr>
<td class="title">Дополнительное изображение (204x185)</td>
<td>
  <xsl:if test='$serial/add_foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat($serial/@id,'_4'))"/>
          <xsl:with-param name="type" select="$serial/add_foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="add_foto"/></td>
</tr>                        

<tr>
<td class="title">Банер (358х209)</td>
<td>
  <xsl:if test='$serial/baner/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('serial_',concat($serial/@id,'_3'))"/>
          <xsl:with-param name="type" select="$serial/baner"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="baner"/></td>
</tr>

<tr>
<td class="title">Текст около банера</td>
<td><textarea cols="50" rows="7" name="baner_text">
<xsl:value-of select="$serial/@baner_text"/>
</textarea></td>
</tr>

<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="short_description">
<xsl:value-of select="$serial/@short_description"/>
</textarea></td>
</tr>


<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$serial/@srt}"/></td>
</tr>

<tr>
<td class="title">Показывать аксессуары</td>
<td>
  <input type="checkbox" name="sh_acs">
  <xsl:if test='$serial/@sh_acs=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать элементы</td>
<td>
  <input type="checkbox" name="sh_elem">
  <xsl:if test='$serial/@sh_elem=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать цвета</td>
<td>
  <input type="checkbox" name="sh_color">
  <xsl:if test='$serial/@sh_color=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать фотогалерею</td>
<td>
  <input type="checkbox" name="sh_fotogal">
  <xsl:if test='$serial/@sh_fotogal=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать компоновки</td>
<td>
  <input type="checkbox" name="sh_arr">
  <xsl:if test='$serial/@sh_arr=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать промо-блок</td>
<td>
  <input type="checkbox" name="sh_promo">
  <xsl:if test='$serial/@sh_promo=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Показывать примеры интерьеров</td>
<td>
  <input type="checkbox" name="sh_ex">
  <xsl:if test='$serial/@sh_ex=1'>
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
