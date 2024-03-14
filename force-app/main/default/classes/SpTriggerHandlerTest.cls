@isTest
public class SpTriggerHandlerTest {
    @isTest
    private static void testUpdateDescription(){
        //Prepare Data
        Salesforce_Project__c s1= new Salesforce_Project__c();
        s1.Project_Name__c='Test Method';
        s1.Status__c='New';
        s1.Description__c='All are great Learners';

        Salesforce_Project__c s2= new Salesforce_Project__c();
        s2.Project_Name__c='Test Method2';
        s2.Status__c='New';
        s2.Description__c='All are great Learners';

        List<Salesforce_Project__c> listSt= new List<Salesforce_Project__c>{s1,s2};
        insert listSt;
       
        //Future test this is how we get id for it
        Set<Id> spIds=new Set<Id>{s1.Id, s2.id};
        
        Test.startTest();
        SalesforceProjectTriggerHandler.updateDescription(spIds);
        Test.stopTest();

        List<Salesforce_Project__c> listSp=[select id, Description__c from Salesforce_Project__c];
        System.assert(listSp[0].Description__c.contains('future'));
    }
}