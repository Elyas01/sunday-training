public with sharing class CovidInfoRestCallout {
    
    Public static HttpResponse getCovidInfo(){

        //1.Prepare HTTPREquest and wrap the necessary information
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');

         //2.prepare internet 
        Http http= new Http();

        //3.send the request over the internet to receive response
        HttpResponse response=http.send(request);

        //4.process the response
        if (response.getStatusCode()==200) {
           String jsonstring= response.getBody();
           List<CovidInfoWrapperClass> wrappers =(List<CovidInfoWrapperClass>)JSON.deserialize(jsonString, List<CovidInfoWrapperClass>.class);
           CovidInfoWrapperClass wrapper =wrappers[0];

           //Check for existing records todays date 
          List <Covid_Info__c> infos=[SELECT id ,Name, Positive__c,Negative__c, Pending__c FROM Covid_Info__c WHERE Received_Date__c = TODAY];
            if (!infos.isempty()) {
                infos[0].name=wrapper.states.toString();
                infos[0].Positive__c=wrapper.positive;
                infos[0].Negative__c=wrapper.Negative;
                infos[0].Pending__c=wrapper.pending;
                infos[0].Received_Date__c=date.today();
                update infos[0];
           
            }else {

                Covid_Info__c info= new Covid_Info__c();
                info.name=wrapper.states.toString(); // Illegal assignment from integer to string = tostring();
                info.Positive__c=wrapper.positive;
                info.Negative__c=wrapper.Negative;
                info.Pending__c=wrapper.pending;
                info.Received_Date__c=date.today();

                insert info;
            }
        }


        return response;
    }
}