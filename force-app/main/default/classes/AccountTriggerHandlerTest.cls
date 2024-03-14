@isTest
public  class AccountTriggerHandlerTest {
   @isTest
   public static void testInsertDesc(){
    Account acc= new Account();
        acc.Name='SI jane';
        acc.industry='Energy';
        acc.Active__c='Yes';

        Account acc2= new Account();
        acc2.Name='UI Jamie';
        acc2.industry='Energy';
        acc2.Active__c='yes';
        Account acc3= new Account();
        acc3.Name='SI je';
        acc3.industry='Energy';
      
        List<Account> listAcc= new list<Account>{acc, acc2, acc3};
        insert listAcc;

        //Assertation
        List<Account> accounts= [select id, Description, Active__c from Account WHERE Active__c='yes'];
      System.assert(accounts[0].Description.contains('Active'));

       
        
   }
   @isTest
   public static void testUpdateDesc(){
    //Insert
      Account acc= new Account();
        acc.Name='SI jane';
        acc.industry='Energy';
       

        Account acc2= new Account();
        acc2.Name='UI Jamie';
        acc2.industry='Energy';
        
        Account acc3= new Account();
        acc3.Name='SI je';
        acc3.industry='Energy';
      
        List<Account> listAcc= new list<Account>{acc, acc2, acc3};
        insert listAcc;
      //update
        acc.Active__c='Yes';
        acc2.Active__c='Yes';
        acc3.Active__c='Yes';
        List<Account> listAcc2= new list<Account>{acc, acc2, acc3};
        update listAcc2;

        //Assertation
        List<Account> accounts= [select id, Description, Active__c from Account WHERE Active__c='yes'];
      System.assert(accounts[0].Description.contains('Active'));

       
        
   }

   @isTest
   public static void updatVipc(){
      //prepare data
      Account acc= New Account();
      acc.Name='Josephine';
      acc.Industry='Banking';

      Account acc2= New Account();
      acc2.Name='Napoleon';
      acc2.Industry='Energy';

      List<Account> listAcc= new list<Account>{acc, acc2};
      insert listAcc;

         List<Contact> listCnt= New List<Contact>();
         for (Integer i = 0; i < 200; i++) {
            Contact cnt= new Contact();
            cnt.LastName='Test Soql';
            if (i<100) {
               cnt.AccountId=acc.Id;
            }else {
               cnt.AccountId=acc2.Id;
            }
            listCnt.add(cnt);
         } insert listCnt; //prepare data
         //update vip of Accounts
     /* for (Account eachAcc : listAcc) {
         eachAcc.VIP__c=true;
         eachAcc.Description='Updated';
      }*/
      acc.VIP__c=true;
      acc2.VIP__c=true;
      //Dml Will fire again
      update listAcc;
      List<Contact> contacts= [select id, VIP__c from Contact];
      system.assertEquals(true, contacts[0].VIP__c);
   }
}