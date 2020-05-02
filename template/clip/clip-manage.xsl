<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../util/util.xsl"/>
<xsl:include href="../util/dict_types.xsl"/> 

<xsl:template match="clip_manage"> 


<h1>Клип - <xsl:value-of select="clip_db/@name"/></h1>

<xsl:for-each select='clip_db/story_db'>
  <p>
    <xsl:value-of select="@name"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <xsl:value-of select="@rotation"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
    <a href="@url"><xsl:value-of select="@url"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></a>

    <xsl:if test="count(storypart_db) &gt; 0" >
      <ul>
      <xsl:for-each select='storypart_db'>
        <xsl:choose>
        <xsl:when test="@type=1">
          <h2><xsl:value-of select="@slogan1"/></h2>
          <h2><xsl:value-of select="@slogan2"/></h2>
        </xsl:when>
        <xsl:when test="@type=2">
          <xsl:if test='foto/extension'>
           <xsl:call-template name="res_image_stuff">
                  <xsl:with-param name="id" select="concat('storypart_',concat(@id,'_1'))"/>
                  <xsl:with-param name="type" select="foto"/>
                  <xsl:with-param name="max" select='string("300")'/>
                  <xsl:with-param name="alt" select='string("")'/>
           </xsl:call-template><br/>
          </xsl:if>
        </xsl:when>
        </xsl:choose>
    
        [<a href="clip-partedit?obj={@id}">Редактировать</a>]
        [<a href="clip-partdel?obj={@id}">Удалить</a>]<br/>         
        <hr size="1"/> 

      </xsl:for-each>
      </ul>
    </xsl:if>

    [<a href="clip-storyedit?obj={@id}">Редактировать</a>]<br/>
    [<a href="clip-storydel?obj={@id}">Удалить</a>]<br/>
    [<a href="clip-partadd?story_id={@id}">Добавить часть</a>]

  </p>
</xsl:for-each>

[<a href="clip-storyadd?clip_id={clip_db/@id}">Добавить историю</a>]<br/>
[<a href="clip-edit?obj={clip_db/@id}">Редактировать клип</a>]<br/>
[<a href="clip-view?obj={clip_db/@id}">Просмотреть клип</a>]


</xsl:template>


</xsl:stylesheet>

