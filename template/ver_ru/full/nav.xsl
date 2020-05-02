<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="simple_nav">

<!-- Header -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">

<tr>
<td  style="padding-top: 12px;">
<a href="/"><img src="/images/logo{$lc/@pref}.gif" width="150" height="35" border="0"/><!-- 28 --></a>
</td>
</tr>

</table>
</xsl:template>

<xsl:template name="nav">
<xsl:param name="printver"/>

<!-- Header -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">

<tr>
<td colspan="3" align="right">
<table border="0" cellspacing="0" cellpadding="0" class="head">
<tr>
<td nowrap="nowrap">
<div class="upmenu" style="position:relative; top: 59px; z-index: 1;"><a href="feedback-add"><xsl:value-of select="$lc/nav/ask_quest"/></a> :
<!--a href="container-view?walias=faq">FAQ</a> :-->
<a href="container-view?walias=sitemap"><xsl:value-of select="$lc/nav/site_map"/></a></div>
</td>
</tr>
</table>

</td>
</tr>

<tr>
<td  style="padding-top: 12px;">
<a href="/"><img src="/images/logo{$lc/@pref}.gif" width="150" height="35" border="0"/><!-- 28 --></a></td>
<td width="100%" valign="top" style="padding-top: 8px;">


<xsl:choose>
<xsl:when test="$printver='1'">

<table border="0" cellspacing="0" cellpadding="0" class="head">
<tr>
<td><img src="/images/dot.gif" width="20" height="1" border="0" name="dot1" id="dot1"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu1head" id="orgmenu1head"></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot2" id="dot2"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu2head" id="orgmenu2head"></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot3" id="dot3"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu3head" id="orgmenu3head"></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot4" id="dot4"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu4head" id="orgmenu4head"></div></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" name="dot5" id="dot5"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu5head" id="orgmenu5head"></div></td>
</tr>
</table>

<!--
<tr>
<td><img src="/images/dot.gif" width="20" height="1" border="0" name="dot1" id="dot1"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu1head" id="orgmenu1head">
<xsl:choose>
 <xsl:when test="$content/container_pview/list/bush_db[@walias='products'] or (not($content/container_pview/child::*) and not($content/news_abc/child::*) and not($content/news_view/child::*) and not($content/welcome_view) and not($content/usr_login) and not($content/usr_forgot) and not($content/register_add) and not($content/project_all) and not($content/project_view) and not($content/project_reviews) and not($content/project_search) and not($content/manager_pall) and not($content/feedback_padd) and not($content/ordcons_add))">
	<xsl:attribute name="class">head1</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('1',0);" onMouseOver="Turn('1',1);" href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot2" id="dot2"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu2head" id="orgmenu2head">
<xsl:choose>
 <xsl:when test="$content/container_pview/list/bush_db[@walias='services']"><xsl:attribute name="class">head2</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('2',0);" onMouseOver="Turn('2',1);" href="container-view?walias=services"><xsl:value-of select="$lc/services"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot3" id="dot3"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu3head" id="orgmenu3head">
<xsl:choose>
 <xsl:when test="$content/container_pview/list/bush_db[@walias='knowhow'] or $content/project_all or $content/project_search or $content/project_view or $content/project_reviews"><xsl:attribute name="class">head3</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('3',0);" onMouseOver="Turn('3',1);" href="container-view?walias=knowhow"><xsl:value-of select="$lc/know_how"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot4" id="dot4"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu4head" id="orgmenu4head">
<xsl:choose>
 <xsl:when test="$content/container_pview/list/bush_db[@walias='how2buy'] or $content/ordpr_add or $content/ordcons_add or $content/ordtest_add"><xsl:attribute name="class">head4</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('4',0);" onMouseOver="Turn('4',1);" href="container-view?walias=how2buy"><xsl:value-of select="$lc/how_to_buy"/></a></div></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" name="dot5" id="dot5"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu5head" id="orgmenu5head">
