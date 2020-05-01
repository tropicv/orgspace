<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="serialpath">
<a href="/">Orgspace</a> :  
<a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a> : 
</xsl:template>

<xsl:template name="serialspacer">
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

<xsl:template name="serialaddspacer">
<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>
</xsl:template>

<xsl:template name="serialmenu">
<xsl:param name="serial"/>
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
   prodm.link[i]="serial-addinf?walias=<xsl:value-of select="@walias"/>"; 
   i++;
</xsl:for-each>

<xsl:choose>
 <xsl:when test="$type='main'">
menu_x_plus[11]=11; menu_y_plus[11]=5;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 80);
 </xsl:when>
 <xsl:otherwise>
menu_x_plus[11]=11; menu_y_plus[11]=1;
CreateLayer(make_txt(prodm), 11, getY(document.dot11)+menu_y_plus[11], getX(document.dot11)+menu_x_plus[11], 80);
 </xsl:otherwise>
</xsl:choose>

<xsl:text disable-output-escaping="yes">//--></xsl:text>
</script>
</xsl:if>
</xsl:template>

<xsl:template name="serialrmenu">
<xsl:param name="cur"/>
<xsl:param name="serial"/>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot14" id="dot14"/><br/></td>
<td class="wtext"><div class="rmenu" name="orgmenu14head" id="orgmenu14head">
<xsl:choose>
<xsl:when test="$cur='addinf'"><xsl:value-of select="$lc/serial/description"/></xsl:when>
<xsl:otherwise><a href="serial-addinf?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/description"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>

<xsl:if test="$serial/@sh_color!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot14" id="dot14"/><br/></td>
<td class="wtext"><div class="rmenu" name="orgmenu14head" id="orgmenu14head">
<xsl:choose>
<xsl:when test="$cur='color'"><xsl:value-of select="$lc/serial/color"/></xsl:when>
<xsl:otherwise><a href="serial-color?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/color"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>

<xsl:if test="$serial/@sh_acs!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot13" id="dot13"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu13head" id="orgmenu13head">
<xsl:choose>
<xsl:when test="$cur='accessories'"><xsl:value-of select="$lc/serial/accessories"/></xsl:when>
<xsl:otherwise><a href="serial-accessories?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/accessories"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>

<xsl:if test="$serial/@sh_elem!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot13" id="dot13"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu13head" id="orgmenu13head">
<xsl:choose>
<xsl:when test="$cur='elements'"><xsl:value-of select="$lc/serial/elements"/></xsl:when>
<xsl:otherwise><a href="serial-elements?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/elements"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>


<xsl:if test="$serial/@sh_ex!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<xsl:choose>
<xsl:when test="$cur='example'"><xsl:value-of select="$lc/serial/example"/></xsl:when>
<xsl:otherwise><a href="serial-example?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/example"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>


<xsl:if test="$serial/@sh_arr!=0">
<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot12" id="dot12"/><br/></td>
<td class="wtext"><div class="rmenu"  name="orgmenu12head" id="orgmenu12head">
<xsl:choose>
<xsl:when test="$cur='arrange'"><xsl:value-of select="$lc/serial/arrange"/></xsl:when>
<xsl:otherwise><a href="serial-arrange?walias={$serial/@walias}"><xsl:value-of select="$lc/serial/arrange"/></a></xsl:otherwise>
</xsl:choose>
</div></td>
</tr>
</xsl:if>
</xsl:template>


</xsl:stylesheet>
