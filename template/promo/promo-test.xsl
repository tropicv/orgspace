<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../util/util.xsl"/> 
<xsl:include href="../layout/layoutblock.xsl"/> 
<xsl:include href="../promo/promo-view.xsl"/>
<xsl:include href="../clip/clip-view.xsl"/>

<xsl:template match="promo_test"> 

<div class="path">Orgspace</div>

<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">

<tr><td  bgcolor="#747474"><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>
<!-- <tr><td><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr> -->

<tr>
<td valign="top">

  <xsl:call-template name="promoview">
  	  <xsl:with-param name="promo" select="promo_db"/>
  </xsl:call-template>
</td>
</tr>

<tr><td><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>

</table>

<xsl:call-template name="bottom_promo"/>

</xsl:template>

</xsl:stylesheet>
