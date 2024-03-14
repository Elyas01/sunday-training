public  class ContactTriggerHandler {
   public static void contUpdateValidation1(List<Contact> conTriggerNew, List<Contact> conTriggerOld,
                                            Map<Id,Contact> conTriggerNewMap, Map<Id,Contact> conTriggerOldMap){
        // 
            for (Contact eachCon : conTriggerNew) {
                //Check if existing LEAD SOURCE is Partner Referral
                //old contact record
                Contact  oldContact=conTriggerOldMap.get(eachCon.id);
                //If we use trigger new here while inserting it wont allow us to select 'Partner Referral'
                if (oldContact.LeadSource=='Partner Referral' ) {
                    // We cant update contact record
                    eachCon.addError('Cannot update \'partner Referral \' Contacts ');
                }
        }
   }
   public static void contUpdateValidation2(List<Contact> conTriggerNew, List<Contact> conTriggerOld,
                                            Map<Id,Contact> conTriggerNewMap, Map<Id,Contact> conTriggerOldMap){

    for (Contact eachcon : conTriggerNew) {
        
        if (eachcon.LeadSource != conTriggerOldMap.get(eachcon.Id).LeadSource) {
            //How to fetch custom label in apex?
            string customMessage= system.label.ContactValidation2;
            eachcon.LeadSource.addError(customMessage);

       }
     }        
   }
}