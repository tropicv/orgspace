<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="user_menu"> 

<xsl:if test="$admin=1">

<table width="100%" border="0">
<td align="right">
<A href="bush-level" class="MIFnavw"><img src="/images/mifors/menu/structure.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Дерево сайта" title="Дерево сайта"/></A>
<A href="banner-abc" class="MIFnavw"><img src="/images/mifors/menu/news.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Банеры" title="Банеры"/></A>
<A href="promo-abc" class="MIFnavw"><img src="/images/mifors/menu/dictonaries.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Промо акции" title="Промо акции"/></A>
<A href="clip-abc" class="MIFnavw"><img src="/images/mifors/menu/atom.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Клипы" title="Клипы"/></A>



<xsl:if test="@rurl='container-view'">
<A href="container-edit?obj={../content/container_view/*/container_db/@id}" class="MIFnavw"><img src="/images/mifors/menu/editpage.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Редактировать страницу" title="Редактировать страницу"/></A>
</xsl:if>

<A href="formstorage-flist" class="MIFnavw"><img src="/images/mifors/menu/news.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Запросы пользователей" title="Запросы пользователей"/></A>

<A href="usr-logout" class="MIFnavw"><img src="/images/mifors/menu/exit.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Выход" title="Выход"/></A>

<xsl:text>_____</xsl:text>
<xsl:if test="$lc/@lang='ru'">
<A href="cgi-bin/sync/sync.sh" class="MIFnavw"><img src="/images/mifors/menu/fastedit.gif" width="21" height="21" border="0" align="absmiddle" hspace="1" alt="Sync" title="Sync"/></A>
</xsl:if> 


</td>

</table>

</xsl:if>

</xsl:template>

</xsl:stylesheet>
