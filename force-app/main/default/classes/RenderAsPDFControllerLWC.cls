public class RenderAsPDFControllerLWC {
    
   @AuraEnabled(cacheable=true)
    public Static blob insertQuotesAttachement(String recordId){
        try{
            blob blobtoString;
            Account acc = [SELECT Name,Email__c,Phone FROM Account WHERE Id =:recordId];
            System.debug('quo :: '+acc);
           
            PageReference pdfPage = Page.RenderAsPDF;
            System.debug('pdfPage :: '+pdfPage);
            System.debug('recordId ::'+recordId);
            pdfPage.getParameters().put('id',recordId);
            blob pdfBody;
           pdfBody = pdfPage.getContent();
            System.debug('pdfBody :: '+pdfBody);
            blobtoString = pdfBody;
            System.debug('blobtoString ::'+blobtoString);
            return blobtoString;
        }catch(Exception e){
            System.debug('Error :: '+e.getMessage() + ' AND Line :: '+e.getLineNumber());
        }
        return null;
    }
}