trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('---Start---');
    if (trigger.isBefore) {
       AccounTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && trigger.isUpdate) {
        AccounTriggerHandler.updateVIPforAllContacts(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    System.debug('---End---');
}

/*
  Map<Id,Account> oldAccMap= trigger.oldMap;
   Map<Id,Account> newAccMap= trigger.newMap;
    if (trigger.isBefore && trigger.isUpdate) {
        Set<Id> setAccIds= newAccMap.keySet();
        Integer countWSupdated=0;
        for (Id eachId : setAccIds) {
            Account newAccount=newAccMap.get(eachId);
            string newWebsite=newAccount.Website;

            Account oldAccount= oldAccMap.get(eachId);
            String oldWebsite=oldAccount.Website;

            if (oldWebsite != newWebsite) {
                countWSupdated++;
                system.debug('For Account ' + newAccount.Name + ' Website is changed to ' + newWebsite );
            }
             
        }system.debug('Number of Account websites updated--->' + countWSupdated);
    }
*
if (trigger.isAfter && trigger.isUpdate) {
    Set<Id> setAccId= newAccMap.keySet();
    
    for (Id eachid : setAccId) {
        system.debug('Each id which is also key of maps ' + eachid);
        Account acc=newAccMap.get(eachid);
        system.debug('New Account Name ' + acc.Name);
        Account oldAcc= oldAccMap.get(eachid);
        system.debug('Old account name ' + oldAcc.Name);
    }
}
*
  Map<Id,Account> oldAccMap= trigger.oldMap;
   Map<Id,Account> newAccMap= trigger.newMap;
   if (trigger.isBefore && trigger.isInsert) {
    system.debug('Before insert old map ' + oldAccMap);
    system.debug('Before insert new map ' + newAccMap);
}
if (trigger.isAfter && trigger.isInsert) {
    system.debug('After insert old map ' + oldAccMap);
    system.debug('After insert new map ' + newAccMap);
}
if (trigger.isBefore && trigger.isUpdate) {
    system.debug('Before update old map ' + oldAccMap);
    system.debug('Before update new map ' + newAccMap);
}
if (trigger.isAfter && trigger.isUpdate) {
    system.debug('After update old map ' + oldAccMap);
    system.debug('After update new map ' + newAccMap);
}
*
 // true for both after insert and after update
    if (trigger.isAfter) {
        List<Account> newAccounts= trigger.new;
        Set<id> accId= new Set<Id>();
        for (Account acc : newAccounts) {
            accId.add(acc.Id);
        }
        system.debug('set of acc ids ' + accId);
    }
*
   if (trigger.isAfter && trigger.isUpdate) {
        //List <Account> oldAccounts = trigger.old;
        for (Account eachacc : trigger.old) {
            system.debug('After update trigger old id ' + eachacc.Id + ' After update trigger old name ' + eachacc.Name);
        }
        //List<Account> newAccounts = trigger.new;
        for (Account eachacc : trigger.new) {
            system.debug('After update trigger new id ' + eachacc.Id + ' After update trigger new name ' + eachacc.Name);
        }
    }
*

    if (trigger.isBefore && trigger.isInsert) {
        system.debug('Before insert trigger old ' + trigger.old);
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('After insert trigger old ' + trigger.old);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('Before update trigger old ' + trigger.old);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('After update trigger old ' + trigger.old);
    }
*
List<Account> newAccounts=Trigger.new;
    system.debug('Accounts size '+ newAccounts.size());
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('Before insert trigger ' + newAccounts);
        for (Account eachacc : newAccounts) {
            system.debug('Before acc id ' + eachacc.Id + 'Before acc Name ' +eachacc.Name);
        }
    }
    if (trigger.isAfter && trigger.isInsert) {
        System.debug('After insert  ' + newAccounts);
        for (Account eachacc : newAccounts) {
            system.debug('After acc id ' + eachacc.Id +'After acc Name ' + eachacc.Name);
        }
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('Before insert trigger ' + newAccounts);
        for (Account eachacc : newAccounts) {
            system.debug('Before acc id ' + eachacc.Id + 'Before acc Name ' +eachacc.Name);
        }
    }
    if (trigger.isAfter && trigger.isUpdate) {
        System.debug('After insert  ' + newAccounts);
        for (Account eachacc : newAccounts) {
            system.debug('After acc id ' + eachacc.Id +'After acc Name ' + eachacc.Name);
        }
    }
*
  List<Account> newAccount=Trigger.new;
   if(trigger.isAfter){
    System.debug('after trigger.new' + newAccount);
    System.debug('New Accounts Size ' + newAccount.size());
   }
This is not common to use
  //Will be true before insert & before Update
   if(trigger.isBefore){
    System.debug('We are in before trigger');
   
   if(trigger.isInsert){
    System.debug('Before insert trigger called');
   }
   if(trigger.isUpdate){
    System.debug('Before update trigger called');
    }
   }

   //Will be true after insert & after update
   if(trigger.isAfter){
    System.debug('We are in after trigger');
   
   if(trigger.isInsert){
    System.debug('After insert trigger Called');
   }
   if(trigger.isUpdate){
    System.debug('After update trigger Called');
    }
   }
  */
   /*
   This One is more common to use
if(trigger.isBefore && trigger.isInsert){
    System.debug('Before insert trigger called');
   }
   if(trigger.isAfter && trigger.isInsert){
    System.debug('After insert trigger called');
   }
   if(trigger.isBefore && trigger.isUpdate){
    System.debug('Before Update trigger called');
   }
   if(trigger.isAfter && trigger.isUpdate){
    System.debug('After Update trigger called');
   }
   */


    /*  if(trigger.isInsert){
        system.debug('before insert trigger is Called');
     }
     if(trigger.isUpdate){
        system.debug('before update trigger is called');
     }*/

     
   /* if(trigger.isBefore){
        system.debug('before insert trigger');
    }
    if(trigger.isAfter){
        system.debug('After insert trigger');
    }*/
