@isTest
public  class AccountsbatchTest {
    @isTest
    public static void accountBatchTest(){
    List<Account> listAcc= new List<Account>();
    for (Integer i = 0; i < 900; i++) {
        Account acc =new Account();
        acc.Name='Batch Test' +i;
        acc.Industry='Citi Bank';
        listAcc.add(acc);
    }
    insert listAcc;
   
    test.startTest();
    AccountsBatch ab= new AccountsBatch();
    Database.executeBatch(ab, 900);
    test.stopTest();
    list<Account> listAc= [select id, description from Account];
    System.assert(listAc[0].Description.contains('batch'));

}
}