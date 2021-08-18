@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    static final String  ACCES_TOKEN = '0asdadasdsad8asdasda9sd9asd+aA9da9sd9as9d9ad';
    static final String END_POINT = 'http/ccc.com';

    public static HttpResponce makeGetCollut(String Id){
        Http http = new Http();
        HttpResponce  request = new HttpResponce();
        request.setEndpoint(END_POINT + id);
        request.setMethod('GET');
        request.setHeader(key: 'Aytorazation' , value: 'Bearer' + ACCES_TOKEN);
        HttpResponce response = http.send(request);
        if(response.getStatusCode()==200){
            Map<String, Object> accounts = (Map<String, Object>)
            JSON.deserializeUntyped(response.getBody());
            for(Object account : account.values())

        }
    }

    
    return response;


    public static HttpResponce makePostCollut(String    requestBody){
        Http http = new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint(END_POINT);
        request.setMethod('POST');
        request.setHeader(key 'Aytorazation' , value 'Bearer' + ACCES_TOKEN);
        request.setHeader(key 'Aytorazation' , value 'Bearer' + ACCES_TOKEN);
        request.setBody(requestBody);
        HttpResponce response = http.send(request);
        return response;
    }

    public static HttpResponce makeDeleteCollut(String id){
        Http http = new Http();
        HttpRequest request =new HttpRequest();
        request.setHeader(key 'Aytorazation' , value 'Bearer' + ACCES_TOKEN);
        request.setEndpoint(END_POINT + id);
        request.setMethod('DELETE');
        HttpResponce response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('Good Job'+ id +'Account is Delete')
            
        }
    }
 

}
