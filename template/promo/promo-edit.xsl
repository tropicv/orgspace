<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../util/util.xsl"/>
<xsl:include href="../util/dict_types.xsl"/> 
<xsl:include href="../tobj/ws1.xsl"/> 


<xsl:template name="promodlg">
<xsl:param name="promo"/>
<xsl:param name="add"/>

<table class="title">

<tr>
 <td class="title">Название (alt)</td>
 <td><input size="50" type="text" name="alt" value="{$promo/@alt}"/></td>
</tr>


<tr>
<td class="MIFdlg">Тип</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('type')"/>
        <xsl:with-param name="list" select="$promo/type/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Положение</td>
<td>
      <xsl:call-template name="select_dict">
        <xsl:with-param name="name" select="string('aligment')"/>
        <xsl:with-param name="list" select="$promo/aligment/word"/>
      </xsl:call-template>
</td>
</tr>

<tr>
<td class="title">Размер промо области: </td>
<td> по X <input type="text" size="3" name="sizex" value="{$promo/@sizex}"/>  по Y <input type="text" name="sizey" size="3" value="{$promo/@sizey}"/> </td>
</tr>

<tr>
<td class="title">Банер</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('promo_',concat($promo/@id,'_1'))"/>
          <xsl:with-param name="type" select="$promo/image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
 <input type="file" name="image"/>
</td>
</tr>

<tr>
 <td class="title">Ссылка при клике (href)</td>
 <td><input size="50" type="text" name="link" value="{$promo/@link}"/></td>
</tr>

<tr>
<td class="title">Флеш ролик</td>
<td>
  <xsl:if test='$add=0'>
   <xsl:call-template name="res_file_stuff">
          <xsl:with-param name="id" select="concat('promo_',concat($promo/@id,'_2'))"/>
          <xsl:with-param name="type" select="$promo/flash"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='string("")'/>
   </xsl:call-template><br/>
  </xsl:if>
 <input type="file" name="flash"/>
</td>
</tr>

<tr>
<td class="title">Текст</td>
<td>
<xsl:call-template name="edit_visual">
       <xsl:with-param name="data" select="$promo/@textbody"/>
       <xsl:with-param name="pname" select="string('textbody')"/>
</xsl:call-template>
</td>
</tr>

<tr>
<td class="MIFdlg">Публиковать</td>
<td>
  <input type="checkbox" name="is_public">
  <xsl:if test='$promo/@is_public=1'>
        <xsl:attribute name="checked">checked</xsl:attribute>
  </xsl:if>
  </input>
</td>
</tr>

<tr>
<td class="title"><br/></td>
<td><input type="submit" value="Сохранить"/></td>
</tr>

<xsl:call-template name="edit_visual_end">
       <xsl:with-param name="data" select="$promo/@textbody"/>
       <xsl:with-param name="pname" select="string('textbody')"/>
</xsl:call-template>

</table>

</xsl:template>

<xsl:template match="promo_edit"> 

<h2>Редактирование промоблока</h2>

 <form name="composeForm" id="composeForm" onsubmit="return copydata('textbody');" method="POST" action="promo-edit?state=1&amp;obj={promo_db/@id}" enctype="multipart/form-data">

  <xsl:call-template name="promodlg">
   <xsl:with-param name="promo" select="promo_db"/>
   <xsl:with-param name="add" select="number('0')"/>
  </xsl:call-template>

 </form>

</xsl:template>

</xsl:stylesheet>
