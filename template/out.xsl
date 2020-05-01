<?xml version="1.0" encoding="windows-1251"?> 
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet  
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      version="1.0" 
      xmlns:java="http://xml.apache.org/xslt/java" 
      exclude-result-prefixes="java">

<xsl:output method="html" indent="no" encoding="windows-1251" />


<xsl:include href="file:///welcome/welcome-view.xsl"/>

<xsl:template match="/">
 <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>