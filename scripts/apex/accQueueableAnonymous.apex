List<Account> accounts= [select id, name from account];// the first two line is instance of class since we accepting list of accounts as parameter.
AccountsQueueableExample aq= new AccountsQueueableExample(accounts);
Id jobId=system.enqueueJob(aq);