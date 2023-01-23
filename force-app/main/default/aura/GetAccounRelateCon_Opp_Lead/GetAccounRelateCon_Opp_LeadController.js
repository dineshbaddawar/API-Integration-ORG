({
	doInit : function(component, event, helper) {
        debugger;
		var action = component.get("c.getAccountRecord");
       
        var currentId = component.get("v.recordId");
        component.set("v.cureentAccId",currentId);
        action.setParams({
            "AccountIdToPass" : currentId
        });
        action.setCallback(this, function(response){
            var State = response.getState();
            if(State === 'SUCCESS'){
                var data = response.getReturnValue();
                component.set("v.accData", data);
               // console.log("acc Data ::"+accData)
               helper.helperMethodContact(component, event);
            }
        });
        $A.enqueueAction(action);
	}
})