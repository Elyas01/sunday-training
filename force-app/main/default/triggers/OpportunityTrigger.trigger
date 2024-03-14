trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {

    if (trigger.isBefore && trigger.isUpdate) {
        for (Opportunity opp : trigger.new) {
            system.debug('new opp name and amount ' + opp.name +' ' + opp.amount);
            system.debug('old opp name and amount ' + oldMap.name +' ' + oldMap.amount);
            Opportunity oldMap=trigger.oldMap.get(opp.Id);
            if (oldMap.StageName !=opp.StageName) {
                System.debug(opp.Description+ '---'+ opp.Name);
            }
        }
    }
}
