<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page_cont_l2">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>


<!-- End Path -->

<!-- Content -->

<!--
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td colspan="2"><img src="/images/dot.gif" width="760" height="1" border="0" /><br/></td>
</tr>
<tr>
<td><img src="/images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></td>
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

<td class="wtextl2" width="100%" valign="top" rowspan="2">
<div class="wtitle" style="float: left;">
<xsl:value-of select="$page/@title"/>
</div>

<div class="wtitle" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<xsl:choose>
<xsl:when test="count($content/container_view/list/bush_db)>=3">
    <a class="white" href="container-view?walias={$content/container_view/list/bush_db[3]/@walias}"><xsl:value-of select="$content/container_view/list/bush_db[3]/@title"/></a>
</xsl:when>
<xsl:otherwise>
    <xsl:variable name="nav_last" select="//nav_view/nav_db/bush_db[last()]" />
    <a class="white" href="container-view?walias={//nav_view/nav_db/bush_db[@link=$nav_last/@parent]/@walias}"><xsl:value-of select="//nav_view/nav_db/bush_db[@link=$nav_last/@parent]/@title"/></a>
</xsl:otherwise>
</xsl:choose>

</div>

<h1>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</h1>
<br/><br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>

<td align="right" valign="top">
<img src="/images/c-tr.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>


<tr>
<td valign="bottom">
<img src="/images/c-bl.gif" width="6" height="6" border="0" style="position:relative; left: -358px; z-index: 1;"/><br/>
</td>
<td align="right" valign="bottom">
<img src="/images/c-br.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="358" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="390" height="1" border="0" /><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0" /><br/></td>
</tr>

</table>

</xsl:template>

<xsl:template name="page_edit_l2">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

Layer 111
<xsl:call-template name="page_path_edit">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>


<!-- End Path -->

<!-- Content -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td><img src="/images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">

<tr>
<td rowspan="3">
Layer 1<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>

<td>
<img src="/images/dot.gif" width="1" height="100" border="0"/><br/>
</td>

<td class="wtitle" width="100%" align="right">
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<xsl:value-of select="$page/@title"/>
</td>
</tr>


<tr>
<td>
<img src="/images/dot.gif" width="1" height="152" border="0"/><br/>
</td>
<td class="wtext" valign="top">
Layer 2<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>

<br/>
Layer 3<br/>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>

<tr>
<td>
<img src="/images/c-bl.gif" width="6" height="6" border="0" style="position:relative; left: -359px; z-index: 1;"/><br/>
</td>
<td align="right">
<img src="/images/c-br.gif" width="6" height="6" border="0"/><br/>
</td>
</tr>
</table>

</xsl:template>

</xsl:stylesheet>
