
public class money_type extends basic_type {

  /** minimal value */
  public double min_value;

  /** maximal value */
  public double max_value;

  /** money currency */
  public String currency;

  /** 
    @param reqired - [0|1] this parameter required
    @param default_value - default value
    @param min_value - minimal value
    @param max_value - maximal value
    @param currency - money currency
  */

  public money_type( int reqired,double default_value,double min_value,double max_value,String currency){
    super(reqired,new Double(default_value));
    this.min_value=min_value;
    this.max_value=max_value;
    this.currency=currency;
  }


  /** 
    Casting input value and return converted result, filling err field

    @param test - testing value 
    @return new casted value
  */

  public Object cast_type(Object test){     
    Double f;
    err=null;
    if(test.getClass().getName().equals("java.lang.String")){
      if(dont_test((String)test)) return new Integer(0);

      if(((String)test).length()==0){
          err=new err_vect(VALUE_NOT_FILLED,this);
          return default_value;
      }
      try{
       f=new Double((String)test);

       if(f.doubleValue() < min_value || f.doubleValue()> max_value ) throw new NumberFormatException();  

       long x=Math.round((f.doubleValue()*100));

       return new Double(x/100.);

      } catch (NumberFormatException s){ 
        err=new err_vect(INVALID_INPUT_TYPE,this);          
      }
    } else {
     err=new err_vect(INVALID_INPUT_TYPE,this);
    }
    return default_value;
  }

  public static double trunc(double val){
       long x=Math.round(val*100);
       return (double)x/100.;
  }

  public static String str(double val){
      String m=""+val;
      String kop;
      if(m.indexOf(".")!=-1){
         kop=m.substring(m.indexOf("."));
         if(kop.length()==2) m+="0";
      } else m+=".00";
      return m; 
  }

  public String get_type_string(String db_type){ return "double precision NOT NULL"; }

}
