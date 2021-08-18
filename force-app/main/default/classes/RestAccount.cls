@RestResource(UrlMapping = '/Accounts/*')
global with sharing class RestAccount {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        return [SELECT Name FROM Account WHERE Id = :accountId];
    }

    @HttpPost
    global static Id createAccount(String name){
        Account account = new Account();
        account.Name = name;
        insert account;
        return account.Id;
    }

    @HttpDelete
    global static void deleteAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        delete [SELECT Name FROM Account WHERE Id = :accountId];
    }

    @HttpPatch
    global static Id updateAccountFields() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        for (String fieldName : params.keySet()) {
            account.put(fieldName, params.get(fieldName));
        }
        update account;
        return account.Id;
    }

    @HttpPut
    global static Id upsertAccount(){
        RestRequest request = RestContext.request;
        Account account = new Account();
        Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        for (String fieldName : params.keySet()) {
            if (params.get(fieldName) != 'null'){
            	account.put(fieldName, params.get(fieldName));
            }
        }
        upsert account;
        return account.Id;
    }
}