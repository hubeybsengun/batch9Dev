trigger SalesforceTicketTrigger on Salesforce_Ticket__c (before insert, before update, after insert, after update) {
    if (trigger.isBefore) {
        for (Salesforce_Ticket__c eachST : trigger.new) {
            Boolean updateDesc = false;
            if (trigger.isInsert && eachST.Priority__c == 'High') {
                updateDesc = true;
            }
            if (trigger.isUpdate) {
                if (eachST.Priority__c == 'High' && trigger.newMap.get(eachST.Id).Priority__c != trigger.oldMap.get(eachST.Id).Priority__c) {
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachST.Description__c='The tickect priority is HIGH. Work on it ASAP.';
            }
        }
    }
}