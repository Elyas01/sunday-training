@isTest
public  class SoqlDemoTest {
    @TestSetup
    //Preparing Common Data.
    //it will run before testmethod runs.
    static void makeData(){
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
    }
    @isTest
    public static void soqldmlTest(){
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

        List<Contact> listCnt= new List<Contact>();
        for (Integer i = 0; i < 300; i++) {
            Contact cnt=new Contact();
            cnt.LastName='Soql Test' + i;
            if (i<100) {
                cnt.accountId=acc.id;
            }else if (i<200) {
                cnt.AccountId=acc2.id;

            }else if (i<300) {
                cnt.AccountId=acc3.id;
            }
            listCnt.add(cnt);
        }   insert listCnt;
        Test.starttest(); // this will reset the governor limit for our Method
        SoqlDemo2.childtoparent_soql1();
        Test.stopTest(); //after the stop it will resume from previous
    }
    @isTest
    public static void testParentToChild(){
        //1.Prepare Data
        //Accounts With Customer-Direct
        //Some Opportunities for those Accounts
        List<Account> listAcc=[select id, Name, type FROM Account];
        for (Account eachAcc : listAcc) {
            eachAcc.Type='Customer - Direct';
        }
        update listAcc;
        List<Opportunity> listOpp= new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity op= new Opportunity();
            op.Name='Test Opp' + i;
            op.StageName='Closed Won';
            op.CloseDate=date.today();
            listOpp.add(op);
            if (i<100) {
                op.AccountId=listAcc[0].Id;
            }else if (i<200) {
                op.AccountId=listAcc[1].Id;
            }if (i<300) {
                op.AccountId=listAcc[2].Id;
            }
        } insert listOpp;
        Test.startTest();
        SoqlDemo2.parenttochild_soql1();
        Test.stopTest();

        
    }
}