<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/kvadr.xsl"/> 
<xsl:include href="../layout/line3.xsl"/> 
<xsl:include href="../layout/level1/prodl1.xsl"/> 
<xsl:include href="../layout/level1/servicel1.xsl"/> 
<xsl:include href="../layout/level1/khowl1.xsl"/> 
<xsl:include href="../layout/level1/buyl1.xsl"/> 
<xsl:include href="../layout/level1/orgl1.xsl"/> 

<xsl:include href="../layout/level2/servicel2.xsl"/> 
<xsl:include href="../layout/level2/khowl2.xsl"/> 
<xsl:include href="../layout/level2/buyl2.xsl"/> 
<xsl:include href="../layout/level2/orgl2.xsl"/> 
<xsl:include href="../layout/level2/prodl2.xsl"/> 

<xsl:include href="../layout/level4/prodl4.xsl"/> 
<xsl:include href="../layout/level4/servicel4.xsl"/> 
<xsl:include href="../layout/level4/khowl4.xsl"/> 
<xsl:include href="../layout/level4/buyl4.xsl"/> 
<xsl:include href="../layout/level4/orgl4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../layout/level4/dkhowl4.xsl"/> 
<xsl:include href="../layout/level4/dorgl4.xsl"/> 

<xsl:include href="../layout/level5/prodl5.xsl"/> 
<xsl:include href="../layout/level5/servicel5.xsl"/> 
<xsl:include href="../layout/level5/khowl5.xsl"/> 
<xsl:include href="../layout/level5/buyl5.xsl"/> 
<xsl:include href="../layout/level5/orgl5.xsl"/> 
<xsl:include href="../layout/level5/dorgl5.xsl"/> 

<xsl:include href="../layout/faq/faqpage.xsl"/> 

<xsl:template match="container_view"> 

<xsl:apply-templates select="child::*[2]"/> 

</xsl:template>
</xsl:stylesheet>
