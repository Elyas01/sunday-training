public with sharing class LeadCtrl {

    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
        return [SELECT FirstName, LastName, Title, Company 
                FROM Lead
                WHERE Title!=null
                AND Company!=null
                ORDER BY CreatedDate DESC
                LIMIT 4];
    }
}