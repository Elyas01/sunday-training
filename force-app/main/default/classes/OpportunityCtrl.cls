public with sharing class OpportunityCtrl {
@AuraEnabled(cacheable=true)
public static List<Opportunity> getOpportunity(string stage) {
    return [SELECT Id, Name, Type, StageName, Amount 
            FROM Opportunity
            WHERE StageName=:stage
            WITH SECURITY_ENFORCED
            ORDER BY Amount DESC //highest amount
            LIMIT 5];

    }
}