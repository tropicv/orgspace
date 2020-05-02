<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../tobj/ws1.xsl"/> 
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template name="newsdlg">
<xsl:param name="news"/>

<table class="MIFdlg">

<tr>
<td class="title">Группа</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('grp')"/>
        <xsl:with-param name="list" select="$news/grp/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Топик</td>
<td>
<textarea cols="50" rows="3" name="topic">
  <xsl:value-of select="$news/@topic"/>
</textarea>
</td>
</tr>

<tr>
<td class="title">Текст</td>
<td>
<xsl:call-template name="edit_visual">
       <xsl:with-param name="data" select="$news/@body"/>
       <xsl:with-param name="pname" select="string('body')"/>
</xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Дата</td>
<td>
  <input type="text" size="12" value="{$news/@event_date}" name="event_date"/>
</td>
</tr>

<tr>
<td class="title">Ссылка на подробности</td>
<td>
  <input type="text" size="50" value="{$news/@link}" name="link"/>
</td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

<xsl:call-template name="edit_visual_end">
       <xsl:with-param name="data" select="$news/@body"/>
       <xsl:with-param name="pname" select="string('body')"/>
</xsl:call-template>

</table>

</xsl:template>

<xsl:template match="news_edit"> 

<h2>Редактор новости</h2>

<form name="composeForm" id="composeForm" onsubmit="return copydata('body');" method="POST" action="news-edit?state=1&amp;obj={news_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="newsdlg">
 	 <xsl:with-param name="news" select="news_db"/>
	</xsl:call-template>

</form>

</xsl:template>

</xsl:stylesheet>
