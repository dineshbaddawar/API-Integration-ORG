public class RenderAsPDFController {
    
    
    public String AccountName {get; set;}
    public String AccountEmail {get; set;}
    public String oppName {get; set;}
    public String oppEmail {get; set;}
    public List<Lead> leadData {get; set;}
    
    public  RenderAsPDFController(ApexPages.StandardController controller){
        String currentDonarId = ApexPages.currentPage().getParameters().get('Id');
        List<Account> accList = [SELECT Id,Name,Email__c,Phone FROM Account WHERE ID =: currentDonarId];
        AccountName =  accList[0].Name; 
        AccountEmail = accList[0].Email__c;
        Set<Id> IdSetAcc = new Set<Id>();
        for(Account acc : accList){
            IdSetAcc.add(acc.id);
        }
        
        List<Opportunity> oppData = [SELECT Id,Name,AccountId,Email__c FROM Opportunity WHERE AccountId IN : IdSetAcc LIMIT 1];
        oppName = oppData[0].Name;
        oppEmail = oppData[0].Email__c;
        System.debug('oppData ::'+oppData);
        
        List<Lead> leadListData = [SELECT Id,Name,Email,AnnualRevenue,Company,Opportunity__c FROM Lead WHERE Opportunity__c =: oppData[0].Id];
         System.debug('leadListData ::'+leadListData);
        this.leadData = leadListData;
        System.debug('leadData ::'+leadData);
    }
    
    public Static Blob getPDFFileData(String AccId){
        try{
            PageReference pdfpage = Page.RenderAsPDF; 
            pdfpage.getParameters().put('id',AccId);
            Blob pdfBlob;
            pdfBlob = pdfpage.getContent();
             String base64Pdf = EncodingUtil.base64Encode(pdfBlob);
            Blob newpdfBlob = Blob.valueOf(base64Pdf);
            return newpdfBlob;
        }catch(Exception e){
            System.debug('The Error :'+e.getMessage()+ ' The Line Number :'+e.getLineNumber());
            return null;
        }
    }
  
}