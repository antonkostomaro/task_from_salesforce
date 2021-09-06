@RestResource(urlMapping='/Account/*')
global with sharing class taskApiRestName {
    
        @HttpGet
        global static Account getAccountById() {
            RestRequest request = RestContext.request;
            String AccountID = request.requestURI.substring(
              request.requestURI.lastIndexOf('/')+1);
            List<Account> accounts = [SELECT name FROM Account WHERE Id =  : AccountID];
            Account result = accounts.get(0);
            return result;
        }
    
        @HttpPost
        global static Id createAccount(String name, String numberOfEmployees){
            Account account = new Account(
                Name = name,
                NumberOfEmployees = Integer.valueOf(numberOfEmployees)
                );
    
            insert account;
            return account.Id;
        }
        @HttpDelete
        global static void deleteAccount() {
            RestRequest request = RestContext.request;
            String AccountID = request.requestURI.substring(
                request.requestURI.lastIndexOf('/')+1);
            Account thisAccount = [SELECT Id FROM Account WHERE Id = :AccountID];
            delete thisAccount;
        }     
        @HttpPut
        global static ID upsertAccount(String id, String name, Integer numberOfEmployees){
            Account account = new Account(
                Id = id,
                Name = name,
                NumberOfEmployees = numberOfEmployees
            );
            
            upsert account;
            return account.Id;
        }
        @HttpPatch
        global static Id updateAccount(){
            RestRequest request = RestContext.request;
            String accountId = request.requestURI.substring(
                request.requestURI.lastIndexOf('/')+1);
            Account account = [SELECT Id FROM Account WHERE Id =:accountId];
            Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.toString());
            
            for(String fieldName: params.keySet()){
                if (fieldname.equals('NumberOfEmployees')) {
                    account.put(fieldname, Integer.valueOf(params.get(fieldName)));
                } else {
                    account.put(fieldName,params.get(fieldName));   
                }
            }
    
            update account;
            return account.Id;
        }
}
