<?xml version="1.0" encoding="windows-1251" standalone="no"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../ent.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="container_view_mainnew_edit"> 

<h5>template:mainnew</h5>
 <table border="1" cellspacing="0" cellpadding="0">
  <tr>
   <td valign="top">
    <h5>Зеленый блок (Layer 1):</h5>
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">1</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
   <td valign="top">
      <h5>Заголовок (Layer 20):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">20</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
   <table border="1" cellspacing="0" cellpadding="0">
    <tr>
     <td>
      <h5>Изображение (Layer 2):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">2</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
     <td>
      <h5>Текст (Layer 21):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">21</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
    </tr>

    <tr>
     <td>
      <h5>Изображение (Layer 22):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">22</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
     <td>
      <h5>Текст (Layer 23):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">23</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
    </tr>
   </table>

      <h5>Ссылка (Layer 29):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">29</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>

   </td>   
   <td valign="top">
	
      <h5>Заголовок (Layer 30):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">30</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>

   <table border="1" cellspacing="0" cellpadding="0">
    <tr>
     <td>
      <h5>Изображение (Layer 3):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">3</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
     <td>
      <h5>Текст (Layer 31):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">31</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
    </tr>

    <tr>
     <td>
      <h5>Изображение (Layer 32):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">32</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
     <td>
      <h5>Текст (Layer 33):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">33</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>
     </td>
    </tr>
   </table>

      <h5>Ссылка (Layer 39):</h5>
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">39</xsl:with-param>
        <xsl:with-param name="mode" select="string('EDIT')"/>
       </xsl:call-template>

   </td>   
  </tr>
  <tr>
   <td colspan="3" bgcolor="#f0f0f0" valign="top">
    <xsl:call-template name="process_layer">
     <xsl:with-param name="element" select="container_db/element_db"/>
     <xsl:with-param name="layer">0</xsl:with-param>
     <xsl:with-param name="mode" select="string('EDIT')"/>
    </xsl:call-template>
   </td>
  </tr>  
 </table>     
</xsl:template>

<xsl:template match="container_view_mainnew"> 

<xsl:if test="container_db/element_db[@layer=1]/child::*">

<table border="0" cellspacing="0" cellpadding="0" width="100%" class="mainpt">
 <tr><td colspan="3" bgcolor="#747474"><img src="/images/dot.gif" width="760" height="1" border="0"/></td></tr>
 <tr><td colspan="3" ><img src="/images/dot.gif" width="760" height="15" border="0"/></td></tr>
 <tr>
  <td width="20%" class="green">
    <div class="fleft"><img src="images/c-tl.gif" width="6" height="6" border="0"/></div>
    <div align="right"><img src="images/c-tr.gif" width="6" height="6" border="0"/></div>

    <div class="intgreen">
       <xsl:call-template name="process_layer">
        <xsl:with-param name="element" select="container_db/element_db"/>
        <xsl:with-param name="layer">1</xsl:with-param>
        <xsl:with-param name="mode" select="string('view')"/>
       </xsl:call-template>
    </div>

  </td>
  <td width="40%" class="middle" rowspan="2">
        <xsl:call-template name="process_layer">
         <xsl:with-param name="element" select="container_db/element_db"/>
         <xsl:with-param name="layer">20</xsl:with-param>
         <xsl:with-param name="mode" select="string('view')"/>
        </xsl:call-template>

        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="mainptint">
	 <tr>
	  <td>

            <table border="0" cellspacing="0" cellpadding="0" >
            <tr><td>
            <div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
            </td><td align="right">
            <div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
            </td></tr>
            
            <tr><td colspan="2">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">2</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
            </td></tr>
            
            <tr><td colspan="2">
            <div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
            <div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
            </td></tr>
            </table>

	  </td>
	  <td><img src="/images/dot.gif" width="15" height="1" border="0"/></td>
	  <td width="100%">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">21</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
	  </td>
	 </tr>

	<xsl:if test="container_db/element_db[@layer=22]/child::*">

	 <tr><td><img src="/images/dot.gif" width="15" height="10" border="0"/></td></tr>
	 <tr>
	  <td>

            <table border="0" cellspacing="0" cellpadding="0" >
            <tr><td>
            <div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
            </td><td align="right">
            <div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
            </td></tr>
            
            <tr><td colspan="2">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">22</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
            </td></tr>
            
            <tr><td colspan="2">
            <div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
            <div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
            </td></tr>
            </table>

	  </td>
	  <td><img src="/images/dot.gif" width="15" height="1" border="0"/></td>
	  <td width="100%">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">23</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
	  </td>
	 </tr>

	</xsl:if>

	</table>

               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">29</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
