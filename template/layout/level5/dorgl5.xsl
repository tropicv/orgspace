<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_view_dorgl5_edit"> 

<xsl:call-template name="page_edit_l5">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
</xsl:call-template>


<xsl:call-template name="page_workplace">
     <xsl:with-param name="page" select="container_db"/>
</xsl:call-template>

</xsl:template>


<xsl:template match="container_view_dorgl5"> 

<xsl:call-template name="dorgl5">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
</xsl:call-template>

</xsl:template>


<xsl:template name="dorgl5"> 
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>
<xsl:apply-templates select="$content/child::*" mode="path"/>

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
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">5</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
<xsl:apply-templates select="$content/child::*" mode="title"/>
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
    <xsl:apply-templates select="$content/child::*" mode="left_start"/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
    <xsl:apply-templates select="$content/child::*" mode="left_end"/>

</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<h1><xsl:apply-templates select="$content/child::*" mode="content_title"/></h1>

<br/><br/><br/><br/><br/>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td class="text" width="100%">
 <img src="/images/dot.gif" width="1" height="6" border="0"/><br/> 

   <xsl:apply-templates select="$content/child::*" mode="content_start"/>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

   <xsl:call-template name="tabrow_view">
     <xsl:with-param name="page" select="$page"/>
   </xsl:call-template>

   <xsl:apply-templates select="$content/child::*" mode="content_end"/>

</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td width="205">
<img src="/images/dot.gif" width="205" height="6" border="0"/><br/>

    <xsl:apply-templates select="$content/child::*" mode="right_print"/>


<table border="0" cellspacing="0" cellpadding="0" class="prod">
<tr>
<td class="wnav">

    <xsl:apply-templates select="$content/child::*" mode="under_start"/>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

    <xsl:apply-templates select="$content/child::*" mode="under_end"/>

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

</xsl:stylesheet>
