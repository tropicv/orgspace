<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="block_add_dialog">
<xsl:param name="block"/>

<!--

<table style="font-size: 60%" cellpadding="4">
<tr>
<xsl:for-each select="$block/category">
<td valign="top">
 <b><xsl:value-of select="@title"/></b><br/>
 <xsl:for-each select="block">
  .<xsl:value-of select="@title"/><br/>
  <xsl:for-each select="template">
    <a href="container-elementadd?creator={../@class}.{../@method}.{@name}&amp;container={$block/../@obj}"><xsl:value-of select="@title"/></a><br/>     
  </xsl:for-each>
 </xsl:for-each>

</td>
</xsl:for-each>
</tr>
</table>

-->


<div style="font-size: 60%"> Добавить:

<xsl:for-each select="$block/category">
 <xsl:for-each select="block">
  <xsl:for-each select="template">
   <a href="container-elementadd?creator={../@class}.{../@method}.{@name}&amp;container={$block/../@obj}"><xsl:value-of select="@title"/></a> | 
  </xsl:for-each>
 </xsl:for-each>
</xsl:for-each>
</div>


</xsl:template>

<xsl:template name="block_edit">
<xsl:param name="block"/>

     <table border="1">
       <tr>
        <td>
	  <a href="container-elementedit?obj={$block/@id}"><img src="/images/mifors/block_edit.gif" width="16" height="15" border="0" hspace="2" alt="изменить вид '{$block/@name}'" title="изменить вид '{$block/@name}'"/></a>
	  <a href="container-elementchange?obj={$block/@id}"><img src="/images/mifors/block_edit.gif" width="16" height="15" border="0" hspace="2" alt="редактировать блок '{$block/@name}'" title="редактировать блок '{$block/@name}'"/></a>
	  <a href="container-elementdel?obj={$block/@id}"><img src="/images/mifors/block_del.gif" width="16" height="15" border="0" alt="удалить блок" title="удалить блок" hspace="8"/></a>

	</td>
       </tr>
       <tr>
        <td>
	 <xsl:apply-templates select="$block"/> 
	</td>
       </tr>
     </table> 

</xsl:template>

<xsl:template name="block_view">
<xsl:param name="block"/>

  <xsl:apply-templates select="$block"/> 

</xsl:template>

<xsl:template name="container_select">
<xsl:param name="block"/>
<xsl:param name="cur"/>

<select name="container_id">
<xsl:for-each select="$block">

 <option value="{@id}">
  <xsl:if test="$cur=@id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
  <xsl:value-of select="@title"/>
 </option>

</xsl:for-each>
</select>

</xsl:template>


<xsl:template name="open_layer_menu">
<xsl:param name="layer"/>
</xsl:template>

<xsl:template name="close_layer_menu">
</xsl:template>



<xsl:template name="process_layer">
<xsl:param name="element"/>
<xsl:param name="layer"/>
<xsl:param name="mode"/>

<xsl:for-each select="$element">
<xsl:if test='@layer=$layer'>

 <xsl:if test="$mode='EDIT'">
  <xsl:call-template name="open_layer_menu">
   <xsl:with-param name="layer" select="$layer"/>
  </xsl:call-template>
 </xsl:if>

 <xsl:choose>
  <xsl:when test="$mode='EDIT'">
   <xsl:call-template name="block_edit">
    <xsl:with-param name="block" select="."/>
   </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
   <xsl:call-template name="block_view">
    <xsl:with-param name="block" select="."/>
   </xsl:call-template>
  </xsl:otherwise>
 </xsl:choose>

 <xsl:if test="$mode='EDIT'">
  <xsl:call-template name="close_layer_menu"/>
 </xsl:if>

</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="bottom_promo">
<!-- Promozona -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="bnav">
<tr>
<td>
<div class="fleft"><img src="images/c-tl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></div>
</td>
</tr>

<tr>
<td>
<table border="0" cellspacing="0" cellpadding="0" width="99%" class="intbnav">
<tr>

<xsl:variable name="promo" select="/*/promo"/>

<td width="20%"><b><xsl:value-of select="$lc/you_know"/></b><br/> 
<xsl:value-of select="$promo/container_glossary/container_db/@glossary_text1" disable-output-escaping="yes"/> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<a href="container-view?obj={$promo/container_glossary/container_db/@id}"><xsl:value-of select="$promo/container_glossary/container_db/@glossary_text2"/> </a>
</td>

<td width="50%"><a href="/news-abc?obj=1"><b><xsl:value-of select="$lc/news"/>:</b></a><br/>

<table class="newslist">
<xsl:for-each select="$promo/news_last/list/news_db">
<xsl:if test="position() &lt; 6">
<tr><td><xsl:value-of select="@event_date"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></td><td><a href="news-view?obj={@id}"><xsl:value-of select="@topic" disable-output-escaping="yes"/></a></td></tr>
</xsl:if>
</xsl:for-each>
</table>

</td>
<td width="30%" class="last">

  <a href="{$promo/banner_get/banner_db/@link}">
   <xsl:call-template name="res_image_stuff">
          <xsl:with-param name="id" select="concat('banner_',concat($promo/banner_get/banner_db/@id,'_1'))"/>
          <xsl:with-param name="type" select="$promo/banner_get/banner_db/image"/>
          <xsl:with-param name="max" select='string("300")'/>
          <xsl:with-param name="alt" select='$promo/banner_get/banner_db/@alt'/>
   </xsl:call-template><br/>
  </a>

