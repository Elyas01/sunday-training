@isTest
public  class CalculatorTest {
   
    @isTest
    public static void simpleTest(){
    Calculator calc= new Calculator();
    calc.printNewMessage('Test Method');
    calc.printAndReturnMessage('Again test Method');
    calc.add(3, 11);
    calc.add(9, 3, 1);
   }
}