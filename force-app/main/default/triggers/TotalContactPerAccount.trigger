trigger TotalContactPerAccount on Contact (after insert,after delete,after update, after undelete,before insert, before update) {
    /*
  Set<Id> IdSet = new Set<Id>();
    for(Contact con : trigger.new){
        IdSet.add(con.AccountId); 
    }
 
    List<Contact> conList = [SELECT AccountId,Name FROM Contact WHERE AccountId IN : IdSet];
    Map<Id, Decimal> TotalContact = new Map<Id,Decimal>();
    for(Contact con : conList){
        if(TotalContact.containsKey(con.AccountId)){
            Decimal TotalCon = TotalContact.get(con.AccountId) + 1;
            TotalContact.put(con.AccountId, TotalCon);
        } else{
            TotalContact.put(con.AccountId, 1);
        }
    }
    
    List<Account> accList = new List<Account>();
    for(Id accId : TotalContact.keySet()){
        Account acc = new Account();
        acc.No_of_Contacts__c = TotalContact.get(accId);
        acc.Id  = accId;
        accList.add(acc);
    }
    update accList;
   
    if(trigger.isAfter && trigger.isInsert){
        TotalContactPerAccountHelper.TriggerHelperMethod(trigger.new);
        UtilityClass.TotalCountPrice(trigger.new);
    }
     */


    UtilityClass util = new UtilityClass();
    if(trigger.isAfter && trigger.isInsert){
        util.AfterInsert(trigger.newMap);
    }

    if(trigger.isAfter && trigger.isDelete){
        util.AfterDelete(trigger.oldMap);
    }

    if(trigger.isAfter && trigger.isUndelete){
        util.AfterUnDelete(trigger.newMap);
    }
}