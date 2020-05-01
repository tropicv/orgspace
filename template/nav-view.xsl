<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="nav_view"> 
<xsl:choose>
 <xsl:when test="nav_db/@type=0"> <!-- //NAV_LINK -->
	<xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=1"> <!-- //NAV_LEVEL -->
	<xsl:call-template name="show_level">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=2"> <!-- //NAV_TREE -->  
        <ul>
	<xsl:call-template name="show_tree">
	<xsl:with-param name="bush" select="nav_db/bush_db/bush_db"/>
	</xsl:call-template>
        </ul>
 </xsl:when>
 <xsl:when test="nav_db/@type=3"> <!-- //NAV_RUBR --> 
	<xsl:call-template name="show_rubr">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=4"> <!-- //NAV_PATH -->
	<xsl:call-template name="show_path">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=5"> <!-- //BACK_LINK -->
        <a href="javascript:history.back()">&lt;&lt; <xsl:value-of select="$lc/nav/back"/></a>
 </xsl:when>
 <xsl:when test="nav_db/@type=6"> <!-- //TOP_LINK -->
	<P align="right"><A href="#top" class="int">&#916; <xsl:value-of select="$lc/nav/top"/></A></P>
 </xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="nav_view_navlevel1"> 
<xsl:choose>
 <xsl:when test="nav_db/@type=0"> <!-- //NAV_LINK -->
	<xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=1"> <!-- //NAV_LEVEL -->
	<xsl:call-template name="show_level1">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=2"> <!-- //NAV_TREE -->  
	<xsl:call-template name="show_tree1">
	<xsl:with-param name="bush" select="nav_db/bush_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=3"> <!-- //NAV_RUBR --> 
	<xsl:call-template name="show_rubr_navlevel1">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=4"> <!-- //NAV_PATH -->
	<xsl:call-template name="show_path">
	<xsl:with-param name="bush" select="nav_db/bush_db"/>
	</xsl:call-template>
 </xsl:when>
 <xsl:when test="nav_db/@type=5"> <!-- //BACK_LINK -->
        <a href="javascript:history.back()">&lt;&lt; <xsl:value-of select="$lc/nav/back"/></a>
 </xsl:when>
 <xsl:when test="nav_db/@type=6"> <!-- //TOP_LINK -->
	<P align="right"><A href="#top" class="int">&#916; <xsl:value-of select="$lc/nav/top"/></A></P>
 </xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template name="show_link">
<xsl:param name="bush"/>

<xsl:choose>
 <xsl:when test="$bush/@type=2"> <!-- LINK_EXTERNAL -->
  <a href="{$bush/@url}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=0"> <!-- SAME_PAGE -->
  <a href="container-view?obj={$bush/@container}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=1"> <!-- LINK_INTERNAL-->
  <xsl:choose>
   <xsl:when test="$bush/@target_type=2">
    <a href="{$bush/@url}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
   </xsl:when>
   <xsl:otherwise>
    <a href="container-view?obj={$bush/@target_container}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:when>
</xsl:choose>

</xsl:template>

<xsl:template name="show_link_style">
<xsl:param name="bush"/>
<xsl:param name="style"/>

<xsl:choose>
 <xsl:when test="$bush/@type=2"> <!-- LINK_EXTERNAL -->
  <a href="{$bush/@url}" class="{$style}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=0"> <!-- SAME_PAGE -->
  <a href="container-view?obj={$bush/@container}" class="{$style}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=1"> <!-- LINK_INTERNAL-->
  <xsl:choose>
   <xsl:when test="$bush/@target_type=2">
    <a href="{$bush/@url}" class="{$style}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
   </xsl:when>
   <xsl:otherwise>
    <a href="container-view?obj={$bush/@target_container}" class="{$style}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/></a>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:when>
</xsl:choose>

</xsl:template>

<xsl:template name="show_link_navlevel1">
<xsl:param name="bush"/>

<xsl:choose>
 <xsl:when test="$bush/@type=2"> <!-- LINK_EXTERNAL -->
  <a href="{$bush/@url}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/>
  <img src="images/arr.gif" width="6" height="8" border="0" style="margin-left: 50px;" align="absmiddle"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=0"> <!-- SAME_PAGE -->
  <a href="container-view?obj={$bush/@container}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/>
  <img src="images/arr.gif" width="6" height="8" border="0" style="margin-left: 50px;" align="absmiddle"/></a>
 </xsl:when>
 <xsl:when test="$bush/@type=1"> <!-- LINK_EXTERNAL -->
  <xsl:choose>
   <xsl:when test="$bush/@target_type=2">
    <a href="{$bush/@target_url}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/>
    <img src="images/arr.gif" width="6" height="8" border="0" style="margin-left: 50px;" align="absmiddle"/></a>
   </xsl:when>
   <xsl:otherwise>
    <a href="container-view?obj={$bush/@target_container}"><xsl:value-of select="$bush/@title" disable-output-escaping="yes"/>
    <img src="images/arr.gif" width="6" height="8" border="0" style="margin-left: 50px;" align="absmiddle"/></a>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:when>
