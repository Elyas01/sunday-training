//How to fetch records from custom settings?
//1. SOQL
//2.use getAll() and getInstance() methods.

//Map<id, Account> -->
//NAME--> Country_Code__c record
Map<String, Country_Code__c> allCountryCode=Country_Code__c.getAll();
system.debug(allCountryCode);
for(String eachCountry : allCountryCode.keyset()){
    Country_Code__c eachCC= allCountryCode.get(eachCountry);
    System.debug(eachCountry + 'Iso Code is .. ' + eachCC.iso_Code__c);
}
//account record --> billing country->united states
string c1='United States';
//get instance (NAME)
Country_Code__c c1Code=Country_Code__c.getInstance(c1);
string isoCodeC1= c1Code.iso_Code__c;
System.debug(c1+'isoCode is ' + isoCodeC1);

string c2='Canada';
system.debug(c2+' Iso Code is ' + Country_Code__c.getInstance(c2).iso_Code__c);