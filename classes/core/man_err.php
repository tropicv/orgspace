<?

class man_err {
    var $err;

    public man_err(final String code="",displaybl obj=false){
	super(code);
        err=new err_vect(code,obj);
    }
    public man_err(final String code){
	super(code);
        err=new err_vect(code,null);
    }

    public man_err(err_vect err){
        this.err=err;
    }

    public HashMap get_details(){ 
       HashMap e=new HashMap();
       e.put("key",err);
       return e; 
    }
    public err_vect get_err(){ return err; }
}

?>
