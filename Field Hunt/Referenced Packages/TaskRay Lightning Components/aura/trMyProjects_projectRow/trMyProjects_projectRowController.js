({
	doInit : function(component, event, helper) {
    component.get('v.projectObj.progressArray');
	},
  toggleExpanded : function(component, event, helper){
    var currentExpandedStatus = component.get('v.expanded');
    var toggleExpandEvent = component.getEvent('genericEvent');
    toggleExpandEvent.setParams({
      'actionType': 'expandProject',
      'payload': {
        Id: (currentExpandedStatus) ? null : component.get('v.projectObj').project.Id
      }
    });
    toggleExpandEvent.fire();
  },
  toggleAutoFollowForProject : function(component, event, helper){
    var toggleAutoFollow = component.getEvent('genericEvent');
    toggleAutoFollow.setParams({
      'actionType': 'toggleAutoFollowForProject',
      'payload': {
        Id: component.get('v.projectObj').project.Id
      }
    });
    toggleAutoFollow.fire();
  },
  navigateToOwner : function(component, event, helper){
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": component.get('v.projectObj').owner.Id
    });
    navEvt.fire();
  },
  navigateToProject : function(component, event, helper){
    var navigateToTaskRay = $A.get("e.TASKRAY_LTNG:trNavigateToTaskRayEvent")
    navigateToTaskRay.setParams({
      projectId: component.get('v.projectObj').project.Id
    });
    navigateToTaskRay.fire();
  }
})