<xsl:choose>
 <xsl:when test="$content/container_pview/list/bush_db[@walias='about'] or $content/news_abc/child::* or $content/news_view/child::* or $content/usr_login or $content/usr_forgot or $content/register_padd or $content/manager_pall or $content/feedback_padd"><xsl:attribute name="class">head5</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('5',0);" onMouseOver="Turn('5',1);" href="container-view?walias=about"><xsl:value-of select="$lc/about_orgspace"/></a></div></td>
</tr>
-->
</xsl:when>

<xsl:otherwise>

<table border="0" cellspacing="0" cellpadding="0" class="head">

<tr>
<td><img src="/images/dot.gif" width="25" height="1" border="0"/><br/></td>
<td colspan="9"><div class="upmenu"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="20" height="1" border="0" name="dot1" id="dot1"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu1head" id="orgmenu1head">
<xsl:choose>
 <xsl:when test="$content/container_view/list/bush_db[@walias='products'] or (not($content/container_view/child::*) and not($content/news_abc/child::*) and not($content/news_view/child::*) and not($content/welcome_view) and not($content/usr_login) and not($content/usr_forgot) and not($content/register_add) and not($content/project_all) and not($content/project_view) and not($content/project_reviews) and not($content/project_search) and not($content/manager_all) and not($content/feedback_add) and not($content/callback_add) and not($content/subscr_add) and not($content/kmore_add) and not($content/ordcons_add) and not($content/ordtest_add) and not($content/ordpr_add) and not($content/ordcat_add))">
	<xsl:attribute name="class">head1</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('1',0);" onMouseOver="Turn('1',1);" href="container-view?walias=products"><xsl:value-of select="$lc/products"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot2" id="dot2"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu2head" id="orgmenu2head">
<xsl:choose>
 <xsl:when test="$content/container_view/list/bush_db[@walias='services'] or $content/kmore_add"><xsl:attribute name="class">head2</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('2',0);" onMouseOver="Turn('2',1);" href="container-view?walias=services"><xsl:value-of select="$lc/services"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot3" id="dot3"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu3head" id="orgmenu3head">
<xsl:choose>
 <xsl:when test="$content/container_view/list/bush_db[@walias='knowhow'] or $content/project_all or $content/project_search or $content/project_view or $content/project_reviews"><xsl:attribute name="class">head3</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('3',0);" onMouseOver="Turn('3',1);" href="container-view?walias=knowhow"><xsl:value-of select="$lc/know_how"/></a></div></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0" name="dot4" id="dot4"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu4head" id="orgmenu4head">
<xsl:choose>
 <xsl:when test="$content/container_view/list/bush_db[@walias='how2buy'] or $content/ordcons_add or $content/ordtest_add or $content/ordpr_add or $content/callback_add  or $content/ordcat_add "><xsl:attribute name="class">head4</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('4',0);" onMouseOver="Turn('4',1);" href="container-view?walias=how2buy"><xsl:value-of select="$lc/how_to_buy"/></a></div></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0" name="dot5" id="dot5"/><br/></td>
<td nowrap="nowrap"><div name="orgmenu5head" id="orgmenu5head">
<xsl:choose>
 <xsl:when test="$content/container_view/list/bush_db[@walias='about'] or $content/news_abc/child::* or $content/news_view/child::* or $content/usr_login or $content/usr_forgot or $content/register_add or $content/manager_all or $content/feedback_add or $content/subscr_add"><xsl:attribute name="class">head5</xsl:attribute></xsl:when> 
 <xsl:otherwise><xsl:attribute name="class">menu</xsl:attribute></xsl:otherwise>
</xsl:choose>
<a onMouseOut="Turn('5',0);" onMouseOver="Turn('5',1);" href="container-view?walias=about"><xsl:value-of select="$lc/about_orgspace"/></a></div></td>
</tr>

<tr>
<td><img src="/images/dot.gif" width="25" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="67" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="60" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="70" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="15" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="75" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="10" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="97" height="1" border="0"/><br/></td>
</tr>

</table>

