@isTest
public class DmlDemo2Test {
  @isTest
    public static void dml2Cnt(){
        Account acc=new Account();
        acc.Name='Softinnovas';
        insert acc;
        DmlDemo2.dmlInsertDemo2();
        List<Contact> listacc=[select id,AccountId,LastName FROM Contact WHERE LastName='Biden'];
        System.assertEquals(1, listacc.size());
        System.assertEquals('Biden', listacc[0].LastName);
    }
    public static void dmlInsert3(){
        Salesforce_Project__c sp= new Salesforce_Project__c();
        sp.Project_Name__c='Josephine';
        sp.Description__c='Great';
        sp.Status__c='New';
        
        insert sp;
        DmlDemo2.dmlInsertDemo3();
        List<Salesforce_Ticket__c> listSt=[select id,Subject__c,Salesforce_Project__c from Salesforce_Ticket__c where Subject__c='Learn Apex Dml'];
        system.assertEquals(sp.Id, listSt[0].Salesforce_Project__c);
    }
}