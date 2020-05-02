<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="pcat_view"> 

<xsl:variable name="vmode"> 
<xsl:choose>
 <xsl:when test="@vmode='all'">all</xsl:when>
 <xsl:otherwise>short</xsl:otherwise>
</xsl:choose>
</xsl:variable>

<xsl:choose>
 <xsl:when test="@vmode='all'">

<table class="any" width="90%">
<tr>
<td width="40%">

<table border="0" cellspacing="0" cellpadding="0" class="smapf">
<tr>
<td><img src="/images/fmenu/1.gif" width="32" height="20"/></td>
<td colspan="4" class="l1"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text><a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a></td>
</tr>

<tr>
<td><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/4.gif" width="32" height="18"/></td>
<td colspan="3" class="l2"><a href="zone-all"><xsl:value-of select="$lc/zone/@name"/></a></td>
</tr>

  <xsl:for-each select="zone_all/zone_db">
<tr>
<xsl:choose>
 <xsl:when test="position()=1">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/5.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/7.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/9.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td class="l3" colspan="2"><a href="zone-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>

<xsl:if test="@sh_sol!=0">
<tr>
<td ><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="zone-solution?walias={@walias}"><xsl:value-of select="$lc/zone/solution"/></a></td>
</tr>
</xsl:if>

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last() and @sh_arr=0">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="zone-example?walias={@walias}"><xsl:value-of select="$lc/zone/example"/></a></td>
</tr>


      <xsl:if test="@sh_arr!=0">
<tr>
<td ><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last()">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="zone-arrange?walias={@walias}"><xsl:value-of select="$lc/zone/arrange"/></a></td>
</tr>
      </xsl:if>

  </xsl:for-each>

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/11.gif" width="32" height="18"/></td>
<td colspan="3" class="l2"><a href="serial-all"><xsl:value-of select="$lc/serial/@name"/></a></td>
</tr>

  <xsl:for-each select="serial_all/serial_db">
<tr>

<xsl:choose>
 <xsl:when test="position()=1">
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/7.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/9.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td colspan="2" class="l3"><a href="serial-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-addinf?walias={@walias}"><xsl:value-of select="$lc/serial/description"/></a></td>
</tr>

<xsl:if test="@sh_color!=0">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-color?walias={@walias}"><xsl:value-of select="$lc/serial/color"/></a></td>
</tr>
</xsl:if>

<xsl:if test="@sh_acs!=0">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-accessories?walias={@walias}"><xsl:value-of select="$lc/serial/accessories"/></a></td>
</tr>
</xsl:if>

<xsl:if test="@sh_elem!=0">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-elements?walias={@walias}"><xsl:value-of select="$lc/serial/elements"/></a></td>
</tr>
</xsl:if>

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last() and @sh_arr=0">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-example?walias={@walias}"><xsl:value-of select="$lc/serial/example"/></a></td>
</tr>

      <xsl:if test="@sh_arr!=0">
<tr>
<td ><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last()">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-arrange?walias={@walias}"><xsl:value-of select="$lc/serial/arrange"/></a></td>
</tr>
      </xsl:if>

  </xsl:for-each>

<!-- CHAIRS -->

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/11.gif" width="32" height="18"/></td>
<td colspan="3" class="l2"><a href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a></td>
</tr>

  <xsl:for-each select="chairs_all/chairs_db">
<tr>

<xsl:choose>
 <xsl:when test="position()=1">
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/7.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/9.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td colspan="2" class="l3"><a href="chairs-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>

<xsl:variable name="cw" select="@walias"/> 

<xsl:variable name="lastp"> 
<xsl:choose>
 <xsl:when test="position()=last()">yes</xsl:when>
 <xsl:otherwise>no</xsl:otherwise>
</xsl:choose>
</xsl:variable>

