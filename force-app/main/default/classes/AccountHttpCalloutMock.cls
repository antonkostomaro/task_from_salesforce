
@IsTest
public class AccountHttpCalloutMock implements HttpCalloutMock{

    public HttpResponse respond(HttpRequest request) {
        String resource = '';
        switch on request.getMethod(){
            when 'GET'{
                resource = 'AccountCalloutMockGet';
            }
            when 'POST', 'PATCH', 'PUT' {
                resource = 'AccountCalloutMockPost';
            }
            when 'DELETE'{
                HttpResponse response = new HttpResponse();
                response.setHeader('Content-Type', 'application/json;charset=UTF-8');
                response.setStatusCode(200);
                return response;
            }
        }
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource(resource);
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        return mock.respond(request);
    }
}