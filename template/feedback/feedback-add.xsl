<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/dorgl4.xsl"/> 


<xsl:template match="feedback_add"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="dorgl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('org')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
<xsl:choose>
<xsl:when test="@last_state=1 or @last_state=2"> 
[<a href="container-managewrapper?i=feedback&amp;m=add&amp;state={@last_state}&amp;creator=container.view.dorgl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=feedback&amp;m=add&amp;creator=container.view.dorgl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="feedback_add" mode="title"> 
<a class="white" href="/"><xsl:value-of select="$lc/main_page"/></a>
</xsl:template>

<xsl:template match="feedback_add" mode="path"> 
<a href="/">Orgspace</a> : 
<xsl:value-of select="$lc/nav/ask_quest"/>
</xsl:template>

<xsl:template match="feedback_add" mode="left_start"> 
</xsl:template>

<xsl:template match="feedback_add" mode="left_end"> 
</xsl:template>

<xsl:template match="feedback_add" mode="content_title"> 
<xsl:value-of select="$lc/nav/ask_quest"/>
</xsl:template>

<xsl:template match="feedback_add" mode="content_start"> 
</xsl:template>

<xsl:template match="feedback_add" mode="content_end"> 

<h1><xsl:value-of select="$lc/feedback/@name"/></h1>

<xsl:choose>

<xsl:when test="@last_state=0 or @last_state=1"> 

<xsl:if test="error"> 
<b><xsl:value-of select="$lc/feedback/err"/></b>
</xsl:if> 

<br/>
<p>* <xsl:value-of select="$lc/feedback/req"/></p>

 <form name="feedback" id="feedback" method="POST" action="feedback-add?state=1" enctype="multipart/form-data">

<table class="feedback" border="0" cellspacing="0" cellpadding="0" >

<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/quest"/></td>
</tr>

<tr>
<td colspan="2">
<textarea cols="44" rows="7" name="quest">
</textarea>
</td>
</tr>
</table>

<table class="feedback" border="0" cellspacing="0" cellpadding="0" >
<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/feedback/name"/></td>
</tr>

<tr>
<td class="input"><input type="text" name="name" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* E-mail</td>
</tr>

<tr>
<td class="input"><input type="text" name="email" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/comp"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="company" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>


<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/tel"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="tel" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/city"/></td>
</tr>
<tr>
<td class="input"><input type="text" name="town" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<!--
<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/fax"/></td>
</tr>

<tr>
<td class="input"><input type="text" name="fax" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>
-->

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
</tr>

<tr>
<td colspan="2">* <xsl:value-of select="$lc/feedback/know"/></td>
</tr>

<tr>
<td colspan="2">
<select name="hear_type">
<xsl:for-each select="feedback_db/hear_type/word">
<option value="{@value}"><xsl:value-of select="."/></option>
</xsl:for-each>
</select>
</td>
</tr>

<tr>
<td colspan="2"><img src="/images/dot.gif" width="1" height="20" border="0"/></td>
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
<td colspan="2"><img src="/images/dot.gif" width="1" height="20" border="0"/></td>
</tr>

<tr>
<td colspan="2">
  <!--
  <input type="image" src="/images/send{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/send}" title="{$lc/send}"/>
  <img src="/images/dot.gif" width="40" height="1" border="0"/>
  <input onclick="document.forms.feedback.reset();return false;" type="image" src="/images/clear{$lc/@pref}.gif" width="68" height="14" border="0" align="absmiddle" alt="{$lc/clear}" title="{$lc/clear}"/>
  -->
  <xsl:call-template name="form_button">
    <xsl:with-param name="name_form">feedback</xsl:with-param>
  </xsl:call-template>
</td>
</tr>

</table>

 </form>
 
<xsl:call-template name="politic"></xsl:call-template>
</xsl:when> 

<xsl:when test="@last_state=2"> 
<xsl:value-of select="$lc/feedback/thanks"/>
</xsl:when> 

</xsl:choose>

</xsl:template>

<xsl:template match="feedback_add" mode="right_start"> 
<!--tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><a href="container-view?walias=faq"><xsl:value-of select="$lc/nav/faq"/></a></div></td>
</tr-->

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<td class="wtext"><div class="rmenu"><xsl:value-of select="$lc/nav/ask_quest"/></div></td>
</tr>
</xsl:template>

<xsl:template match="feedback_add" mode="right_end"> 
</xsl:template>

<xsl:template match="feedback_add" mode="right_print"> 
<div class="print" align="right">
<a href="feedback-padd" target="blank"><xsl:value-of select="$lc/print_ver"/><img src="/images/print.gif" hspace="5" width="14" height="14" border="0" align="absmiddle"/></a>
</div>
</xsl:template>

<xsl:template match="feedback_add" mode="under_start"> 
</xsl:template>

<xsl:template match="feedback_add" mode="under_end"> 
</xsl:template>



</xsl:stylesheet>
