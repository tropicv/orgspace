<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../layout/print/level4/prodl4.xsl"/> 
<xsl:include href="../layout/print/level4/servicel4.xsl"/> 
<xsl:include href="../layout/print/level4/khowl4.xsl"/> 
<xsl:include href="../layout/print/level4/buyl4.xsl"/> 
<xsl:include href="../layout/print/level4/orgl4.xsl"/> 
<xsl:include href="../layout/print/level4/goodsl4.xsl"/> 
<xsl:include href="../layout/print/level4/dkhowl4.xsl"/> 
<xsl:include href="../layout/print/level4/dorgl4.xsl"/> 
<xsl:include href="../layout/print/level4/faqpage.xsl"/> 

<xsl:include href="../layout/print/level5/prodl5.xsl"/> 
<xsl:include href="../layout/print/level5/servicel5.xsl"/> 
<xsl:include href="../layout/print/level5/khowl5.xsl"/> 
<xsl:include href="../layout/print/level5/buyl5.xsl"/> 
<xsl:include href="../layout/print/level5/orgl5.xsl"/> 


<xsl:template match="container_pview"> 

<xsl:apply-templates select="child::*[2]"/> 

</xsl:template>
</xsl:stylesheet>
