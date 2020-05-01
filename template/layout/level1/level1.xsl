<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page_cont_l1">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>


<!-- End Path -->

<!--
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td colspan="2"><img src="/images/dot.gif" width="760" height="1" border="0" /><br/></td>
</tr>
<tr>
<td><img src="images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></td>
</tr>
</table>
-->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">

<tr>
<td rowspan="2">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
<td valign="top">
<img src="/images/c-tl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td align="right" valign="top">
<img src="/images/c-tr.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>

<tr>
<td>
<img src="/images/dot.gif" width="6" height="123" border="0"/><br/>
</td>
<td class="wslogan" align="right" width="100%">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="358" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="396" height="1" border="0" /><br/></td>
</tr>
</table>

<h1><xsl:value-of select="$page/@title"/></h1>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}" >
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</table>


</xsl:template>

<xsl:template name="page_edit_l1">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

Layer 111
<xsl:call-template name="page_path_edit">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>


<!-- End Path -->



<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td colspan="2"><img src="/images/dot.gif" width="760" height="1" border="0" /><br/></td>
</tr>
<tr>
<td><img src="images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">

<tr>
<td>
Layer 1<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
<td class="wslogan" align="right">
Layer 2<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="358" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="402" height="1" border="0" /><br/></td>
</tr>
</table>

<h1><xsl:value-of select="$page/@title"/></h1>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}" >
<tr>
<td>
Layer 3<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>
</table>

</xsl:template>

</xsl:stylesheet>
