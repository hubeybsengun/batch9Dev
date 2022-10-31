public class CalculatorW {
    public static decimal dynamicCalulationMethod(decimal a, decimal b, String c) {
        decimal result = 0 ;

    
        switch on c {
            when 'addition' {
                result = a+b;
            }
            when  'subtraction' {
                result = a-b;
            } when  'multiplication'{
                result =a*b;
            } when 'division'{
                result =a/b;
            }when else {
                system.debug('ERROR!');
                result = null;
            }
        }
            return result;
    }
}
