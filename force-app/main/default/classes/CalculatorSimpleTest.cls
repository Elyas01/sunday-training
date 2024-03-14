@isTest
public  class CalculatorSimpleTest {
    @isTest
    private static void simpleTest(){

     Integer sum =CalculatorSimple.add(20, 31);
     Integer expectedSum=51;
     system.assertEquals(expectedSum, sum, 'Two Params');

     Integer sum2=CalculatorSimple.add(7, 9, 11);
     Integer expected2=27;
     system.assertEquals(expected2, sum2, '3 params');

    }
}