@RestResource(urlMapping='/Account/wise-unicorn-okjtbh-dev-ed.lightning.force.com')
global with sharing class ExerciseOneFromHMController {

    global class DataWrapper{
        @AuraEnabled
        global String Id{get; set;}
        @AuraEnabled
        global Links urls {get; set;}
    }

    global class Links{
        @AuraEnabled
        global String raw {get; set;}
        @AuraEnabled
        global String full {get; set;}
}

    @AuraEnabled
    global static Account UploandServer() {
        RestRequest request = RestContext.request;
        String AccountID = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
        List<Account> accounts = [SELECT name FROM Account WHERE Id =  : AccountID];
        Account result = accounts.get(0);
        return result;
}

        }
  
 

