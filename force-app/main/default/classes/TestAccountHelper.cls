@IsTest
public with sharing class TestAccountHelper {
  
    public static Account createDummyAccount(String name, Boolean plansDiscussed, Boolean needInsert) {
        Account dummyAccount = new Account(Name = name, Plans_Discussed__c = plansDiscussed);
        if (needInsert){
            insert dummyAccount;
        }
        return dummyAccount;
    }

    public static List<Account> createListOfDummyAccounts(Integer count, String name, Boolean plansDiscussed, Boolean needInsert){
        List<Account> dummyAccounts = new List<Account>();
        for (Integer i = 0; i < count; i++) {
            dummyAccounts.add(createDummyAccount(name + '#' + i, plansDiscussed, false));
        }
        if (needInsert) {
            insert dummyAccounts;
        }
        return dummyAccounts;
    }
}
