<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="predmetpath">
<a href="/">Orgspace</a> : 
<a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a> : 
</xsl:template>

<!--
<xsl:template name="predmetmenu">
<xsl:param name="predmet"/>
<xsl:param name="list"/>

<xsl:for-each select="$list/list_one">
 <xsl:if test="$predmet!=@walias">
<td><img src="/images/dot.gif" width="13" height="1" border="0" /><br/></td>
<td class="wmenu"><a href="predmet-view?walias={@walias}"><xsl:value-of select="@name"/></a></td>
 </xsl:if>
</xsl:for-each>

</xsl:template>
-->

<xsl:template name="predmetmenu">
<xsl:param name="predmet"/>
<xsl:param name="list"/>
<xsl:param name="type"/>

<xsl:if test="$print!=1">

<script language="JavaScript1.2">
<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text>
i=0;

prodm=new menu();
prodm.name="7"; 
prodm.color="9DB9D3"; 
prodm.acolor="C4D5E5"; 
<xsl:for-each select="$list/list_one">
   prodm.title[i]="<xsl:value-of select="@name"/>"; 
   prodm.link[i]="predmet-view?walias=<xsl:value-of select="@walias"/>"; 
   i++;
</xsl:for-each>

<xsl:choose>
 <xsl:when test="$type='main'">
menu_x_plus[11]=11; menu_y_plus[11]=10;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 130);
 </xsl:when>
 <xsl:otherwise>
menu_x_plus[11]=11; menu_y_plus[11]=1;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 130);
 </xsl:otherwise>
</xsl:choose>

<xsl:text disable-output-escaping="yes">//--></xsl:text>
</script>
</xsl:if>
</xsl:template>

</xsl:stylesheet>
