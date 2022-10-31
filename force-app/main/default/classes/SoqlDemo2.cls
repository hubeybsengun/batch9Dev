public  class SoqlDemo2 {
    public static void childToParent_SOQL1() {
        list<contact> listContact = [select id, name, account.name, account.Industry from Contact WHERE account.industry = 'Energy'];

        for (contact eachContact : listContact) {
            string accName = eachContact.account.name ;
            string accIndustry = eachContact.account.Industry ;

            system.debug('contact name is ' + eachContact.name + ', account name is ' + accName);
        }
    }

    public static void parentToChild_SOQL1() {
        List<account> accountWithOpps =[select id, name, AnnualRevenue,type, 
                                        (select name, amount,stagename from opportunities where stagename = 'Closed Won')
                                         from account where type = 'Customer - Direct'];
        for (account eachAcc : accountWithOpps ) {
            system.debug('Account name is '+ eachAcc.name + ' and annual revenue is ' + eachAcc.AnnualRevenue);
            system.debug('----');

            List<Opportunity> accOpportunities = eachAcc.Opportunities;
            for (opportunity eachOpp : accOpportunities) {
                system.debug('opp name is ' + eachOpp.name + ' AND amount is ' + eachOpp.Amount);
            }
            system.debug('==========');
        }
    }


    public static void parentToChild_SOQL2(){
        list<salesforce_project__c> listSp =[select name, project_name__c, status__c,
                                            (select name, subject__c, priority__c from salesforce_tickets__r)
                                            from Salesforce_Project__c];
           integer totalHP=0;                                 
        for (salesforce_project__c eachSP : listSp) {
            system.debug('project name IS ' + eachSP.Project_Name__c + ' and autonumber is '+ eachSP.Name);
            List<Salesforce_Ticket__c> listST = eachSP.Salesforce_Tickets__r;
            system.debug('total tickets in '+ eachSP.name + 'are' + listST.size());

            integer eachProjectHP = 0;

            for (salesforce_ticket__c eachST : listST) {
                //check if eachST priority is HIGH
                if (eachSt.Priority__c =='High') {
                    eachProjectHP++;
                    totalHP++;
                }
            }
            
            system.debug('project # of high priority tickets ==> '+ eachProjectHP);
        
        }
        system.debug('total # of high priority tickets ==> ' + totalHP);
    }

}
