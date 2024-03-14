trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {

    if (trigger.isBefore && trigger.isUpdate) {
        ContactTriggerHandler.contUpdateValidation1(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);

        ContactTriggerHandler.contUpdateValidation2(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}