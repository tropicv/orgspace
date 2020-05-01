<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../util/util.xsl"/>

<xsl:template match="promo_abc"> 


<h1>����������</h1>
<br/>

<form method="POST" action="promo-test">

<table border="1">
<tr>
 <td><b>N</b></td>
 <td><b>��������</b></td>
 <td><b>���</b></td>
 <td><b>�����������</b></td>
 <td><b>���� ����������</b></td>
 <td><b>��������</b></td>
 <td><b>����</b></td>
</tr>

<xsl:for-each select='list/promo_db'>
<tr>
 <td><xsl:value-of select="@id"/></td>
 <td><xsl:value-of select="@alt"/></td>
 <td>
   <xsl:choose>
     <xsl:when test="@type=1">����� ����</xsl:when>
     <xsl:when test="@type=2">�����</xsl:when>
     <xsl:when test="@type=3">����</xsl:when>
     <xsl:otherwise>���</xsl:otherwise>
   </xsl:choose>
 </td>

 <td align="center">
   <xsl:choose>
     <xsl:when test="@is_public=1">��</xsl:when>
     <xsl:otherwise>���</xsl:otherwise>
   </xsl:choose>
 </td>
 <td align="right"><xsl:value-of select="@open_date"/></td>
 <td> 
    <xsl:if test="$admin=1">
     <a href="promo-edit?obj={@id}">�������������</a> | <a href="promo-del?obj={@id}">�������</a>
    </xsl:if>
 </td>
 <td><input type="checkbox" name="promo_{@id}"/></td>
</tr>
</xsl:for-each>

<tr>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td><input type="submit" value=">>"/></td>
</tr>

</table>

</form>

<xsl:if test="$admin=1">
 <xsl:for-each select="promo_list_size_info/page">
  <a href="/promo-abc?pg={@number}">
    <xsl:value-of select="@number"/>
  </a>
  <xsl:text disable-output-escaping="yes">&nbsp;</xsl:text>
 </xsl:for-each>
  <br/>
  [<a href="promo-add">�������� ���������</a>]
  <br/>
</xsl:if>


</xsl:template>


</xsl:stylesheet>

