public class SoqlDemo {
    public static void accountsoql() {
        //SOQL query returns List<sObjects>
        List<Account> listAcc = [ SELECT Id, Name, Phone, Active__c FROM Account where Name LIKE '%A%'];
        system.debug('account list---' + listAcc);
        System.debug('number of records ' + listAcc.size());

        //SOQL can return only sObjects if it is returning ONLy 1 RECORD
        Account acc = [select id, name, phone FROM Account ORDER BY CreatedDate DESC LIMIT 1];
        System.debug('acc is '+ acc);
    }
    public static void accountsoql2(){
        Account acc=[select id, name, phone, AccountNumber from Account ORDER BY CreatedDate DESC LIMIT 1 ];
        system.debug('acc is'+ acc);

        string accName= acc.Name;
        string accPhone= acc.Phone;

        system.debug('acc name is ' + accName + ' acc phone is ' + accPhone);
        system.debug('acc acount number is '+ acc.AccountNumber);
        System.debug('-----');
    }
    public static void accountsoql3(){
        List<Account> listacc= [select id, name, phone, AccountNumber from Account ORDER BY CreatedDate DESC ];
        system.debug('listacc is'+ listacc);
        
        for ( Account eachaccount: listacc) {
            string accname= eachaccount.Name;
            string accphone=eachaccount.phone;
            //to fitch field values we use
            System.debug('Acc Name is ' + accname);
            System.debug('Acc Phone is ' + accphone);
            System.debug('Acc Account Number is ' + eachaccount.AccountNumber);
            System.debug('-----');
        }
    }
    public static void accountsoqlfilter(){
        /*List<Account> listacc=[select id, name from Account where Name = 'Salesforcce Inc.'];
            system.debug(listacc);*/
        string accname='Salesforce Inc.';
        List<Account> listacc=[select id, name from Account where Name = :accname ];
        system.debug(listacc);
    }
    //Dynamic , passing account name in parametera
    public static void accountsoqlfilter(string accname){
        //Get Account where name= accname
        List<Account> listacc = [select id, name from Account where name = :accname];
        system.debug('list acc is ' + listacc);
    }
}