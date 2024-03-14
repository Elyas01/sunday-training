// updating description of all accounts via batch class.
// getting statistics using stateful
public class AccountsBatch implements Database.Batchable<SObject>, Database.stateful {

    Integer count=0;  // Database.stateful is to find out how many times our batch run
    //1. Start Method
    public Database.QueryLocator start(Database.BatchableContext bc){
        //soql to fetch records
        //on account records
        System.debug('Batch Started');
        Database.QueryLocator ql=Database.getQueryLocator([select id, description from Account]);
        return ql;
    }
    //execute runs multiple times to update accounts
    public void execute(Database.BatchableContext bc, List<Account> scope){
        for (Account acc : scope) {
            acc.Description='Updated from batch';
        }
        count++;
       system.debug('Count '+ count);
        update scope;
        system.debug('We are in Execute Method');
            
    }
    //finfish method to pring number of times execute ran.
    public void finish(Database.BatchableContext bc){
        system.debug('End yes simple');
    }
}