<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="formstorage_flist"> 

<h2>Запросы пользователей</h2>


<xsl:choose>
 <xsl:when test="@last_state=0"> 
  <form method="POST" action="formstorage-flist?state=1" enctype="multipart/form-data">
    <table>
      <tr>
        <td>C:</td>
        <td><input type="text" name="from" value="{./formstorage_db/@postdate}"/></td>
      </tr>
      <tr>
        <td>По:</td>
        <td><input type="text" name="to" value="{./formstorage_db/@postdate}"/></td>
      </tr>
      <tr>
        <td><br/></td>
        <td><input type="submit" value="Показать"/></td>
      </tr>
    </table>
  </form>
 </xsl:when> 
 <xsl:when test="@last_state=1"> 

  <form method="POST" action="formstorage-flist?state=1" enctype="multipart/form-data">
    <table>
      <tr>
        <td>C:</td>
        <td><input type="text" name="from" value="{./param/@from}"/></td>
      </tr>
      <tr>
        <td>По:</td>
        <td><input type="text" name="to" value="{./param/@to}"/></td>
      </tr>
      <tr>
        <td><br/></td>
        <td><input type="submit" value="Показать"/></td>
      </tr>
    </table>
  </form><br/>

  <table cellpadding="2" cellspacing="1" class="rep">
  <tr><td>Форма</td><td>Дата</td><td>Содержание</td></tr>
  <xsl:for-each select="list/formstorage_db">
    <tr>
       <td><xsl:value-of select="@form"/></td>
       <td><xsl:value-of select="@postdate"/></td>
       <td><xsl:value-of select="@body" disable-output-escaping="yes"/></td>
    </tr>
  </xsl:for-each>
  </table>
 </xsl:when>
</xsl:choose>

</xsl:template>
</xsl:stylesheet>
