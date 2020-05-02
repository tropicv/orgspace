<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="usr_denied"> 

  <br/>
  <br/>
  <br/>

  <h1>Недостаточно прав для просмотра этой страницы</h1>

  <form method="POST" action="usr-login?state=1" enctype="multipart/form-data">

  <table border="0">

  <tr>
      <td valign="middle" align="right"><font color="#393966" class="MIFtext"><br/>Имя<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]><![CDATA[&nbsp;]]></xsl:text></font></td>
      <td><input type="text" size="10" name="nick" value=""/></td>
  </tr>

  <tr>
      <td valign="middle" align="right"><font color="#393966" class="MIFtext">Пароль<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]><![CDATA[&nbsp;]]></xsl:text></font></td>
      <td><input type="password" size="10" name="passwd" value=""/></td>
  </tr>

  <tr>
      <td valign="middle" align="right"></td>
      <td><input type="submit" size="10" value="Войти"/></td>
  </tr>

  </table>

  </form>


</xsl:template>


</xsl:stylesheet>