<!--    <div align="right"><a class="mainall" href="/project-all">Все проекты <img src="images/main_ar.gif" width="15" height="14" border="0" align="absmiddle"/></a></div> -->

  </td>
  <td width="40%" class="last" rowspan="2">
        <xsl:call-template name="process_layer">
         <xsl:with-param name="element" select="container_db/element_db"/>
         <xsl:with-param name="layer">30</xsl:with-param>
         <xsl:with-param name="mode" select="string('view')"/>
        </xsl:call-template>

        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="mainptint">
	 <tr>
	  <td>

            <table border="0" cellspacing="0" cellpadding="0" >
            <tr><td>
            <div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
            </td><td align="right">
            <div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
            </td></tr>
            
            <tr><td colspan="2">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">3</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
            </td></tr>
            
            <tr><td colspan="2">
            <div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
            <div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
            </td></tr>
            </table>

	  </td>
	  <td><img src="/images/dot.gif" width="15" height="1" border="0"/></td>
	  <td width="100%">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">31</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
	  </td>
	 </tr>

	<xsl:if test="container_db/element_db[@layer=32]/child::*">

	 <tr><td><img src="/images/dot.gif" width="15" height="10" border="0"/></td></tr>
	 <tr>
	  <td>

            <table border="0" cellspacing="0" cellpadding="0" >
            <tr><td>
            <div class="tcorn"><img src="/images/c-tl.gif" width="6" height="6" border="0"/></div>
            </td><td align="right">
            <div class="tcorn"><img src="/images/c-tr.gif" width="6" height="6" border="0"/></div>
            </td></tr>
            
            <tr><td colspan="2">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">32</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
            </td></tr>
            
            <tr><td colspan="2">
            <div class="fleft"><img src="/images/c-bl.gif" width="6" height="6" border="0" class="bcorn"/></div>
            <div align="right"><img src="/images/c-br.gif" width="6" height="6" border="0" class="bcorn"/></div>
            </td></tr>
            </table>

	  </td>
	  <td><img src="/images/dot.gif" width="15" height="1" border="0"/></td>
	  <td width="100%">
               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">33</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>
	  </td>
	 </tr>

	</xsl:if>

	</table>

               <xsl:call-template name="process_layer">
                <xsl:with-param name="element" select="container_db/element_db"/>
                <xsl:with-param name="layer">39</xsl:with-param>
                <xsl:with-param name="mode" select="string('view')"/>
               </xsl:call-template>

<!--    <div align="right"><a class="mainall" href="/container-view?walias=products">Все работы <img src="images/main_ar.gif" width="15" height="14" border="0" align="absmiddle"/></a></div> -->
  </td>
 </tr>
 <tr>
    <td class="greenbottom">
    <img src="images/dot.gif" width="150" height="1" border="0"/><br/>
    <div class="fleft"><img src="images/c-bl.gif" width="6" height="6" border="0"/></div>
    <div align="right"><img src="images/c-br.gif" width="6" height="6" border="0"/></div>
    </td>
 </tr>
 <tr><td colspan="3" ><img src="/images/dot.gif" width="760" height="15" border="0"/></td></tr>
</table>

</xsl:if>

</xsl:template>
</xsl:stylesheet>
