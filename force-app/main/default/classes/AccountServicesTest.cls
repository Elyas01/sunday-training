@isTest
public with sharing class AccountServicesTest {
  @TestSetup
  private static void makeData(){
    // prepare 3 accounts records
    List<Account> accs=new List<Account>();
    for (Integer i=0; i<3; i++) {
        Account acc= TestSuite.createAccount();
        accs.add(acc);
    }
    insert accs;
  }

  @isTest
  private static void getAccTest(){
    //prepare RestRequest
    Account acc= [select Id from account limit 1];
    string homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
    RestRequest request = new RestRequest();
    request.requestURI=homeUrl + '/services/apexrest/Account/' + acc.Id;
    request.httpMethod='GET';

    //Prepare RestContext
    RestContext.request=request;

    //Test Method

    Test.startTest();
    Case accObj=CaseServices.getCase();
    system.assertEquals(acc.Id, accObj.Id);
    Test.stopTest();
    

    
  }
  @isTest
  private static void postAccTest(){
    Test.startTest();
    Id accId= CaseServices.postAccounts('Other','Banking', 'Jnie');
    system.assertNotEquals(accId, null);
    Test.stopTest();
  }
  @isTest
  private static void deleteAccTest(){
    //prepare RestRequest
    Account acc= [select Id from account limit 1];
    string homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
    RestRequest request = new RestRequest();
    request.requestURI=homeUrl + '/services/apexrest/Account/' + acc.Id;
    request.httpMethod='GET';

    //Prepare RestContext
    RestContext.request=request;

    //Test Method

    Test.startTest();
    string status=CaseServices.deleteAccount();
    system.assertEquals('Account deleted successfully', status);
    Test.stopTest();
    

    
  }
  @isTest
  private static void putCaseTest(){
    Test.startTest();
    //1.Lets not pass case id and test
    Id accId=CaseServices.PuttAccount(null, 'Other', 'Banking', 'Test');
    System.assertNotEquals(null, accId);
    //2.Lets pass case id but update 2 field
    Id accId2=CaseServices.PuttAccount(accId, 'Prospect', 'Apparel', 'Test');
    System.assertEquals(accId, accId2);
    Test.stopTest();
  }

  @isTest
  private static void patchCaseTest(){
    //Prepare RestRequest
    Test.startTest();
    Account acc= [select id, priority, industry from Account Where priority='Other'  limit 1];
    acc.priority='Prospect';
    string jsonstring= JSON.serialize(acc);
    RestRequest request = new RestRequest();
    request.requestBody=blob.valueOf(jsonstring);
    request.httpMethod='PATCH';
    
    //Prepare RestContext
    RestContext.request=request;

    //Perform tests
    Case updatedCase= CaseServices.patchAccount();
    system.assertEquals('Prospect', updatedCase.Priority);
    Test.stopTest();

    //https://api.instantwebtools.net/v1/airlines
  }
}