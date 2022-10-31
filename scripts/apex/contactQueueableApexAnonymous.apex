List<Account> accList=[select id,name from account where active__c = 'Yes'];
ContactQueueableApex cq = new ContactQueueableApex(accList);
id jobId= system.enqueueJob(cq);
system.debug(jobId);