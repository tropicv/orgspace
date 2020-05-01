<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../project/projectdlg.xsl"/>

<xsl:template match="project_edit"> 

<h2>Редактор проекта</h2>

 <form name="composeForm" id="composeForm" onsubmit="return copydata('description');" method="POST" action="project-edit?state=1&amp;obj={project_db/@id}" enctype="multipart/form-data">

	<xsl:call-template name="projectdlg">
	<xsl:with-param name="project" select="project_db"/>
	</xsl:call-template>

 </form>

</xsl:template>
</xsl:stylesheet>
