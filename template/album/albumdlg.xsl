<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="albumdlg">
<xsl:param name="image"/>
<xsl:param name="album"/>
<xsl:param name="add"/>

<table class="MIFdlg">


<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$image/@name}"/></td>
</tr>

<tr>
<td class="title">Описание</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$image/@description"/>
</textarea></td>
</tr>


<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$image/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('imagegal_',concat($image/@id,'_1'))"/>
          <xsl:with-param name="type" select="$image/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое</td>
<td>
  <xsl:if test='$image/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('imagegal_',concat($image/@id,'_2'))"/>
          <xsl:with-param name="type" select="$image/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$image/@srt}" size="3"/></td>
</tr>


<xsl:if test="$add=1">


<tr>
<td><input type="hidden" name="supp_id" value="{$album/@obj}"/></td>
<td><input type="hidden" name="supp_type" value="{$album/@type}"/>

<xsl:choose>
<xsl:when test="$album/@ftype=1">
 <input type="hidden" name="ftype" value="{$album/@ftype}"/>
</xsl:when>
<xsl:otherwise>
 <input type="hidden" name="ftype" value="0"/>
</xsl:otherwise>
</xsl:choose>

</td>
</tr>
</xsl:if>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>

</xsl:template>

</xsl:stylesheet>
