public class AccountInvocable {
    @invocableMethod (label = 'Close Related Opportunities'
                        category = 'Account')
    public static void closeOpportunity(List<id> accountIds){
        //get all the open related opportunities
        List<Opportunity> opps = [select id, stagename
                                   from Opportunity
                                   where accountId in:accountIds
                                    and stagename NOT IN ('Closed Won','Closed Lost')];
        if (!opps.isEmpty()) {
            for (opportunity opp : opps) {
                opp.StageName = 'Closed Lost';
            }
            update opps;
            
        }
    }
}
