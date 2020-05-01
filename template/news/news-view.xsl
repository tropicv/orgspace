<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="news_view"> 


<xsl:variable name="cur_grp" select="news_db/@grp"/>
<xsl:variable name="grp" select="news_grp/word[@value=$cur_grp]"/>

<div class="path">
<a href="/">Orgspace</a> :
<a href="container-view?walias=about">oб orgspace</a> :
<a href="container-view?walias=news"><xsl:value-of select="$lc/news"/></a> :
<a href="news-abc?obj={$grp/@value}"><xsl:value-of select="$grp"/></a> :
<xsl:choose>
 <xsl:when test="string-length(news_db/@topic) &lt; 60"><xsl:value-of select="news_db/@topic"/></xsl:when>
 <xsl:otherwise>
  <xsl:value-of select="substring(news_db/@topic, 1, 59)"/>
  <xsl:value-of select="substring-before(substring(news_db/@topic, 60),' ')"/> ...
 </xsl:otherwise>
</xsl:choose>

</div>


<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="org">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<a href="news-abc?obj={$grp/@value}" class="white"><xsl:value-of select="$grp"/></a>
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
<xsl:if test="$print!=1">

<td width="205">

<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2"> 
<img src="/images/cont/news-1.jpg" width="214" heigth="185"/>
</td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>
<br/><br/><br/><br/><br/>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

</xsl:if>

<td class="text" width="100%">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<h1><xsl:value-of select="news_db/@topic" disable-output-escaping="yes"/></h1>

<p>
    <b><xsl:value-of select="news_db/@event_date"/></b><br/><br/>

    <xsl:value-of select="news_db/@body" disable-output-escaping="yes"/>

    <xsl:if test="$admin=1">
     [<a href="news-edit?obj={news_db/@id}">Редактировать</a>]<br/>
    </xsl:if>

</p>

</td>

<xsl:if test="$print!=1">

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td width="205">
<div class="print" align="right" style="position:relative; top: -6px;  z-index: 1;">
<a href="{$content/*/@req_url}&amp;ver=print" target="blank"><xsl:value-of select="$lc/print_ver"/> <img src="/images/print.gif" hspace="5" width="14" height="14" border="0" align="absmiddle"/></a>
</div>

</td>
</xsl:if>
</tr>


<tr>
<xsl:choose>
<xsl:when test="$print!=1">
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="320" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="205" height="1" border="0"/><br/></td>
</xsl:when>
<xsl:otherwise>
<td><img src="/images/dot.gif" width="760" height="1" border="0"/><br/></td>
</xsl:otherwise>
</xsl:choose>
</tr>


</table>

<xsl:if test="$admin=1">
[<a href="container-managewrapper?i=news&amp;m=view&amp;obj={@obj}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:if>

</xsl:template>


</xsl:stylesheet>