</td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<img src="images/dot.gif" width="760" height="1" border="0"/><br/>
<div class="fleft"><img src="images/c-bl.gif" width="6" height="6" border="0"/></div>
<div align="right"><img src="images/c-br.gif" width="6" height="6" border="0"/></div>
</td>
</tr>
</table>
</xsl:template>

<xsl:template name="page_path">
<xsl:param name="path"/>

<div class="path">
<xsl:choose>
<xsl:when test="$path/element_db[@layer=111]/child::*">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$path/element_db"/>
     <xsl:with-param name="layer">111</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
</xsl:otherwise>
</xsl:choose>

<!--
<a href="/">Orgspace</a> 
<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
<xsl:value-of select="$path/container_db/@title"/>
-->
</div>

</xsl:template>

<xsl:template name="page_path_simple">
<xsl:param name="path"/>

<xsl:if test="$path/element_db[@layer=111]/child::*">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$path/element_db"/>
     <xsl:with-param name="layer">111</xsl:with-param>
     <xsl:with-param name="mode" select="string('view')"/>
    </xsl:call-template>
</xsl:if>

</xsl:template>

<xsl:template name="page_path_edit">
<xsl:param name="path"/>

<div class="path">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$path/element_db"/>
     <xsl:with-param name="layer">111</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
</div>

</xsl:template>

<xsl:template name="page_workplace">
<xsl:param name="page"/>

 <table border="1" cellspacing="0" cellpadding="0">
  <tr>
   <td colspan="2" bgcolor="#f0f0f0" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="$page/element_db"/>
     <xsl:with-param name="layer">0</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
  </tr>  
 </table>     
</xsl:template>

<xsl:template name="tabrow_edit">
<xsl:param name="page"/>

  <table border="1" >
 
  <tr>
   <td colspan="2">
Layer 30<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">30</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 31<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">31</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 32<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">32</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 33<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">33</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 34<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">34</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 35<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">35</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 36<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">36</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 37<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">37</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 38<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">38</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 39<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">39</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 40<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">40</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 41<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">41</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 42<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">42</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 43<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">43</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 44<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">44</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 45<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">45</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 46<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">46</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 47<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">47</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 48<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">48</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 49<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">49</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 50<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">50</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 51<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">51</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 52<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">52</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 53<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">53</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 54<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">54</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 55<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">55</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 56<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">56</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 57<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">57</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 58<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">58</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 59<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">59</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 60<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">60</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 61<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">61</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 62<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">62</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>


  <tr>
   <td colspan="2">
Layer 63<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">63</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 64<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">64</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 65<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">65</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 66<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">66</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 67<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">67</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 68<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">68</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 69<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">69</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 70<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">70</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 71<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">71</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 72<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">72</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 73<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">73</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 74<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">74</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>

  <tr>
   <td colspan="2">
Layer 75<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">75</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td>
Layer 76<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">76</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
   <td>
Layer 77<br/>
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">77</xsl:with-param>
       <xsl:with-param name="mode" select="string('EDIT')"/>
     </xsl:call-template>
   </td>
  </tr>


  </table>


</xsl:template>

<xsl:template name="tabrow_view">
<xsl:param name="page"/>

  <table border="0" cellspacing="0" cellpadding="4">
 
  <xsl:if test="$page/element_db[@layer=30]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">30</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=31]/child::* or $page/element_db[@layer=32]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">31</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text" width="100%">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">32</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=33]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">33</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=34]/child::* or $page/element_db[@layer=35]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">34</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">35</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=36]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">36</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=37]/child::* or $page/element_db[@layer=38]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">37</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">38</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=39]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">39</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=40]/child::* or $page/element_db[@layer=41]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">40</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">41</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=42]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">42</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=43]/child::* or $page/element_db[@layer=44]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">43</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">44</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>


  <xsl:if test="$page/element_db[@layer=45]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">45</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=46]/child::* or $page/element_db[@layer=47]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">46</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">47</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=48]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">48</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=49]/child::* or $page/element_db[@layer=50]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">49</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">50</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=51]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">51</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=52]/child::* or $page/element_db[@layer=53]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">52</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">53</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=54]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">54</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=55]/child::* or $page/element_db[@layer=56]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">55</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">56</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=57]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">57</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  <xsl:if test="$page/element_db[@layer=58]/child::* or $page/element_db[@layer=59]/child::*">
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">58</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">59</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>
  
  <xsl:if test="$page/element_db[@layer=60]/child::* or $page/element_db[@layer=61] or $page/element_db[@layer=62]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">60</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">61</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">62</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=63]/child::* or $page/element_db[@layer=64] or $page/element_db[@layer=65]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">63</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">64</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">65</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=66]/child::* or $page/element_db[@layer=67] or $page/element_db[@layer=68]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">66</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">67</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">68</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=69]/child::* or $page/element_db[@layer=70] or $page/element_db[@layer=71]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">69</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">70</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">71</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=72]/child::* or $page/element_db[@layer=73] or $page/element_db[@layer=74]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">72</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">73</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">74</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>

  <xsl:if test="$page/element_db[@layer=75]/child::* or $page/element_db[@layer=76] or $page/element_db[@layer=77]/child::*">
  <tr>
   <td colspan="2" class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">75</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  <tr>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">76</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
   <td class="text">
     <xsl:call-template name="process_layer">
       <xsl:with-param name="element" select="$page/element_db"/>
       <xsl:with-param name="layer">77</xsl:with-param>
       <xsl:with-param name="mode" select="string('VIEW')"/>
     </xsl:call-template>
   </td>
  </tr>
  </xsl:if>




  </table>

</xsl:template>

</xsl:stylesheet>
