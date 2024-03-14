public class SoqlDemo2 {
    public static void childtoparent_soql1(){
        //list<sobjects> on whichever object we are doing query.
        List<Contact> listcontact=[select id, name, account.name from Contact
                        where account.industry= 'Energy'];
        for (Contact eachcontact : listcontact) {
            string accname=eachcontact.Account.Name;
            System.debug('Contact name is ' + eachcontact.name +' Acount name is ' + accname);
        }
    }
    public static void parenttochild_soql1(){
        List<Account> listaccwopp =[select id, name, annualrevenue, type,
                                     (select id, name, amount, stagename from opportunities where stagename='closed won')
                                      from account where type='customer - direct'];
        // account name, its annual revenue 
            //opp name--> amount-->
            for (Account eachacc : listaccwopp) {
                List<Opportunity> listOpp=eachacc.Opportunities;
                for (Opportunity Opp : listOpp) {
                    system.debug('opp name is'+ opp.Name);
                    system.debug('opp Amount is' + opp.Amount);
                }
            }
    }
}