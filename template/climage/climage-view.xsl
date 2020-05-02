<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="climage_view"> 

<xsl:if test="climage_db/@first=1">
<xsl:text disable-output-escaping="yes">
&lt;table border="0" cellspacing="0" cellpadding="0">&lt;tr>&lt;td>
</xsl:text>
</xsl:if>

<xsl:choose>
 <xsl:when test="climage_db/@is_slider=1">
   <xsl:call-template name="res_image_stuff_slider">
          <xsl:with-param name="id" select="concat('climage_',concat(climage_db/@id,'_1'))"/>
          <xsl:with-param name="idb" select="concat('climage_',concat(climage_db/@id,'_2'))"/>
          <xsl:with-param name="type" select="climage_db/image"/>
          <xsl:with-param name="typeb" select="climage_db/bigimage"/>
          <xsl:with-param name="max" select='string("600")'/>
          <xsl:with-param name="alt" select='climage_db/@title'/>
          <xsl:with-param name="pad" select='climage_db/@pad'/>
          <xsl:with-param name="link" select='climage_db/@link'/>
          <xsl:with-param name="layer" select='ancestor::element_db/@layer'/>
   </xsl:call-template>
 </xsl:when>
 <xsl:when test="climage_db/bigimage">
   <xsl:call-template name="res_image_stuff_pup_element">
          <xsl:with-param name="id" select="concat('climage_',concat(climage_db/@id,'_1'))"/>
          <xsl:with-param name="idb" select="concat('climage_',concat(climage_db/@id,'_2'))"/>
          <xsl:with-param name="type" select="climage_db/image"/>
          <xsl:with-param name="typeb" select="climage_db/bigimage"/>
          <xsl:with-param name="max" select='string("600")'/>
          <xsl:with-param name="alt" select='climage_db/@title'/>
          <xsl:with-param name="pad" select='climage_db/@pad'/>
   </xsl:call-template>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="res_image_stuff_element">
          <xsl:with-param name="id" select="concat('climage_',concat(climage_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="climage_db/image"/>
          <xsl:with-param name="max" select='string("600")'/>
          <xsl:with-param name="alt" select='climage_db/@title'/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>

<xsl:if test="climage_db/@last=1">
<xsl:text disable-output-escaping="yes">
&lt;/td>&lt;/tr>&lt;/table>
</xsl:text>
</xsl:if>

</xsl:template>


</xsl:stylesheet>
