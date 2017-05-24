({
	doInit : function(component, event, helper) {
    helper.fetchTodoItems(component, event, helper);
	},
  handleComponentEvent : function(component, event, helper){
    var payload = event.getParam('payload');
    switch(event.getParam('actionType')){
      case 'completeTask':
        helper.completeTodoItem(payload.Id, component, helper, payload.failCallback);
        event.stopPropagation();
        break;
      case 'completeChecklistItem':
        helper.completeTodoItem(payload.Id, component, helper, payload.failCallback);
        event.stopPropagation();
        break;
      default:
        break;
    }
  },
  showSpinner : function (component) {
    var spinner = component.find('spinner');
    var evt = spinner.get("e.toggle");
    evt.setParams({ isVisible : true });
    evt.fire();
  },
  hideSpinner : function (component) {
    var spinner = component.find('spinner');
    var evt = spinner.get("e.toggle");
    evt.setParams({ isVisible : false });
    evt.fire();
  },
  handleExternalChange : function(component, event, helper){
    helper.fetchTodoItems(component, event, helper);
  }
})