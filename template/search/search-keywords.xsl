<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="search_keywords"> 


<div class="path">
<a href="/">Orgspace</a> : 
<xsl:value-of select="$lc/nav/search"/>
</div>


<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="org">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:value-of select="$lc/nav/search"/>
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

<td class="text" width="100%">

<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>
<h1><xsl:value-of select="$lc/nav/search_ser"/></h1>

<xsl:for-each select='search/serial_db'>
  <p>
    <b><a href="serial-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@short_description!=''">
      <xsl:value-of select="@short_description" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/chairs_db'>
  <p>
    <b><a href="chairs-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@short_description!=''">
      <xsl:value-of select="@short_description" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/zone_db'>
  <p>
    <b><a href="zone-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@slogan!=''">
      <xsl:value-of select="@slogan" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/design_db'>
  <p>
    <b><a href="design-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@slogan!=''">
      <xsl:value-of select="@slogan" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/predmet_db'>
  <p>
    <b><a href="predmet-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@short_description!=''">
      <xsl:value-of select="@short_description" disable-output-escaping="yes"/>
    </xsl:if>
    <xsl:if test="@slogan!=''">
      <xsl:value-of select="@slogan" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/goods_db'>
  <p>
    <b><a href="goods-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@short_description!=''">
      <xsl:value-of select="@short_description" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:for-each select='search/gtype_db'>
  <p>
    <b><a href="gtype-view?obj={@id}"><xsl:value-of select="@name"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@short_description!=''">
      <xsl:value-of select="@short_description" disable-output-escaping="yes"/>
    </xsl:if>
  </p>
</xsl:for-each>


<xsl:for-each select='search/container_db'>
  <p>
    <b><a href="container-view?obj={@id}"><xsl:value-of select="@title"/></a></b>
    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:if test="@description!=''">
      <xsl:value-of select="@description"/>
    </xsl:if>
  </p>
</xsl:for-each>


<form method="POST" action="search-keywords" enctype="multipart/form-data">

<table class="feedback" border="0" cellspacing="0" cellpadding="0" >

<tr>
<td colspan="2"><xsl:value-of select="$lc/nav/search"/></td>
</tr>

<tr>
<td class="input"><input type="text" name="keywords" value="{@keywords}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

</table>

</form>

</td>

<td width="205">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="205" class="org">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="javascript:history.back()">&lt;&lt; <xsl:value-of select="$lc/nav/back"/></a></div></td>
</tr>


<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

</td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="555" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</tr>


</table>


</xsl:template>
</xsl:stylesheet>
