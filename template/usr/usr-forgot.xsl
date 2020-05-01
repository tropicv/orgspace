<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level5/level5.xsl"/> 
<xsl:include href="../layout/level5/dorgl5.xsl"/> 


<xsl:template match="usr_forgot"> 

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
[<a href="container-managewrapper?i=usr&amp;m=forgot&amp;state={@last_state}&amp;creator=container.view.dorgl5" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=usr&amp;m=forgot&amp;creator=container.view.dorgl5" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="usr_forgot" mode="title"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="path"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="left_start"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="left_end"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="content_title"> 
<xsl:value-of select="$lc/manager/for_diler"/>
</xsl:template>

<xsl:template match="usr_forgot" mode="content_start"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="content_end"> 

<xsl:choose>
<xsl:when test="@last_state=0"> 
  <form method="POST" action="usr-forgot?state=1" enctype="multipart/form-data">

  <table border="0" class="any">

  <tr>
      <td style="vertical-align: middle;"><font class="MIFtext">E-mail:<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]><![CDATA[&nbsp;]]></xsl:text></font></td>
      <td><input type="text" size="20" name="email" value=""/></td>
  </tr>

  <tr>
      <td valign="middle" align="right"></td>
      <td style="padding-top: 10px;"><input type="submit" size="10" value="{$lc/send}"/></td>
  </tr>


  </table>

  </form>
</xsl:when>
<xsl:when test="@last_state=1"> 
<h1><xsl:value-of select="$lc/register/sendmail"/></h1>
</xsl:when>
</xsl:choose>



</xsl:template>

<xsl:template match="usr_forgot" mode="right_start"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="right_end"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="right_print"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="under_start"> 
</xsl:template>

<xsl:template match="usr_forgot" mode="under_end"> 
</xsl:template>

</xsl:stylesheet>
