public with sharing class AirlinesCallouts {

   @future(callout=true) //if you dont mention it it means callout = false
   //future method doesnt return anyhting
    public static void postAtirlinesDetails(Id airlinesId){
        //prepare data
        Airlines__c air= [SELECT name, country__c, Logo_URL__c, slogan__c, Head_Quarters__c,Website__c,Establlished__c 
                          FROM Airlines__c
                          WHERE Id= :airlinesId];
        AirlinesWrapper wrap = new AirlinesWrapper();
        wrap.name=air.name;
        wrap.country=air.country__c;
        wrap.logo=air.Logo_URL__c;
        wrap.slogan=air.slogan__c;
        wrap.head_quaters=air.Head_Quarters__c;
        wrap.website=air.Website__c;
        wrap.established=air.Establlished__c;
        string body = JSON.serialize(wrap);

        //1.prepare HttpRequest and wrap all necessary in it
        HttpRequest request= new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setBody(body);
        request.setHeader('Content-Type', 'applicatoin/json');
        //2.prepare Internet
        Http http= new Http();
        //3.send the request over the internert to receive response back
        HttpResponse response= Http.send(request);
        //4.process the response
        air.Integration_Status__c = Datetime.now() 
            + ' ' + response.getStatusCode()
            + ' ' + response.getStatus()
            + ' ' + response.getBody();
            try {
                update air;
            } catch (Exception ex) {
                // create a log
            }
    }
}