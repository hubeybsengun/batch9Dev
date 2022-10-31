@istest
public class ContactQueueableApexTest {
    @testSetup
     static void makeData(){
       List<Account> accList = new  List<Account>();
       for(integer i = 0; i<100; i++){
            Account a = new Account();
            a.Name = 'Test Account ' + i;
            accList.add(a);
       }
       insert accList;
    }

    @istest
    private static void testQueueable(){
        List<Account> allAcc = [Select id, name from account];
        ContactQueueableApex cq = new ContactQueueableApex(allAcc);
        test.startTest();
        system.enqueueJob(cq);
        test.stopTest();
        List<Account> result= [Select id, name from account];
        system.assertEquals(100, result.size());
    }
}
