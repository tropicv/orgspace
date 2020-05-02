<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page_cont_l5">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>
<!-- End Path -->

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:if test="$content/container_view/list/child::*">
<xsl:variable name="cnt" select="count($content/container_view/list/bush_db)-1"/>
<xsl:call-template name="show_link_style">
<xsl:with-param name="bush" select="$content/container_view/list/bush_db[$cnt]"/>
<xsl:with-param name="style" select="string('white')"/>
</xsl:call-template>
</xsl:if>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">5</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</TD>

<td  valign="top">
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td valign="bottom">
<div><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
</td>
<td  valign="bottom">
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="748" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>

</table>

<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>
<td width="205" rowspan="2">

<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<h1><xsl:value-of select="$page/@title"/></h1>

<div class="print">
<xsl:if test="$page/@walias='sitemap'">
<xsl:choose>
<xsl:when test="($content/*/@vmode='all')">
<img src="/images/map.gif" width="43" height="22" border="0" vspace="5" hspace="5" align="absmiddle"/><a href="container-view?walias=sitemap" style="text-decoration: underline;"><xsl:value-of select="$lc/short_ver"/></a><br/>
<img src="/images/a_map_f.gif" width="43" height="34" border="0" vspace="5" hspace="5" align="absmiddle"/><xsl:value-of select="$lc/full_ver"/>
</xsl:when>
<xsl:otherwise>
<img src="/images/a_map.gif" width="43" height="22" border="0" vspace="5" hspace="5" align="absmiddle"/><xsl:value-of select="$lc/short_ver"/><br/>
<img src="/images/map_f.gif" width="43" height="34" border="0" vspace="5" hspace="5" align="absmiddle"/><a href="container-view?walias=sitemap&amp;vmode=all" style="text-decoration: underline;"><xsl:value-of select="$lc/full_ver"/></a>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
</div>
<br/><br/><br/><br/><br/>
</td>

<td rowspan="2"><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td class="text" width="100%">
<a name="top"/>
<!-- <img src="/images/dot.gif" width="1" height="6" border="0"/><br/> -->
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

   <xsl:call-template name="tabrow_view">
     <xsl:with-param name="page" select="$page"/>
   </xsl:call-template>

</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td width="205">

<div class="print" align="right" style="position:relative; top: -6px; z-index: 1;">
<a href="container-pview?obj={$page/@id}" target="blank"><xsl:value-of select="$lc/print_ver"/><img src="/images/print.gif" hspace="5" width="14" height="14" border="0" align="absmiddle"/></a>
</div>

<table border="0" cellspacing="0" cellpadding="0" class="prod">
<tr>
<td class="wnav">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
</tr>
</table>



</td>
</tr>

<tr>
<td class="text" colspan="3" width="100%">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">7</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>

</table>
<br/>
</xsl:template>

<xsl:template name="page_edit_l5">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

Layer 111
<xsl:call-template name="page_path_edit">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>


<!-- End Path -->

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td><img src="/images/dot.gif" width="760" height="4" border="0"/><br/>
Layer 5<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">5</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td></tr>

<tr><td>
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>
<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>
<td width="205" rowspan="2">

<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
Layer 1<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<h1><xsl:value-of select="$page/@title"/></h1>
<br/><br/><br/><br/><br/>
</td>

<td class="text" width="100%">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>
Layer 2<br/>

   <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
   </xsl:call-template>

   <xsl:call-template name="tabrow_edit">
     <xsl:with-param name="page" select="$page"/>
   </xsl:call-template>

 
</td>

<td width="205">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" class="prod">
<tr>
<td class="wnav">
Layer 4<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>
</table>

</td>
</tr>

<tr>
<td class="text" colspan="2" >
Layer 7<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">7</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="350" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>

</table>

</xsl:template>


</xsl:stylesheet>
