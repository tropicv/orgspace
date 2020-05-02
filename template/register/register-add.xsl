<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level5/level5.xsl"/> 
<xsl:include href="../layout/level5/dorgl5.xsl"/> 


<xsl:template match="register_add"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="dorgl5">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
<xsl:choose>
<xsl:when test="@last_state=1 or @last_state=2"> 
[<a href="container-managewrapper?i=register&amp;m=add&amp;state={@last_state}&amp;creator=container.view.dorgl5" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=register&amp;m=add&amp;creator=container.view.dorgl5" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="register_add" mode="title"> 
</xsl:template>

<xsl:template match="register_add" mode="path"> 
</xsl:template>

<xsl:template match="register_add" mode="left_start"> 
</xsl:template>

<xsl:template match="register_add" mode="left_end"> 
</xsl:template>

<xsl:template match="register_add" mode="content_title"> 
<xsl:value-of select="$lc/register/@name"/>
</xsl:template>

<xsl:template match="register_add" mode="content_start"> 
</xsl:template>

<xsl:template match="register_add" mode="content_end"> 

<xsl:choose>

<xsl:when test="@last_state=0 or @last_state=1"> 

<xsl:if test="error"> 
<b><xsl:value-of select="$lc/feedback/err"/></b>
</xsl:if> 

<br/>
<p>* <xsl:value-of select="$lc/feedback/req"/></p>

 <form name="register" id="register" method="POST" action="register-add?state=1" enctype="multipart/form-data">

<div style="padding-left: 10px;">
<table class="feedback" border="0" cellspacing="0" cellpadding="0" >


<tr>
<td colspan="2">* <xsl:value-of select="$lc/register/org_name"/></td>
</tr><tr>
<td class="input"><input type="text" name="company" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/register/org_form"/></td>
</tr><tr>
<td class="input"><input type="text" name="org_type" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/register/city"/></td>
</tr><tr>
<td class="input"><input type="text" name="town" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/register/cont_pers"/></td>
</tr><tr>
<td class="input"><input type="text" name="name" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>                    	
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/register/city_code"/></td>
</tr><tr>
<td class="input"><input type="text" name="cod" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/register/tel"/></td>
</tr><tr>
<td class="input"><input type="text" name="tel" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>
<!--
<tr>
<td colspan="2"><xsl:value-of select="$lc/register/fax"/></td>
</tr><tr>
<td class="input"><input type="text" name="fax" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>
-->

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* E-Mail</td>
</tr><tr>
<td class="input"><input type="text" name="email" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>


<tr>
<td colspan="2">* <xsl:value-of select="$lc/register/business"/></td>
</tr><tr>
<td class="input"><input type="text" name="job_type" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>


<tr>
<td colspan="2"> <xsl:value-of select="$lc/register/know"/></td>
</tr><tr>
<td colspan="2">
<select name="hear_type">
<xsl:for-each select="register_db/hear_type/word">
<option value="{@value}"><xsl:value-of select="."/></option>
</xsl:for-each>
</select>
</td>
</tr>


<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>
</table>

<table class="feedback" border="0" cellspacing="0" cellpadding="0" >
<tr>
<td colspan="2"><xsl:value-of select="$lc/register/add"/></td>
</tr><tr>
<td colspan="2">
<textarea cols="44" rows="7" name="quest">
<xsl:value-of select="$lc/register/predl"/>
</textarea>
</td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">
<!--
  <input type="image" src="/images/send{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/send}" title="{$lc/send}"/>
  <img src="/images/dot.gif" width="40" height="1" border="0"/>
  <input onclick="document.forms.register.reset();return false;" type="image" src="/images/clear{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/clear}" title="{$lc/clear}"/>
-->
    <xsl:call-template name="form_button">
	<xsl:with-param name="name_form">register</xsl:with-param>
    </xsl:call-template>
      
</td>
</tr>

</table>
</div>

 </form>

<xsl:call-template name="politic"></xsl:call-template>

</xsl:when> 

<xsl:when test="@last_state=2"> 
<xsl:value-of select="$lc/feedback/thanks"/>
</xsl:when> 

</xsl:choose>

</xsl:template>

<xsl:template match="register_add" mode="right_start"> 
</xsl:template>

<xsl:template match="register_add" mode="right_end"> 
</xsl:template>

<xsl:template match="register_add" mode="right_print"> 
</xsl:template>

<xsl:template match="register_add" mode="under_start"> 
</xsl:template>

<xsl:template match="register_add" mode="under_end"> 
</xsl:template>


</xsl:stylesheet>
