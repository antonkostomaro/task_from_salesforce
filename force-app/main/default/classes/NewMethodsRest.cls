public with sharing class NewMethodsRest {
    private static String token = '6Cel800D5g000006zW078885g000008Vo1kby9xlp6m2uCx82kjMUrf9ElGI1LmX3wX5frLhyKeRGV3MWaTSkn0qSpVQZJjig0jy2WQ0IgF';

    public static HttpResponse makeGetCallout(Id recordId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://epam108-dev-ed.lightning.force.com/.salesforce.com/services/apexrest/Accounts/' + recordId);
        request.setHeader('Authorization','Bearer '+ token);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
        else{
            System.debug('Error ' + response.getStatusCode());
        }
        return response;
    }

    public static HttpResponse makePostCallout(String name){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://epam108-dev-ed.lightning.force.com/.salesforce.com/services/apexrest/Accounts/');
        request.setHeader('Authorization','Bearer '+ token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name" : "' + name + '"}');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
        else{
            System.debug('Error ' + response.getStatusCode());
        }
        return response;
    }

    public static HttpResponse makeDeleteCallout(Id recordId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndpoint('https://epam108-dev-ed.lightning.force.com/.salesforce.com/services/apexrest/Accounts/' + recordId);
        request.setHeader('Authorization','Bearer '+ token);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
        else{
            System.debug('Error ' + response.getStatusCode());
        }
        return response;
    }

    public static HttpResponse makePatchCallout(Id recordId, String name){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://epam108-dev-ed.lightning.force.com/.salesforce.com/services/apexrest/Accounts/' + recordId + '?_HttpMethod=PATCH');
        request.setHeader('Authorization','Bearer '+ token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name" : "' + name + '"}');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
        else{
            System.debug('Error ' + response.getStatusCode());
        }
        return response;
    }

    public static HttpResponse makePutCallout(Account account){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint('https://epam108-dev-ed.lightning.force.com/.salesforce.com/services/apexrest/Accounts/');
        request.setHeader('Authorization','Bearer '+ token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name" : "' + account.Name + '", "id" : "' + account.Id + '"}');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
        else{
            System.debug('Error ' + response.getStatusCode());
        }
        return response;
    }
}




