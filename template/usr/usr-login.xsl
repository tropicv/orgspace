<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/dorgl4.xsl"/> 


<xsl:template match="usr_login"> 

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
[<a href="container-managewrapper?i=usr&amp;m=login&amp;state={@last_state}&amp;creator=container.view.dorgl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=usr&amp;m=login&amp;creator=container.view.dorgl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template match="usr_login" mode="title"> 
</xsl:template>

<xsl:template match="usr_login" mode="path"> 
</xsl:template>

<xsl:template match="usr_login" mode="left_start"> 
</xsl:template>

<xsl:template match="usr_login" mode="left_end"> 
</xsl:template>

<xsl:template match="usr_login" mode="content_title"> 
<xsl:value-of select="$lc/manager/for_diler"/>
</xsl:template>

<xsl:template match="usr_login" mode="content_start"> 
</xsl:template>

<xsl:template match="usr_login" mode="content_end"> 


  <xsl:if test="error"> 
     <br/>
     <b><xsl:value-of select="$lc/register/err"/></b>
  </xsl:if> 

  <form method="POST" action="usr-login?state=1" enctype="multipart/form-data">

  <table border="0" class="any">

  <tr>
      <td style="vertical-align: middle;"><font class="MIFtext"><xsl:value-of select="$lc/register/login"/>:<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]><![CDATA[&nbsp;]]></xsl:text></font></td>
      <td><input type="text" size="10" name="nick" value=""/></td>
  </tr>

  <tr>
      <td style="vertical-align: middle;"><font class="MIFtext"><xsl:value-of select="$lc/register/passwd"/>:<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]><![CDATA[&nbsp;]]></xsl:text></font></td>
      <td><input type="password" size="10" name="passwd" value=""/></td>
  </tr>

  <tr>
      <td valign="middle" align="right"></td>
      <td><a href="usr-forgot"><xsl:value-of select="$lc/register/forg_passwd"/></a></td>
  </tr>

  <tr>
      <td valign="middle" align="right"></td>
      <td><a href="register-add"><xsl:value-of select="$lc/register/register"/></a></td>
  </tr>

  <tr>
      <td valign="middle" align="right"></td>
      <td style="padding-top: 10px;"><input type="submit" size="10" value="{$lc/enter}"/></td>
  </tr>


  </table>

  </form>


</xsl:template>

<xsl:template match="usr_login" mode="right_start"> 
</xsl:template>

<xsl:template match="usr_login" mode="right_end"> 
</xsl:template>

<xsl:template match="usr_login" mode="right_print"> 
</xsl:template>

<xsl:template match="usr_login" mode="under_start"> 
</xsl:template>

<xsl:template match="usr_login" mode="under_end"> 
</xsl:template>

</xsl:stylesheet>
