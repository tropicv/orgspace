<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template name="partdlg">
<xsl:param name="part"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="MIFdlg">Тип</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('type')"/>
        <xsl:with-param name="list" select="$part/type/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Слоган 1</td>
<td><input type="text" name="slogan1" value="{$part/@slogan1}" size="50"/></td>
</tr>

<tr>
<td class="title">Слоган 2</td>
<td><input type="text" name="slogan2" value="{$part/@slogan2}" size="50"/></td>
</tr>


<tr>
<td class="title">Изображение</td>
<td>
  <xsl:if test='$part/foto/extension'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('storypart_',concat($part/@id,'_1'))"/>
          <xsl:with-param name="type" select="$part/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
  <input type="file" name="foto"/>
</td>
</tr>


<tr>
<td class="title">Порядок</td>
<td><input type="text" name="srt" value="{$part/@srt}" size="5"/></td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Добавить"/></td>
</tr>



</table>

</xsl:template>

<xsl:template match="clip_partedit"> 

<h2>Редактор части</h2>

 <form method="POST" action="clip-partedit?state=1&amp;obj={storypart_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="partdlg">
	<xsl:with-param name="part" select="storypart_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
