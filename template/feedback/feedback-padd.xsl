<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/dorgl4.xsl"/> 


<xsl:template match="feedback_padd"> 

<div class="path">
<a href="/">Orgspace</a> : 
<xsl:value-of select="$lc/nav/ask_quest"/>
</div>


<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="org">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<a class="white" href="/"><xsl:value-of select="$lc/main_page"/></a>
</TD>

<td  valign="top">
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td valign="bottom">
<div><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
</td>
<td  valign="bottom">
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr style="background: #FFFFFF;">
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="748" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="6" height="1" border="0"/><br/></td>
</tr>

</table>

<img src="/images/dot.gif" width="1" height="10" border="0"/><br/>

<!-- End Line -->


<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cont">
<tr>

<td class="text" width="100%">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>
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

<tr>
<td colspan="2"><xsl:value-of select="$lc/feedback/fax"/></td>
</tr>

<tr>
<td class="input"><input type="text" name="fax" size="45" value=""/></td>
<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
</tr>

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

<xsl:call-template name="politic" />

</xsl:when> 

<xsl:when test="@last_state=2"> 
<xsl:value-of select="$lc/feedback/thanks"/>
</xsl:when> 

</xsl:choose>


</td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="760" height="1" border="0"/><br/></td>
</tr>


</table>

<br/>


</xsl:template>


</xsl:stylesheet>
