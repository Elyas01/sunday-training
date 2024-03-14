public with sharing class ErrorLogHelper {
   
    public static void createErrorLog(string processName, string logDetails){
        insert new Error_Log__c(Log_Date_Time__c = Datetime.now(),
                                Process_Name__c = processName,
                                Log_Details__c= logDetails 
                                );

    }
        
}
