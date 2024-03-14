AccountsBatch ab= new AccountsBatch();
Id batchId=database.executeBatch(ab, 20);
system.debug('Batch Id ==> '+ batchId);