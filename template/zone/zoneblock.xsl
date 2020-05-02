<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="zonepath">
<a href="/">Orgspace</a> : 
<a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a> :
</xsl:template>

<xsl:template name="zonespacer">
<tr>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="23" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="24" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="24" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="24" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="23" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="107" height="1" border="0"/><br/></td>
</tr>
</xsl:template>

<xsl:template name="zoneaddspacer">
<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>
</xsl:template>

<xsl:template name="zonemenu">
<xsl:param name="zone"/>
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
<!-- <xsl:if test="$zone!=@walias"> -->
   prodm.title[i]="<xsl:value-of select="@name"/>"; 
   prodm.link[i]="zone-solution?walias=<xsl:value-of select="@walias"/>"; 
   i++;
<!-- </xsl:if> -->
</xsl:for-each>

<xsl:choose>
 <xsl:when test="$type='main'">
menu_x_plus[11]=21; menu_y_plus[11]=10;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 120);
 </xsl:when>
 <xsl:otherwise>
menu_x_plus[11]=11; menu_y_plus[11]=1;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 120);
 </xsl:otherwise>
</xsl:choose>

<xsl:text disable-output-escaping="yes">//--></xsl:text>
</script>
</xsl:if>
</xsl:template>

<xsl:template name="zonermenu">
<xsl:param name="cur"/>
<xsl:param name="zone"/>

<!--
<xsl:if test="zone_db/@id=2">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<a href="container-view?obj=711">bench-системы</a>
</div></td>
</tr>
</xsl:if>

<xsl:if test="$zone/@sh_sol!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<xsl:choose>
<xsl:when test="$cur='solution'"><xsl:value-of select="$lc/zone/solution"/></xsl:when>
<xsl:otherwise><a href="zone-solution?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/solution"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>

<xsl:if test="$zone/@sh_ex!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<xsl:choose>
<xsl:when test="$cur='example'"><xsl:value-of select="$lc/zone/example"/></xsl:when>
<xsl:otherwise><a href="zone-example?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/example"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>

<xsl:if test="$zone/@sh_arr!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<xsl:choose>
<xsl:when test="$cur='arrange'"><xsl:value-of select="$lc/zone/arrange"/></xsl:when>
<xsl:otherwise><a href="zone-arrange?walias={$zone/@walias}"><xsl:value-of select="$lc/zone/arrange"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>
-->
</xsl:template>

</xsl:stylesheet>
