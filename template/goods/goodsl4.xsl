<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_view_goodsl4_edit"> 

<xsl:call-template name="page_edit_l4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('prod')"/>
</xsl:call-template>


<xsl:call-template name="page_workplace">
     <xsl:with-param name="page" select="container_db"/>
</xsl:call-template>

</xsl:template>

<xsl:template match="container_view_prodl4"> 

<xsl:variable name="class" select="string('prod')"/>
<xsl:variable name="page" select="container_db"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="container_db"/>
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
<xsl:value-of select="$content/container_view/list/bush_db[4]/@title"/>
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
<td width="205">

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
<br/><br/><br/><br/><br/>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td class="text" width="100%">
<!-- <img src="/images/dot.gif" width="1" height="6" border="0"/><br/> -->
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td width="205">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="205" class="{$class}">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext">
<!-- <xsl:value-of select="$page/@title"/><br/> -->
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
</tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<div class="print" align="right">
<a href="container-pview?obj={$page/@id}" target="blank"><xsl:value-of select="$lc/print_ver"/> <img src="/images/print.gif" width="14" height="14" border="0" align="absmiddle" hspace="5"/></a>
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
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>

</table>
<br/>
</xsl:template>

<xsl:template name="page_edit_l4">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

Layer 111
<xsl:call-template name="page_path_edit">
     <xsl:with-param name="path" select="container_db"/>
</xsl:call-template>


<!-- End Path -->

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td><img src="/images/dot.gif" width="760" height="4" border="0"/><br/></td></tr>

<tr><td>
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>
<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>
<td width="205">

<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
Layer 1<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<h1><xsl:value-of select="container_db/@title"/></h1>
<br/><br/><br/><br/><br/>
</td>

<td class="text" width="100%">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>
Layer 2<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>

<td width="205">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="205" class="{$class}">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext">
<!-- <xsl:value-of select="container_db/@title"/><br/> -->
Layer 3<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" class="prod">
<tr>
<td class="wnav">
Layer 4<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>
</table>

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
