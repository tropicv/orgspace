<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
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

<xsl:template match="container_view_goodsl4"> 

<xsl:call-template name="goodsl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('prod')"/>
</xsl:call-template>

</xsl:template>






<xsl:template name="goodsl4"> 
<xsl:param name="page"/>
<xsl:param name="class"/>

<!-- Path -->

<xsl:choose>
<xsl:when test="../@rurl!='container-view'">
 <xsl:apply-templates select="$content/child::*" mode="path"/>
</xsl:when>
<xsl:otherwise>
 <br/>
</xsl:otherwise>
</xsl:choose>

<!-- End Path -->

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="{$class}">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<xsl:if test="../@rurl!='container-view'">
 <xsl:apply-templates select="$content/child::*" mode="title"/>
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

<xsl:if test="$print!=1">
<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="748" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>
</xsl:if>

</table>

<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>
<xsl:if test="$print!=1">
<td width="205">

<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
    <xsl:if test="../@rurl!='container-view'">
      <xsl:apply-templates select="$content/child::*" mode="left_start"/>
    </xsl:if>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

    <xsl:if test="../@rurl!='container-view'">
      <xsl:apply-templates select="$content/child::*" mode="left_end"/>
    </xsl:if>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<xsl:if test="../@rurl!='container-view'">
 <p class="h1"><xsl:apply-templates select="$content/child::*" mode="content_title"/></p>
 <!--h1><xsl:apply-templates select="$content/child::*" mode="content_title"/></h1-->
</xsl:if>

<br/><br/><br/><br/><br/>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
</xsl:if>

<td class="text" width="100%">
<!--  <img src="/images/dot.gif" width="1" height="6" border="0"/><br/>  -->

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="content_start"/>
    </xsl:if>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

   <xsl:call-template name="tabrow_view">
     <xsl:with-param name="page" select="$page"/>
   </xsl:call-template>

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="content_end"/>
    </xsl:if>

</td>

<xsl:if test="$print!=1">
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

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="right_start"/>
    </xsl:if>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="right_end"/>
    </xsl:if>
</td>
</tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<div class="print" align="right">
<a href="{$content/*/@req_url}&amp;ver=print" target="blank"><xsl:value-of select="$lc/print_ver"/> <img src="/images/print.gif" width="14" height="14" border="0" hspace="5" align="absmiddle"/></a>
</div>

<table border="0" cellspacing="0" cellpadding="0" class="prod">
<tr>
<td class="wnav">

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="under_start"/>
    </xsl:if>
    
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>

    <xsl:if test="../@rurl!='container-view'">
     <xsl:apply-templates select="$content/child::*" mode="under_end"/>
    </xsl:if>
</td>
</tr>
</table>

<!-- TEST CHAIRS -->
 <xsl:if test="../@rurl!='chairs-order'">
	<table border="0" cellspacing="0" cellpadding="0" width="205" class="{$class}">
	<tr>
		<td colspan="2">
			<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
			<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
		</td>
	</tr>
	<tr>
		<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
		<td class="wtext">
			<div style="margin: 5px 0;"><a href="chairs-order?walias={chairs_example/@walias}&obj={chairs_example/@obj}" style="padding: 5px 0;">Заказать</a></div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
			<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
		</td>
	</tr>
	</table>
</xsl:if>


</td>
</xsl:if>
</tr>

<tr>

<xsl:if test="$print!=1">
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</xsl:if>

</tr>

</table>
<br/>
</xsl:template>

</xsl:stylesheet>
