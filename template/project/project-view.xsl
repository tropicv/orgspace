<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../layout/main.xsl"/> 
<xsl:include href="../layout/level4/level4.xsl"/> 
<xsl:include href="../layout/level4/dkhowl4.xsl"/> 
<xsl:include href="../project/projectblock.xsl"/>


<xsl:template match="project_view"> 

<xsl:choose>
 <xsl:when test="$wrapper/container_db">
   <xsl:apply-templates select="$wrapper"/>
 </xsl:when>
 <xsl:otherwise>
   <xsl:call-template name="dkhowl4">
     <xsl:with-param name="page" select="container_db"/>
     <xsl:with-param name="class" select="string('khow')"/>
   </xsl:call-template>
 </xsl:otherwise>
</xsl:choose>


<xsl:if test="$admin=1">
[<a href="project-edit?obj={project_db/@id}">Редактировать проект</a>]
[<a href="container-managewrapper?i=project&amp;m=view&amp;walias={project_db/@walias}&amp;creator=container.view.dkhowl4" target="blank">Редактировать шаблон</a>]

[<a href="album-add?obj={project_db/@id}&amp;type=project">Добавить отзыв</a>]<br/><br/>
</xsl:if>


</xsl:template>

<xsl:template match="project_view" mode="title"> 
<a href="project-all" class="white"><xsl:value-of select="$lc/project/example"/></a>
</xsl:template>

<xsl:template match="project_view" mode="path"> 

<div class="path">
<xsl:call-template name="projectpath"/>
<a href="project-all"> <xsl:value-of select="$lc/project/example"/></a> : 
<xsl:value-of select="project_db/@name"/>
</div>

</xsl:template>

<xsl:template match="project_view" mode="left_start"> 
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('project_',concat(project_db/@id,'_2'))"/>
          <xsl:with-param name="type" select="project_db/thumb"/>
          <xsl:with-param name="max" select='string("204")'/>
          <xsl:with-param name="alt" select='project_db/@name'/>
   </xsl:call-template>
</xsl:template>

<xsl:template match="project_view" mode="left_end"> 
</xsl:template>

<xsl:template match="project_view" mode="content_title"> 
 <xsl:value-of select="project_db/@name"/>
</xsl:template>

<xsl:template match="project_view" mode="content_start"> 
</xsl:template>

<xsl:template match="project_view" mode="content_end"> 
</xsl:template>

<xsl:template match="project_view" mode="right_start"> 

<div class="rmenu"><a href="container-view?obj=643">список клиентов</a></div>
<div class="rmenu"><xsl:value-of select="$lc/project/example"/></div>
<div class="rmenu"><a href="project-reviews"><xsl:value-of select="$lc/project/recomend"/></a></div>

<!--
<xsl:choose>
<xsl:when test="count(list/imagegal_db)>0">
<div class="rmenu"><a href="project-reviews?walias={project_db/@walias}"><xsl:value-of select="$lc/project/review"/></a></div>
</xsl:when>
<xsl:otherwise>
<div class="rmenu"><xsl:value-of select="$lc/project/example"/></div>
</xsl:otherwise>
</xsl:choose>
-->
</xsl:template>

<xsl:template match="project_view" mode="right_end"> 
</xsl:template>

<xsl:template match="project_view" mode="under_start"> 
<xsl:for-each select="list_all/list_one">

<xsl:choose>
<xsl:when test="@walias=../../project_db/@walias">
 <div class="current"><xsl:value-of select="@name"/></div>
</xsl:when>
<xsl:otherwise>
<div><a href="project-view?walias={@walias}"><xsl:value-of select="@name"/></a></div>
</xsl:otherwise>
</xsl:choose>

</xsl:for-each>
</xsl:template>

<xsl:template match="project_view" mode="under_end"> 
</xsl:template>

</xsl:stylesheet>
