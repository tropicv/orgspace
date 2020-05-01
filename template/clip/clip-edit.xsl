<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="clipdlg">
<xsl:param name="clip"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$clip/@name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$clip/@walias}"/></td>
</tr>

<tr>
<td class="title">Флеш ролик</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_file_stuff">
          <xsl:with-param name="id" select="concat('clip_',concat($clip/@id,'_1'))"/>
          <xsl:with-param name="type" select="$clip/flash"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="flash"/>
</td>
</tr>


<tr>
<td class="title">Ширина (px)</td>
<td><input type="text" name="w" value="{$clip/@w}"/></td>
</tr>

<tr>
<td class="title">Высота (px)</td>
<td><input type="text" name="h" value="{$clip/@h}"/></td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>


</table>

</xsl:template>

<xsl:template match="clip_edit"> 

<h2>Редактор клипа</h2>

 <form method="POST" action="clip-edit?state=1&amp;obj={clip_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="clipdlg">
	<xsl:with-param name="clip" select="clip_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
