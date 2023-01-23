public class PhoneResponseWrapper {
    
    public String Message;
    public String Status;
    public List<PostOffice> PostOffice;
    
    public class PostOffice {
        public String Name;
        public String Description;
        public String BranchType;
        public String DeliveryStatus;
        public String Circle;
        public String District;
        public String Division;
        public String Region;
        public String Block;
        public String State;
        public String Country;
        public String Pincode;
    }
    
    public static List<PhoneResponseWrapper> parse(String json) {
        return (List<PhoneResponseWrapper>) System.JSON.deserialize(json, List<PhoneResponseWrapper>.class);
    }
    
}