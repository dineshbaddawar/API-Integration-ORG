({
	doInit : function(component, event, helper) {
		alert("doInit Method Called");
        var action = component.get("c.getPickListValues");
        console.log("action Value : ",action);
        action.setCallback(this, function(response){
            debugger;
            var State = response.getState();
            if(State == 'SUCCESS'){
                var result = response.getReturnValue();
                console.log("result Value : ",result);
                var plValues = [];
                for(var i=0; i < result.length; i++){
                    plValues.push({
                        label: result[i],
                        value: result[i]
                    });
                }
                component.set("v.LeadTypeList", plValues);
            }
        });
       // $A.enqueuaAction(action);
        $A.enqueueAction(action);
	},
    
    handleLeadTypeChange : function(component, event, helper) {
		alert("handleLeadTypeChange Method Called");
        // Get the Selected Values
        var selectedValues = event.getParam("value");
        console.log("selectedValues Value : ",selectedValues);
        
        // updating the selected Values
        component.set("v.selectedLeadTypeList", selectedValues);
	},
    getSelectedLeadType : function(component, event, helper) {
		alert("getSelectedLeadType Method Called");
        // Get Selected LeadType List on Button click
        var selectedValues = component.get("v.selectedLeadTypeList");
        console.log('Selectd Genre-' + selectedValues);
	}
    
})