@isTest
public  class DmlDemoTest {
    @isTest
    public static void dmaInsertTest(){
        DmlDemo.dmlInsertDemo();

        List<Account> acc=[select id, Name from Account WHERE Name='Jane'];
       
        System.assertEquals(1, acc.size());
        system.assertEquals('Jane', acc[0].Name);
    }
    @isTest
    public static void dmlInsertCst(){
        DmlDemo.dmlInsertCstm();
        List<Salesforce_Project__c> listSp=[select id, Project_Name__c from Salesforce_Project__c WHERE Project_Name__c='Test Methods'];
        system.assertEquals(1, listSp.size());
        system.assertEquals('Test Methods', listSp[0].Project_Name__c);
    }

    


}