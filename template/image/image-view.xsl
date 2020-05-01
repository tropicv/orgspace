<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../util/util.xsl"/>

<xsl:template match="image_view">

   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('image_',concat(image_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="image_db/image"/>
          <xsl:with-param name="max" select='string("700")'/>
          <xsl:with-param name="alt" select="image_db/@title"/>
   </xsl:call-template><br/>
</xsl:template>

<xsl:template match="image_view_link"> 
   <div class="fleft">
   <!--  style="width: {image_db/image/width}px; margin-right: 20px; margin-bottom: 20px;" -->
   <a href="{image_db/@title}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('image_',concat(image_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="image_db/image"/>
          <xsl:with-param name="max" select='string("700")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/></a>
   </div>
</xsl:template>


</xsl:stylesheet>
