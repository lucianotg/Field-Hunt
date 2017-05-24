({
	doInit : function(component, event, helper) {
    helper.fetchMyProjectInfo(component, event, helper);
	},
  handleComponentEvent : function(component, event, helper){
    var payload = event.getParam('payload');
    switch(event.getParam('actionType')){
      case 'toggleAutoFollowForProject':
        helper.toggleProjectAutoFollow(payload.Id, component, helper);
        event.stopPropagation();
        break;
      case 'expandProject':
        component.set('v.expandedProjectId',payload.Id);
        event.stopPropagation();
        break;
      default:
        break;
    }
  },
  handleExternalChange : function(component, event, helper){
    helper.fetchMyProjectInfo(component, event, helper);
  },
  increaseShowMore : function(component, event, helper){
    var showMoreLimit = component.get('v.showMoreLimit');
    var newShowMoreLimit = showMoreLimit+5;
    component.set('v.showMoreLimit',newShowMoreLimit);
    var myProjects = component.get('v.projects');
    if(newShowMoreLimit<myProjects.length){
      component.set('v.showMoreBtnVisible', true);
    } else{
      component.set('v.showMoreBtnVisible', false);
    }
  }
})