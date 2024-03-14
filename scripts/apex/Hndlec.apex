try{
   Integer i= 10/0;
}catch(system.Exception ex){
    TransactionLogHandler.doHandleEception( ex, 'Required fields are mssing' );
}