public class HIC_GoogleDistanceMatrixWrapper {
    
    @auraEnabled public List<String> destination_addresses;
    @auraEnabled public List<String> origin_addresses;
    @auraEnabled public List<Rows> rows;
    @auraEnabled public  String status;
    
    public HIC_GoogleDistanceMatrixWrapper() {
        
    } 
    
    public class Elements {
        @auraEnabled public Distance distance;
        @auraEnabled public Distance duration;
        @auraEnabled public String status;
    }
    
    public class Distance {
        @auraEnabled public String text;
        @auraEnabled public Integer value;
    }
    
    public class Rows {
        @auraEnabled public List<Elements> elements;
    }
    
    
    public static HIC_GoogleDistanceMatrixWrapper parse(String json) {
        return (HIC_GoogleDistanceMatrixWrapper) System.JSON.deserialize(json, HIC_GoogleDistanceMatrixWrapper.class);
    }
}