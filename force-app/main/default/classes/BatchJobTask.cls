//1.4 Crate Batch Job which select all tasks with  Is Synced = false
// a. Batch should copy from Account.Owner.Name to Task.AccountOwner__c
// b. Set Task.IsSynced__c = true;
// c. Update Account field Updated By Task = true;
// d. Use Query Locator

public class BatchJobTask implements Database.Batchable<sObject>, Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext BC) {
      return Database.getQueryLocator(
        'SELECT id, AccountId, Is_Synced__c, Account_Owner__c, Account.Owner.Name, Account.Updated_By_Task__c FROM task WHERE Is_Synced__c = false'
      );
    }
  
    public void execute(Database.BatchableContext bc, List<Task> tasks) {
      for (Task tsk : tasks) {
        tsk.Account_Owner__c = t.Account.Owner.Name;
        tsk.Is_Synced__c = true;
        tsk.Account.Updated_By_Task__c = true;
      }
  
      update tasks;
    }
  
    public void finish(Database.BatchableContext bc) {}
  }