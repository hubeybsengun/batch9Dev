public class CaseInvocable {
    @InvocableMethod( label = 'Send Email & Save Activity'
                    category = 'Case')
    public static void sendEmail(list<FlowInput> inputs){
        list<messaging.SingleEmailMessage> messages = new list<messaging.SingleEmailMessage>();
        for (flowInput input : inputs) {
            messaging.SingleEmailMessage message = new messaging.SingleEmailMessage();
            message.setSubject('Case Created: '+ input.caseNumber);
            message.setPlainTextBody('Hello there, \n'
                                    + 'A case has been created your query. You can quote the case number when you call the next time! \n'
                                    + 'Thanks, \n'
                                    + 'SalesForce');
            message.setTargetObjectId(input.contactId); 
            message.setSaveAsActivity(true);

            messages.add(message);
        }
        Messaging.sendEmail(messages);
}

    public class FlowInput{
        @invocableVariable (label = 'Case Number' required = true)
        public String caseNumber;
        @invocableVariable (label = 'Contact Id' required = true)
        public Id contactId;
}
}
