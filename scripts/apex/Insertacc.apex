List<Account> newAcc = new List<Account>();

Account acc= new Account();
acc.name='database.insert';
acc.Phone='12345';
newAcc.add(acc);

Account acc2= new Account();
acc2.name='database insert';
acc2.Phone='12345';
newAcc.add(acc2);

Account ac1= new Account();
newAcc.add(ac1);
Account ac2= new Account();
newAcc.add(ac2);
//insert newAcc; // this will give error even if anyone refcord has error in it. none will be inserrted
//Database.insert(newAcc, true);//this will error even if anyone refcord has error in it. none will be inserrted
List<database.SaveResult> results=Database.insert(newAcc, false);// this will error only for bad guys, THE GOOD ONES WILL BE INSERTED

for(Database.SaveResult eachR : results){
    //Check if records inserted successfully
    if(eachR.isSuccess()){
        System.debug('Records inserted successfully' + eachR.getId());
    }else{
        System.debug('Failed ' + eachR.getErrors());
    }
}

