List<Account> accs = [select id, name from account];
AccountQueueableExample aq = new AccountQueueableExample(accs);
Id jobId = system.enqueueJob(aq);
system.debug(jobid);