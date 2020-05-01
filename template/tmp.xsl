<?xml version="1.0" encoding="windows-1251"?> 
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

<xsl:output method="html" indent="yes" encoding="windows-1251" />


<xsl:variable name="access_info" select="/"/>
<xsl:variable name="content" select="//content"/>
<xsl:variable name="user_menu" select="/*/user_menu"/>
<xsl:variable name="res_path" select="string('/res')"/>
<xsl:variable name="admin" select="string('1')"/>

<xsl:include href="./container/container-edit.xsl"/>
<xsl:template match="/">
 <xsl:apply-templates/>
</xsl:template>
</xsl:stylesheet>