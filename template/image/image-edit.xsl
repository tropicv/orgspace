<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="imagedlg">
<xsl:param name="image"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('image_',concat($image/@id,'_1'))"/>
          <xsl:with-param name="type" select="$image/image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="image"/>
</td>
</tr>

<tr>
<td class="title">
 <xsl:choose>
  <xsl:when test="@creator='image.view.link'">Ссылка</xsl:when>
  <xsl:otherwise>Подпись</xsl:otherwise>
 </xsl:choose>
</td>
<td>
  <input name="title" type="text" size="50" maxLength="300" value="{$image/@title}"/>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>


</table>

</xsl:template>

<xsl:template match="image_edit"> 


<h2>Редактор изображения</h2>

 <form method="POST" action="image-edit?state=1&amp;obj={image_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="imagedlg">
	<xsl:with-param name="image" select="image_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
