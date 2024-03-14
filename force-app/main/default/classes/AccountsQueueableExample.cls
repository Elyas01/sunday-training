public with sharing class AccountsQueueableExample implements Queueable {
   List<Account> listAccount;
    public AccountsQueueableExample(List<Account> accs) {
    listAccount=accs;
    }

    public void execute(QueueableContext qc){
        for (Account ac : listAccount) {
            ac.Name=ac.Name + '...SI';
        }
        update listAccount;
    }
}