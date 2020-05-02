<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="news_abc"> 


<xsl:variable name="cur_grp" select="@obj"/>
<xsl:variable name="grp" select="news_grp/word[@value=$cur_grp]"/>

<div class="path">
<a href="/">Orgspace</a> :
<a href="container-view?walias=about">oб orgspace</a> :
<a href="container-view?walias=news"><xsl:value-of select="$lc/news"/></a> :
<xsl:value-of select="$grp"/>
</div>


<!-- Line -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="org">
<tr>
<td valign="top">
<div><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td>

<TD rowspan="2" align="right" class="abswtitle" width="100%">
<IMG align="absMiddle" border="0" height="8" hspace="5" vspace="6" src="/images/arr.gif" width="6"/> 
<a href="container-view?walias=news" class="white"><xsl:value-of select="$lc/news"/></a>
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
<h1><xsl:value-of select="$grp"/></h1>
<br/><br/><br/><br/><br/>
</td>

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
</xsl:if>

<td class="text" width="100%">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<h1><xsl:value-of select="$lc/up_news"/></h1>

<xsl:for-each select='list/news_db'>
  <p>
    <xsl:value-of select="@event_date"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <a href="news-view?obj={@id}"><xsl:value-of select="@topic" disable-output-escaping="yes"/></a>
    <xsl:if test="$admin=1">
     [<a href="news-edit?obj={@id}">Редактировать</a>]<br/>
     [<a href="news-del?obj={@id}">Удалить</a>]<br/>
    </xsl:if>
  </p>
</xsl:for-each>

<xsl:if test="$admin=1">
  [<a href="news-add">Добавить новость</a>]
  <br/>
</xsl:if>


</td>

<xsl:if test="$print!=1">

<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>

<td width="205">
<img src="/images/dot.gif" width="1" height="6" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="0" width="205" class="org">
<tr><td colspan="2">
<div class="fleft"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<xsl:for-each select='news_grp/word'>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
 <xsl:choose>
  <xsl:when test="$cur_grp=@value">
    <td class="wtext"><div class="rmenu"><xsl:value-of select="."/></div></td>
  </xsl:when>
  <xsl:otherwise>
    <td class="wtext"><div class="rmenu"><a href="news-abc?obj={@value}"><xsl:value-of select="."/></a></div></td>
  </xsl:otherwise>
 </xsl:choose>
</tr>

</xsl:for-each>

<tr>
<td><img src="/images/dot.gif" width="1" height="1" border="0"/><br/></td>
<!--td class="wtext"><div class="rmenu"><a href="subscr-add"><xsl:value-of select="$lc/subscr/alts"/></a></div></td-->
</tr>


<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0"/></div>
</td></tr>
</table>

<div class="print" align="right">
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
[<a href="container-managewrapper?i=news&amp;m=abc&amp;obj={@obj}&amp;creator=container.view.empty" target="blank">Редактировать шаблон</a>]
</xsl:if>


</xsl:template>


</xsl:stylesheet>

