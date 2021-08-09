global without sharing class For_account
{
    @InvocableMethod
    public static void Task_Method_1(List<Account> accounts)
    {
        list<Task> add_Tasks = new List<Task>();
        for (Account account : accounts){
            add_Tasks.add(new Task(Subject = 'Negotiations with' + account.Name , WhatID = account.Id));
        
           
        }
        insert add_Tasks;
    }
}