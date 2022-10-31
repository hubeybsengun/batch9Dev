@istest
public class CalculatorTest {
    @istest
    //priv yada public farketmez static olcak ve pembe parentez icine deger alamaz
    
    private static void testCalculator() {
        Calculator calc= new Calculator();
        calc.printNewMessage('this is coming from a test method.');
        
    }
    @istest
    private static void testCalPrint2() {
        Calculator calc = new Calculator();
        string returnmsg = calc.returnMessage('this is coming from a test method, again. so chill.');
        string expectedReturnMsg = 'this is coming from a test method, again. so chill....OK Cool';
        system.assertEquals(expectedReturnMsg, returnmsg);
    }
}