</xsl:otherwise>
</xsl:choose>


</td>
<td align="right" valign="top" style="padding-top: 23px;">


<table border="0" cellspacing="0" cellpadding="0" class="search">
<form action="search-keywords" method="POST">

<tr>
<td><xsl:value-of select="$lc/nav/search"/>:</td>
<td><img src="/images/dot.gif" width="3" height="1" border="0"/><br/></td>
<td class="input" align="right" nowrap="nowrap">
<input type="text" name="keywords" size="14"/>
</td>
<td nowrap="nowrap">
<input type="image" src="/images/search.gif" width="20" height="15" border="0" align="absmiddle" alt="{$lc/nav/search}" title="{$lc/nav/search}"/>
</td>
</tr>
</form>
</table>

</td>
</tr>

<xsl:if test="$printver!='1'">
<tr>
<td><img src="/images/dot.gif" width="150" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="455" height="1" border="0"/><br/></td>
<td><img src="/images/dot.gif" width="155" height="1" border="0"/><br/></td>
</tr>
</xsl:if>

</table>

<!-- End Header -->
</xsl:template>

<xsl:template name="copy">
<!--
<div class="copy"><xsl:text disable-output-escaping="yes"><![CDATA[&copy;]]></xsl:text> 2004 Orgspace Consulting : 
<a href="container-view?walias=ppolicy">Privacy Policy <xsl:text disable-output-escaping="yes">&amp;</xsl:text> Legal Notice</a> 
<xsl:if test="$content/welcome_view">
: <a href="serial-all"><xsl:value-of select="$lc/furniture"/> Karstula, Periscope, Fansy, Aura, Tetrix, Wellorg</a> 
</xsl:if>
</div>
-->

<div class="copy">
<xsl:value-of select="//botm_link/container_view/*/container_db[@layer=0]/element_db[1]/*/*/@title" disable-output-escaping="yes"/>
</div>

<script src="/scp/lightslider/src/js/lightslider.js"></script>
<link rel="stylesheet" type="text/css" href="/scp/lightslider/src/css/lightslider.css" />


<style>
.banner-hide-img { margin:0 auto; padding:0; }
.banner-hide-img li{
    display:none;
}

