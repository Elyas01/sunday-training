string cronExp='0 0 13 * * ?';
AccountSchedulable ac =new AccountSchedulable();
system.schedule('accUpdateCron Thing', cronExp, ac);