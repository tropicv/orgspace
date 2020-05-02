<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="select_dict">
<xsl:param name="name"/>
<xsl:param name="list"/>


<select name="{$name}">
<xsl:for-each select="$list">
 <option value="{@value}">
   <xsl:if test="@is_current='1'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
   <xsl:value-of select="."/>
 </option>
</xsl:for-each>
</select>
  
</xsl:template>


<xsl:template name="chkselect_dict">
<xsl:param name="name"/>
<xsl:param name="data"/>

     <input type="hidden" name="{$name}" value=""/>
 
     <xsl:for-each select="$data/word">
       <xsl:variable name="vl" select="@value"/>

       <input type="checkbox" name="{$name}.c{@value}">
         <xsl:if test="$data/values/word[@value=$vl]">
             <xsl:attribute name="checked">checked</xsl:attribute>
         </xsl:if>
       </input>
       <xsl:value-of select="."/><br/>

     </xsl:for-each>

</xsl:template>

</xsl:stylesheet>
