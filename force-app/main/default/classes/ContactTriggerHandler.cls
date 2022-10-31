public class ContactTriggerHandler {
    public static void contactUpdateValidation1(List<Contact> contTriggerNew, List<Contact> contTriggerOld, map<id, Contact> contTriggerNewMap, map<id, contact> contTriggerOldMap) {

        for (contact eachCnt : contTriggerNew) {

            Contact oldcontact = contTriggerOldMap.get(eachcnt.Id);

            if (oldcontact.LeadSource == 'Partner Referral') {
                
                eachCnt.addError('Cannot update \'Partner Referral\' contact.');
            }
        }

    }


    public static void contactUpdateValidation2(List<Contact> contTriggerNew, List<Contact> contTriggerOld, map<id, Contact> contTriggerNewMap, map<id, contact> contTriggerOldMap) {

        for (contact eachContact : contTriggerNew) {
            if (eachcontact.LeadSource != contTriggerOldMap.get(eachContact.Id).LeadSource) {

                string customValidation = system.label.contactUpdateValidation2;
                eachContact.LeadSource.addError(customValidation);
                //eachContact.LeadSource.addError('CANNOT UPDATE LEADSOURCE!!!'); ust satir islemde
            }
        }

    }

    public static void updateAccNumberOfContacts(List<Contact> contTriggerNew, List<Contact> contTriggerOld){

        Set<Id> accountIds= new Set<Id>();



        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isundelete){
            for(contact eachCont: contTriggerNew){
                accountIds.add(eachcont.AccountId);
            }
        }

        if(Trigger.isUpdate || Trigger.isdelete){
            for(contact eachCont: contTriggerNew){
                accountIds.add(eachcont.AccountId);
            }
        }
        if(!accountIds.isempty()){
            ////all accounts in accountIds, and all its contacts using inner query
            // list<account> listAcc = [Select id, number_of_contacts__c,(SELECT id from contacts)from account where id in :accountIds];

            // List<Account> updateAcc = new list<Account>();
            // for(account eachAcc : listAcc){
            //     eachAcc.number_of_contacts__c = eachAcc.Contacts.size();
            //     updateAcc.add(eachACC);
            // }
            // update updateAcc;
            contUp(accountIds);
        }
        
    }
    @future
    public static void contUp(Set<Id> setIds){
        Account accList = [Select id,	Number_of_contacts__c, (select id from Contacts)
                            from Account where id in:setIds];
        List<Account> newAcc = new List<Account>();
        for(account each : accList) {
            each.Number_of_contacts__c = each.Contacts.size();
            newAcc.add(each);
        }
        update newAcc;
    }

}
