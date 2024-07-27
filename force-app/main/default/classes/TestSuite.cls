public with sharing class TestSuite {
  @isTest
     public static Case CreateCase(string Origin, string priority){
        Case cs =new Case();
        cs.subject='Test Subject';
        cs.Description='Test Description';
        cs.Origin=Origin;
        cs.Priority=priority;
        return cs;

     }
     public static Account createAccount(){
        Account acc= new Account();
        acc.name='Test';
        acc.type='Other';
        acc.Industry='Banking';

        return acc;
     }
}