<xsl:if test="list/child::*">
<xsl:for-each select="list/chairsitem_db">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last() and $lastp='yes'">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="chairs-example?walias={$cw}&amp;obj={@id}"><xsl:value-of select="@name"/></a></td>
</tr>
</xsl:for-each>

</xsl:if>


  </xsl:for-each>

<!-- END CHAIRS -->

<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/11.gif" width="32" height="18"/></td>
<td colspan="3" class="l2"><a href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a></td>
</tr>

  <xsl:for-each select="predmet_all/predmet_db">
<tr>

<xsl:choose>
 <xsl:when test="position()=1">
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/7.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/9.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td class="l3" colspan="2"><a href="predmet-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>

<xsl:if test="@sh_fotogal!=0">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="predmet-gallery?walias={@walias}"><xsl:value-of select="$lc/predmet/gallery"/></a></td>
</tr>
</xsl:if>

<xsl:if test="@sh_assort!=0">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="predmet-assortment?walias={@walias}"><xsl:value-of select="$lc/predmet/assortment"/></a></td>
</tr>
</xsl:if>

<xsl:variable name="lastp"> 
<xsl:choose>
 <xsl:when test="position()=last()">yes</xsl:when>
 <xsl:otherwise>no</xsl:otherwise>
</xsl:choose>
</xsl:variable>


<xsl:if test="list/child::*">
<xsl:for-each select="list/goods_db">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last() and $lastp='yes'">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="goods-view?obj={@id}"><xsl:value-of select="@name"/></a></td>
</tr>
</xsl:for-each>

<xsl:for-each select="list/gtype_db">
<tr>
<td><img src="/images/fmenu/14.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/fmenu/2.gif" width="32" height="18"/></td>

<xsl:choose>
 <xsl:when test="position()=last() and $lastp='yes'">
<td><img src="/images/fmenu/3.gif" width="32" height="18"/></td>
 </xsl:when>
 <xsl:otherwise>
<td class="bg"><img src="/images/fmenu/8.gif" width="32" height="18"/></td>
 </xsl:otherwise>
</xsl:choose>

<td><img src="/images/fmenu/10.gif" width="32" height="18"/></td>
<td class="l3"><a href="gtype-view?obj={@id}"><xsl:value-of select="@name"/></a></td>
</tr>
</xsl:for-each>
</xsl:if>

  </xsl:for-each>

<!-- View not prod  pages in prod -->

<xsl:for-each select="pg_all/bush_db/bush_db/bush_db[@walias='products']/bush_db">
<xsl:if test="@walias='aboutprod'">

<xsl:variable name="pref" select="number('1')"/>

<tr>
<xsl:choose>
<xsl:when test="position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/2.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/4.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/11.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="3" class="l2"><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>

<xsl:if test="child::*"> 
<xsl:choose>
<xsl:when test="position()=last()"> 
  <xsl:call-template name="show_tree_smapf">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('3')"/>
  <xsl:with-param name="lastp" select="number('1')"/>
  <xsl:with-param name="prevlastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  <xsl:with-param name="pos" select="position()"/>
  </xsl:call-template> 
</xsl:when>
<xsl:otherwise>
  <xsl:call-template name="show_tree_smapf">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('3')"/>
  <xsl:with-param name="lastp" select="number('0')"/>
  <xsl:with-param name="prevlastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  <xsl:with-param name="pos" select="position()"/>
  </xsl:call-template> 
</xsl:otherwise>
</xsl:choose>
</xsl:if>

</xsl:if>
</xsl:for-each>


</table>

</td>
<td>
 <img src="/images/dot.gif" width="50" height="1" border="0"/>
</td>
<td width="40%">

<xsl:for-each select="pg_all/bush_db/bush_db/bush_db">
<xsl:if test="@walias!='products'">

<xsl:variable name="pref">
<xsl:choose>
 <xsl:when test="position()>5">5</xsl:when>
 <xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>

