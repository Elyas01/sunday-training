trigger LeadTrigger on Lead (before insert, Before update, After insert, After update) {

    if (trigger.isBefore && trigger.isInsert) {
        for (Lead eachLd : trigger.new) {
            if (eachLd.LeadSource=='Web') {
                system.debug('Rating should be cold');
            }else {
                system.debug('Rating should be hot');
            }
        }
    }
}

// trigger.oldMap.get(eachLd.Id).LeadSource!=trigger.newMap.get(eachLd.Id).LeadSource