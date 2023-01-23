public class Animals {
    
    @AuraEnabled
    public static String fetchAnimals(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Provide the Named Credentials
        request.setEndpoint('callout:AnimalCreds');
        request.setMethod('GET');        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
	return null;
    }
    
    public Static Lead GetleadReocords(){
        User us = [SELECT Id,Name FROM User WHERE Name = 'Jarvis'];
        Lead led = new Lead();
        led.OwnerId =us.Id;
        insert led;
        return led;
    }
}