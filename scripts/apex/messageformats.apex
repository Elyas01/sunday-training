//Data
Account: Name=" Universal Containers", Type="New Customer", Industry="Education"

//JSON Message format/ We use this format always
{
    "Name" : "Universal Containers",
    "Type" : "New Customer",
    "Industry" : "Education",
    "Annualrevenue" : 3000000.00
}

//XML Message Format
<Account>
    <Name>Universal Containers</Name>
    <type>New Customer</Type>
    <Industry>Education</Industry>
    <AnnualRevenue>3000000.00</AnnualRevenue>
</Account>

//Get an account record and convert the same into JSON format - debug
Account acc= [SELECT Id , Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE Name='Burlington Textiles Corp of America'];
String jsonString = JSON.serialize(acc);
system.debug(jsonString);

//Get 10 Accounts and convert them into JSON format - debug
List<Account> accounts= [SELECT Id , Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE Type != null
                AND Industry != null
                LIMIT 10];
String jsonString = JSON.serialize(accounts);
system.debug(jsonString);
//Get an opportunity record whose amount is greater than 5M and Convert the same into JSON Format - debug
Opportunity opp = [SELECT id, Name ,Type, Amount FROM Opportunity Where Amount > 5000000 limit 1];
string jsonString2=JSON.serialize(opp);
system.debug(jsonString2);

// get 10 opportunity
List<Opportunity> opp = [SELECT id, Name ,Type, Amount 
                    FROM Opportunity
                    WHERE type !=null
                    AND Amount !=null
                    LIMIT 10];
string jsonString2=JSON.serialize(opp);
system.debug(jsonString2);