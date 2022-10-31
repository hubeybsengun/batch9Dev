trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {

        Map<Id, Salesforce_Project__c> newSFMap = trigger.newmap; 
    
        if(trigger.isAfter){ 
            for(id projectID : newSFMap.keyset()){ 
                    system.debug('Project name : ' + 
    newSFMap.get(projectID).Project_Name__c); 
            }
        }

           if (Trigger.isAfter && Trigger.isInsert) {
        //create default salesforce ticket.
        SalesforceProjectTriggerHandler.createDefaultSalesforceTicket(Trigger.New);
        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newmap.keySet());
}
        if (Trigger.isAfter && trigger.isUpdate) {
            SalesforceProjectTriggerHandler.spCompletedProject(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }


    
//     if(trigger.isBefore && trigger.isUpdate){
//     SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
// }






// if (trigger.isBefore && trigger.isInsert) {
//    for (Salesforce_Project__c eachSP : trigger.new) {
//     system.debug('Before insert project name=>'+eachSP.Project_Name__c+'  ID =>'+eachSP.Id);
//    } 
   
// }
// if (trigger.isAfter && trigger.isUpdate) {
//     for (Salesforce_Project__c eachSPold : trigger.old) {
//         system.debug('after update .old project name=>'+eachSPold.Project_Name__c+'  ID =>'+eachSPold.Id);
//        }  for (Salesforce_Project__c eachSPnew : trigger.new) {
//         system.debug('after update .new project name=>'+eachSPnew.Project_Name__c+'  ID =>'+eachSPnew.Id);
//        }  
// }

 }