trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update) {

    if (trigger.isAfter && trigger.isInsert) {
      SalesforceProjectTriggerHandler.createDefaultSalesforceTicket(trigger.new);// for sptriggerHandlerTest i turned it off
        System.debug('Calling the future method');
        SalesforceProjectTriggerHandler.updateDescription(trigger.newMap.keySet());
        system.debug('Done calling future method...');
    }

    if (trigger.isBefore && trigger.isUpdate) {
      //Validation
    //SalesforceProjectTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    //DML
    if (trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedStatus(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}