public with sharing class AccountTaskManager {

    @InvocableMethod
    public static void createTaskForAccount(List<Account> accounts){
        List<Task> tasks = new List<Task>();
        for (Account account : accounts){
            tasks.add(new Task(Subject = 'Negotiations with ' + account.Name, WhatId = account.Id));
        }
        insert tasks;
    }
}

