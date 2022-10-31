trigger CaseTrigger on Case (before insert,before update) {
if (trigger.isInsert) {
    system.debug('before insert case');
}
if (trigger.isUpdate) {
    CaseTriggerHandler.countTriggerExecution++;
    system.debug('Case trigger execution count ==> '+CaseTriggerHandler.countTriggerExecution);
    CaseTriggerHandler.countTriggerRecords += Trigger.size;
    system.debug('Case trigger record count ==> '+CaseTriggerHandler.countTriggerRecords);
}

























    /*
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            system.debug('Before insert Case');
        }
        if (Trigger.isUpdate) {
            system.debug('Before Update Case');
        }
        if (Trigger.isDelete) {
            system.debug('Before delete Case');
        }
    }
    
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            system.debug('After insert Case');
        }
        if (Trigger.isUpdate) {
            system.debug('After Update Case');
        }
        if (Trigger.isDelete) {
            system.debug('After delete Case');
        }
    }
    */


}