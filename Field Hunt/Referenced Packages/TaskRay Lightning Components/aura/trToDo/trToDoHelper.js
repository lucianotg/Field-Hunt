({
    getRecordId : function(component) {
        var recordId = component.get("v.recordId");
        return recordId;
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
    organizeResponse : function(component, response) {
        var data = response.getReturnValue();
        //allRecords gets 1 tempRecord per project
        var allRecords = [];
        //for each project...
        data.forEach(function(project){
            //set up a temporary record
            var tempRecord = {
                projectName: project.projectName,
                projectId: project.projectId,
                listTasks: [],
                timeTasks: [],
                totalTasks: 0,
                completedTasks: 0
            };
            //add the list names to the tempRecord
            for(var listNameKey in project.listOptions){
                var listName = project.listOptions[listNameKey];
                if(!listName){
                    return;
                }
                tempRecord.listTasks.push({
                    statusName: listName.toLowerCase(),
                    listColor: project.listColors[listName],
                    tasks: []
                });
            }
            //  go thorugh the project's tasks
            project.projectTasks.forEach(function(tasksForProject){
                var status = tasksForProject.listName;
                //iterate tempRecord's tasks to see which status it matches in tempRecords
                tempRecord.listTasks.forEach(function(tempRecordListTasks){
                    if(!tempRecordListTasks.statusName || !status){
                        return;
                    }
                    if(tempRecordListTasks.statusName.toLowerCase() === status.toLowerCase()){
                        tempRecordListTasks.tasks.push(tasksForProject);
                        tempRecord.totalTasks += 1;
                    }
                });
                var time = tasksForProject.timeGroup;
                var timeFound = false;
                //iterate tempRecord's time tasks
                tempRecord.timeTasks.forEach(function(tempRecordTimeTasks){
                   if(tempRecordTimeTasks.timeName === time){
                        tempRecordTimeTasks.tasks.push(tasksForProject);
                        timeFound = true;  //we found it!
                    }
                });
                if(timeFound === false){
                    var timeAndTask = {
                        timeName: time,
                        tasks: [tasksForProject]
                    };
                    tempRecord.timeTasks.push(timeAndTask);
                }
            });
            //completed tasks
            tempRecord.completedTasks = tempRecord.listTasks[tempRecord.listTasks.length-1].tasks.length;
            allRecords.push(tempRecord);
        });

        if(component.isValid()){
            component.set("v.records", allRecords);
            component.set("v.currentProjectObject", allRecords[component.get("v.visibleProjectIndex")]);
        }

    }
})