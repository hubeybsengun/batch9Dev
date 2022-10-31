public class Calculator2 {
   public Integer add(integer a, integer b){
    Integer sum = a+ b ;
    return sum;
   }
   public Integer add(integer a, integer b, Integer c){
    Integer sum = a + b + c;
    return sum;
   }
   public boolean leapYearCheck(date dt){
    integer  year = dt.year();
    boolean isLeap = date.isLeapYear(year);
    return isLeap;
   }
}
