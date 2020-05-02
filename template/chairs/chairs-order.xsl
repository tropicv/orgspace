<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/goodsl4.xsl"/> 
<xsl:include href="../chairs/chairsblock.xsl"/>


<xsl:template match="chairs_order"> 
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

	<xsl:call-template name="chairsmenu">
		<xsl:with-param name="chairs" select="chairs_db/@walias"/>
		<xsl:with-param name="list" select="list_all"/>
		<xsl:with-param name="type" select="string('cont')"/>
	</xsl:call-template>

	<xsl:if test="$admin=1">
		[<a href="container-managewrapper?i=chairs&amp;m=order&amp;state={@last_state}&amp;creator=container.view.goodsl4" target="blank">Редактировать шаблон</a>]
	</xsl:if>
</xsl:template>


<xsl:template match="chairs_order" mode="title"> 
	<a class="white" href="chairs-view?walias={chairs_db/@walias}"><xsl:value-of select="chairsorder_db/@title"/></a>
</xsl:template>


<xsl:template match="chairs_order" mode="path"> 
	<xsl:variable name="chairs" select="chairs_db"/>

	<div class="path">
		<xsl:call-template name="chairspath"/>
		<a href="chairs-view?walias={$chairs/@walias}"><xsl:value-of select="$chairs/@name"/></a> :
		<xsl:value-of select="chairsitem_db/@name"/>
	</div>
</xsl:template>


<xsl:template match="chairs_order" mode="left_start"> 
</xsl:template>


<xsl:template match="chairs_order" mode="left_end"> 
</xsl:template>


<xsl:template match="chairs_order" mode="content_title"> 
 <xsl:value-of select="chairsorder_db/@title"/>
</xsl:template>


<xsl:template match="chairs_order" mode="content_start"> 
</xsl:template>


<!-- TEST CHAIRS -->
<xsl:template match="chairs_order" mode="content_end"> 
	<xsl:if test="not($wrapper/container_db/element_db[@layer=2])">
		<h1><xsl:value-of select="$lc/chairsorder_db/@title"/></h1>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="@last_state=0 or @last_state=1"> 
			<xsl:if test="error"> 
				<b><xsl:value-of select="$lc/feedback/err"/></b>
			</xsl:if> 
			<br/>
			<p>* <xsl:value-of select="$lc/feedback/req"/></p>
			<form name="ordcat" id="ordcat" method="POST" action="chairs-order?state=1" enctype="multipart/form-data">
				<xsl:variable name="c" select="chairs_db"/>
				<table class="fbuy" border="0" cellspacing="0" cellpadding="0" >
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
						<td colspan="2">* Комментарий</td>
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
								<xsl:with-param name="name_form">chairs</xsl:with-param>
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


<xsl:template match="chairs_order" mode="right_start"> 
	<xsl:variable name="chairs" select="chairs_db"/>
	<xsl:variable name="chairsitem" select="chairsitem_db"/>

	<xsl:for-each select="list_all_goods/list_one[@block!=1]">
		<tr>
		<td><img src="/images/dot.gif" width="1" height="1" border="0" name="dot14" id="dot14"/><br/></td>
		<td class="wtext">
			<div class="rmenu" name="orgmenu14head" id="orgmenu14head">
				<xsl:choose>
					<xsl:when test="$chairsitem/@id=@id"><xsl:value-of select="@name"/></xsl:when>
					<xsl:otherwise><a href="chairs-example?walias={$chairs/@walias}&amp;obj={@id}"><xsl:value-of select="@name"/></a></xsl:otherwise>
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
		<td class="wtext"><div name="orgmenu11head" id="orgmenu11head"><a onMouseOut="Turn('11',0);" onMouseOver="Turn('11',1);" href="container-view?walias=chairs"><xsl:value-of select="$lc/chairs/other"/></a></div></td>
	</tr>
	<tr>
		<td colspan="2"><img src="/images/dot.gif" width="1" height="4" border="0" name="dot11" id="dot11" hspace="10"/><br/></td>
	</tr>
</xsl:template>


<xsl:template match="chairs_order" mode="right_end">
</xsl:template>


<xsl:template match="chairs_order" mode="under_start"> 
</xsl:template>


<xsl:template match="chairs_order" mode="under_end"> 
</xsl:template>

</xsl:stylesheet>

