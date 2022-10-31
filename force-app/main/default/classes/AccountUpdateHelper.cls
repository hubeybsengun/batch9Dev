public  class AccountUpdateHelper {
    @invocableMethod
   public static void updateAccountWebsite(List<Id> accIds){
    List<account> updateAccounts = new List<account>();
    for (account eachAccount : [select id, website from account where id in :accIds]) {
        eachAccount.Website = 'wwww.softinnovas.com';
        updateAccounts.add(eachAccount);
    }
    update updateAccounts;
   }
}
