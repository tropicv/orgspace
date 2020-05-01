<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/dprodl4.xsl"/> 


<xsl:template match="ordcase_add"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="dprodl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('prod')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
<xsl:choose>
<xsl:when test="@last_state=1 or @last_state=2"> 
[<a href="container-managewrapper?i=ordcase&amp;m=add&amp;state={@last_state}&amp;creator=container.view.dprodl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=ordcase&amp;m=add&amp;creator=container.view.dprodl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="ordcase_add" mode="title"> 

<xsl:if test="not($wrapper/container_db/element_db[@layer=5])">
<xsl:value-of select="$lc/ordcase/alt"/>
</xsl:if>
</xsl:template>

<xsl:template match="ordcase_add" mode="path"> 
<xsl:if test="not($wrapper/container_db/element_db[@layer=111])">
<a href="/">Orgspace</a> : 
<xsl:value-of select="$lc/ordcase/alt"/>
</xsl:if>
</xsl:template>

<xsl:template match="ordcase_add" mode="left_start"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="left_end"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="content_title"> 
<xsl:value-of select="$lc/ordcase/alt"/>
</xsl:template>

<xsl:template match="ordcase_add" mode="content_start"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="content_end"> 

<xsl:if test="not($wrapper/container_db/element_db[@layer=2])">
<h1><xsl:value-of select="$lc/ordcase/@name"/></h1>
</xsl:if>

<xsl:choose>

<xsl:when test="@last_state=0 or @last_state=1"> 

<xsl:if test="error"> 
<b><xsl:value-of select="$lc/feedback/err"/></b>
</xsl:if> 

<br/>
<p>* <xsl:value-of select="$lc/feedback/req"/></p>

 <form name="ordcase" id="ordcase" method="POST" action="ordcase-add?state=1" enctype="multipart/form-data">

<xsl:variable name="c" select="ordcase_db"/>

<table class="fprod" border="0" cellspacing="0" cellpadding="0" >

<tr>
<td colspan="2">* <xsl:value-of select="$lc/feedback/name"/></td>
</tr>

<tr>
<td class="input"><input type="text" name="name" size="45" value="{$c/@name}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>


<tr>
<td colspan="2">* <xsl:value-of select="$lc/feedback/comp"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="company" size="45" value="{$c/@company}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>


<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/feedback/tel"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="tel" size="45" value="{$c/@tel}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/ordcat/adr"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="adr" size="45" value="{$c/@adr}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">
<!--
  <input type="image" src="/images/send{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/send}" title="{$lc/send}"/>
  <img src="/images/dot.gif" width="40" height="1" border="0"/>
  <input onclick="reset_form('ordcase');return false;" type="image" src="/images/clear{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/clear}" title="{$lc/clear}"/>
 -->
 <xsl:call-template name="form_button">
 <xsl:with-param name="name_form">ordcase</xsl:with-param>
 </xsl:call-template>
</td>
</tr>

</table>

 </form>

<xsl:call-template name="politic" />

</xsl:when> 

<xsl:when test="@last_state=2"> 
<xsl:value-of select="$lc/feedback/thanks"/>
</xsl:when> 

</xsl:choose>

</xsl:template>

<xsl:template match="ordcase_add" mode="right_start"> 
<xsl:if test="not($wrapper/container_db/element_db[@layer=3])">
<xsl:value-of select="$lc/ordcase/@name"/>
</xsl:if>
</xsl:template>

<xsl:template match="ordcase_add" mode="right_end"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="right_print"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="under_start"> 
</xsl:template>

<xsl:template match="ordcase_add" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>
