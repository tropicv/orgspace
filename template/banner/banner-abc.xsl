<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../util/util.xsl"/>

<xsl:template match="banner_abc"> 


<h1>Банеры</h1>

<ul>
<xsl:for-each select='list/banner_db'>
  <p>
    <b><xsl:value-of select="@alt"/></b>
    <br/>
    Опубликован - <xsl:value-of select="@is_public"/>
    <br/>

    <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('banner_',concat(@id,'_1'))"/>
          <xsl:with-param name="type" select="image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='@alt'/>
    </xsl:call-template><br/>

    <xsl:if test="$admin=1">
     [<a href="banner-edit?obj={@id}">Редактировать</a>]<br/>
     [<a href="banner-del?obj={@id}">Удалить</a>]<br/>
    </xsl:if>

  </p>
</xsl:for-each>

<xsl:if test="$admin=1">
  [<a href="banner-add">Добавить банер</a>]
  <br/>
</xsl:if>

</ul>

</xsl:template>


</xsl:stylesheet>