<table border="0" cellspacing="0" cellpadding="0" class="smap">
<tr>
<xsl:choose>
<xsl:when test="(child::*)">
<td><img src="/images/fmenu/{$pref}/1.gif" width="32" height="20"/></td>
</xsl:when>
<xsl:otherwise>
<td><img src="/images/fmenu/{$pref}/15.gif" width="32" height="20"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="4" class="l1"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td></tr>

<xsl:if test="child::*"> 
<xsl:choose>
<xsl:when test="position()=last()"> 
  <xsl:call-template name="show_tree_smapf">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('2')"/>
  <xsl:with-param name="lastp" select="number('1')"/>
  <xsl:with-param name="prevlastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  <xsl:with-param name="pos" select="position()"/>
  </xsl:call-template> 
</xsl:when>
<xsl:otherwise>
  <xsl:call-template name="show_tree_smapf">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('2')"/>
  <xsl:with-param name="lastp" select="number('0')"/>
  <xsl:with-param name="prevlastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  <xsl:with-param name="pos" select="position()"/>
  </xsl:call-template> 
</xsl:otherwise>
</xsl:choose>
</xsl:if>

</table><br/>
</xsl:if>

</xsl:for-each>

</td>
</tr>
</table>

 </xsl:when>
 <xsl:otherwise>

<table class="any" width="90%">
<tr>
<td width="40%">

<table border="0" cellspacing="0" cellpadding="0" class="smap">
<tr>
<td><img src="/images/menu/1.gif" width="32" height="20"/></td>
<td colspan="3" class="l1"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text><a href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a></td>
</tr>

<tr>
<td><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/3.gif" width="32" height="18"/></td>
<td colspan="2" class="l2"><a href="zone-all"><xsl:value-of select="$lc/zone/@name"/></a></td>
</tr>

  <xsl:for-each select="zone_all/zone_db">
<tr>
<td class="bg"><img src="/images/menu/4.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/6.gif" width="32" height="18"/></td>
<td class="l3"><a href="zone-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>
  </xsl:for-each>

<tr>
<td><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/7.gif" width="32" height="18"/></td>
<td colspan="2" class="l2"><a href="serial-all"><xsl:value-of select="$lc/serial/@name"/></a></td>
</tr>

  <xsl:for-each select="serial_all/serial_db">
<tr>
<td class="bg"><img src="/images/menu/4.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/6.gif" width="32" height="18"/></td>
<td class="l3"><a href="serial-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>
  </xsl:for-each>

<tr>
<td><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/7.gif" width="32" height="18"/></td>
<td colspan="2" class="l2"><a href="chairs-all"><xsl:value-of select="$lc/chairs/@name"/></a></td>
</tr>

  <xsl:for-each select="chairs_all/chairs_db">
<tr>
<td class="bg"><img src="/images/menu/4.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/6.gif" width="32" height="18"/></td>
<td class="l3"><a href="chairs-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>
  </xsl:for-each>

<tr>
<td><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/7.gif" width="32" height="18"/></td>
<td colspan="2" class="l2"><a href="predmet-all"><xsl:value-of select="$lc/predmet/@name"/></a></td>
</tr>

  <xsl:for-each select="predmet_all/predmet_db">

<tr>
<td class="bg"><img src="/images/menu/4.gif" width="32" height="18"/></td>
<td class="bg"><img src="/images/menu/2.gif" width="32" height="18"/></td>
<td><img src="/images/menu/6.gif" width="32" height="18"/></td>
<td class="l3"><a href="predmet-view?walias={@walias}"><xsl:value-of select="@short_name"/></a></td>
</tr>

  </xsl:for-each>

<xsl:for-each select="pg_all/bush_db/bush_db/bush_db[@walias='products']/bush_db">
<xsl:if test="@walias='aboutprod'">

<xsl:variable name="pref" select="number('1')"/>

