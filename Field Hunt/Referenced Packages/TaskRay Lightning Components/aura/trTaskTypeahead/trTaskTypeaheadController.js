({
	onKeyUp : function(component, event, helper) {
    helper.searchObject(component, event, helper);
	},
  suggestionClick : function(component, event, helper){
    var suggestionLabel = event.target.getAttribute('data-suggestionLabel');
    var suggestionId = event.target.getAttribute('data-suggestionId');
    component.set('v.selectedSuggestion', {suggestionLabel: suggestionLabel, suggestionId: suggestionId});
    component.set('v.suggestions',[]);
    var appEvent = $A.get("e.TASKRAY_LTNG:trGenericAppEvent");
    if(appEvent){
      appEvent.setParams({
        actionType: 'typeaheadSelected',
        payload:{
          target:'TIME_ENTRY_ADD_TASK',
          selectedItemId: suggestionId
        }
      });
      appEvent.fire();
    }
  },
  clearClick : function(component, event, helper){
    component.set('v.selectedSuggestion', {});
    var appEvent = $A.get("e.TASKRAY_LTNG:trGenericAppEvent");
    if(appEvent){
      appEvent.setParams({
        actionType: 'typeaheadSelected',
        payload:{
          target:'TIME_ENTRY_ADD_TASK',
          selectedItemId: null
        }
      });
      appEvent.fire();
    }
  }
})