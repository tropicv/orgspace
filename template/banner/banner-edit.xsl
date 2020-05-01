<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template name="bannerdlg">
<xsl:param name="banner"/>
<xsl:param name="add"/>

<table class="MIFdlg">

<tr>
<td class="title">�����������</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('banner_',concat($banner/@id,'_1'))"/>
          <xsl:with-param name="type" select="$banner/image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
<input type="file" name="image"/>
</td>
</tr>

<tr>
<td class="title">������� ��� ������� (alt)</td>
<td><input size="50" type="text" name="alt" value="{$banner/@alt}"/></td>
</tr>

<tr>
<td class="title">������ ��� ����� (href)</td>
<td><input size="50" type="text" name="link" value="{$banner/@link}"/></td>
</tr>


<tr>
<td class="MIFdlg">�����������</td>
<td>
  <input type="checkbox" name="is_public">
  <xsl:if test='$banner/@is_public=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="MIFdlg">��������������� �������</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('target')"/>
        <xsl:with-param name="list" select="$banner/target/word"/>
      </xsl:call-template>

<!--
      <xsl:call-template name="chkselect_dict">
        <xsl:with-param name="name" select="string('target')"/>
        <xsl:with-param name="list" select="$banner/target"/>
      </xsl:call-template>
-->
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="��������"/></td>
</tr>


</table>

</xsl:template>

<xsl:template match="banner_edit"> 

<h2>�������� ������</h2>

 <form method="POST" action="banner-edit?state=1&amp;obj={banner_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="bannerdlg">
	<xsl:with-param name="banner" select="banner_db"/>
	<xsl:with-param name="add" select="number('0')"/>
	</xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
