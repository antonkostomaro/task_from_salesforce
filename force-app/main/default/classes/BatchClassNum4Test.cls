@isTest
public with sharing class BatchClassNum4Test {
    
    @TestSetup
    static void setup() {
        Account account = new Account(
            Name = 'testName',
            BillingCity = 'testCity'
        );
       
        insert account;

        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 10; i++) {
            contacts.add(new Contact(
                AccountId = account.Id,
                LastName = 'Contact' + i,
                Is_Synced__c = false,
                MailingCity = 'Brest'
            ));
        }

        insert contacts;
    }

    @isTest
    static void testBatch(){

        Test.startTest();
        BatchClassNum4 BatchClassNum4 = new BatchClassNum4();
        Id batchId = Database.executeBatch(BatchClassNum4);
        Test.stopTest();

        System.assertEquals(10, [SELECT Id FROM Contact WHERE MailingCity = 'testCity'].size());
        System.assertEquals(0, [SELECT Id FROM Contact WHERE MailingCity='Brest'].size());
    }

}