public class GeneralApexClass {
    
    // Collection Apex Class
    
    public Static void ListMethod(){
        // Add Method:
        List<String> str = new List<String>();
        str.add('Name');
        str.add('LastName');
        System.debug('The List Has---- '+str);
        
        // Clone Method:
        
        List<String> newstr = str.clone();
        System.debug('Cloned List Values ----- '+newstr);
        System.debug('Size List Values ----- '+newstr.size());
        newstr.remove(1);
        newstr.add('two');
        System.debug('After Remove List Values ----- '+newstr);
        
        List<String> str1 = newstr.clone();
        
        System.debug('the List equls---- '+newstr.equals(str1));
        System.debug('Get the Index 1 value---> '+str1.get(1));
        // Setting new value to the index
        str1.set(1, 'Salesforce CRM');
        System.debug('After Setting the new Index 1 value---> '+str1.get(1));
        str1.clear();
        System.debug('clear List Values ----- '+str1);
    }
    
    public Static void SetMethod(){
        Set<String> set1 = new Set<String>{'One','Two','Three'};
            set1.add('Salesforce');
        System.debug('the Set1 Values-- '+set1);
        // Size method
        System.debug('the Set1 Size-- '+set1.size());
        // Remove Method
        set1.remove('Salesforce');
        System.debug('the Set1 Size-- '+set1);
        // Size Method
        System.debug('the Size of Set1 ---- '+set1.size());
        // Contain Method
        boolean contain=   set1.contains('One');
        
        System.debug('contain Method ---->'+contain);
        //  isEmpty  Method
        Boolean isEmptyMethod = set1.isEmpty();
        System.debug('isEmpty  Method ---->'+isEmptyMethod);
    }
    
    public Static void MapMethod(){
        Map<Integer, String> map2 = new Map<Integer, String>{3 => 'one', 4 => 'two' .toUpperCase()};
            map2.put(1,'Dinesh');
        map2.put(2,'Ganesh');   
        System.debug('Map1 values   '+map2);
        // get(key): This method helps to find the value of a key in a map collection.
        
        Map<Integer, String> map1 = new Map<Integer, String>{1=> 'One' .toLowerCase(), 2=>'Two' .toUpperCase(), 3=>'Three' .toUpperCase(), 4=>'Four',5=>'Five',6=>'Six'};
            System.debug('map1 data---->'+map1);
        Boolean var = map1.containsKey(1);
        System.debug('the Contains Key----'+var);
        // get given key value
        String var1 = map1.get(2);
        System.debug('the Get Key Value----'+var1);
        Set<Integer> keySet = map1.keyset();
        System.debug('the Get keySet Value----'+keySet);
        System.debug('The values Set----'+map1.values());


        List<Account> ls = [select Id,Name from Account];
        System.debug('Account List ----'+ls);
        Map<Id, Account> m = new Map<Id, Account>(ls);
        System.debug('the Map Values in Account---- '+m);


        Account acc = new Account();
        acc.Name= 'ABc';
        acc.phone= '567890';
        
        Map<Integer, Account> map11 = new Map<Integer, Account> {};
            map11.put(1,acc);
        System.debug('the Map11 ----'+map11);
        
        Map<Integer, Account> map22 = map11.clone();
        System.debug('the Map2 -----------'+map22);
        
        map11.get(1).Phone ='1234567777';
        System.debug('the Map 1 AGain--------'+map11);
        boolean contain = map11.containsKey(1);
        System.debug('the Contaon Return -------------'+contain);
        
        Account valueusignkey = map11.get(1);
        System.debug('valueusignkey------------------- '+valueusignkey);
        
    }
    
    // Wrapper Class Example
    
    public static List<AccountContactWrapper> getDataFromWrapper(){
        List<AccountContactWrapper> wrapList = new List<AccountContactWrapper>();
        List<Account> accList = [SELECT Id,Name,(SELECT Id,Name,Email FROM Contacts) FROM Account];
        for(Account acc : accList){
            AccountContactWrapper obj = new AccountContactWrapper();
            obj.accName= acc.Name;
            obj.conList = acc.Contacts;
            obj.contactCount = acc.Contacts.size();
            wrapList.add(obj);
            System.debug('wrapList ::'+wrapList);
        }
        return wrapList;
    }
    
    public class AccountContactWrapper{
        public String accName {get;set;}
        public List<Contact> conList {get;set;}
        public Integer contactCount {get;set;}
    }

}