.lSPager { opacity:0; }
.lSSlideOuter:hover > .lSPager { opacity:1; }
/*.lSSlideOuter:hover { background: #e7eaf3; }*?
</style>

<script type="text/javascript">

$( document ).ready(function() {
    var meth = '<xsl:value-of select="$user_menu/@meth" />';
    var sliderWidth = $(window).width()-520;
    if(meth=='edit') 
	sliderWidth=400;
    var mainSliderWidth = $(window).width()-20;

    var wImageMax=0;
    var wImage=0;
    var numSlider=[];
    $(".image-slider").each(function(i) {
	var layer1 = $(this).attr("data-layer");
	var boo=true;
	for(var c=0; c &lt; numSlider.length; c++ ){
	    if(numSlider[c]==layer1){
		boo=false; 
		break;
	    }
	}
	if(boo) numSlider.push(layer1);
    });
    var firstParent="";
    var listSliders="#image-gallery";
    var mainSlider="";
    for(var c=0; c &lt; numSlider.length; c++ ){
	var imgSl="";
	$(".image-slider[data-layer='"+numSlider[c]+"']").each(function(i){
	    if(i==0) $(this).parent().addClass("block-slider-"+numSlider[c]);
	    var scrImage = $(this).attr("data-path");
	    var linkProject = $(this).attr("data-link");
	    if(linkProject=='' || linkProject==null || linkProject==undefined)
	        imgSl+='<li class="slider-item slider-item-'+numSlider[c]+'" data-thumb="'+scrImage+'"><a href="'+scrImage+'" class="highslide" onclick="return hs.expand(this)">'+$(this).html()+'</a></li>';
	    else
		imgSl+='<li class="slider-item slider-item-'+numSlider[c]+'" data-thumb="'+scrImage+'"><a href="'+linkProject+'">'+$(this).html()+'</a></li>';
	    var img = new Image();
	    img.src = scrImage;
	    wImage = img.width;
	    //if(wImage>wImageMax) wImageMax=wImage; // close 29.08
	    //if(sliderWidth>wImage) sliderWidth=wImage; // close 29.08
	});
	mainSlider+=imgSl;
	<xsl:if test="user_menu/@item!='welcome'">
	    $(".block-slider-"+numSlider[c]+" .image-slider[data-layer='"+numSlider[c]+"']").first().before('<div class="clearfix" style="width:'+sliderWidth+'px;"><ul id="image-gallery-'+numSlider[c]+'" class="gallery list-unstyled cS-hidden">'+imgSl+'</ul></div>');
	</xsl:if>
	listSliders+=", #image-gallery-"+numSlider[c];
	$("#image-gallery-"+numSlider[c]+" b").text("Slider N"+numSlider[c]);
    }

    if(wImageMax&lt;200) wImageMax=1000;
    <xsl:if test="user_menu/@item='welcome'">
	var rndSlider = numSlider[Math.floor(Math.random() * numSlider.length)];
//	$(".main-page-slider").html('<div class="clearfix" style="margin:0 auto; max-width:'+wImageMax+'px"><ul id="image-gallery" class="gallery list-unstyled cS-hidden">'+mainSlider+'</ul></div>');
	$(".main-page-slider").html('<div class="clearfix" style="margin:0 auto; max-width:'+mainSliderWidth+'px"><ul id="image-gallery" class="gallery list-unstyled cS-hidden">'+mainSlider+'</ul></div>');
	
	$(listSliders).hide();
	$("#image-gallery").show();
	for(var cc=0; cc &lt; numSlider.length; cc++) {
	    if(numSlider[cc]!=rndSlider) $(".slider-item-"+numSlider[cc]).remove();
	}
    </xsl:if>

<xsl:choose>
    <xsl:when test="user_menu/@item!='welcome'">
	$(listSliders).lightSlider({
	    gallery: true,
	    item:1,
	    autoWidth:false,
    	    slideMargin: 0,
	    speed:1000,
	    pause:7000,
    	    auto:true,
	    loop:true,
    	    onSliderLoad: function() {
		$(listSliders).removeClass('cS-hidden');
	    }
	});
    
	$(".lSSlideOuter  .lSPager").css("margin","10px auto");
    </xsl:when>
    <xsl:otherwise>
	if ($(listSliders).find("li").length == 1) {
	    console.log($(listSliders).find("li").length);
	    $(listSliders).lightSlider({
		gallery: false,
		item:1,
	        autoWidth:false,
    	        slideMargin: 0,
	        loop:true,
    	        onSliderLoad: function() {
		    $(listSliders).removeClass('cS-hidden');
		    $(".lSSlideOuter  .lSPager").hide();
		    $(".lSSlideOuter  .lSAction").hide(); 
		}
		});
	} else {
	    $(listSliders).lightSlider({
	        gallery: false,
	        item:1,
		autoWidth:false,
    		slideMargin: 0,
		speed:1000,
		pause:7000,
    		auto:true,
		loop:true,
    		onSliderLoad: function() {
		    $(listSliders).removeClass('cS-hidden');
		}
	    });
	}
	$(".lSSlideOuter  .lSPager").css("margin","-30px 0 30px");
    </xsl:otherwise>
</xsl:choose>
    

    $(window).resize(function(){
	var ww = $(window).width();
	if(ww > $(".slider-item").width()){
	    if(ww &lt;= 920){ // close 29.08
		$(".clearfix").css("width", "400px"); // close 29.08
	    } else if(ww >= 1520){ // close 29.08
		$(".clearfix").css("width", "1000px"); // close 29.08
	    } else { // close 29.08
		$(".clearfix").css("width", (ww-520)+"px"); // close 29.08
	    }
	}
	$(".clearfix").refresh;
    });
});

</script>

</xsl:template>

</xsl:stylesheet>
