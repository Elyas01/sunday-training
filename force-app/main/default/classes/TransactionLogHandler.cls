public with sharing class TransactionLogHandler {
    public static void doHandleEception(system.Exception ex , string processName){
        Error_Log__c transactionLog = new Error_Log__c(
        	Log_Details__c = ex.getStackTraceString() +'Required fields are missing' + ex.getMessage()
        	 + ex.getCause() +  + ex.getTypeName()+ +ex.getLineNumber(),
        	Log_Date_Time__c = system.now(),
        	Process_Name__c = processName
        	);
      insert transactionLog;
    }
}
