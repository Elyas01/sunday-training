public  class SoqlVideo {
    

    public static void allContacts(){
        // get all contacts name, phone and email
        // soql returns list of sobject

        List<Contact> contatsList= [SELECT name, Phone, Email FROM contact];
        system.debug(contatsList);
    }
     public static void latestContact(){
        // lates contact limit 1 with it is name And Email it is one record
        contact latestContct=[SELECT name, Email FROM Contact order by createddate desc limit 1];
        // string cont=latestContct.name;
        system.debug('Contact name ' + latestContct.Name);
        system.debug('Contact Email ' + latestContct.Email);
     }
     
     public static void contactEmail(){
        //get all contacts where email is not null and print them

        List<Contact> listContact=[Select name,email from contact WHERE email !=''];
        System.debug(listContact.size());

        for (Contact eachCon : listContact) {
            System.debug('Contact name is ' + eachCon.Name.toUpperCase() + 'And Email is ' + eachCon.Email.toUpperCase());
        }

     }
     public static void contact(string fName){
        List<Contact> listCnt=[select id, FirstName, Email from Contact WHERE FirstName = : fName];
        system.debug(listCnt);
     }

}