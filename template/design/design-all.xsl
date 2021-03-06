<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>
<xsl:include href="../design/designblock.xsl"/>


<xsl:template match="design_all"> 

<a name="top"/>

<div class="path">
<xsl:call-template name="designpath"/>
<xsl:value-of select="$lc/design/@name"/>
</div>

<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod">
<tr><td>
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="any">
<tr>
<td class="wtext" width="500" rowspan="2">
  <xsl:value-of select="//botm_link/container_view/*/container_db[@layer=0]/element_db[@layer=3]/*/*/@title" disable-output-escaping="yes"/>
</td>
<!--td width="20" rowspan="2">
  <xsl:text disable-output-escaping="yes">&nbsp;</xsl:text>
</td-->
<td rowspan="2" style="vertical-align:top;">
<table border="0" cellspacing="0" cellpadding="0" class="any">
 <tr>
  <td class="abswtitle" nowrap="nowrap" valign="top"><xsl:value-of select="$lc/design/@name"/>:</td>
  <td class="wtext" nowrap="nowrap" valign="top">
<xsl:variable name="num">
<xsl:choose>
<xsl:when test="count(list/design_db)=4">2</xsl:when>
<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
</xsl:variable>
   <xsl:for-each select="list/design_db">
     <a href="design-view?walias={@walias}"><xsl:value-of select="@short_name"/></a><br/>
       <xsl:if test="(position() mod $num = 0) and (position()!=last())">
        <xsl:text disable-output-escaping="yes">&lt;/td>&lt;td class="wtext" nowrap="nowrap" valign="top"></xsl:text>
       </xsl:if>
   </xsl:for-each>
  </td>
 </tr>
</table>
</td>
<td class="abswtitle" width="100" align="right">
<div><nobr>
<img src="/images/arr.gif" width="6" height="8" border="0" hspace="5" align="absmiddle"/> 
<a class="white" href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a>
</nobr></div>
</td>
</tr>

<tr><td align="right">
<xsl:for-each select="list/design_db">

<xsl:if test='@sh_tmb!=1'>
<a href="design-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat(@id,'_2'))"/>
          <xsl:with-param name="type" select="thumb"/>
          <xsl:with-param name="max" select='string("42")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template>
</a>
</xsl:if>
</xsl:for-each>

<img src="/images/dot.gif" width="50" height="42" border="0"/>
</td></tr>
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
<table cellpadding="0" cellspacing="0">
<tr>

<xsl:for-each select="list/design_db">

<td width="33%">
<!-- +++++
<div>
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="position() mod 3 = 0">blkbr</xsl:when>
<xsl:otherwise>blk</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
===== -->

<table class="cattext" border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td colspan="2">
<a href="design-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template><br/>
</a>
</td>
<td>
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
<td class="cattextdescr">
<a href="design-view?walias={@walias}"><xsl:value-of select="@name"/></a><br/><br/>
<xsl:value-of select="@slogan" disable-output-escaping="yes"/>
</td>
</tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<xsl:if test="$admin=1">
<br/><div class="design_action">[<a href="design-del?obj={@id}">������� ����</a>]</div>
<br/>
</xsl:if>

<!-- +++++
</div>
===== -->
<br/>
</td>
<xsl:if test="position() mod 3 = 0">
<xsl:text disable-output-escaping="yes">
&lt;/tr>
&lt;tr>
</xsl:text>
</xsl:if>

</xsl:for-each>

</tr>
</table>

</div>

<!--div style="clear:both;">
</div-->

<div align="right">
<a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a>
</div>

<br/>


<!-- End PIC BLOCK   -->

<!--
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<xsl:for-each select="list/design_db">

<td>
<a name="{@walias}"/>
<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2">
<a href="design-view?walias={@walias}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('design_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="foto"/>
          <xsl:with-param name="max" select='string("158")'/>
          <xsl:with-param name="alt" select='@name'/>
   </xsl:call-template><br/>
</a>

</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>

<br/>
</td>
<td width="50%" valign="top">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cattext">
<tr class="link">
<td><a href="design-view?walias={@walias}"><xsl:value-of select="@name"/></a></td>
<td align="right"><a href="design-view?walias={@walias}"><img src="/images/cat-arr.gif" width="6" height="9" border="0" align="absmiddle"/></a><br/></td>
</tr>

<tr>
<td colspan="2" class="hr"><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"  class="text">
<xsl:value-of select="@slogan" disable-output-escaping="yes"/>
</td>
</tr>
</table>

</td>

<xsl:if test="position() mod 2 != 0">
<td><img src="/images/dot.gif" width="70" height="1" border="0"/><br/></td>
</xsl:if>

<xsl:if test="(position() mod 2 = 0) and (position()!=last())">
      <xsl:text disable-output-escaping="yes">&lt;/tr></xsl:text>
<tr>
<td colspan="5" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>
      <xsl:text disable-output-escaping="yes">&lt;tr></xsl:text>
</xsl:if>

</xsl:for-each>
</tr>

<tr>
<td colspan="5" align="right"><a href="#top"><img src="/images/top.gif" width="16" height="14" border="0"/></a></td>
</tr>

</table>
-->

<xsl:if test="$admin=1">
[<a href="design-add">��������</a>]<br/>
[<a href="container-managewrapper?i=design&amp;m=all&amp;creator=container.view.empty" target="blank">������������� ������</a>]
</xsl:if>

<br/>

</xsl:template>
</xsl:stylesheet>