<tr>
<xsl:choose>
<xsl:when test="position()=last()">
<td><img src="/images/menu/{$pref}/8.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/2.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=1">
<td><img src="/images/menu/{$pref}/3.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/7.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="2" class="l2"><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>

<xsl:if test="child::*"> 
<xsl:choose>
<xsl:when test="position()=last()"> 
  <xsl:call-template name="show_tree_smap">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('3')"/>
  <xsl:with-param name="lastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  </xsl:call-template> 
</xsl:when>
<xsl:otherwise>
  <xsl:call-template name="show_tree_smap">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('3')"/>
  <xsl:with-param name="lastp" select="number('0')"/>
  <xsl:with-param name="pref" select="$pref"/>
  </xsl:call-template> 
</xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:if>
</xsl:for-each>

</table>


<xsl:for-each select="pg_all/bush_db/bush_db/bush_db">
<xsl:if test="@walias!='products'">

<xsl:variable name="pref">
<xsl:choose>
 <xsl:when test="position()>5">5</xsl:when>
 <xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>

<table border="0" cellspacing="0" cellpadding="0" class="smap">
<tr>
<xsl:choose>
<xsl:when test="(child::*)">
<td><img src="/images/menu/{$pref}/1.gif" width="32" height="20"/></td>
</xsl:when>
<xsl:otherwise>
<td><img src="/images/menu/{$pref}/11.gif" width="32" height="20"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="3" class="l1"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>

<xsl:if test="child::*"> 
<xsl:choose>
<xsl:when test="position()=last()"> 
  <xsl:call-template name="show_tree_smap">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('2')"/>
  <xsl:with-param name="lastp" select="number('1')"/>
  <xsl:with-param name="pref" select="$pref"/>
  </xsl:call-template> 
</xsl:when>
<xsl:otherwise>
  <xsl:call-template name="show_tree_smap">
  <xsl:with-param name="bush" select="bush_db"/>
  <xsl:with-param name="lev" select="number('2')"/>
  <xsl:with-param name="lastp" select="number('0')"/>
  <xsl:with-param name="pref" select="$pref"/>
  </xsl:call-template> 
</xsl:otherwise>
</xsl:choose>
</xsl:if>

</table><br/>
</xsl:if>

<xsl:if test="position()='2'">
<xsl:text disable-output-escaping="yes">
&lt;/td>
&lt;td>
 &lt;img src="/images/dot.gif" width="50" height="1" border="0"/>
&lt;/td>
&lt;td width="40%">
</xsl:text>
</xsl:if>

</xsl:for-each>

</td>
</tr>
</table>

 </xsl:otherwise>
</xsl:choose>


</xsl:template>


<xsl:template name="show_tree_smap">
<xsl:param name="bush"/>
<xsl:param name="lev"/>
<xsl:param name="lastp"/>
<xsl:param name="pref"/>

<xsl:for-each select="$bush">

<xsl:choose>
<xsl:when test="$lev=2">
<tr>
<xsl:choose>
<xsl:when test="position()=last()">
<td><img src="/images/menu/{$pref}/8.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/2.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=1">
<td><img src="/images/menu/{$pref}/3.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/7.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="2" class="l2"><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>
</xsl:when>



<xsl:when test="$lev=3">
<tr>

<xsl:choose>
<xsl:when test="$lastp=1">
<td><img src="/images/menu/{$pref}/9.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/4.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=last() and $lastp=1">
<td><img src="/images/menu/{$pref}/8.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/menu/{$pref}/2.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td><img src="/images/menu/{$pref}/6.gif" width="32" height="18"/></td>
<td class="l3">
<xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>
</xsl:when>
<xsl:otherwise>
</xsl:otherwise>
</xsl:choose>

	<xsl:if test="(child::*) and (($content/*/@vmode='all') or (not($content/*/@vmode) and ($lev &lt; 3)))"> 

	<xsl:choose>
	<xsl:when test="position()=last()"> 
	  <xsl:call-template name="show_tree_smap">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number($lev)+1"/>
	  <xsl:with-param name="lastp" select="number('1')"/>
	  <xsl:with-param name="pref" select="$pref"/>
	  </xsl:call-template> 
	</xsl:when>
	<xsl:otherwise>
	  <xsl:call-template name="show_tree_smap">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number($lev)+1"/>
	  <xsl:with-param name="lastp" select="number('0')"/>
	  <xsl:with-param name="pref" select="$pref"/>
	  </xsl:call-template> 
	</xsl:otherwise>
	</xsl:choose>
	</xsl:if>
