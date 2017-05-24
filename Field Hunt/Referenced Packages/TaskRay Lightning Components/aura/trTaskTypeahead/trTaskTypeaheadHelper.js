({
  uniqueSearchId: null,
  waitingId: null,
	searchObject : function(component, event, helper) {
    var searchId = (new Date()).getTime();
    this.uniqueSearchId = searchId;

    var action = component.get("c.searchSObject");
    action.setParams({
        "type": 'TASKRAY__Project_Task__c',
        "searchString": event.target.value
    });

    action.setCallback(this, function(response) {
        if (this.uniqueSearchId == searchId && component.isValid()) {
            component.set("v.suggestions", JSON.parse(response.getReturnValue()));
        } else {
            // Action aborted because another has been fired
            // Or the component is not valid anymore
        }
    });

    window.clearTimeout(this.waitingId);

    this.waitingId = window.setTimeout($A.getCallback(function() {
        if (component.isValid()) {
            $A.enqueueAction(action);
        }
    }), 250);
	}
})