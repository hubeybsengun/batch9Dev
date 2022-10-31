try{
    Account ac = new Account();
    insert ac;
} 
catch(DmlException dx){
    system.debug('dml went wrong buddy');
}
catch(exception ex){
    System.debug('Sometghing went wrong buddy.');
}

    system.debug('Apex is simple');
