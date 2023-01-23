public class AccRelatedConC {
  @AuraEnabled(cacheable=true)
    public static List<Account> fetchAcc (id RecId){
        string query= 'SELECT Id, Name,(select id,Name,AccountId from contacts)'+
                ' FROM Account where Id = :RecId';
        
         return Database.query( query );
        
    }  
}