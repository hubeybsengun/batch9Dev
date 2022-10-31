public with sharing class ContactQueueableApex implements Queueable{

        List<Account> accList;    
    public ContactQueueableApex(List<Account> accList){
        this.accList = accList;
    }
    public void execute(QueueableContext qc){
        List<Contact> listCon = new  List<Contact>();
        for(account each: accList){
            contact c = new Contact();
            c.LastName = 'Queueable test cont';
            c.AccountId=each.Id;
            listCon.add(c);
        }
            insert listCon;
        
    }
}
