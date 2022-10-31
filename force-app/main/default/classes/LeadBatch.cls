public  class LeadBatch implements database.Batchable<SObject>, database.stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator ql = database.getQueryLocator([select id, description from Lead]);
        return ql;
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for (Lead acc : scope) {
            acc.Description += 'Updated from Batch Apex';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Batch over');
    }
}
