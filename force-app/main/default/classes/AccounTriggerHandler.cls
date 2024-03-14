public class AccounTriggerHandler {
   public static void updateAccountDescription(List<Account> accTriggerNew, List<Account> accTriggerOld, 
                                            Map<Id,Account> accTriggerNewMap, Map<Id,Account> accTriggerOldMap){

        Map<Id,Account> newAccMap=acctriggerNewMap;
       Map<Id,Account> oldAccMap=accTriggerOldMap;
        for (Account eachAcc : acctriggernew) {
           // Boolean updateDesc=false;
            if (trigger.isInsert && eachAcc.Active__c=='Yes') {
               // updateDesc=true;
               eachAcc.Description='Acount is Now Active. Enjoy buddy';
            }
            if (trigger.isUpdate) {
                //id accIds=eachAcc.Id;
                Account oldAccount=oldAccMap.get(eachAcc.Id);
               Account newAccount=newAccMap.get(eachAcc.Id);
                if (eachAcc.Active__c=='Yes' && oldAccount.Active__c != eachAcc.Active__c) {
                  // updateDesc=true;
                  eachAcc.Description='Acount is Now Active. Enjoy buddy';
                }

                /*if (updateDesc) {
                    eachAcc.Description='Acount is Now Active. Enjoy buddy';
                }*/
            }
        }
   }

   public static void updateVIPforAllContacts(List<Account> accTriggerNew, List<Account> accTriggerOld, 
                                            Map<Id,Account> accTriggerNewMap, Map<Id,Account> accTriggerOldMap){

    //we need accounts that vip field is changed
    Set<Id> accountIds= new Set<Id>();
    system.debug('Account Ids ' + accountIds);
    for (Account eachAcc : accTriggerNew) {
        if (eachAcc.vip__c != accTriggerOldMap.get(eachAcc.Id).vip__c) {
            system.debug('Account Ids ' + accountIds);
            accountIds.add(eachAcc.Id);
        }
    }
    //get all contats which their account vip field is changed
  
        
    //                              all contacts for this particular account'accountids'
    List<Contact> listContacts = [SELECT Id, vip__c, Account.Id, Name FROM Contact where account.Id in :accountIds];
    system.debug('List of contacts' + listContacts);
    for (Contact eachcon : listContacts) {
        Account newAcc= accTriggerNewMap.get(eachcon.Account.Id);
        Boolean vipAcc= newAcc.vip__c;
        //to change the contact vip field
        eachcon.vip__c = vipAcc;
    }
    update listContacts;
    
   }
   
}