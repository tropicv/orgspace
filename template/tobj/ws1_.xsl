<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="edit_visual">
<xsl:param name="data"/>
<xsl:param name="pname"/>

<xsl:if test="$agent = 'MSIE'">

<div class="yToolbar" id="ParaToolbar">
<script language="javascript" src="/images/mifors/ws/edit.js"></script>

<div id="EditMode" class="TBGen">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">


var statMode = false;

function statusMode(mode){
   if (mode != statMode){
	setMode(mode);
	statMode = mode;
   }
}

function copydata(pname){
   document.composeForm[pname].value=GetHtml();
   return true;
}



</SCRIPT>
<font color="#000000" face="Arial" size="2"><a href="javascript:void(0)" onClick="statusMode(true);return false;">�������� ����</a> | 
<a href="javascript:void(1)" onClick="statusMode(false);return false;">�������������� � ��������� ����</a></font>
</div>
</div>

<xsl:call-template name="visual_menu"/>

<!--script type="text/javascript" src="/scp/redactor/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function()
{
    $('#redactor').redactor({
            focus: true,
	    toolbarExternal: '#toolbar'
    });
});
</script>
			 
<div id="toolbar"></div>
			 
<textarea id="redactor" name="content">...</textarea>
-->

<iframe class="Composition" width="100%" id="Composition" height="350" ></iframe> 

</xsl:if>

<xsl:if test="$agent != 'MSIE'">

<tr>
<td class="MIFdlg">�����</td>
<td>
  <textarea cols="70" rows="20" name="{$pname}">
   <xsl:value-of select='$data'/>
<!--
   <xsl:for-each select='$data/p'>
      <xsl:value-of select='.'/><xsl:if test='position()!=last()'><xsl:text disable-output-escaping="yes">&#xd;&#xa;&#xd;&#xa;</xsl:text></xsl:if>
   </xsl:for-each>
-->
  </textarea>
</td>
</tr>

</xsl:if>

</xsl:template>


<xsl:template name="edit_visual_end">
<xsl:param name="data"/>
<xsl:param name="pname"/>

<xsl:if test="$agent = 'MSIE'">

<div style="visibility:hidden;">
  <textarea name="{$pname}" rows="1">
   <xsl:value-of select='$data'/>
<!--     <xsl:for-each select='$data/p'><xsl:value-of select='.' /></xsl:for-each> -->
  </textarea>
</div>

<p> 
  <script>
//        bodyTag='&lt;html>&lt;head>&lt;link rel="stylesheet" type="text/css" href="/script/main.css">&lt;/head>&lt;body>'+document.composeForm['<xsl:value-of select="$pname"/>'].value+'&lt;/body>&lt;/html>';
        bodyTag='&lt;html>&lt;head>&lt;base href="<xsl:value-of select="$base_url"/>">&lt;link rel="stylesheet" type="text/css" href="/scp/main.css">&lt;/head>&lt;body>'+document.composeForm['<xsl:value-of select="$pname"/>'].value+'&lt;/body>&lt;/html>';
	Composition.document.open();
	Composition.document.write(bodyTag);
	Composition.document.close();
	Composition.document.designMode="On";
  </script>
</p>

</xsl:if>


</xsl:template>

<xsl:template name="visual_menu">

<table>
<tr><td>

