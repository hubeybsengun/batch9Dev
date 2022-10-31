public class DMLPractice {
    public static void insertNewAccount() {
        account ac= new Account();
        ac.Name = 'DML Practice';
        ac.Rating ='Hot';
        ac.Type ='Prospect';
        insert ac;
    }

    public static void createOppsForNewAcc() {
        account ac1= [select id from account ORDER BY CreatedDate DESC LIMIT 1];
        List<opportunity> oppList = new List<opportunity>();

        date tDay= date.today();
    for (Integer i = 1; i < 6; i++) {
        Opportunity opp = new Opportunity();
        opp.Name = ' DML Opp '+i;
        opp.AccountId = ac1.Id;
        opp.Amount = 500000;
        opp.CloseDate = tDay.addMonths(1);
        opp.StageName='Prospecting';

        oppList.add(opp);
    }
        insert oppList;
    }

    public static void updateOpps() {
        list<Opportunity> op=[select name from Opportunity ORDER BY CreatedDate DESC LIMIT 5];

        integer n=1;
        list<Opportunity> updateOp= new list<Opportunity>();
        for (Opportunity eachOp : op) {
            eachOp.Name = 'DML Opp Update' + n++;
            updateOp.add(eachOp);
        }
        update updateOp;
    }


    public static void deleteOpps() {
        List<Opportunity> lastFiveOpp= [select id,name from Opportunity ORDER BY LastModifiedDate DESC LIMIT 5];
        if (!lastFiveOpp.isEmpty()) {
            delete lastFiveOpp;
        }
    }


}
