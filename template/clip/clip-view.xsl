<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="clipview">
<xsl:param name="clip"/>


<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="{$clip/@w}" height="{$clip/@h}" id="main_libs" align="left">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="{$res_path}/{$clip/flash/name}?rand=1&amp;XMLstr=%2Fclip-entry%3Fwalias={$clip/@walias}" />
<param name="quality" value="high" />
<param name="bgcolor" value="#ffffff" />
<param name="WMode" value="opaque"/>
<embed wmode="opaque" src="{$res_path}/{$clip/flash/name}?rand=1&amp;XMLstr=%2Fclip-entry%3Fwalias={$clip/@walias}" quality="high" bgcolor="#ffffff" width="{$clip/@w}" height="{$clip/@h}" name="main_libs" align="left" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="//www.macromedia.com/go/getflashplayer" />


</object>


</xsl:template>


<xsl:template match="clip_view"> 

 <xsl:call-template name="clipview">
	<xsl:with-param name="clip" select="clip_db"/>
 </xsl:call-template>

</xsl:template>


<xsl:template name="stdclipview">
<xsl:param name="name"/>
<xsl:param name="w"/>
<xsl:param name="h"/>

<!--
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="{$w}" height="{$h}" id="main_libs" align="left">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="{$res_path}/{$name}" />
<param name="quality" value="high" />
<param name="bgcolor" value="#ffffff" />
<param name="WMode" value="opaque"/>
<embed wmode="opaque" src="{$res_path}/{$name}" quality="high" bgcolor="#ffffff" width="{$w}" height="{$h}" name="main_libs" align="left" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="//www.macromedia.com/go/getflashplayer" />
</object>
-->

<script language="javascript">
embedFlash('<xsl:value-of select="$res_path"/>/<xsl:value-of select="$name"/>','<xsl:value-of select="$h"/>','<xsl:value-of select="$w"/>');
</script>



</xsl:template>

</xsl:stylesheet>