</xsl:for-each>
</xsl:template>


<xsl:template name="show_tree_smapf">
<xsl:param name="bush"/>
<xsl:param name="lev"/>
<xsl:param name="lastp"/>
<xsl:param name="prevlastp"/>
<xsl:param name="pref"/>
<xsl:param name="pos"/>

<xsl:for-each select="$bush">

<xsl:choose>
<xsl:when test="$lev=2">
<tr>
<xsl:choose>
<xsl:when test="position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/2.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/4.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/11.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td colspan="3" class="l2"><xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>
</xsl:when>



<xsl:when test="$lev=3">
<tr>

<xsl:choose>
<xsl:when test="$pos=1 and position()=1">
<td><img src="/images/fmenu/{$pref}/3.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td ><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="$pos=1 and position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/5.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:when test="$lastp=1 and position()!=1">
<td><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:when test="$lastp=1 and position()=1">
<td><img src="/images/fmenu/{$pref}/3.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:when test="$lastp!=1 and position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/8.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/6.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="position()=last() and position()=1">
<td><img src="/images/fmenu/{$pref}/10.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:when test="position()=last() and not(child::*)">
<td><img src="/images/fmenu/{$pref}/13.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:when test="position()=1">
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/7.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/9.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<td class="l3" colspan="2">
<xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>
</xsl:when>

<xsl:when test="$lev=4">
<tr>
<td><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>

<xsl:choose>
<xsl:when test="$prevlastp=1">
<td><img src="/images/fmenu/{$pref}/14.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/6.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="$lastp=1 and position()=last()">
<td><img src="/images/fmenu/{$pref}/3.gif" width="32" height="18"/></td>
</xsl:when>
<xsl:otherwise>
<td class="bg{$pref}"><img src="/images/fmenu/{$pref}/8.gif" width="32" height="18"/></td>
</xsl:otherwise>
</xsl:choose>
<td><img src="/images/fmenu/{$pref}/10.gif" width="32" height="18"/></td>
<td class="l3" >
<xsl:call-template name="show_link"><xsl:with-param name="bush" select="."/></xsl:call-template></td>
</tr>
</xsl:when>

<xsl:otherwise>
</xsl:otherwise>
</xsl:choose>

	<xsl:if test="(child::*)"> 

	<xsl:choose>
	<xsl:when test="position()=last()"> 
	  <xsl:call-template name="show_tree_smapf">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number($lev)+1"/>
	  <xsl:with-param name="lastp" select="number('1')"/>
	  <xsl:with-param name="pref" select="$pref"/>
	  <xsl:with-param name="prevlastp" select="$lastp"/>
	  <xsl:with-param name="pos" select="position()"/>
	  </xsl:call-template> 
	</xsl:when>
	<xsl:otherwise>
	  <xsl:call-template name="show_tree_smapf">
	  <xsl:with-param name="bush" select="bush_db"/>
	  <xsl:with-param name="lev" select="number($lev)+1"/>
	  <xsl:with-param name="lastp" select="number('0')"/>
	  <xsl:with-param name="pref" select="$pref"/>
	  <xsl:with-param name="prevlastp" select="$lastp"/>
	  <xsl:with-param name="pos" select="position()"/>
	  </xsl:call-template> 
	</xsl:otherwise>
	</xsl:choose>
	</xsl:if>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>

