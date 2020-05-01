<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/level4/goodsl4.xsl"/> 


<xsl:template match="chairs_order"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="dbuyl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('buy')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
<xsl:choose>
<xsl:when test="@last_state=1 or @last_state=2"> 
[<a href="container-managewrapper?i=chairs&amp;m=add&amp;state={@last_state}&amp;creator=container.view.dbuyl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=chairs&amp;m=add&amp;creator=container.view.dbuyl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="chairs_order" mode="title"> 

<xsl:if test="not($wrapper/container_db/element_db[@layer=5])">
<xsl:value-of select="$lc/chairs/alt"/>
</xsl:if>
</xsl:template>

<xsl:template match="chairs_order" mode="path"> 
<xsl:if test="not($wrapper/container_db/element_db[@layer=111])">
<a href="/">Orgspace</a> : 
<xsl:value-of select="$lc/chairs/alt"/>
</xsl:if>
</xsl:template>

<xsl:template match="chairs_order" mode="left_start"> 
</xsl:template>

<xsl:template match="chairs_order" mode="left_end">
</xsl:template>

<xsl:template match="chairs_order" mode="content_title">  
<xsl:value-of select="$lc/chairs/alt"/>
</xsl:template>

<xsl:template match="chairs_order" mode="content_start"> 
</xsl:template>

<xsl:template match="chairs_order" mode="content_end"> 

<xsl:if test="not($wrapper/container_db/element_db[@layer=2])">
<h1><xsl:value-of select="$lc/chairs/@name"/></h1>
</xsl:if>

<xsl:choose>

<xsl:when test="@last_state=0 or @last_state=1"> 

<xsl:if test="error"> 
<b><xsl:value-of select="$lc/feedback/err"/></b>
</xsl:if> 

<br/>
<p>* <xsl:value-of select="$lc/feedback/req"/></p>


 <form name="chairs" id="chairs" method="POST" action="chairs-order?state=1" enctype="multipart/form-data">


<xsl:variable name="c" select="chairs_db"/>

<table class="fbuy" border="0" cellspacing="0" cellpadding="0" >

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
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* E-mail</td>
</tr>
<tr>
<td class="input"><input type="text" name="mail" size="45" value="{$c/@mail}"/></td>
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
<td colspan="2"><xsl:value-of select="$lc/chairs/time"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="time" size="45" value="{$c/@time}"/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* Введите код с картинки</td>
</tr>
<tr>
<td colspan="2"><img src="./cap.php"/></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>
<tr>
<td class="input"><input type="text" size="45" name="keystring"/></td>
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
  <input onclick="reset_form('chairs');return false;" type="image" src="/images/clear{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/clear}" title="{$lc/clear}"/>
-->
    <xsl:call-template name="form_button">
	<xsl:with-param name="name_form">chairs</xsl:with-param>
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

<xsl:template match="chairs_order" mode="right_start"> 
<xsl:if test="not($wrapper/container_db/element_db[@layer=3])">
<xsl:value-of select="$lc/chairs/@name"/>
</xsl:if>
</xsl:template>

<xsl:template match="chairs_order" mode="right_end"> 
</xsl:template>

<xsl:template match="chairs_order" mode="right_print"> 
</xsl:template>

<xsl:template match="chairs_order" mode="under_start"> 
</xsl:template>

<xsl:template match="chairs_order" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>
