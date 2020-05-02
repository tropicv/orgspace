<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../tobj/ws1.xsl"/> 
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template name="projectdlg">
<xsl:param name="project"/>

<table class="MIFdlg">

<tr>
<td class="title">Название</td>
<td><input type="text" name="name" value="{$project/@name}"/></td>
</tr>

<tr>
<td class="title">Краткое название</td>
<td><input type="text" name="short_name" value="{$project/@short_name}"/></td>
</tr>

<tr>
<td class="title">Алиас</td>
<td><input type="text" name="walias" value="{$project/@walias}"/></td>
</tr>

<tr>
<td class="title">Изображение (204x185)</td>
<td>
  <xsl:if test='$project/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('project_',concat($project/@id,'_1'))"/>
          <xsl:with-param name="type" select="$project/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">Изображение малое (158x158)</td>
<td>
  <xsl:if test='$project/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('project_',concat($project/@id,'_2'))"/>
          <xsl:with-param name="type" select="$project/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>


<tr>
<td class="title">Краткое описание</td>
<td><textarea cols="50" rows="7" name="short_description">
<xsl:value-of select="$project/@short_description"/>
</textarea></td>
</tr>


<tr>
<td class="title">Дополнительная информация </td>
<td>
<xsl:call-template name="edit_visual">
       <xsl:with-param name="data" select="$project/@description"/>
       <xsl:with-param name="pname" select="string('description')"/>
</xsl:call-template>

</td>
</tr>

<tr>
<td class="title">Автор (имя дилера)</td>
<td><input type="text" name="author" value="{$project/@author}"/></td>
</tr>

<tr>
<td class="title">Ведущий менеджер</td>
<td>
<select name="manager">
<xsl:for-each select="$project/../list/manager">
 <option value="{@id}">
   <xsl:if test="@id=$project/@manager"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
</select>
</td>
</tr>

<tr>
<td class="title">Зоны офиса</td>
<td>
  <select name="zones[]" size="8" multiple="multiple">
<xsl:for-each select="$project/../list/zone">
 <option value="{@id}">
   <xsl:if test="contains($project/@zone,@id)"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
  </select>
</td>
</tr>

<tr>
<td class="MIFdlg">Показывать зоны</td>
<td>
  <input type="checkbox" name="sh_zone">
  <xsl:if test='$project/@sh_zone=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Серии</td>
<td>
  <select name="serials[]" size="6" multiple="multiple">
<xsl:for-each select="$project/../list/serial">
 <option value="{@id}">
   <xsl:if test="contains($project/@serial,@id)"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
  </select>
</td>
</tr>


<tr>
<td class="MIFdlg">Характеристика объекта</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('otype')"/>
        <xsl:with-param name="list" select="$project/otype/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="MIFdlg">Показывать характеристику</td>
<td>
  <input type="checkbox" name="sh_otype">
  <xsl:if test='$project/@sh_otype=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$project/@srt}"/></td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

<xsl:call-template name="edit_visual_end">
       <xsl:with-param name="data" select="$project/@description"/>
       <xsl:with-param name="pname" select="string('description')"/>
</xsl:call-template>

</table>


</xsl:template>

</xsl:stylesheet>
