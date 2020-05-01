<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../tobj/ws1.xsl"/> 

<xsl:template name="chairsdlg">
<xsl:param name="chairs"/>

<table class="MIFdlg">

<tr>
<td class="title">��������</td>
<td><input type="text" name="name" value="{$chairs/@name}"/></td>
</tr>

<tr>
<td class="title">������� ��������</td>
<td><input type="text" name="short_name" value="{$chairs/@short_name}"/></td>
</tr>

<tr>
<td class="title">������</td>
<td><input type="text" name="slogan" value="{$chairs/@slogan}"/></td>
</tr>




<tr>
<td class="title">�����</td>
<td><input type="text" name="walias" value="{$chairs/@walias}"/></td>
</tr>

<tr>
<td class="title">����������� (158x158)</td>
<td>
  <xsl:if test='$chairs/foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat($chairs/@id,'_1'))"/>
          <xsl:with-param name="type" select="$chairs/foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="foto"/></td>
</tr>

<tr>
<td class="title">����������� ����� (42x42)</td>
<td>
  <xsl:if test='$chairs/thumb/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat($chairs/@id,'_2'))"/>
          <xsl:with-param name="type" select="$chairs/thumb"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="thumb"/></td>
</tr>

<tr>
<td class="title">�� ���������� ����� �����������</td>
<td>
  <input type="checkbox" name="sh_tmb">
  <xsl:if test='$chairs/@sh_tmb=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>


<tr>
<td class="title">�������������� ����������� (204x185)</td>
<td>
  <xsl:if test='$chairs/add_foto/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat($chairs/@id,'_4'))"/>
          <xsl:with-param name="type" select="$chairs/add_foto"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="add_foto"/></td>
</tr>                        

<tr>
<td class="title">����� (358�209)</td>
<td>
  <xsl:if test='$chairs/baner/name'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('chairs_',concat($chairs/@id,'_3'))"/>
          <xsl:with-param name="type" select="$chairs/baner"/>
          <xsl:with-param name="max" select='string("300")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="baner"/></td>
</tr>

<tr>
<td class="title">����� ����� ������</td>
<td><textarea cols="50" rows="7" name="baner_text">
<xsl:value-of select="$chairs/@baner_text"/>
</textarea></td>
</tr>

<tr>
<td class="title">������� ��������</td>
<td><textarea cols="50" rows="7" name="short_description">
<xsl:value-of select="$chairs/@short_description"/>
</textarea></td>
</tr>

<tr>
<td class="title">����� ����� ��������</td>
<td><input type="text" name="example" value="{$chairs/@example}"/></td>
</tr>

<tr>
<td class="title">������� ����������</td>
<td><input type="text" name="srt" value="{$chairs/@srt}"/></td>
</tr>

<!--
<tr>
<td class="title">���������� �����������</td>
<td>
  <input type="checkbox" name="sh_fotogal">
  <xsl:if test='$chairs/@sh_fotogal=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>
-->

<tr>
<td class="title">���������� �����-����</td>
<td>
  <input type="checkbox" name="sh_promo">
  <xsl:if test='$chairs/@sh_promo=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">������ ��������</td>
<td>
  <input type="checkbox" name="ch_type">
  <xsl:if test='$chairs/@ch_type=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title">�����������</td>
<td>
  <input type="checkbox" name="sh_acs">
  <xsl:if test='$chairs/@sh_acs=1'>
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
