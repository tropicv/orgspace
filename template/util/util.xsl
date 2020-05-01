<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="plashka">
 <xsl:param name="num"/>

 <xsl:if test="$num mod 6 != 0">

<td width="20%"><img src="/images/dot.gif" width="1" height="1" border="0" /><br/></td>

<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
</td><td align="right">
<div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
</td></tr>

<tr><td colspan="2" bgcolor="#E2EAF2"><img src="/images/dot.gif" width="106" height="83" border="0"/></td></tr>

<tr><td colspan="2">
<div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
<div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
</td></tr>
</table>
</td>

  <xsl:call-template name="plashka">
    <xsl:with-param name="num" select="number($num)+1"/>
  </xsl:call-template>

 </xsl:if>

</xsl:template>

<xsl:template name="res_file_stuff"> 
    <xsl:param name="id"/>
    <xsl:param name="type"/>
    <xsl:param name="txt"/>
    <xsl:choose>
	<xsl:when test="$type/extension='.swf'">
	    <object width="550" height="400" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">
		<param name="movie" value="{$res_path}/{$id}{$type/extension}" />
		<embed src="{$res_path}/{$id}{$type/extension}" width="550" height="400" type="application/x-shockwave-flash">
		    <p><xsl:value-of select="$id" /><xsl:value-of select="$type/extension" /></p>
		</embed>
	    </object>
	</xsl:when>
	<xsl:otherwise>
	    <A class="file" href="{$res_path}/{$id}{$type/extension}"><xsl:value-of select="$txt"/></A>
	</xsl:otherwise>
    </xsl:choose>
    
    
<!--    <A class="file" href="{$res_path}/"><xsl:value-of select="$txt"/>file</A>-->
</xsl:template>


<xsl:template name="res_image_stuff"> 
    <xsl:param name="id"/>
    <xsl:param name="type"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>

    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>

    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 

</xsl:template>


<xsl:template name="res_image_stuff_pup"> 
    <xsl:param name="id"/>
    <xsl:param name="idb"/>
    <xsl:param name="type"/>
    <xsl:param name="typeb"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>

<!--    <a href="" onclick="javascript:openwin('{$res_path}/{$idb}{$typeb/extension}',{number($typeb/width)+40},{number($typeb/height)+60}); return false;">
    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>
    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 
    <br/></a>-->

    <a href="{$res_path}/{$idb}{$typeb/extension}" class="highslide" onclick="return hs.expand(this)">
    <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" />
    <br/></a>
    <div class="highslide-caption"><xsl:value-of select="$alt"/></div>


</xsl:template>

<xsl:template name="res_image_stuff_element"> 
    <xsl:param name="id"/>
    <xsl:param name="type"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>

   <div class="fleft" style="width: {$type/width}px; margin-right: 20px; margin-bottom: 20px;">
    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>

    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 
   </div>

</xsl:template>

<xsl:template name="res_image_stuff_pup_element_tmp"> 
    <xsl:param name="id"/>
    <xsl:param name="idb"/>
    <xsl:param name="type"/>
    <xsl:param name="typeb"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>
    <xsl:param name="pad"/>
    
   <div class="fleft">
    <xsl:attribute name="style">width: <xsl:value-of select="$type/width"/>px; <xsl:if test="$pad!=1">margin-right: 20px; margin-bottom: 20px;</xsl:if></xsl:attribute>
<!--    <a href="" onclick="javascript:openwin('{$res_path}/{$idb}{$typeb/extension}',{number($typeb/width)+40},{number($typeb/height)+60}); return false;">
    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>
    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 
    <br/></a>-->

    <a href="{$res_path}/{$idb}{$typeb/extension}" class="highslide" onclick="return hs.expand(this)">
    <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" />
    </a>
    <div class="highslide-caption"><xsl:value-of select="$alt"/></div>
    
   </div> 

</xsl:template>



<xsl:template name="res_image_stuff_slider"> 
    <xsl:param name="id"/>
    <xsl:param name="idb"/>
    <xsl:param name="type"/>
    <xsl:param name="typeb"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>
    <xsl:param name="pad"/>
    <xsl:param name="link"/>
    <xsl:param name="layer"/>
    <!--<br/>-->
    <div class="image-slider" data-path="{$res_path}/{$id}{$type/extension}" data-link="{$link}" data-layer="{$layer}">
	<xsl:if test="$user_menu/@meth!='edit'"><xsl:attribute name="style">display:none;</xsl:attribute></xsl:if>
	<xsl:if test="$user_menu/@meth='edit'"><xsl:attribute name="style">width:400px;</xsl:attribute><b style="color:green">Image for slider N<xsl:value-of select="$layer"/></b></xsl:if>
	<img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="100%" style="border: 0px"/>
    </div> 

</xsl:template>


