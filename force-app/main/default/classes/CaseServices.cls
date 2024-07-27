@RestResource(urlMapping='/Account/*')
Global with sharing class CaseServices {
   //softinnovas-2af-dev-ed.my.salesforce.com/service/apexrest/Case
  //https://softinnovas-2af-dev-ed.my.salesforce.com/services/apexrest/Account/0018Z00002fXhJyQAK // RequestUri
    @HttpGet
   global static Account getCase(){
    RestRequest request=RestContext.request;  //RestContext. has two properties 1.request 2. response  // if you want to get the id you need to put Restcontext.request
    string uri=request.requestURI;
    string caseId=uri.substringAfterLast('/');
    Account cs =[select Id ,Name, Type, Industry FROM Account Where Id = :caseId];
    return cs;
   }
   //why we didnt convert our record into json ? because salesforce will do that fo us
  @HttpPost
   global static Id PostAccount (string Type, string Industry,string Name){

    Account acc=new Account();
    acc.Name=Name;
    acc.Type= Type;
    acc.Industry=Industry;

    insert acc;
    return acc.Id;
   }
   @HttpDelete
   global static string deleteAccount(){
    RestRequest request = RestContext.request;
    string uri =request.requestURI;
    string accId=uri.substringAfterLast('/');
    Account acc= [SELECT Id FROM Account where Id =: accId];
    delete acc;

    return 'Account deleted successfully';
   }
   @HttpPut
   global static Id PuttAccount(String Id, string Type, string Industry,string Name){

    Account acc=new Account();
    acc.Id=Id;
    acc.Name=Name;
    acc.Type= Type;
    acc.Industry=Industry;

    upsert acc;
    return acc.Id;

   }
   @HttpPatch
   global static Account patchAccount(){
    RestRequest request=RestContext.request;
    string jsonString=request.requestBody.toString(); //requestbody is blob thats why we converting to string.
    //Approach
    Account acc=(Account)JSON.deserialize(jsonString, Account.class);
    update acc;
    account accObj= [select id , type, industry, name from Account where id = :acc.id];
    return accObj;
   }
  /* @Httppost
   global static List<Account> postAccounts(){
    RestRequest request = RestContext.request;
    string jsonString= request.requestBody.toString();
    List<Account> accs= (List<Account>)JSON.deserialize(jsonString, List<Account>.class);
    insert accs;
    return accs;
   }*/

}

/* split()
string str = 'boo:moo:voo';
str.split(':'); ['boo', 'moo', 'voo'];

string uri = 'https://softinnovas-2af-dev-ed.my.salesforce.com/service/apexrest/Case/5008Z00002KWBFEQA5';
string[] words = uri.split('/')'
[
    'https:',
    '',
    'softinnovas-2af-dev-ed.my.salesforce.com',
    'service',
    'apexrest',
    'Case',
    '5008Z00002KWBFEQA5'


]'
*/