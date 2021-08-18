public with sharing class CheckingAssignments {
    @InvocableMethod
    public static void assignTasks(List<Id> accountIds){
        List<Task> tasksForAccount = [SELECT OwnerId, WhatId FROM Task WHERE WhatId = :accountIds];
        User userForTasks = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        Map<Id, Integer> taskMap = new Map<Id, Integer>();


        for (Task task : tasksForAccount){
            if(taskMap.containsKey(task.WhatId)){
                taskMap.put(task.WhatId, taskMap.get(task.WhatId) + 1);
            } else {
                taskMap.put(task.WhatId, 1);
            }
        }

        for (Task task : tasksForAccount){
            if (taskMap.get(task.WhatId) > 2){
                task.OwnerId = userForTasks.Id;
            }
        } 
          
        
        update tasksForAccount;
    }
}
