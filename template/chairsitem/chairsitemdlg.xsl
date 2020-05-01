<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template name="chairsitemdlg">
<xsl:param name="chairsitem"/>
<xsl:param name="product"/>
<xsl:param name="add"/>

<table class="MIFdlg">


<tr>
<td class="title">��������</td>
<td><input type="text" name="name" value="{$chairsitem/@name}"/></td>
</tr>

<tr>
<td class="title">�������</td>
<td><input type="text" name="code" value="{$chairsitem/@code}"/></td>
</tr>

<tr>
<td class="title">�����</td>
<td>
<select name="serial_id">
<xsl:for-each select="$chairsitem/../chairs/list_all/list_one">
 <option value="{@id}">
   <xsl:if test="@id=$chairsitem/@chairs_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="@name"/>
 </option>
</xsl:for-each>
</select>
</td>
</tr>

<!--

<tr>
<td class="title">��������</td>
<td><textarea cols="50" rows="7" name="description">
<xsl:value-of select="$chairsitem/@description"/>
</textarea></td>
</tr>


<tr>
<td class="title">������� ��������</td>
<td><textarea cols="50" rows="7" name="short_description">
<xsl:value-of select="$chairsitem/@short_description"/>
</textarea></td>
</tr>

-->
<tr>
<td class="title">����������� (158x158)</td>
<td>
  <xsl:if test='$chairsitem/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairsitem_',concat($chairsitem/@id,'_1'))"/>
          <xsl:with-param name="type" select="$chairsitem/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<!--<tr>
<td class="title">����������� �����</td>
<td>
  <xsl:if test='$chairsitem/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairsitem_',concat($chairsitem/@id,'_2'))"/>
          <xsl:with-param name="type" select="$chairsitem/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

-->

<tr>
<td class="title">������� ����������</td>
<td><input type="text" name="srt" value="{$chairsitem/@srt}"/></td>
</tr>

<xsl:if test="$add=1">
<tr>
<td><input type="hidden" name="chairs_id" value="{$product/@obj}"/></td>
<td></td>
</tr>
</xsl:if>


<tr>
<td class="title">�����������<br/><i>(������ �����������,<br/>��� '����� ������������')</i></td>
<td>
  <input type="checkbox" name="block">
  <xsl:if test='$chairsitem/@block=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="���������"/></td>
</tr>

</table>

</xsl:template>

</xsl:stylesheet>