<table>
<tr>
<td><div class="Btn" language="javascript" onClick="fontL()"><img alt="��������� �����" class="Ico" width="27" height="22" src="/images/mifors/ws/fontup.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="fontS()"><img alt="��������� �����" class="Ico" width="27" height="22" src="/images/mifors/ws/fontdown.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="pre()"><img alt="������������������ �����" class="Ico" width="22" height="22" src="/images/mifors/ws/wpre.gif"/></div></td>
<td><div class="Btn" style="font-size:10pt;">�����:<SELECT id="parastyle" style="position:relative;top:1px;font-size:10px;" onchange="makeStyle(this.value)">
<option value="" selected="true"> </option>
</SELECT>
</div>
<SCRIPT>
constrStyles();
</SCRIPT>
</td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="createTable()"><img alt="������� �������" class="Ico" width="22" height="22" src="/images/mifors/ws/wctable.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="setTable()"><img alt="�������� �������" class="Ico" width="22" height="22" src="/images/mifors/ws/wstable.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="setCell()"><img alt="�������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wcell.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="insertRow()"><img alt="�������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wirow.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="deleteRow()"><img alt="������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wdrow.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="insertColumn()"><img alt="�������� �������" class="Ico" width="22" height="22" src="/images/mifors/ws/wiclm.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="deleteColumn()"><img alt="������� �������" class="Ico" width="22" height="22" src="/images/mifors/ws/wdclm.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="createStyledTable()"><img alt="�������� ������� �� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wsttable.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="showhide()"><img alt="���������� �������" class="Ico" width="22" height="22" src="/images/mifors/ws/showtable.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="MyColor('forecolor')"><img alt="���� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wfgc.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="MyColor('backcolor')"><img alt="���� ����" class="Ico" width="22" height="22" src="/images/mifors/ws/wbgc.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="optimize()"><img alt="��������������" class="Ico" width="22" height="22" src="/images/mifors/ws/optim.gif"/></div></td>
</tr>
</table>

</td>
</tr>
<tr>
<td>

<table>
<tr>
<td><div class="Btn" language="javascript" onClick="formatC('cut')"><img alt="��������" class="Ico" width="22" height="22" src="/images/mifors/ws/cut.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('copy')"><img alt="����������" class="Ico" width="22" height="22" src="/images/mifors/ws/copy.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('paste')"><img alt="��������" class="Ico" width="22" height="22" src="/images/mifors/ws/paste.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="paste()"><img alt="�������� � �������" class="Ico" width="22" height="22" src="/images/mifors/ws/pasteoptim.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="formatC('bold');"><img alt="������" class="Ico" width="22" height="22" src="/images/mifors/ws/bold.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('italic')"><img alt="������" class="Ico" width="22" height="22" src="/images/mifors/ws/italic.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('underline')"><img alt="������������" class="Ico" width="22" height="22" src="/images/mifors/ws/under.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('removeFormat')"><img alt="������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/rformat.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" name="Justify" language="javascript" onClick="formatC('justifyleft')"><img alt="�� ������ ����" class="Ico" width="22" height="22" src="/images/mifors/ws/aleft.gif"/></div></td>
<td><div class="Btn" name="Justify" language="javascript" onClick="formatC('justifycenter')"><img alt="�� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/center.gif"/></div></td>
<td><div class="Btn" name="Justify" language="javascript" onClick="formatC('justifyright')"><img alt="�� ������� ����" class="Ico" width="22" height="22" src="/images/mifors/ws/aright.gif"/></div></td>
<td><div class="Btn" name="Justify" language="javascript" onClick="formatC('justifyfull')"><img alt="�� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/aj.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="formatC('insertorderedlist')"><img alt="������������ ������" class="Ico" width="22" height="22" src="/images/mifors/ws/nlist.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('insertunorderedlist')"><img alt="������������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/blist.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('outdent')"><img alt="��������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/ileft.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('indent')"><img alt="��������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/iright.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="createLink()"><img alt="�����������" class="Ico" width="22" height="22" src="/images/mifors/ws/wlink.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="deleteLink()"><img alt="������ ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wdlink.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="insertSymbol()"><img alt="�������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wsymb.gif"/></div></td>
<td><img src="/images/mifors/dot.gif" border="0" width="5"/></td>
<td><div class="Btn" language="javascript" onClick="formatC('subscript')"><img alt="������ ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wsub.gif"/></div></td>
<td><div class="Btn" language="javascript" onClick="formatC('superscript')"><img alt="������� ������" class="Ico" width="22" height="22" src="/images/mifors/ws/wsup.gif"/></div></td>
</tr>
</table>


</td>
</tr>
</table>

</xsl:template>

</xsl:stylesheet>
