<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../gtype/gtypeblock.xsl"/>


<xsl:template match="gtype_order"> 
<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="goodsl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('prod')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
[<a href="gtype-edit?obj={gtype_db/@id}">Редактировать тип</a>]
[<a href="gtype-add">Добавить тип</a>]
<xsl:choose>
<xsl:when test="predmet_db/child::*">
[<a href="container-managewrapper?i=gtype&amp;m=view&amp;obj={gtype_db/@id}&amp;predmet={predmet_db/@id}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:when>
<xsl:otherwise>
[<a href="container-managewrapper?i=gtype&amp;m=view&amp;obj={gtype_db/@id}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
</xsl:otherwise>
</xsl:choose>
</xsl:if>


<xsl:if test="$print!=1">
<xsl:call-template name="predmetmenu">
 <xsl:with-param name="predmet" select="predmet_db/@walias"/>
 <xsl:with-param name="list" select="list_all_predmet"/>
 <xsl:with-param name="type" select="string('cont')"/>
</xsl:call-template>
</xsl:if>
</xsl:template>


<xsl:template match="gtype_order" mode="title"> 
	<a class="white" href="gtype-view?walias={gtype_db/@walias}"><xsl:value-of select="gtypeorder_db/@title"/></a>
</xsl:template>


<xsl:template match="gtype_order" mode="path"> 
	<xsl:variable name="gtype" select="gtype_db"/>

	<div class="path">
		<xsl:call-template name="gtypepath"/>
		<a href="gtype-view?walias={$gtype/@walias}"><xsl:value-of select="$gtype/@name"/></a> : Узнать больше
		<!--<a href="gtype-examle?walias={$gtype/@walias}&amp;obj={gtypeitem_db/@obj}"><xsl:value-of select="gtypeitem_db/@name"/></a> : Заказать кресло-->
	</div>
</xsl:template>


<xsl:template match="gtype_order" mode="left_start"> 
</xsl:template>


<xsl:template match="gtype_order" mode="left_end"> 
</xsl:template>


<xsl:template match="gtype_order" mode="content_title"> 
 <xsl:value-of select="gtypeorder_db/@title"/>
</xsl:template>


<xsl:template match="gtype_order" mode="content_start"> 
</xsl:template>


<!-- TEST CHAIRS -->
<xsl:template match="gtype_order" mode="content_end"> 
	<xsl:if test="not($wrapper/container_db/element_db[@layer=2])">
		<h1><xsl:value-of select="gtypeorder_db/@title"/></h1>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="@last_state=0 or @last_state=1"> 
			<xsl:if test="error"> 
				<b><xsl:value-of select="$lc/feedback/err"/></b>
			</xsl:if> 
			<br/>
			<p>* <xsl:value-of select="$lc/feedback/req"/></p>
			<form name="ordcat" id="ordcat" method="POST" action="gtype-order?state=1" enctype="multipart/form-data">
				<xsl:variable name="c" select="gtypeorder_db"/>
				<table class="feedback" border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td colspan="2"><input type="hidden" name="walias" size="45" value="{gtypeitem_db/@name}"/></td>
					</tr>
					<tr>
						<td colspan="2">* <xsl:value-of select="$lc/feedback/name"/></td>
					</tr>
					<tr>
						<td class="input"><input type="text" name="name" size="45" value="{$c/@name}"/></td>
						<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2">* <xsl:value-of select="$lc/feedback/tel"/></td>
					</tr>
					<tr>
						<td class="input"><input type="text" name="tel" size="45" value="{$c/@tel}"/></td>
						<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2">* E-mail</td>
					</tr>
					<tr>
						<td class="input"><input type="text" name="mail" size="45" value="{$c/@mail}"/></td>
						<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2">Комментарий</td>
					</tr>
					<tr>
						<td class="input"><textarea type="text" name="coment" size="45" value="{$c/@coment}"/></td>
						<td class="inputr"><img src="/images/dot.gif" width="5" height="15" border="0"/><br/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
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
						<td colspan="2"><img src="/images/dot.gif" width="1" height="10" border="0"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<xsl:call-template name="form_button">
								<xsl:with-param name="name_form">gtype</xsl:with-param>
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
</xsl:template>


<xsl:template match="gtype_order" mode="right_start"> 
	<xsl:variable name="gtype" select="gtype_db"/>
	<xsl:variable name="gtypeitem" select="gtypeitem_db"/>

	<xsl:for-each select="list_all_goods/list_one[@block!=1]">
		<tr>
		<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot14" id="dot14"/><br/></td>
		<td class="wtext">
			<div class="rmenu" name="orgmenu14head" id="orgmenu14head">
				<xsl:choose>
					<xsl:when test="$gtypeitem/@id=@id"><xsl:value-of select="@name"/></xsl:when>
					<xsl:otherwise><a href="gtype-example?walias={$gtype/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a></xsl:otherwise>
				</xsl:choose>
			</div>
		</td>
		</tr>
	</xsl:for-each>
	<tr>
		<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0"/><br/></td>
	</tr>
	<tr>
		<td><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>
		<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="container-view?walias=gtype"><xsl:value-of select="$lc/gtype/other"/></a></div></td>
	</tr>
	<tr>
		<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
	</tr>
</xsl:template>


<xsl:template match="gtype_order" mode="right_end">
</xsl:template>


<xsl:template match="gtype_order" mode="under_start"> 
</xsl:template>


<xsl:template match="gtype_order" mode="under_end"> 
</xsl:template>

</xsl:stylesheet>

