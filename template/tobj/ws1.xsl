<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="edit_visual">
<xsl:param name="data"/>
<xsl:param name="pname"/>

<script type="text/javascript" src="/scp/redactor/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/scp/redactor/redactor.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/scp/redactor/redactor.css"/>
<script type="text/javascript">
$(function()
{
    $('#redactor').redactor({
            focus: true
    });
});
</script>
			 
<div id="toolbar"></div>
			 
<textarea id="redactor" cols="70" rows="20" name="{$pname}">
  <xsl:value-of select='$data'/>
</textarea>


</xsl:template>


<xsl:template name="edit_visual_end">
<xsl:param name="data"/>
<xsl:param name="pname"/>


</xsl:template>

<xsl:template name="visual_menu">

</xsl:template>

</xsl:stylesheet>
