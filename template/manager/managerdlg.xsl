<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template name="managerdlg">
<xsl:param name="manager"/>

<table class="MIFdlg">

<tr>
<td class="title">Команда</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('team')"/>
        <xsl:with-param name="list" select="$manager/team/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Имя</td>
<td><input type="text" name="name" value="{$manager/@name}"/></td>
</tr>


<tr>
<td class="title">Фото (156x156)</td>
<td>
  <xsl:if test='$manager/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('manager_',concat($manager/@id,'_1'))"/>
          <xsl:with-param name="type" select="$manager/foto"/>
          <xsl:with-param name="max" select='string("156")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>


<tr>
<td class="title">Девиз</td>
<td><textarea cols="50" rows="7" name="slogan">
<xsl:value-of select="$manager/@slogan"/>
</textarea></td>
</tr>


<tr>
<td class="title">E-mail</td>
<td><input type="text" name="email" value="{$manager/@email}"/></td>
</tr>

<tr>
<td class="title">Tel/Fax</td>
<td><input type="text" name="tel" value="{$manager/@tel}"/></td>
</tr>


<tr>
<td class="MIFdlg">Показывать проекты</td>
<td>
  <input type="checkbox" name="sh_prj">
  <xsl:if test='$manager/@sh_prj=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">Порядок сортировки</td>
<td><input type="text" name="srt" value="{$manager/@srt}"/></td>
</tr>


<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

</table>


</xsl:template>

</xsl:stylesheet>
