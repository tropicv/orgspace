<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="line3_blk_edit">
<xsl:param name="num" />

<!--li-->
<td width="33%">

<table border="0" cellspacing="0" cellpadding="0" class="cattext">

<tr>
<td class="p5">
    <h5>Ссылка (Layer <xsl:value-of select="$num"/>):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="$num"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>

<tr>
<td>

<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
    <h5>Изображение (Layer <xsl:value-of select="number($num)+1"/>):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="number($num)+1"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

</td>
</tr>

<tr>
<td class="p5">
    <h5>Текст (Layer <xsl:value-of select="number($num)+2"/>):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="number($num)+2"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</td>
</tr>
</table>


<!--/li-->
</td>
</xsl:template>

<xsl:template name="line3_blk">
<xsl:param name="num" />

<!--li class='pic'-->
<td width="33%" style="min-width: 370px;">

<table border="0" cellspacing="0" cellpadding="0" class="cattext">

<tr>

<td>
 <table border="0" cellspacing="0" cellpadding="0" >
 <tr><td>
 <div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
 </td><td align="right">
 <div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
 </td></tr>

 <tr><td colspan="2">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="number($num)+1"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
  </td></tr>

 <tr><td colspan="2">
 <div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
 <div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
 </td></tr>
 </table>
</td>

<td>
 <table>
 <tr>
 <td class="p5">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="$num"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
 </td>
 </tr>
 <tr>
 <td class="p5">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer"><xsl:value-of select="number($num)+2"/></xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
 </td>
 </tr>
 </table>
</td>

</tr>

</table>


<!--/li-->
</td>
</xsl:template>

<xsl:template match="container_view_line3_edit"> 

<h5>template:line3</h5>

<a name="top"/>

<!-- Path -->

Layer 111
<xsl:call-template name="page_path_edit">
     <xsl:with-param name="path" select="container_db"/>
</xsl:call-template>

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
<tr>
<td rowspan="2">
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
 <tr>
  <td class="abswtitle" nowrap="nowrap" valign="top">
    <h5>Название (Layer 1):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
  </td>
  <td class="wtext" nowrap="nowrap" valign="top">
    <h5>Ссылки (Layer 2):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
  </td>
  <td class="wtext" nowrap="nowrap" valign="top">
    <h5>Ссылки (Layer 3):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
  </td>
  <td class="wtext" nowrap="nowrap" valign="top">
    <h5>Ссылки (Layer 4):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
  </td>
 </tr>
</table>
</td>
<td class="abswtitle" width="100%" align="right">
<div>
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
    <h5>Название (Layer 5):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">5</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</div>
</td>
</tr>

</table>
</td></tr>

<tr><td>
<img src="/images/dot.gif" width="760" height="1" border="0"/>
</td></tr>

<tr><td>
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<!-- End Line -->

<br/>

<div class="pic_wrap">
<!--ul class="pic"-->

<table cellpadding="0" cellspacing="0" border="1">

<tr>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(6)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(9)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(12)"/>
</xsl:call-template>

</tr>
<tr>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(15)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(18)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(21)"/>
</xsl:call-template>

</tr>
<tr>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(24)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(27)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(30)"/>
</xsl:call-template>

</tr>
<tr>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(33)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(36)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(39)"/>
</xsl:call-template>

</tr>
<tr>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(42)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(45)"/>
</xsl:call-template>

<xsl:call-template name="line3_blk_edit">
 <xsl:with-param name="num" select="number(48)"/>
</xsl:call-template>

</tr>

</table>

<!--/ul-->
</div>

<div style="clear:both;">
</div>

<div align="right">
<a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a>
</div>

<br/>


<!-- End PIC BLOCK   -->

<table width="100%">
  <tr>
   <td colspan="3" bgcolor="#f0f0f0" valign="top">
    <h5>Корзина:</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">0</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
  </tr>  
</table>


</xsl:template>

<xsl:template match="container_view_line3"> 

<a name="top"/>

<!-- Path -->

<xsl:call-template name="page_path">
     <xsl:with-param name="path" select="container_db"/>
</xsl:call-template>

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
<tr>
<td rowspan="2">
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
 <tr>
  <td class="abswtitle" nowrap="nowrap" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
  </td>
<xsl:if test="container_db/element_db[@layer=2]/child::*">
  <td class="wtext" nowrap="nowrap" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
  </td>
</xsl:if>
<xsl:if test="container_db/element_db[@layer=3]/child::*">
  <td class="wtext" nowrap="nowrap" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">3</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
  </td>
</xsl:if>
<xsl:if test="container_db/element_db[@layer=4]/child::*">
  <td class="wtext" nowrap="nowrap" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">4</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
  </td>
</xsl:if>
 </tr>
</table>
</td>
<td class="abswtitle" width="100%" align="right">
<div>
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">5</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</div>
</td>
</tr>

</table>
</td></tr>

<tr><td>
<img src="/images/dot.gif" width="760" height="1" border="0"/>
</td></tr>

<tr><td>
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<!-- End Line -->

<br/>

<div class="pic_wrap">
<!--ul class="pic"-->
<table cellspacing="0" cellpadding="0">

<tr>
<xsl:if test="container_db/element_db[@layer=6]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(6)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=9]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(9)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=12]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(12)"/>
</xsl:call-template>
</xsl:if>

</tr>
<tr>

<xsl:if test="container_db/element_db[@layer=15]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(15)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=18]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(18)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=21]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(21)"/>
</xsl:call-template>
</xsl:if>

</tr>
<tr>

<xsl:if test="container_db/element_db[@layer=24]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(24)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=27]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(27)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=30]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(30)"/>
</xsl:call-template>
</xsl:if>

</tr>
<tr>

<xsl:if test="container_db/element_db[@layer=33]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(33)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=36]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(36)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=39]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(39)"/>
</xsl:call-template>
</xsl:if>

</tr>
<tr>

<xsl:if test="container_db/element_db[@layer=42]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(42)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=45]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(45)"/>
</xsl:call-template>
</xsl:if>

<xsl:if test="container_db/element_db[@layer=48]/child::*">
<xsl:call-template name="line3_blk">
 <xsl:with-param name="num" select="number(48)"/>
</xsl:call-template>
</xsl:if>

</tr>

</table>
<!--/ul-->
</div>

<div style="clear:both;">
</div>

<div align="right">
<a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a>
</div>

<br/>



</xsl:template>
</xsl:stylesheet>
