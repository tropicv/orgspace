<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="container_view_level1_edit"> 
<!-- Path -->

<div class="path"><a href="/">Orgspace</a> <xsl:value-of select="$lc/products"/></div>

<!-- End Path -->

<!-- Content -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td><img src="images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod" >

<tr>
<td>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template><br/>
</td>
<td class="wslogan" align="right">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template><br/>
</td>
</tr>
</table>

<h1>продукты</h1>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod" >
<tr>
<td width="33%" class="nav"><a href="/">зоны офиса <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
<td width="34%" class="nav"><a href="/">серии <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
<td width="33%" class="nav"><a href="/">предметы <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
</tr>

<tr>
<td width="33%" class="wnav">
<a href="/">Кабинеты</a><br/>
<a href="/">Рабочие места</a><br/>
<a href="/">Переговорная зона</a><br/>
<a href="/">Рабочая зона проходов</a><br/>
<a href="/">Архивная зона</a><br/>
<a href="/">Стойка-ресепшн</a>
<br/><br/><br/>
</td>
<td width="34%" class="wnav">
<a href="/">Karstula</a><br/>
<a href="/">Periscope</a><br/>
<a href="/">Fansy</a><br/>
<a href="/">Aura</a><br/>
<a href="/">Tetrix</a><br/>
<a href="/">Wellorg</a>
</td>
<td width="33%" class="wnav">
<a href="/">Именные предметы</a><br/>
<a href="/">Элементы мебели</a><br/>
<a href="/">Индексы</a>
</td>
</tr>
</table>

<!-- Promozona -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="bnav">
<tr>
<td>
<div class="fleft"><img src="images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="intbnav">
<tr>
<td width="20%"><b>а знаете ли Вы, что:</b><br/> что такое концепция <a href="/">эффективного офиса</a>?</td>
<td width="50%"><b>новости:</b><br/>
новость общая<br/>
новость общая<br/>
новость общая<br/>
новость общая
</td>
<td width="30%" class="last"><img src="images/cont/loly.gif" width="171" height="63" border="0"/></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<div class="fleft"><img src="images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>
</table>

    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">0</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template><br/>

</xsl:template>

<xsl:template match="container_view_level1"> 
<!-- Path -->

<div class="path"><a href="/">Orgspace</a> продукты</div>

<!-- End Path -->

<!-- Content -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcorn">
<tr>
<td><img src="images/c-tl.gif" width="6" height="6" border="0" /></td>
<td align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod" >

<tr>
<td>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
<td class="wslogan" align="right">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">2</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</td>
</tr>
</table>

<h1>продукты</h1>

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="prod" >
<tr>
<td width="33%" class="nav"><a href="/">зоны офиса <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
<td width="34%" class="nav"><a href="/">серии <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
<td width="33%" class="nav"><a href="/">предметы <img src="images/arr.gif" width="5" height="7" border="0" style="margin-left: 50px;" align="absmiddle"/></a></td>
</tr>

<tr>
<td width="33%" class="wnav">
<a href="/">Кабинеты</a><br/>
<a href="/">Рабочие места</a><br/>
<a href="/">Переговорная зона</a><br/>
<a href="/">Рабочая зона проходов</a><br/>
<a href="/">Архивная зона</a><br/>
<a href="/">Стойка-ресепшн</a>
<br/><br/><br/>
</td>
<td width="34%" class="wnav">
<a href="/">Karstula</a><br/>
<a href="/">Periscope</a><br/>
<a href="/">Fansy</a><br/>
<a href="/">Aura</a><br/>
<a href="/">Tetrix</a><br/>
<a href="/">Wellorg</a>
</td>
<td width="33%" class="wnav">
<a href="/">Именные предметы</a><br/>
<a href="/">Элементы мебели</a><br/>
<a href="/">Индексы</a>
</td>
</tr>
</table>

<!-- Promozona -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="bnav">
<tr>
<td>
<div class="fleft"><img src="images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="intbnav">
<tr>
<td width="20%"><b>а знаете ли Вы, что:</b><br/> что такое концепция <a href="/">эффективного офиса</a>?</td>
<td width="50%"><b>новости:</b><br/>
новость общая<br/>
новость общая<br/>
новость общая<br/>
новость общая
</td>
<td width="30%" class="last"><img src="images/cont/loly.gif" width="171" height="63" border="0"/></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<div class="fleft"><img src="images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>
</table>

</xsl:template>
</xsl:stylesheet>