</xsl:choose>

</xsl:template>

<xsl:template name="show_level">
<xsl:param name="bush"/>

<xsl:for-each select="$bush/bush_db">
<xsl:if test="@notshow!=1">
<p style="margin: 0 0 0.5em 0;">
 <xsl:choose>
  <xsl:when test="(@type=0 and @container=$bush/../../../@container_id) or (@type=2 and @url=$content/*[1]/@rurl)">
   <xsl:value-of select="@title"/>
  </xsl:when>
  <xsl:otherwise>
	<xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template>
  </xsl:otherwise>
 </xsl:choose>
</p>
</xsl:if>
</xsl:for-each>

</xsl:template>

<xsl:template name="show_level1">
<xsl:param name="bush"/>

<xsl:for-each select="$bush/bush_db">
<p style="margin: 0 0 1em 0;">
 <xsl:choose>
  <xsl:when test="@type=0 and @container=$bush/../../../@container_id">
   <xsl:value-of select="@title"/>
  </xsl:when>
  <xsl:otherwise>
	<xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template>
  </xsl:otherwise>
 </xsl:choose>
</p>
</xsl:for-each>

</xsl:template>

<xsl:template name="show_path">
<xsl:param name="bush"/>

<a href="/">Orgspace</a> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]>:<![CDATA[&nbsp;]]></xsl:text>
<xsl:for-each select="$bush">

<xsl:if test="position()>2">
 <xsl:choose>
  <xsl:when test="position()=last()">
   <xsl:value-of select="@title"/>
  </xsl:when>
  <xsl:otherwise>
	<xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]>:<![CDATA[&nbsp;]]></xsl:text>
  </xsl:otherwise>
 </xsl:choose>
</xsl:if>

</xsl:for-each>

</xsl:template>

<xsl:template name="show_rubr">
<xsl:param name="bush"/>

<xsl:for-each select="$bush/bush_db">
	<b>
	 <xsl:call-template name="show_link">
	 <xsl:with-param name="bush" select="."/>
	 </xsl:call-template> 
	</b>
        <xsl:for-each select="bush_db">
	  <xsl:if test="@not_show!=1">
	  <li>
	  <xsl:call-template name="show_link">
	  <xsl:with-param name="bush" select="."/>
	  </xsl:call-template> 
	  </li>
	  </xsl:if> 
        </xsl:for-each>
	<br/>
</xsl:for-each>

</xsl:template>


<xsl:template name="show_tree">
<xsl:param name="bush"/>

<xsl:for-each select="$bush">
	<li><xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template></li>
	<xsl:if test="child::*"> 
	 <ul>
	  <xsl:call-template name="show_tree">
	  <xsl:with-param name="bush" select="bush_db"/>
	  </xsl:call-template> 
	 </ul>
	</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="show_tree_lev">
<xsl:param name="bush"/>
<xsl:param name="lev"/>

<xsl:for-each select="$bush">
	<li><xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template></li>
	<xsl:if test="(child::*) and (($content/*/@vmode='all') or (not($content/*/@vmode) and ($lev &lt; 3)))"> 
	 <ul>
	  <xsl:call-template name="show_tree_lev">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number($lev)+1"/>
	  </xsl:call-template> 
	 </ul>
	</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="show_tree1">
<xsl:param name="bush"/>

<xsl:for-each select="$bush">
<xsl:if test="@walias!='products'">
<ul>
	<li><xsl:call-template name="show_link">
	<xsl:with-param name="bush" select="."/>
	</xsl:call-template></li>
	<xsl:if test="child::*"> 
	 <ul>
	  <xsl:call-template name="show_tree_lev">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number('2')"/>
	  </xsl:call-template> 
	 </ul>
	</xsl:if>
</ul>
</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="show_rubr_navlevel1">
<xsl:param name="bush"/>

<xsl:variable name="cr" select="count($bush/bush_db)"/>
<xsl:variable name="wr" select="number('100') div number($cr)"/>

<tr>
<td colspan="{$cr}"><img src="/images/dot.gif" width="760" height="1" border="0" /><br/></td>
</tr>

<tr>
<xsl:for-each select="$bush/bush_db">
<td class="nav" width="{$wr}%">

	 <xsl:call-template name="show_link_navlevel1">
	 <xsl:with-param name="bush" select="."/>
	 </xsl:call-template> 
</td>
</xsl:for-each>
</tr>

<tr>
<xsl:for-each select="$bush/bush_db">
<td class="wnav">
 <xsl:for-each select="bush_db">
   <xsl:if test="@notshow='0'">
	 <xsl:call-template name="show_link">
	 <xsl:with-param name="bush" select="."/>
	 </xsl:call-template><br/>
   </xsl:if>
 </xsl:for-each>
</td>
</xsl:for-each>
</tr>

</xsl:template>

</xsl:stylesheet>
