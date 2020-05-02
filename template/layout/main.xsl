<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../layout/layoutblock.xsl"/> 
<xsl:include href="../tobj/tobj-view.xsl"/> 
<xsl:include href="../nav/nav-view.xsl"/> 
<xsl:include href="../image/image-view.xsl"/> 
<xsl:include href="../climage/climage-view.xsl"/> 
<xsl:include href="../file/file-view.xsl"/> 
<xsl:include href="../pcat/pcat-view.xsl"/> 
<xsl:include href="../layout/mainnew.xsl"/> 

<xsl:template match="container_view_main_edit"> 

<h5>template:main</h5>
 <table class="test" border="1" cellspacing="0" cellpadding="0">
  <tr>
   <td valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
   <td valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>   
  </tr>
  <tr>
   <td colspan="2" bgcolor="#f0f0f0" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">0</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
  </tr>  
 </table>     
</xsl:template>

<xsl:template match="container_view_main"> 

 <table border="0">
  <tr>
   <td valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
   </td>
   <td valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
   </td>   
  </tr>
 </table>     

</xsl:template>
</xsl:stylesheet>
