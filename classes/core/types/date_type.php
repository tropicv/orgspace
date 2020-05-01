<?


class date_type extends basic_type {

   function date_type($reqired,$default_value){
    parent::basic_type($reqired,$default_value);
   }

  /**
    Casting input value and return converted result, filling err field

    @param test - testing value
    @return new casted value
  */

   function cast_type($test){
    $this->err=false;

    $tm=$this->parse_date($test,get_proper("date_format"));
    if($tm){
         return $this->sql_date_no_time($tm);
    }

    $this->err=new err_vect(INVALID_INPUT_TYPE,$this);
    return $this->default_value;
   }

   function str_to_db($test){
    return date_type::sql_date_no_time(date_type::parse_date($test,get_proper("date_format")));
   }

   function sql_date_no_time($date){
      return strftime("%Y-%m-%d 00:00:00",$date);
   }

   function sql_date_with_time($date){
      return strftime("%Y-%m-%d %H:%M:%S",$date);
   }

   function sql_date_string_now(){
//     return date_type::sql_date_no_time(localtime());
     return date_type::sql_date_no_time(time());
   }

   function sql_date_string_now_with_time(){
     return date_type::sql_date_with_time(time());
   }

   function parse_date($date,$date_format)  {
     $year=$month=$day=false;

     for($i=0,$x=0;$i<strlen($date_format);$i++){

        if($date_format{$i}=='%'){
           $i++;
           $typ=$date_format{$i};

           if($typ=='Y'){
               if(ctype_alnum($date{$x}) && ctype_alnum($date{$x+1}) &&
	          ctype_alnum($date{$x+2}) && ctype_alnum($date{$x+3})) {
	               $year=substr($date,$x,4);
		       $x+=4;
               } else return false;
	   }
           else if($typ=='y'){
               if(ctype_alnum($date{$x}) && ctype_alnum($date{$x+1})){
	               $year=2000+substr($date,$x,2);
		       $x+=2;
	        } else return false;
	   }
           else if($typ=='m'){
               if(ctype_alnum($date{$x}) && ctype_alnum($date{$x+1})){
	               $month=substr($date,$x,2);
		       $x+=2;
	       } else return false;
	   }
           else if($typ=='d'){
               if(ctype_alnum($date{$x}) && ctype_alnum($date{$x+1})){
	               $day=substr($date,$x,2);
		       $x+=2;
		} else return false;
	  }
        }else {
           if($date{$x}!=$date_format{$i}) return false;
	   $x++;
        }
     }


     if(!checkdate($month,$day,$year)) return false;

     return mktime(0,0,0,$month,$day,$year);
   }


  function date_string($tim){
     global $date_format;
     return strftime($date_format,$tim);
  }

  function set_date_format($fmt){
     global $date_format;
     $date_format=$fmt;
  }

  function get_type_string($db_type){ return "timestamp NOT NULL"; }

  function need_apos(){ return true; }

  function render_field($value,&$outp,$data_provider){     

     if(!$value) return false;
     $conv=strtotime($value);
     return strftime(get_proper("date_format"),$conv);
  }

}

?>