({
  groupByTaskId: function(arrayToGroup){
    var returnObj = {};
    if(arrayToGroup){
      arrayToGroup.forEach(function(todoItemObj){
        var isChecklistItem = (todoItemObj.TASKRAY__Project_Task__c) ? true : false;
        var taskId = (isChecklistItem) ? todoItemObj.TASKRAY__Project_Task__c : todoItemObj.Id;
        if(!returnObj[taskId]){
          returnObj[taskId] = [];
        }
        returnObj[taskId].push(todoItemObj);
      });
    }
    return returnObj;
  },
  fetchTodoItems : function(component, event, helper) {
    helper.getLocaleDateString(component, event, helper);
    var action = component.get('c.todoItemsForDate');
    if(component.get('v.dateToDisplay')){
      action.setParams({
        dateStr: component.get('v.dateToDisplay')
      });
    }
    action.setCallback(this, function(response){
      var state = response.getState();
      if(state === 'SUCCESS'){
        helper.organizeToDoResponse(response.getReturnValue(), component);
      } else {
        helper.popErrorMessage(component, action);
      }
    });
    $A.enqueueAction(action);
  },
  getLocaleDateString : function(component, event, helper){
    var action = component.get('c.getLocalizedDateString');
    if(component.get('v.dateToDisplay')){
      action.setParams({
        dateStr: component.get('v.dateToDisplay')
      });
    }
    action.setCallback(this, function(response){
      var state = response.getState();
      if(state === 'SUCCESS'){
        component.set('v.localizedDateStr', response.getReturnValue());
      } else {
        helper.popErrorMessage(component, action);
      }
    });
    $A.enqueueAction(action);
  },
  completeTodoItem : function(todoItemId, component, helper, failCallback){
    var action = component.get('c.completeTodoItem');
    action.setParams({
        "todoItemId": todoItemId
    });
    action.setCallback(this, function(response){
      var state = response.getState();
      if(state === 'SUCCESS'){
        helper.organizeToDoResponse(response.getReturnValue(), component, helper);
        var appEvent = $A.get("e.TASKRAY_LTNG:trExternalChange");
        appEvent.fire();
      } else {
        if(failCallback){
          $A.enqueueAction(failCallback);
        }
        helper.popErrorMessage(component, action);
      }
    });
    $A.enqueueAction(action);
  },
  organizeToDoResponse : function(returnValue, component, helper){
    function sortSObjectItems(a, b){
      var aIsChecklistItem = (typeof (a.TASKRAY__Project_Task__c)!== 'undefined') ? true : false;
      var bIsChecklistItem = (typeof (b.TASKRAY__Project_Task__c)!== 'undefined') ? true : false;
      var aSortName = (aIsChecklistItem) ? a.TASKRAY__Project_Task__r.Name : a.Name;
      var bSortName = (bIsChecklistItem) ? b.TASKRAY__Project_Task__r.Name : b.Name;
      return aSortName.localeCompare(bSortName);
    }
    function normalizeViewInfo(todoItemObj){
      var isChecklistItem = (todoItemObj.TASKRAY__Project_Task__c) ? true : false;
      var projectName = '';
      var projectId;
      if(isChecklistItem && todoItemObj.TASKRAY__Project_Task__r.TASKRAY__Project__r){
        projectName = todoItemObj.TASKRAY__Project_Task__r.TASKRAY__Project__r.Name;
        projectId = todoItemObj.TASKRAY__Project_Task__r.TASKRAY__Project__r.Id;
      } else{
        if(todoItemObj.TASKRAY__Project__r){
          projectName = todoItemObj.TASKRAY__Project__r.Name;
          projectId = todoItemObj.TASKRAY__Project__r.Id;
        }
      }

      var taskName = (isChecklistItem && todoItemObj.TASKRAY__Project_Task__r) ? todoItemObj.TASKRAY__Project_Task__r.Name : todoItemObj.Name;
      var taskId = (isChecklistItem && todoItemObj.TASKRAY__Project_Task__r) ? todoItemObj.TASKRAY__Project_Task__r.Id : todoItemObj.Id;
      var viewObj = {
        taskName: taskName,
        taskId: taskId,
        projectName: projectName,
        projectId: projectId,
        isChecklistItem: isChecklistItem
      };
      todoItemObj.viewObj = viewObj;
    }
    function organizeChecklists(todoItemsByTaskId){
      var taskObjArray = [];

      for(var taskId in todoItemsByTaskId){
        var itemArray = todoItemsByTaskId[taskId];
        var taskInfo = {
          taskId: '',
          taskName: '',
          projectName: '',
          projectId: '',
          hasChecklistItems: false,
          taskObj:{},
          checklists: [],
          showTaskCheckbox: false
        };
        itemArray.forEach(function(todoItem){
          taskInfo.taskName = todoItem.viewObj.taskName;
          taskInfo.taskId = todoItem.viewObj.taskId;
          taskInfo.projectName = todoItem.viewObj.projectName;
          taskInfo.projectId = todoItem.viewObj.projectId;
          if(todoItem.viewObj.isChecklistItem===true){
            var checklistName = (todoItem.TASKRAY__trChecklistGroup__r) ? todoItem.TASKRAY__trChecklistGroup__r.Name : 'Unassigned';
            var indexOfChecklist = taskInfo.checklists.findIndex(function(checklistObj){
              return (checklistObj.checklistName == checklistName) ? true : false;
            });

            if(indexOfChecklist===-1){
              var checklistObj = {
                checklistName: checklistName,
                checklistItems: [todoItem]
              };
              taskInfo.checklists.push(checklistObj);
            } else{
              taskInfo.checklists[indexOfChecklist].checklistItems.push(todoItem);
            }
            taskInfo.hasChecklistItems=true;
          } else{
            taskInfo.taskObj = todoItem;
            taskInfo.showTaskCheckbox = true;
          }
        });
        taskObjArray.push(taskInfo);
      }
      return taskObjArray;
    }
    var sorted = returnValue.sort(sortSObjectItems);
    var itemCount = sorted.length;
    sorted.forEach(function(todoItemObj){
      normalizeViewInfo(todoItemObj);
    });

    var groupedByTask = this.groupByTaskId(sorted);

    var organized = organizeChecklists(groupedByTask);
    //If this is today's overdue run confetti when complete
    if(component.get('v.todoItemCount')>0 && itemCount === 0 && component.get('v.overdue')===false){
      helper.runConfetti(component, helper);
    }

    if(itemCount===0 && component.get('v.overdue')===false){
      component.set('v.noItemsMessage', $A.get('$Label.TASKRAY_LTNG.trToDoByDay_NothingDueToday'));
    }

    //If this is an overdue todo, remove it
    if(component.get('v.todoItemCount')>0 && itemCount === 0 && component.get('v.overdue')===true){
      var action = component.get('v.refetchOverdueDates');
      if(action){
        $A.enqueueAction(action);
      }
      return;
    }


    component.set('v.todoItems', organized);
    component.set('v.todoItemCount', itemCount);
  },
  runConfetti : function(component){
    var action = component.get('v.runConfetti');
    if(action){
      $A.enqueueAction(action);
    }
  },
  popErrorMessage : function(component, action){
    var errors = action.getError();
    var msg = (errors && errors[0] && errors[0].pageErrors && errors[0].pageErrors[0] && errors[0].pageErrors[0] && errors[0].pageErrors[0].message) ? errors[0].pageErrors[0].statusCode+' '+errors[0].pageErrors[0].message : '';
    if(msg == ''){
      if(typeof(errors[0].message) != 'undefined' && errors[0].message) {
        msg = errors[0].message;
      }
    }
    var showToast = $A.get('e.force:showToast');
    showToast.setParams({
        'title': 'Error: ',
        'message': "Taskray encountered an error: " + msg,
        'type': 'error'
    });
    showToast.fire();
  }
})