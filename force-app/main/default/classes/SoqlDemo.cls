public  class SoqlDemo {
    public static void accountSOQL_1() {
       list<Account> listAcc = [select id, name from Account WHERE name like'%A%'];
       system.debug('account list =>'+listAcc);
       system.debug('account list of size  =>'+listAcc.size());
       


        Account acc = [select id, name , phone ,active__c from Account ORDER BY CreatedDate DESC LIMIT 1];
        system.debug('Latest created record ===> ' + acc);
     
    }

    public static void accountSOQL_2(){
        Account acc = [select id, name , phone ,active__c, AccountNumber from Account ORDER BY CreatedDate DESC LIMIT 1];
        system.debug('Latest created record ===> ' + acc);

        //store name and phone in string
        string accName = acc.name;
        string accPhone = acc.phone;

        system.debug('acc name is '+ accName + ' phone is ' + accPhone + ' acc number =' + acc.AccountNumber);
    }

    public static void accountSOQL_3(){
        List<Account> listAcc= [select id, name, phone, active__c, accountNumber FROM Account ORDER BY CreatedDate DESC];
        system.debug('account list ===> '+ listAcc);
        for (account eachAccount : listAcc) {
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            system.debug('acc name is ' + accName + ' phone is ' + accPhone + ' acc number ='+ eachAccount.AccountNumber);
            system.debug('--------');
        }

    }

    public static void accountSOQL_Filter() {
        string filterName = 'Salesforce Inc.';
        list<Account> listAcc = [select id, name, active__c from account where name = :filterName];
        system.debug('Filter name = ' + listAcc);
    }
    public static void accountSOQL_Filter(string accName) {
        list<Account> listAcc = [select id, name, active__c from account where name = :accName];
        system.debug('Filter name = ' + listAcc);
    }

}
