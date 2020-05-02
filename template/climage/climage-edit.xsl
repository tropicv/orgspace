<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="climagedlg">
<xsl:param name="climage"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('climage_',concat($climage/@id,'_1'))"/>
          <xsl:with-param name="type" select="$climage/image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="image"/>
</td>
</tr>

<tr>
<td class="title">Большое Изображение</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('climage_',concat($climage/@id,'_2'))"/>
          <xsl:with-param name="type" select="$climage/bigimage"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="bigimage"/>
</td>
</tr>

<tr>
<td class="title">Подпись</td>
<td>
  <input name="title" type="text" size="50" maxLength="300" value="{$climage/@title}"/>
</td>
</tr>

<tr>
<td class="title">link</td>
<td>
  <input name="link" type="text" size="50" maxLength="300" value="{$climage/@link}"/>
</td>
</tr>


<tr>
<td class="MIFdlg">Без отступов</td>
<td>
  <input type="checkbox" name="pad">
  <xsl:if test='$climage/@pad=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Первое в ряду</td>
<td>
  <input type="checkbox" name="first">
  <xsl:if test='$climage/@first=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Последнее в ряду</td>
<td>
  <input type="checkbox" name="last">
  <xsl:if test='$climage/@last=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">Изображение для сладера</td>
<td>
  <input type="checkbox" name="is_slider">
  <xsl:if test='$climage/@is_slider=1'>
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

<xsl:template match="climage_edit"> 

<h2>Редактор изображения</h2>

 <form method="POST" action="climage-edit?state=1&amp;obj={climage_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="climagedlg">
	<xsl:with-param name="climage" select="climage_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
