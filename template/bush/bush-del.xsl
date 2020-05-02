<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../bush/bushdlg.xsl"/>

<xsl:template match="bush_del"> 

<h2>Редактор Структуры</h2>

 <form method="POST" action="bush-del?state=1&amp;obj={bush_db/@id}" enctype="multipart/form-data">
  Delete:
  <input type="submit" value="Ok"/>
  <input type="button" onclick="back()" value="Cancel"/>

 </form>

</xsl:template>
</xsl:stylesheet>
