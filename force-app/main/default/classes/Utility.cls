public class Utility {
    
    Public Static void SendEmailWithTemplate(){
        List<Contact> conList = new List<Contact>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> recipients = new List<String>();
        
        EmailTemplate et=[Select id, Name, DeveloperName, Subject, Body, HtmlValue from EmailTemplate where Name = 'Reset Password Link	'];
        recipients.add(conList[0].Email);
         mail.setToAddresses(recipients);
         mail.setSenderDisplayName('Ondonte');
    }
    
    public static String generateRandomString(){
        Integer len = 10;
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        return randStr+string.ValueOf(system.now().getTime()); 
    }
    
    // =============================================================================================================================================================
    // Account Related Contacts Select OPtion in Aura Comp
    
    // Class #1 : get All Account records
    @AuraEnabled
    public Static List<Account> getAllAccountsList(){
        List<Account> accList = [SELECT Id,Name,Site FROM Account WHERE Site ='salesforce.com'];
        return accList;
    }
    
    
    // Class #2 : Get Contact Related Account Using AccountId
    @AuraEnabled
    public Static List<Contact> getAccountRelatedContacts (String AccId){
        List<Contact> conList = [SELECT Id,Name,AccountId FROM Contact WHERE AccountId =: accId];
        for(Contact con : conList){
            System.debug('Contacts Name :::'+con.Name);
        }
        return conList;
    }
}