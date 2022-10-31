@istest
public class AccountsBatchTest {
    @istest
    private static void testBatch1(){
        //1. prepare data
        List<account> listAcc = new list<account>();
       for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'test acc batch'+i;
            listAcc.add(a);
        }
        insert listAcc;

        //2. starttest, stoptest
        Test.startTest();
        AccountsBatch ab =new AccountsBatch();
        Database.executeBatch(ab, 950);
        Test.stopTest();

        //3.assertion
        List<Account> results = [select id, description from account];
        system.assert(results[0].Description.contains('Batch'));
    }
}
