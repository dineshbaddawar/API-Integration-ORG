// It is used to update product value based on Productcode given in the JSON Body
@RestResource(urlMapping='/productupdateapi/*')
global class productUpdateRestAPI {
    
    @HttpPost
    global static responseWrapper updateProductdataUsingRequestBodyData(){
        try{
            responseWrapper responseJSON = new responseWrapper();
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            String resBody = req.requestBody.toString();
            System.debug('resBody  ::'+resBody);
            String resp = responseHandler(resBody);
            responseJSON.Message = 'SUCCESS';
            
            return responseJSON;
        }catch(Exception e){
           HandleException.CreateErrorMsg('productUpdateRestAPI', 'productUpdateRestAPI', e);
        }
        return null;
    }
    
    global class responseWrapper{
        global String Message;
    }
    
    // Method for to handle the resquest body data
    public static String responseHandler(String resBody){
        try{
            Set<String> productCodeSet = new Set<String>();
            List<String> ProductSKUList = new List<String>();
            List<String> uomList = new List<String>();
            List<RestProductWrapper> sw = (List<RestProductWrapper>)JSON.deserialize(resBody,List<RestProductWrapper>.class);
            system.debug('sw ::'+sw);
            for(RestProductWrapper res : sw){
                System.debug('res  Procode  ::'+res.Procode);
                productCodeSet.add(res.Procode);
                ProductSKUList.add(res.Prosku);
                uomList.add(res.UOM);
            }
            system.debug('productCodeSet ::'+productCodeSet);
            system.debug('ProductSKUList ::'+ProductSKUList);
            system.debug('uomList ::'+uomList);
             // calling Update Method
        List<Product2> prodUpdateMethod = productUpdateRestAPI.updateProductRecord(productCodeSet,ProductSKUList,uomList);
            return 'SUCCESS';
        }catch(Exception e){
            HandleException.CreateErrorMsg('productUpdateRestAPI', 'responseHandler', e);
        }
        return null;
    }
    
    
    public Static List<Product2> updateProductRecord(Set<String> productCodeSet, List<String> ProductSKUList, List<String> uomList  ){
        try{
            List<Product2>  productListToUpdate = [SELECT Id,ProductCode,Product_UOM__c,Product_UniqueCode__c FROM Product2 WHERE ProductCode IN: productCodeSet];
            System.debug('Record to update  Size :: '+productListToUpdate.size());
            for(Product2 pro : productListToUpdate){
                System.debug('Product Code Value ::'+pro.ProductCode);
            }  
            for(Product2 pro : productListToUpdate){
                if(pro.Product_UniqueCode__c !=null){
                    for(String str : ProductSKUList){
                        pro.Product_UniqueCode__c = str;
                    }
                }
                if(pro.Product_UOM__c !=null){
                    for(String str : uomList){
                        pro.Product_UOM__c = str;
                    }
                }
            }
            update productListToUpdate;
            System.debug('Updated Product_UniqueCode__c Value ::'+productListToUpdate[0].Product_UniqueCode__c);
            return productListToUpdate;
        }catch(Exception e){
             HandleException.CreateErrorMsg('productUpdateRestAPI', 'updateProductRecord', e);
        }
        return null;
    }    
    
    
    public class productUpdateRestAPIWrapper {
        public List<RestProductWrapper> productRecord;
    }
    class RestProductWrapper{
        public string Procode;
        public String Prosku;
        public String UOM;
    }
}

/*
 [
    {

    "PROCODE" : "IN7040",

    "PROSKU": "1999",

    "UOM": "KG"

},

 {

    "PROCODE" : "GC1020",

    "PROSKU": "1999",

    "UOM": "kG"

}

]

*/