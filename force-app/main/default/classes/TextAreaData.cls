public class TextAreaData {
    
    public List<Contact> con{get;set;}
    
    {
        Id conId = '0035i000008ukRGAAY'; // Here, I have taken hardcoded Id But you can Replace ConId from URL. 
        con = [SELECT id,name,Rich_Description__c from Contact WHERE Id=: conId limit 1];
     String   textString = con[0].Rich_Description__c.stripHtmlTags();
        system.debug('Dist Data Normal :'+con[0].Rich_Description__c);
        system.debug('Dist Data stripHtmlTagste :'+textString);
    }
}