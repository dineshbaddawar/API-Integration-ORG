// API To Create Records as Per JSON Body . it is also for multiple objects
@RestResource(urlMapping='/plantcreateAPIRest/*')
global class createPlantRestAPI {
   @HttpPost
    global Static responseWrapper createSMSHistory(){
        responseWrapper responseJSON = new responseWrapper(); 
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String body = req.requestBody.toString();
        List<Plant__c> plantList = new List<Plant__c>();
        List<object> bodyMap = (List<object>)JSON.deserializeUntyped(body);
        system.debug('bodymap ===> ' + bodyMap);
        for(object obj : bodyMap){
            Map<string, Object> mtv = (Map<string, Object>)obj;
            System.debug('body Value ::'+(string) mtv.get('body'));
            Plant__c plant = new Plant__c();
            plant.Description__c = (string) mtv.get('plant_desc');
            plant.Plant_Type__c = (string) mtv.get('plant_type');
            plant.Plant_Age__c = (string) mtv.get('plant_age');
            plant.Acquisition_Data__c = date.parse((string) mtv.get('plant_date'));
            plantList.add(plant);
        }
        if(!plantList.isEmpty()){
            insert plantList;
            responseJSON.Message = 'SUCCESS';
            responseJSON.response = plantList.size() +' Record Created Successfully';
        }
        System.debug(' Record Created Size :::'+plantList.size());
        System.debug('First Record ID ::'+plantList[0].Id);
        return responseJSON;
    }
    global class responseWrapper{
        global String Message;
        global string response;
    }
}