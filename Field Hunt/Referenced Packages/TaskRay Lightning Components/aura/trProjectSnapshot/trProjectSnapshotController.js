({
    doInit : function(component, event, helper) {
        component.set("v.visibleProjectIndex",0);
        helper.fetchInfo(component, event, helper);
    },
    goLeft : function(component) {
        if((component.get("v.visibleProjectIndex")) > 0) {
            component.set("v.visibleProjectIndex", (component.get("v.visibleProjectIndex")-1));
            var records = component.get("v.records");
            var index = component.get("v.visibleProjectIndex");
            component.set("v.currentProjectObject", records[index]);
        }
    },
    goRight : function(component) {
        if((component.get("v.visibleProjectIndex")) < (component.get("v.records").length-1)) {
            component.set("v.visibleProjectIndex", (component.get("v.visibleProjectIndex")+1));
            var records = component.get("v.records");
            var index = component.get("v.visibleProjectIndex");
            component.set("v.currentProjectObject", records[index]);
        }
    },
    makeTask: function() {
        var urlEvent = $A.get("e.force:createRecord");
        urlEvent.setParams({
            entityApiName: "TASKRAY__Project_Task__c"
        });
        urlEvent.fire();
    },
    goToProject : function(component, event) {
        var navigateToTaskRay = $A.get("e.TASKRAY_LTNG:trNavigateToTaskRayEvent")
        navigateToTaskRay.setParams({
            projectId: event.target.id
        });
        navigateToTaskRay.fire();
    },
    handleExternalChange: function(component, event, helper){
        var recordId = helper.getRecordId(component);
        if(!recordId){ return; }
        helper.fetchInfo(component, event, helper);
    }
})