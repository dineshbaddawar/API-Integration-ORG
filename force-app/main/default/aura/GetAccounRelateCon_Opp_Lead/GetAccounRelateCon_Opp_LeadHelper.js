({
	helperMethodContact : function(component,event,helper) {
		//alert("Method Called Successfully")
        debugger;
        var action = component.get("c.getAccountRelatedContact");
        action.setParams({
            "AccId" : component.get("v.cureentAccId")
        });
        action.setCallback(this, function(response){
            var State = response.getState();
            if(State !='ERROR'){
                var result = response.getReturnValue();
                component.set("v.conData", result);
                this.HelperMethodOpportunity(component,event);
            }
        });
         $A.enqueueAction(action);
	}, 
    
    HelperMethodOpportunity : function(component,event){
      //  alert("Method Called");
      debugger;
        var action = component.get("c.getAccountRelatedOpportunity");
        action.setParams({
            "accId" : component.get("v.cureentAccId")
        });
        action.setCallback(this, function(response){
            var State = response.getState();
            if(State !='ERROR'){
                var data = response.getReturnValue();
                component.set("v.oppId", data[0].Id);
                component.set("v.oppData", data);
                component.set("v.oppEmailId", data[0].Email__c);
                this.HelperMethodLead(component, event);
            }
        });
        $A.enqueueAction(action);
    },
    
    HelperMethodLead : function(component,event){
       // alert("Method Called"
       debugger;
        var action = component.get("c.getOpportunityRelatedLead");
        action.setParams({
            "OppId" : component.get("v.oppId")
        });
        action.setCallback(this, function(response){
            var State = response.getState();
            if(State != 'ERROR'){
                var result = response.getReturnValue();
                component.set("v.leadData", result);
            }
        });
         $A.enqueueAction(action);
    },
})