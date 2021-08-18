//2.1 Create class with future method. Inside the method do the following:
// a. Select 150 Accounts from database.
// b. For accounts in which BillingAddress is not empty select all related Contacts
// c. Set to all Contacts Is Synced = false; Processed By Future = true;
// d. Run created class using DevConsole.

public with sharing class TaskFirstClass {
  @Future
  public static void updateAccounts(){

          List<Account> listOfAccount = [SELECT Id, 
          (SELECT Id, Is_Synced__c, Processed_By_Future__c FROM Contacts) 
          FROM Account WHERE BillingCity != null OR BillingCountry != null OR 
                                                  BillingGeocodeAccuracy != null OR
                                                  BillingLatitude != null OR
                                                  BillingLongitude != null OR
                                                  BillingPostalCode != null OR
                                                  BillingState != null OR
                                                  BillingStreet != null
                                       LIMIT 150];
  
          List<Contact> contactsForUpdate = new List<Contact>();
          if (listOfAccount != null) {
              for(Account account : listOfAccount){
                  for(Contact contact : account.Contacts){
                      contact.Is_Synced__c = false;
                      contact.Processed_By_Future__c = true;
                      contactsForUpdate.add(contact);
                  }
              }
          }
          
          update contactsForUpdate;
  }
}