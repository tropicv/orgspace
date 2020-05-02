<?

/**
   Generate list info struct for viewing multipage lists, output to dipslay
   <pre>

    &lt;list_size_info page_size="4" size="6" page="1" number_pages="2"/>
       &lt;page number="1" current="false" first="0" last="3" />
       &lt;page number="2" current="true"/>
    &lt;/list_size_info>
   </pre>

*/


class page_inf  {

  function show($inf_name,$number_elements, $page_size, $cur_page) {

    $prm["size"]=$number_elements;
    $prm["page"]=$cur_page;
    $prm["page_size"]=$page_size;

    $number_pages=$number_elements/$page_size;
    if($number_elements%$page_size > 0) $number_pages++;    
    $prm["number_pages"]=$number_pages;

    d_open_node($inf_name."_list_size_info",(object)$prm);
    
    for($i=0;$i<$number_pages;$i++){

      $pprm["number"]=$i;
      $pprm["first"]=$i*$page_size;
      if(($i+1)*$page_size > $number_elements )
        $pprm["last"]=$i*$page_size+$number_elements%$page_size-1;
      else
        $pprm["last"]=($i+1)*page_size-1;

      $pprm["current"]= ($i==$cur_page);
      d_put_node("page",(object)$pprm);
    }
    d_close();
  }
}


?>