<xsl:template name="res_image_stuff_pup_element"> 
    <xsl:param name="id"/>
    <xsl:param name="idb"/>
    <xsl:param name="type"/>
    <xsl:param name="typeb"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>
    <xsl:param name="pad"/>
    
   <div class="fleft">
    <xsl:attribute name="style">width: <xsl:value-of select="$type/width"/>px; <xsl:if test="$pad!=1">margin-right: 20px; margin-bottom: 20px;</xsl:if></xsl:attribute>
<!--    <a href="" onclick="javascript:openwin('{$res_path}/{$idb}{$typeb/extension}',{number($typeb/width)+40},{number($typeb/height)+60}); return false;">
    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>
    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 
    <br/></a>-->

    <a href="{$res_path}/{$idb}{$typeb/extension}" class="highslide" onclick="return hs.expand(this)">
    <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="Click to enlarge" width="{$type/width}" height="{$type/height}" />
    </a>
    <div class="highslide-caption"><xsl:value-of select="$alt"/></div>

   </div> 

</xsl:template>

<xsl:template name="res_image_stuff_pup_element_gal"> 
    <xsl:param name="id"/>
    <xsl:param name="idb"/>
    <xsl:param name="type"/>
    <xsl:param name="typeb"/>
    <xsl:param name="max"/>
    <xsl:param name="alt"/>

   <div class="fleft" style="width: {$type/width}px; margin-right: 5px; margin-bottom: 5px;">
<!--    <a href="" onclick="javascript:openwin('{$res_path}/{$idb}{$typeb/extension}',{number($typeb/width)+40},{number($typeb/height)+60}); return false;">
    <xsl:if test="$type/width &lt;= $max">    
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" border="0"/>
    </xsl:if>
    <xsl:if test="$type/width &gt; $max">   
      <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$max}" border="0"/>
    </xsl:if> 
    <br/></a>-->

    <a href="{$res_path}/{$idb}{$typeb/extension}" class="highslide" onclick="return hs.expand(this)">
    <img src="{$res_path}/{$id}{$type/extension}" alt="{$alt}" title="{$alt}" width="{$type/width}" height="{$type/height}" />
    </a>
    <div class="highslide-caption"><xsl:value-of select="$alt"/></div>

   </div>

</xsl:template>


<xsl:template name="show_select">
<xsl:param name="name"/>
<xsl:param name="select"/>
<xsl:param name="cur"/>

<select name="{$name}">
<xsl:for-each select="$select">
<option value="{@id}">
<xsl:if test="$cur=@id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
<xsl:value-of select="@title"/>
</option>
</xsl:for-each>
</select>

</xsl:template>


<xsl:template name="del_yes_no">
<xsl:param name="title"/>
<xsl:param name="action"/>
<xsl:param name="data"/>

<h2><xsl:value-of select="$title"/></h2>
 <a href="{$action}?state=2&amp;obj={$data}">Нет</a> | 
 <a href="{$action}?state=1&amp;obj={$data}">Да</a>
 <br/>
</xsl:template>

<xsl:template name="politic">
 <div style="margin-top: 20px;">
	Нажимая кнопку &#171;Отослать&#187;, я принимаю условия <a href="/container-view?obj=904">Политики конфидециальности</a> и
	<br/>
	даю согласие на обработку моих персональных данных
 </div>
</xsl:template>


<xsl:template name="politic_coockie">
	<div class="politic">
			<table>
				<tr>
					<td>
						Чтобы Вам было удобнее пользоваться нашим сайтом, мы используем cookie-файлы. Продолжая просматривать веб-сайт, Вы принимаете и соглашаетесь с нашей <a href="/container-view?obj=904">Политики конфидециальности</a>. Вы можете в любое время отозвать свое согласие, изменив настройки своего браузера и удалив сохраненные cookie-файлы. 
					</td>
					<td>
						<button class="btn-coockie-politic" onclick="complianceWithPrivacyPolicy()">Принимаю</button>
					</td>
				</tr>
			</table>
	</div>

	<script>
	if (document.cookie.indexOf("politicCookie=1") != -1) $(".politic").hide();
	else $(".politic").show();

	function complianceWithPrivacyPolicy () {
			document.cookie = "politicCookie=1";
			$(".politic").hide();
	}

	</script>
</xsl:template>



<xsl:template name="form_button">
	<xsl:param name="name_form"/>
	
	<div class="form-btn">
		<button class="send" onclick="document.forms.{$name_form}.submit();return false;">
			<span>&gt;</span>Отослать
		</button>
		<img src="/images/dot.gif" width="70" height="1" border="0"/>
		<button class="clear" onclick="document.forms.{$name_form}.reset();return false;">
			<span>&lt;</span>Очистить
		</button>
	</div>
</xsl:template>


</xsl:stylesheet>
