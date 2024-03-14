public  class AccountSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
    //You can write here any apex code.
    //you can call handler, or future method, or queueable, or batch, or anything.
    AccountsBatch ab= new AccountsBatch();
    database.executeBatch(ab);
}
}