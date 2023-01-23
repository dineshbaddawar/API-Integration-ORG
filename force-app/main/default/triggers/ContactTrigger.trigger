trigger ContactTrigger on Contact (before insert,after insert) {

    if(trigger.isInsert && trigger.isAfter){
        PINCodeAPI.afterInsertContactPindCode(trigger.new);
    }
}