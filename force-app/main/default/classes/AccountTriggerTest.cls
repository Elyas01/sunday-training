@isTest
public class AccountTriggerTest {
   @isTest
   public static void testUpdateDescription(){
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
        acc.Name='Update';
        update acc;
   }
}