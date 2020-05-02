<?xml version="1.0" encoding="WINDOWS-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="WINDOWS-1251"/>
<xsl:template match="/TABLE">
<table border="0" cellpadding="0" cellspacing="0" class="commons" width="80%">
<tbody>
<xsl:for-each select="TBODY/TR">
	<xsl:choose>
	<xsl:when test="position()=1">
		<tr>
		<xsl:for-each select="TD">
			<td>
			<xsl:choose>
			<xsl:when test="position()=1">
				<xsl:attribute name="align">right</xsl:attribute>
				<xsl:attribute name="class">headerfirst</xsl:attribute>
			</xsl:when>
			<xsl:when test="position()=last()">
				<xsl:attribute name="align">right</xsl:attribute>
				<xsl:attribute name="class">header</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="align">left</xsl:attribute>
				<xsl:attribute name="class">header</xsl:attribute>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="child::*|text()">
				<xsl:copy-of select="."/>
			</xsl:for-each>
			</td>
		</xsl:for-each>
		</tr>
		<tr>
		<xsl:for-each select="TD">
		<xsl:choose>
		<xsl:when test="position()=1">
		<td class="topLinefirst" align="right"><img src="/images/mifors/dot.gif" width="1" height="4"/></td>
		</xsl:when>
		<xsl:when test="position()=last()">
		<td class="topLine" align="right"><img src="/images/mifors/dot.gif" width="1" height="4"/></td>
		</xsl:when>
		<xsl:otherwise>
		<td class="topLine" align="left"><img src="/images/mifors/dot.gif"  width="1" height="4"/></td>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:for-each>
		</tr>
	</xsl:when>
	<xsl:when test="position()=last()">
		<tr>
		<xsl:for-each select="TD">
			<td>
			<xsl:choose>
			<xsl:when test="position()=1 or position()=last()">
				<xsl:attribute name="align">right</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="align">left</xsl:attribute>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:copy-of select="child::*|text()"/>
			</td>
		</xsl:for-each>
		</tr>
		<tr>
		<xsl:for-each select="TD">
			<xsl:choose>
			<xsl:when test="position()=1 or position()=last()">
				<td class="bottomLinefirst" width="30" height="1">
					<img src="/images/mifors/dot.gif"  width="30" height="1"/>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td class="bottomLinefirst" height="1">
					<img src="/images/mifors/dot.gif" height="1"/>
				</td>
			</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</tr>
		<tr>
		<xsl:for-each select="TD">
			<td height="14"><img src="/images/mifors/dot.gif" width="1" height="14"/></td>
		</xsl:for-each>
		</tr>
		<tr>
		<xsl:for-each select="TD">
			<xsl:choose>
			<xsl:when test="position()=1">
				<td class="bottomLinefirst" height="25">
					<img src="/images/mifors/dot.gif"  width="1" height="25"/>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td class="bottomLine" height="25">
					<div><spacer type="block" width="1" height="25"></spacer></div>
				</td>
			</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</tr>
	</xsl:when>
	<xsl:otherwise>
		<tr>
		<xsl:for-each select="TD">
			<td>
			<xsl:choose>
			<xsl:when test="position()=1 or position()=last()">
				<xsl:attribute name="align">right</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="align">left</xsl:attribute>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:copy-of select="child::*|text()"/>
			</td>
		</xsl:for-each>
		</tr>
	</xsl:otherwise>
	</xsl:choose>
</xsl:for-each>
</tbody>
</table>
</xsl:template>
</xsl:stylesheet>