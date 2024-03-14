try {
    List<Account> la; // null
    Account ac = new Account();
    la.add(ac);
    
insert ac;
} catch(DmlException de){
    system.debug('Dml went wrong');
}
catch (Exception e) {
    system.debug('Something went wrong ');
}
system.debug('Apex is simple');