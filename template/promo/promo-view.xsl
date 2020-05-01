<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="promo_view"> 
 	<xsl:call-template name="promoview">
  	  <xsl:with-param name="promo" select="promo_db"/>
	</xsl:call-template>
</xsl:template>


<xsl:template name="promoview">
<xsl:param name="promo"/>

<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
<tr><td>
 <xsl:choose>
  <xsl:when test="$promo/@aligment=3"><xsl:attribute name="align">right</xsl:attribute></xsl:when>
  <xsl:when test="$promo/@aligment=2"><xsl:attribute name="align">center</xsl:attribute></xsl:when>
  <xsl:otherwise><xsl:attribute name="align">left</xsl:attribute></xsl:otherwise>
 </xsl:choose>


<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
 <tr>

  <td width="{$promo/@sizex}" valign="top" align="left"> 
   <xsl:if test="$promo/@sizey!=''"><xsl:attribute name="height"><xsl:value-of select="$promo/@sizey"/></xsl:attribute></xsl:if>
  <img src="/images/dot.gif" width="{$promo/@sizex}" height="1" border="0"/><br/>
  
  
  <xsl:choose>

    <xsl:when test="$promo/@type=1">
       <xsl:value-of select="$promo/@textbody" disable-output-escaping="yes"/>
    </xsl:when>

    <xsl:when test="$promo/@type=2">
     <xsl:choose>
      <xsl:when test="$promo/@link!=''">

        <a href="{$promo/@link}" border="0" alt="{$promo/@alt}">
        <xsl:call-template name="res_image_stuff">
             <xsl:with-param name="id" select="concat('promo_',concat($promo/@id,'_1'))"/>
             <xsl:with-param name="type" select="$promo/image"/>
             <xsl:with-param name="max" select='string("1200")'/>
             <xsl:with-param name="alt" select='$promo/@alt'/>
        </xsl:call-template>
        </a>

      </xsl:when>
      <xsl:otherwise>

        <xsl:call-template name="res_image_stuff">
             <xsl:with-param name="id" select="concat('promo_',concat($promo/@id,'_1'))"/>
             <xsl:with-param name="type" select="$promo/image"/>
             <xsl:with-param name="max" select='string("1200")'/>
             <xsl:with-param name="alt" select='$promo/@alt'/>
        </xsl:call-template>

      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>

    <xsl:when test="$promo/@type=3">
     <xsl:call-template name="stdclipview">
	<xsl:with-param name="name" select="$promo/flash/name"/>
	<xsl:with-param name="w" select="$promo/@sizex"/>
	<xsl:with-param name="h" select="$promo/@sizey"/>
     </xsl:call-template>
    </xsl:when>
  </xsl:choose>

  </td>

</tr>
</table>

</td></tr>
</table>

</xsl:template>

</xsl:stylesheet>
