public without sharing class productUpdateRestAPIWrapper {
    
    public List<RestProductWrapper> productRecord;
    public class RestProductWrapper{
        public string Procode;
        public String Prosku;
        public String UOM;
    }
    
    public static List<productUpdateRestAPIWrapper> parse(String json){
        return (List<productUpdateRestAPIWrapper>) System.JSON.deserialize(json, List<productUpdateRestAPIWrapper>.class);
    }
}