({
    doInit : function(component, event, helper) {
     alert("doInit Method Called")
     var controllingFieldAPI = component.get("v.controllingFieldAPI");
     console.log("controllingFieldAPI Value---------> :"+controllingFieldAPI);

     var dependingFieldApI = component.get("v.dependingFieldAPI");
     console.log("dependingFieldApI Value---------> :"+dependingFieldApI);

     var objDetail = component.get("v.objDetail");
     console.log("objDetail Value---------> :"+objDetail);

     helper.fetchPicklistValues(component, objDetail, controllingFieldAPI, dependingFieldApI);
    },

    onControllerFieldChange : function(component, event, helper){
        alert("onControllerFieldChange Method Called")
        var controllerValueKey = event.getSource().get("v.value");
        console.log("controllerValueKey Value---------> :"+controllerValueKey);

        var dependentFieldMap = component.get("v.depnedentFieldMap");
        console.log("dependentFieldMap Value---------> :"+dependentFieldMap);

        if(controllerValueKey != '-- None --'){
            var ListDependentFields = dependentFieldMap[controllerValueKey];

            if(ListDependentFields.length > 0){
                component.set("v.DisabledDependentFld", false);
                helper.fetchDepValues(component, ListDependentFields);
            }else{
                component.set("v.DisabledDependentFld", true);
                component.set("v.listDependingValues", ['-- None --']);
            }
        } else{
            component.set("V.listDependingValues", ['-- None --']);
            component.set("v.DisabledDependentFld", true);
        }
    }
})