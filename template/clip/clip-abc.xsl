<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="clip_abc"> 


<h1>Клипы</h1>

<xsl:for-each select='list/clip_db'>
  <p>
    <xsl:value-of select="@name"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>

    <xsl:if test="$admin=1">
     [<a href="clip-manage?obj={@id}">Редактировать</a>]
    </xsl:if>

    <xsl:if test="$admin=1">
     [<a href="clip-view?obj={@id}">Тестировать</a>]<br/>
    </xsl:if>

  </p>
</xsl:for-each>

<xsl:if test="$admin=1">
  [<a href="clip-add">Добавить клип</a>]
  <br/>
</xsl:if>


</xsl:template>


</xsl:stylesheet>

