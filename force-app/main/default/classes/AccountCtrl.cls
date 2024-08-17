public with sharing class AccountCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts() {
        return [SELECT Id, Name,Type,Industry,AnnualRevenue 
            FROM Account
            WHERE AnnualRevenue != null 
            WITH SECURITY_ENFORCED // FIELD LEVEL SECURITY
            ORDER BY AnnualRevenue DESC 
            LIMIT 5];
    }
}

