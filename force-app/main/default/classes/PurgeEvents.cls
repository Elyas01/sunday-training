public with sharing class PurgeEvents implements Database.Batchable<sObject>, Schedulable{

    public void execute(SchedulableContext ac){
        Database.executeBatch(new PurgeEvents());
    }

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id
                                        FROM Event__c
                                        WHERE 	End_Date_Time__c<=: Datetime.now().addMonths(-2)
                                        AND Live__c= false
                                        ]);
    }

    public void execute(Database.BatchableContext bc, List<Event__c> events){
        delete events;
    }
    
    public void finish(Database.BatchableContext Bc){
        set<Id> userIds= new set<Id>();
        for(GroupMember grpm : [ SELECT UserOrGroupid FROM GroupMember WHERE Group.Name = 'Daily Job']){
            userIds.add(grpm.UserOrGroupid);
        }
        set<string> emailaddresses = new Set<String>();
        for(User user : [SELECT Email FROM User WHERE IsActive = true AND Id In:userIds]){
            emailaddresses.add(user.Email);
        }
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Event Job Completed');
        mail.setSenderDisplayName('Salesforce Developer');
        mail.setplainTextBody('You can check Apex Jobs');
        mail.setHtmlBody('Event Job is completed check the setup');
        mail.setToAddresses(new List<string>(emailaddresses));
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
    }
        
}
