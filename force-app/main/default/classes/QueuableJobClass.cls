//2.2 Create Queueble Job to perform similar logic:
// a. For accounts in which BillingAddress is not empty select all related Contacts
// b. Set to all Contacts Is Synced = false; Processed By Queue = true;
// c. Run created class using DevConsole.

public class QueuableJobClass implements Queueable {
 
  private AccountHelper helper;

  public QueuableJobClass(AccountHelper helper){
      this.helper = helper;
  }

  public void execute(QueueableContext context){
      System.debug('inside execute' + helper);
      Set<Id> accountIds = helper.returnChangedAccounts();

      if (accountIds != null) {
          List<Account> listOfAccount = [SELECT Id, 
          (SELECT Id, Is_Synced__c, Processed_By_Queue__c FROM Contacts) 
          FROM Account WHERE Id IN :accountIds];
  
          List<Contact> contactsForUpdate = new List<Contact>();

          for(Account account : listOfAccount){
              for(Contact contact : account.Contacts){
                  contact.Is_Synced__c = false;
                  contact.Processed_By_Queue__c = true;
                  contactsForUpdate.add(contact);
              }
          }

          update contactsForUpdate;
  }
}
}
//Id jobId = System.enqueueJob(new QueuableJobClass());
//System.debug([SELECT Id, Status FROM AsyncApexJob WHERE Id = :jobId]);