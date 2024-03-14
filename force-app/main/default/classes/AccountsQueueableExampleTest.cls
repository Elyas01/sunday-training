@isTest
public with sharing class AccountsQueueableExampleTest {
   @TestSetup
   static void setup(){
    List<Account> listAcc= new List<Account>();
    for (Integer i = 0; i < 100; i++) {
        listAcc.add(new Account(
            Name='Test Account'+i
        ));
    }
    insert listAcc;
   }
   static testMethod void testQueueable(){
    // query for test data to pass to queueable class
    List<account> accounts= [select id ,name from account where name like 'Test Account%'];
    // create our queueable instance
    
    //Start test/stop test block to forffce async processes to run
    test.startTest();
    AccountsQueueableExample accQobj= new AccountsQueueableExample(accounts);
    system.enqueueJob(accQobj);
    test.stopTest();
    Integer count=[select COUNT() from Account where name like '%SI%'];
    System.assertEquals(100, count);
   }
}