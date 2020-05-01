<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="file_view"> 

   <xsl:call-template name="res_file_stuff">
          <xsl:with-param name="id" select="concat('file_',concat(file_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="file_db/file"/>
          <xsl:with-param name="txt" select="file_db/@title"/>
   </xsl:call-template><br/>
</xsl:template>


</xsl:stylesheet>
