public with sharing class Account_update_class {
    
    @InvocableMethod
    public static void add_new_task(List<Id> id_user){
        List<Task> tasks_For_Account = [SELECT OwnerId, WhatId FROM Task WHERE WhatId = :id_user];
        User Account_User_Activ = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        Map<Id, Integer> key_and_value = new Map<Id, Integer>();
        Integer count = 0;
       

        for (Task task : tasks_For_Account){
            if(key_and_value.containsKey(task.WhatId)){
                count +=1;
                for (Task tasks : tasks_For_Account){
                     if(count >3){
                tasks.OwnerId = Account_User_Activ.Id;
                }
            }
            }else{
                key_and_value.put(task.WhatId, 1);
                count +=1;
            }    
        }    
        
        update tasks_For_Account;    
        }
            
        }
        
    