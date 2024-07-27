trigger AirlinesTrigger on Airlines__c (after insert) {

    if (trigger.isAfter && trigger.isInsert ) {
        AirlinesHandler.afterinsert(trigger.new);
    }
}