<?

class basic_db {
  var $data;
  var $result;
  var $expand_dictonary=false;

  function basic_db($id=-1){
     if(!$this->is_class_load()) $this->load_class();
     if($id!=-1) $this->get_obj($id);
  }

  function load_class(){
      $this->tadd("id",new id_type());  
  }
  
  /** set field basic_type for this class  */

  function tadd($name,$type){
    data_model::add(get_class($this),$name,$type);
  }
  
  /** return basic_type class for this class and field name */
  
  function get($field_name,$type){
//  dbg_tr();
    return data_model::get(get_class($this),$field_name,$type);
  }

  /** if class allready load skip loading */
  function is_class_load(){ return data_model::is_load(get_class($this));  }
  
  function get_con(){ return data_model::get_connection(); }

  function addf($field_name,$value){ 
     return $this->data[$field_name]=$value;
  }

  function addall($data){ 
     return $this->data=$data;
  }

  function getf($field_name){ 
//     if(!isset($this->data[$field_name])) return false;
     return $this->data[$field_name];
  }
  function getall(){ 
     return $this->data;
  }


  function LIKE($fld,$keyword){ 
      $c=$this->get_con();
      return $c->LIKE($fld,$keyword);
  }


  function getid(){ 
     return $this->data["id"];
  }

  function setf($field_name,$value){ 
     $this->data[$field_name]=$value;
  }

  function insert(){
     $class=data_model::get_class(get_class($this));
     $sql="insert into ".table_name($this)." (";
     
     $typ=reset($class);
     while($typ){
       $field_name=key($class);                          
       if($field_name=="id"){
          $typ=next($class);
          continue;
       }	  
       
       $typ=next($class);   
       $sql.=$field_name;
       
       if($typ) $sql.=",";
       else $sql.=") values (";
     }
     
     $typ=reset($class);
     while($typ){
       $field_name=key($class);                          
       $t=$typ["type"];
       
       if($field_name=="id") { 
         $typ=next($class);
	 continue;
       }

       if($t->need_apos()) $sql.="'";	 
       $sql.=$t->sql_render($this->getf($field_name));
       if($t->need_apos()) $sql.="'";	 

       $typ=next($class);
       if($typ) $sql.=",";
       else $sql.=");";
     }    
//accum_file("111", "sql = $sql\n");
     $con=$this->get_con();     
     $this->setf("id",$con->insert(table_name($this),$sql));          

     /** saving files */

     $typ=reset($class);
     while($typ){
       $field_name=key($class);                          
       $t=$typ["type"];

       if(get_class($t)=="file_type" || get_class($t)=="image_type"){
          $tdata=$this->getf($field_name);
          $this->save_res_file($field_name,$t->get_id(),$tdata);
       }
       $typ=next($class);   
     }

  }

  function update(){
     $class=data_model::get_class(get_class($this));

     $typ=reset($class);
     while($typ){
       $field_name=key($class);                          
       $t=$typ["type"];
    
       if(get_class($t)=="file_type" || get_class($t)=="image_type"){
          $tdata=$this->getf($field_name);

          $cls=get_class($this);    
          $old=new $cls();    
          $old->get_obj($this->getid());
          $old_data=$old->getf($field_name);


          if(get_param("del_".$field_name)){  // delete check box
              $this->delete_file(make_res_file_name($t->getid(),$old_data)); 
              $this->setf($field_name,"");
          }else{ 

             if(!$tdata && $old_data){ // image exist and not chaned
               $this->setf($field_name,$old_data); 
             }
             else { // new image
               $this->save_res_file($field_name,$t->get_id(),$tdata);                        
             }
          }
       }
       $typ=next($class);   
     }

     $sql="update ".table_name($this)." set ";   
     $typ=reset($class);
     while($typ){
       $field_name=key($class);                          
       if($field_name=="id") { 
         $typ=next($class);
	 continue;
       }
       $t=$typ["type"];
       
       $sql.=$field_name."=";
              
       if($t->need_apos()) $sql.="'";	 
       $sql.=$t->sql_render($this->getf($field_name));
       if($t->need_apos()) $sql.="'";	 
  
       $typ=next($class);

       if($typ) $sql.=",";
       else $sql.=" where id=".$this->getf("id").";";    
     }
     $con=$this->get_con();
     $con->update($sql);                    

  }

  function delete(){
     $con=$this->get_con();
     return $con->update("delete from ".table_name($this)." where id=".$this->getf("id").";");
  }

  function query($sql){
     $con=$this->get_con();
     $this->result=$con->query($sql);               
  }
  
  function lst(){
     $sql_data=$this->result->lst();
     
     if(!$sql_data){
         $this->result->close();
	 $this->result=false;
	 return false;
     }
     $this->create_obj($sql_data);
     return true;
  }
  
