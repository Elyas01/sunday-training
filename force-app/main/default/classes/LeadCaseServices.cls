@RestResource(urlMapping='/Lead/*')

global class LeadCaseServices {
    
    @HttpGet
    global static Lead getLead(){
      RestRequest  request=RestContext.request;
      string uri=request.requestURI;
      String leadId=uri.substringAfterLast('/');
      Lead ld=[SELECT Id, LastName, Company, Status FROM Lead where id =: leadId];
        return ld;
    }
    @Httppost
    global static Id postLead( String LastName, string Company, string Status){
        Lead ld= new Lead();

        ld.LastName=LastName;
        ld.Company=Company;
        ld.Status=Status;
        insert ld;
        return ld.Id;
    }
    @HttpDelete
    global static string deleteLead(){
     RestRequest request = RestContext.request;
     string uri =request.requestURI;
     string leadId=uri.substringAfterLast('/');
     Lead ld= [SELECT Id FROM Lead where Id =: leadId];
     delete ld;
 
     return 'Lead deleted successfully';
    }
    @HttpPut // the other method is also possible here " CaseService PutAccount"
   global static Lead upsertLead(){
    RestRequest request = RestContext.request;
    string requestBody= request.requestBody.toString();
    Lead ld= (Lead)JSON.deserialize(requestBody, Lead.class);

    upsert ld;
    return ld;

    }
    @HttpPatch
    global static Lead patchLead(){
     RestRequest request=RestContext.request;
     string jsonString=request.requestBody.toString(); //requestbody is blob thats why we converting to string.
     //Approachs
     Lead lead=(Lead)JSON.deserialize(jsonString, Lead.class);
     update lead;
     Lead accObj= [SELECT Id, LastName, Company, Status FROM Lead where Id =: lead.Id];
     return accObj;
    }
}