@RestResource(urlMapping='/Contact/*')
Global with sharing class ContactManager {
  
    @HttpGet
    global static Contact getContact(){
        RestRequest request= RestContext.request;
        string uri=request.requestURI;
        String contactId=uri.substringAfterLast('/');
        Contact con=[Select Id, FirstName, LastName, Title, Email,Department From Contact Where Id=:contactId];
        return con;
    }
    @HttpPost
    global static Id postContact(String FirstName,String LastName, String Title, String Email, String Department){
        Contact con = New Contact();
        con.FirstName=FirstName;
        con.LastName=LastName;
        con.Title= Title;
        con.Email=Email;
        con.Department=Department;
        insert con;
        return con.Id;
    }
    @HttpDelete
    global static string deleteContact(){
        RestRequest request= RestContext.request;
        string uri=request.requestURI;
        string conId=uri.substringAfterLast('/');
       Contact con= [Select Id from Contact where id =:conId];
       delete con;
       return 'Contact Deleted successfully';
    }
    @HttpPut
    global static Id putContact(string Id, String FirstName,String LastName, String Title, String Email, String Department){
        Contact con = New Contact();
        con.FirstName=FirstName;
        con.LastName=LastName;
        con.Title= Title;
        con.Email=Email;
        con.Department=Department;
        upsert con;
        return con.Id;
    }
    @HttpPatch
    global static Contact patchContact(){
        RestRequest request=RestContext.request;
        string jsonString=request.requestBody.toString();
        Contact con=(Contact)JSON.deserialize(jsonString, Contact.class);
        update con;
        Contact conObj=[Select Id, FirstName, LastName, Title, Email,Department From Contact Where Id=:con.Id];
        return conObj;
    }

}