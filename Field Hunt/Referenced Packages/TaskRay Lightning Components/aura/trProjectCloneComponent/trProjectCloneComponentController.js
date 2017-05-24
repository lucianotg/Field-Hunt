({
    doInit : function(component, event, helper) {
        $A.createComponent(
            "ui:outputText",
            {value: ""},
            function(emptyComponent){
                //Add the new button to the body array
                if (component.isValid()) {
                    var body = component.get("v.body");
                    body.push(emptyComponent);
                    component.set("v.body", body);
                }
            }
        );

        var action = component.get("c.getTemplateProjects");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                // success with records
                if(response.getReturnValue().length > 0) {
                    var projects = response.getReturnValue().sort(function(projectA, projectB){
                        if(projectA.Name < projectB.Name){
                            return -1;
                        }
                        if(projectA.Name > projectB.Name){
                            return 1;
                        }
                        if(projectA.Name > projectB.Name){
                            return 0;
                        }
                    });
                    component.set("v.projects", response.getReturnValue());
                    var opts = [{class: "", label: "Select template", value: null}];
                    for(var x=0; x<response.getReturnValue().length; x++){
                        opts.push({class: "",
                                   label: response.getReturnValue()[x].Name,
                                   value: response.getReturnValue()[x].Id });
                    }
                    component.find("InputSelectDynamic").set("v.options", opts);
                }
                if(response.getReturnValue().length === 0) {
                    component.set("v.projects", []);
                }
            } else {
                helper.popErrorMessage(component, action);
            }
        });
        $A.enqueueAction(action);
        
    },
    setProjectToClone: function(component){
        var dropdownMenuOption = component.find("InputSelectDynamic");
        if(dropdownMenuOption.get("v.value") !== null){
            component.set('v.selectedProjectId', dropdownMenuOption.get("v.value"));
        }
    },
    navigateToProject : function(component, event, helper){
        var navigateToTaskRay = $A.get("e.TASKRAY_LTNG:trNavigateToTaskRayEvent")
        navigateToTaskRay.setParams({
            projectId: component.get('v.projectObj').project.Id
        });
        navigateToTaskRay.fire();
    },
    setFirstTaskDate: function(component, event){
        component.set("v.firstOrLastOption", event.currentTarget.dataset.option);
    },
    setLastTaskDate: function(component, event){
        component.set("v.firstOrLastOption", event.currentTarget.dataset.option);
    },
    toggleProjectMenu: function(component){
        var projectDropdownButton = component.find('projectDropdownButton');
        if(component.get("v.projectDropdownOpen") === true){
            $A.util.addClass(projectDropdownButton, 'slds-is-open');
        }else{
             $A.util.removeClass(projectDropdownButton, 'slds-is-open');
        }
        component.set("v.projectDropdownOpen", !component.get("v.projectDropdownOpen"));
    },
    cloneProject: function(component, event, helper){
    	var selectedProjectId = component.get("v.selectedProjectId");
        var cloneDatePicker = component.find("CloneDatePicker");
        var newProjectName = component.find("InputText");
        var projects = component.get("v.projects");
        var dateForClone;
        if((typeof (newProjectName.get("v.value")) !== 'undefined') && (selectedProjectId !== null)){
            component.set("v.showSpinner", true);
            var params = {
                "newName": newProjectName.get("v.value"),
                "baseProjectId": selectedProjectId
            };
            for(var x=0; x<projects.length; x++){
                if(projects[x].Id === selectedProjectId){
                    if(component.get("v.firstOrLastOption") === 'startDate'){
                        dateForClone = cloneDatePicker.get("v.value");
                        params["useStartOrEndDate"] = component.get("v.firstOrLastOption");
                        params["dateForClone"] = cloneDatePicker.get("v.value");
                    }else if(component.get("v.firstOrLastOption") === 'endDate'){
                        params["useStartOrEndDate"] = component.get("v.firstOrLastOption");
                        params["dateForClone"] = cloneDatePicker.get("v.value");
                    }else{
                        params["useStartOrEndDate"] = "";
                        params["dateForClone"] = "null";
                    }
                }
            }
            if(component.get("v.createLookupToCurrentRecordId") === true){
                params["createLookupToRecordId"] = true;
                params["recordIdForLookup"] = component.get("v.recordId");
            }
            var action = component.get("c.cloneProjectFromLightning");
            action.setParams(params);
            action.setCallback(this, function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    component.set("v.createdProjectUrl", "/" + response.getReturnValue());
                    component.set("v.createdProjectId", response.getReturnValue());
                    component.set("v.showNewProjectLink", true);
                    component.set("v.showSpinner", false);
                    window.setTimeout($A.getCallback(function(){
                        component.set("v.showNewProjectLink", false);
                    }), 20000);
                    document.getElementById('startDateRadioButton').checked = false;
                    document.getElementById('endDateRadioButton').checked = false;
                    cloneDatePicker.set("v.value", "");
                    newProjectName.set("v.value", "");
                    var dropdownMenuOption = component.find("InputSelectDynamic");
                    dropdownMenuOption.set("v.value", "Select a Template:");

                } else {
                    component.set("v.showSpinner", false);
                    helper.popErrorMessage(component, action);
                }
            });
            $A.enqueueAction(action);
        }else{
            $A.createComponent(
                        "TASKRAY_LTNG:trErrorComponent",
                        {errorTitle: 'All cloned projects need a name and a starting project.'},
                        function(errorMessageComponent){
                            //Add the new button to the body array
                            if (component.isValid()) {
                                var errorDiv = component.find("errorContainer");
                                errorDiv.set("v.body", errorMessageComponent);
                            }
                        }
            );
        }

    },
    navigateToProject: function(component){
        var navigateToTaskRay = $A.get("e.TASKRAY_LTNG:trNavigateToTaskRayEvent");
        navigateToTaskRay.setParams({
            projectId: component.get('v.createdProjectId')
        });
        navigateToTaskRay.fire();
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
	  }
})