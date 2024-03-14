trigger CaseTrigger on Case (before insert, before update) {
if (trigger.isInsert) {
    system.debug('Before insert');
}

if (trigger.isUpdate) {
    CaseTriggerHandler.countTrigger++;
    system.debug('Number of # Trigger run' + CaseTriggerHandler.countTrigger);
    CaseTriggerHandler.countTriggerRecords +=trigger.size;
    system.debug('Number of # Records' + CaseTriggerHandler.countTriggerRecords);
}
    








//if (trigger.isBefore && trigger.isInsert) {
    for (case cas : trigger.new) {
        if (cas.origin=='Email') {
            cas.Status='working';
            cas.Priority='Medium';
        }
    }
//}
   
}

/* 
if (trigger.isBefore && trigger.isUpdate) {
    for (Case caseRec : trigger.new) {
        if (caseRec.Origin!='null' && trigger.oldMap.get(caseRec.Id).Origin!=trigger.newMap.get(caseRec.Id).Origin) {
            system.debug(caseRec.Origin +'Case origin is changed for ' + caseRec.CaseNumber);
        }
    }
   }
//week5
 when a case is created show this message
    if (trigger.isAfter) {
        for (Case eachCase : trigger.new) {
            if (trigger.isInsert) {
                system.debug('Case# ' +eachCase.CaseNumber +' was created with id ' + eachCase.Id + ' on ' + eachCase.CreatedDate);
            }
        }
    }
*
if (trigger.isAfter) {
        system.debug('We are in the after triggers');
    }
    if (trigger.isBefore) {
        system.debug('We are in before triggers');
    }if (trigger.isBefore && trigger.isUpdate) {
        system.debug('We are in before update triggers');
    }if (trigger.isBefore && trigger.isInsert) {
        system.debug('We are in before insert trigger');
    }if (trigger.isAfter && trigger.isInsert) {
        system.debug('We are in after insert trigger');
    }if (trigger.isAfter && trigger.isUpdate) {
        system.debug('We are in after update trigger');
    }*/

