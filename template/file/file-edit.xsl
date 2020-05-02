<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="filedlg">
<xsl:param name="file"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">Текущий файл</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_file_stuff">
          <xsl:with-param name="id" select="concat('file_',concat($file/@id,'_1'))"/>
          <xsl:with-param name="type" select="$file/file"/>
          <xsl:with-param name="txt" select="$file/@title"/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="file"/>
</td>
</tr>

<tr>
<td class="title">Название файла</td>
<td>
  <input name="title" type="text" size="50" maxLength="300" value="{$file/@title}"/>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>


</table>

</xsl:template>

<xsl:template match="file_edit"> 

<h2>Редактор файла</h2>

 <form method="POST" action="file-edit?state=1&amp;obj={file_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="filedlg">
	<xsl:with-param name="file" select="file_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
