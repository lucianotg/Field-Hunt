({
	fetchMyProjectInfo : function(component, event, helper) {
        var action = component.get("c.getMyProjectsComponentInfo");
        action.setCallback(this, function(response){
            helper.handleMyProjectInfoResponse(action, response, component, event, helper);
        });
        $A.enqueueAction(action);
	},
    handleMyProjectInfoResponse : function(action, response, component, event, helper){
        var state = response.getState();
        if(state === "SUCCESS"){
            var myProjects = response.getReturnValue();
            if(myProjects){
                myProjects.forEach(function(project){
                    if(project.taskStatusCountsWithColor){
                        project.progressArray = project.taskStatusCountsWithColor.map(function(taskStatusObj){
                            return {percentage: taskStatusObj.percentage, color: taskStatusObj.color};
                        });
                        project.taskStatusCountsWithColor.sort(function(listA, listB){
                            if(project.listOptions.indexOf(listA.label) > project.listOptions.indexOf(listB.label)){
                                return 1;
                            }else if(project.listOptions.indexOf(listA.label) < project.listOptions.indexOf(listB.label)){
                                return -1;
                            }else{
                                return 0;
                            }
                        });
                    }
                });
                component.set('v.projects', myProjects);
                var showMoreLimit = component.get('v.showMoreLimit');
                if(showMoreLimit<myProjects.length){
                  component.set('v.showMoreBtnVisible', true);
                } else{
                  component.set('v.showMoreBtnVisible', false);
                }
            }  
        }else{
            this.popErrorMessage(component, action);
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
    },
  toggleProjectAutoFollow : function(projectId, component, helper){
    //Do the optimistic update
    var projects = component.get('v.projects');
    var project = projects.find(function(projectObj){
      return projectObj.project.Id === projectId;
    }.bind(this));
    project.isAutoFollowing = !project.isAutoFollowing;
    component.set('v.projects',projects);
    
    //Do the server sided update
    var action = component.get("c.toggleAutoFollowReturnMyProjectsComponentInfo");
    action.setParams({projectId: projectId});
    action.setCallback(this, function(response){
        helper.handleMyProjectInfoResponse(action, response, component, null, helper);
    });
    $A.enqueueAction(action);
  }
})