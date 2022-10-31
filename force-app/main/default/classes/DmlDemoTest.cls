@istest
public class DmlDemoTest {
    @istest
    private static void dmlTest1(){
        DmlDemo.dmlInsertDemo_StndObj1();
        //soql -> it doesn't acces anything from org.
        //we will records which are created in THIS  test method.
        List<Account> listAcc=[select id , name from account];
        system.assertEquals(1,listAcc.size());
        system.assertEquals('SoftInnovas',listAcc[0].Name);
    }
    @istest
    private static void dmlUpdateDemoTest2(){
        //1. Prepare DATA
        Account acc= new Account();
        acc.Name = 'SoftInnovas';
        insert acc;

        //2. call method
        DmlDemo.dmlUpdateDemo_2();

        //3. assert
        //to assert data if we are inserting/updating in our method.
        //Always fetch data using soql
        List<Account> checkAccount = [select id, name from account where name = 'SoftInnovas Inc.'];
        system.assertEquals(1, checkAccount.size());

    }

    @istest
private static void dmlInsertDemo3(){
    Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Teach DML to batch0 the great';
        sp.Description__c = 'All %50 are great learners.';
        insert sp;

        DmlDemo.dmlInsertDemo_3();
        

        List<Salesforce_Ticket__c> listST= [select id, subject__c, salesforce_project__c
                                            from Salesforce_Ticket__c WHERE Subject__c ='Learn APEX DML'];
        system.assertEquals(sp.Id,listST[0].Salesforce_Project__c);
}
}
