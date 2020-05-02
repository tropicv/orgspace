<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page_cont_l5">
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- <img src="/images/dot.gif" width="1" height="10" border="0"/><br/> -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="$page"/>
</xsl:call-template>

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:if test="$content/container_pview/list/child::*">
<xsl:variable name="cnt" select="count($content/container_pview/list/bush_db)-1"/>
<xsl:call-template name="show_link_style">
<xsl:with-param name="bush" select="$content/container_pview/list/bush_db[$cnt]"/>
<xsl:with-param name="style" select="string('white')"/>
</xsl:call-template>
</xsl:if>
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

<!--
<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="748" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>
-->

</table>

<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>

<td class="text" width="100%">
<!-- <img src="/images/dot.gif" width="1" height="6" border="0"/><br/> -->
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

   <xsl:call-template name="tabrow_view">
     <xsl:with-param name="page" select="$page"/>
   </xsl:call-template>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">7</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

</td>

</tr>

<!--
<tr>
<td><img src="/images/dot.gif" width="760" height="1" border="0"/><br/></td>
</tr>
-->

</table>
<br/>
</xsl:template>


</xsl:stylesheet>
