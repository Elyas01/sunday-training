@isTest
public with sharing class CovidInfoTest {
    @isTest
    private static void getCovidTest(){
        Covid_Info__c ci= new Covid_Info__c();
        ci.name='Test';
        ci.Positive__c=123;
        ci.Negative__c=123;
        ci.Pending__c=123;
        insert ci;
        Covid_Info__c ci1= new Covid_Info__c();
        ci.name='Test';
        ci.Positive__c=123;
        ci.Negative__c=123;
        ci.Pending__c=123;
        update ci;
        Test.startTest();
        CovidInfoRestCalloutMock mock= new CovidInfoRestCalloutMock();
        test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response= CovidInfoRestCallout.getCovidInfo();
        Test.stopTest();
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
        
    }
}