  function create_obj($sql_data){
     $this->data=false;

     $class=data_model::get_class(get_class($this));
     $typ=reset($class);
     
     while($typ){
       $field_name=key($class);                            
       $this->setf($field_name,$sql_data[$field_name]);
       $typ=next($class);       
     }
  }

  function list_init(){
    $this->query("select * from ".table_name($this)." order by id;");
  }

  function get_obj($id){
    $ret=false;
    $this->query("select * from ".table_name($this)." where id=".$id." order by id;");
    if($this->lst()) $ret=true;
    if($this->result) {
      $this->result->close();
      $this->result=false;
    }
    return $ret;
  }

  function create_default(){
     $class=data_model::get_class(get_class($this));     
     $typ=reset($class);
     
     while($typ){
       $field_name=key($class);                          
       $this->setf($field_name,$typ["type"]->get_default());
       $typ=next($class);
     }   
  }

  function make_obj($params){
     $err=false;
     $class=data_model::get_class(get_class($this));     
     $typ=reset($class);
     
     while($typ){
       $field_name=key($class);                          
       $t=$typ["type"];
       
       if(isset($params[$field_name])){          
          $data=$t->cast_type_with_data($field_name,$params[$field_name],get_params());
          if($t->is_err()){ 
	      $e=$t->get_err(); 
	      $e->set_err_field($field_name);
	      $err[]=$e;
	  }   
          $this->setf($field_name,$data);
       }else {
          if(get_class($t)=="chk_type") { $this->setf($field_name,"0"); }
       }   
       $typ=next($class);
     }   
     return $err;
  }
  
  function read(){ return $this->get_obj($this->getf("id")); }

  function list_by_key($key_fieled,$value){
    $this->query("select * from "+table_name($this)+" where ".$key_field."=".$value." order by id;");
  }

  /** Making full path to file
      @param basename path to resuorce files
      @param fid field id
      @return file info
      @see conctructed path
  */ 

  function make_res_file_name($fid,$data){
      $con=$this->get_con();
      $path=$con->get_res_path();
      $path.=$this->make_part_res_file_name($fid,$data);
      return $path;
  }

  function make_part_res_file_name($fid,$data){
      $path="";
      $fopt=split(";",$data);         
      $path.=table_name($this)."_".$this->getid()."_".$fid.$fopt[0];
      return $path;
  }


  /** Saving file data to basename+firm_id+file_ext
      @param basename path to resuorce files
      @param fid field id 
      @param data value of data filed
      @param DataSource object
      @return  HashMap of err_vect, if return null then object empty
      @see err_vect
  */ 

  function save_res_file($field_name,$fid,$data){
    if($data=="" || $data=="none") return false;
    $path=$this->make_res_file_name($fid,$data);
    $params=get_param($field_name);
    copy($params["tmp_name"],$path);
  }

  function del_res_file($fid,$data) {
    if($data){
       unlink($this->make_res_file_name($fid,$data));
    } 
  }

    /** Open node to display , generate all table fileds to node atributes */

  function is_expand_dictonary(){ return $this->expand_dictonary;}
  function set_expand_dictonary($expand){ return $this->expand_dictonary=$expand;}

  function disp_open($disp){
    return $this->display($disp,false);
  }
  function disp_body($disp){
    return $this->display($disp,true);
  }
  function disp_close($disp){
    $disp->close();
  }

  function display(&$disp,$close_tag)  {
       $expand=false;
       $params=false;


       $class=data_model::get_class(get_class($this));

       $map=$this->data;

       $typ=reset($class);

       reset($class);
       while (list($field_name, $typ) = each($class)) {
         $t=$typ["type"];
         $outp=$disp->create();

         $value=$t->render_field($this->getf($field_name),&$outp,$this);

         if(isset($value)) $params[$field_name]=$value;

         if($outp->get_buffer()){
              $expand[$field_name]=$outp;
         }
         if($value) $params[$field_name]=$value;         
       }

       if($expand){
          $disp->open_node(get_class($this),$params);
       }else {
          if($close_tag) $disp->put_node(get_class($this),$params); 
          else $disp->open_node(get_class($this),$params);
          return;
       }

       if($expand){
         reset($expand);
         while (list($keyname, $par) = each($expand)) {
            $disp->open_node($keyname,null);
             $disp->put_disp($par);
            $disp->close($keyname);
         }
         if($close_tag) $disp->close();
         return;
       }


       $disp->close();
    }

}

  /** return table name of class */
  
  function table_name($obj){
     $cls_name=get_class($obj);
     return substr($cls_name,0,strrpos($cls_name,'_'));
  }


?>
