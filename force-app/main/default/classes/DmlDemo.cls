public with sharing class DmlDemo {
    public static void dmlInsertDemo(){
        Account acc= new Account();
        acc.Name='Jane';
        acc.Phone='12345';
        insert acc;
    }
    public static void dmlInsertCstm(){
        Salesforce_Project__c cstm= new Salesforce_Project__c();
        cstm.Project_Name__c='Test Methods';
        cstm.Description__c='All are Doing Great';
        cstm.Status__c='New';
        insert cstm;
    }
}