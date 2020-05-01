<?xml version="1.0" encoding="windows-1251"?> 
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet  
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      version="1.0" 
      xmlns:java="http://xml.apache.org/xslt/java" 
      exclude-result-prefixes="java">

<xsl:output method="html" indent="no" encoding="windows-1251" />

<xsl:include href="ver_ru/full/site_main.xsl"/>

<xsl:variable name="access_info" select="/"/>
<xsl:variable name="content" select="//content"/>
<xsl:variable name="lc" select="/*/lc"/>
<xsl:variable name="upmenu" select="//menu/bush_rubr/bush_db"/>
<xsl:variable name="user_menu" select="/*/user_menu"/>
<xsl:variable name="res_path" select="string('/res')"/>
<xsl:variable name="agent" select="string('MSIE')"/>
<xsl:variable name="base_url" select="concat($user_menu/@proto,'://',$user_menu/@server_name,'/')"/>
<xsl:variable name="wrapper" select="/*/wrapper/container_wrapper/*"/>
<xsl:variable name="fin" select="number(0)"/>

<xsl:variable name="sletter" select="string('абвгдеёжзийклмнопрстуфхцчшщыъьэюяabcdefghijklmnopqrstuvwxyz')"/>
<xsl:variable name="bletter" select="string('АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЫЪЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>

<xsl:variable name="print"> 
<xsl:choose>
 <xsl:when test="//ru_print/child::*">1</xsl:when>
 <xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>

<xsl:variable name="admin"> 
<xsl:choose>
 <xsl:when test="contains(//usr_accessinfo/usr_db/@roles,'admin')">1</xsl:when>
 <xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>


<xsl:include href="chairs/chairs-view.xsl"/>
<xsl:template match="/">

 <xsl:apply-templates/>

</xsl:template>
</xsl:stylesheet>