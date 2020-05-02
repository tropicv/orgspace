<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../goods/goodsblock.xsl"/>


<xsl:template match="goods_shview"> 

<xsl:variable name="goods" select="goods_db"/>

<table border="0" cellspacing="0" cellpadding="0" width="400">
<tr>
<td valign="top">

   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('goods_',concat($goods/@id,'_1'))"/>
          <xsl:with-param name="type" select="$goods/foto"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='$goods/@name'/>
   </xsl:call-template>

</td>

<td width="10" valign="top">
<img src="/images/dot.gif" width="10" height="1" border="0"/><br/>
</td>

<td width="100%" valign="top">


<xsl:if test="$goods/@serial_id!=0">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" class="abswtitle1" width="100%">
<IMG align="absMiddle" border="0" width="1" height="7" hspace="0" vspace="6" src="/images/dot.gif" /> 
<xsl:value-of select="$lc/goods/serial"/>
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

</table>

<div class="text">
<xsl:value-of select="serial_db/@name" disable-output-escaping="yes"/>
</div>

</xsl:if>

<xsl:if test="$goods/@serial_id!=0">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" class="abswtitle1" width="100%">
<IMG align="absMiddle" border="0" width="1" height="7" hspace="0" vspace="6" src="/images/dot.gif" /> 
<xsl:value-of select="$lc/goods/name"/>
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

</table>

<div class="text">
<xsl:value-of select="$goods/@code"/>. 
<xsl:value-of select="$goods/@name"/>
</div>

</xsl:if>

<xsl:if test="$goods/@size!=''">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" class="abswtitle1" width="100%">
<IMG align="absMiddle" border="0" width="1" height="7" hspace="0" vspace="6" src="/images/dot.gif" /> 
<xsl:value-of select="$lc/goods/size"/>
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

</table>

<div class="text">
<xsl:value-of select="$goods/@size" disable-output-escaping="yes"/>
</div>

</xsl:if>

<xsl:if test="$goods/@description!=''">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" class="abswtitle1" width="100%">
<IMG align="absMiddle" border="0" width="1" height="7" hspace="0" vspace="6" src="/images/dot.gif" /> 
<xsl:value-of select="$lc/goods/description"/>
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

</table>

<div class="text">
<xsl:value-of select="$goods/@description" disable-output-escaping="yes"/>
</div>

</xsl:if>


</td>
</tr>
</table>



<br/>
<xsl:if test="$admin=1">
[<a href="goods-edit?obj={$goods/@id}" target="blank">Редактировать предмет</a>]
[<a href="goods-del?obj={$goods/@id}" target="blank">Удалить предмет</a>]
</xsl:if>

</xsl:template>
</xsl:stylesheet>
