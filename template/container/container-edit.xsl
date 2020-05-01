<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/kvadr.xsl"/> 
<xsl:include href="../layout/line3.xsl"/> 
<xsl:include href="../layout/empty.xsl"/> 
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
<xsl:include href="../layout/level4/dservicel4.xsl"/> 
<xsl:include href="../layout/level4/dprodl4.xsl"/> 
<xsl:include href="../layout/level4/dbuyl4.xsl"/> 

<xsl:include href="../layout/level5/prodl5.xsl"/> 
<xsl:include href="../layout/level5/servicel5.xsl"/> 
<xsl:include href="../layout/level5/khowl5.xsl"/> 
<xsl:include href="../layout/level5/buyl5.xsl"/> 
<xsl:include href="../layout/level5/orgl5.xsl"/> 
<xsl:include href="../layout/level5/dorgl5.xsl"/> 

<xsl:include href="../layout/faq/faqpage.xsl"/> 

<xsl:template match="container_edit"> 

<xsl:variable name="cont" select="*/container_db"/>

<table border="0" cellspacing="0" cellpadding="0">
<tr><td bgcolor="#f0f0f0" valign="top" colspan="2">
Редактор Страницы - <b><xsl:value-of select="$cont/@title"/></b> (<xsl:value-of select="$cont/@id"/>:<xsl:value-of select="$cont/@walias"/>)
</td>
</tr>

<tr><td bgcolor="#f0f0f0" valign="top">
<a href="container-editinfo?obj={$cont/@id}"><img src="/images/mifors/menu/page_pasport.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Изменить паспорт страницы" title="Изменить паспорт страницы"/></a>
<a href="container-view?obj={$cont/@id}"><img src="/images/mifors/menu/page_view.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Просмотреть страницу" title="Просмотреть страницу"/></a>
</td>
<td valign="top" bgcolor="#f0f0f0">
<xsl:call-template name="block_add_dialog">
	<xsl:with-param name="block" select="block_categories"/>
</xsl:call-template>
</td></tr>

<tr><td colspan="2">
 <xsl:apply-templates select="*"/> 
</td></tr>
</table>

</xsl:template>
</xsl:stylesheet>
