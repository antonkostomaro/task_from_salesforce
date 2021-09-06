@IsTest
private class RestAccountCalloutTest {

    @IsTest
    static void testGetMethod() {
        Test.setMock(HttpCalloutMock.class, new AccountHttpCalloutMock());
        HttpResponse result = RestAccountCallout.makeGetCallout('0012w0000036iSeAAI');

        Map<String, Object> fields = (Map<String, Object>) JSON.deserializeUntyped(result.getBody());

        System.assertEquals(200, result.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
        System.assertEquals('University of Arizona', fields.get('Name'));
    }

    @IsTest
    static void testPostMethod() {
        Test.setMock(HttpCalloutMock.class, new AccountHttpCalloutMock());
        HttpResponse result = RestAccountCallout.makePostCallout('MockedPost');

        System.assertEquals(200, result.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
        System.assertEquals('"0015g00000MwVhGAAV"', result.getBody());
    }

    @IsTest
    static void testDeleteMethod() {
        Test.setMock(HttpCalloutMock.class, new AccountHttpCalloutMock());
        HttpResponse result = RestAccountCallout.makeDeleteCallout('0015g00000MwVhGAAV');

        System.assertEquals(200, result.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
    }

    @IsTest
    static void testPatchMethod() {
        Test.setMock(HttpCalloutMock.class, new AccountHttpCalloutMock());
        HttpResponse result = RestAccountCallout.makePatchCallout('0015g00000MwVhGAAV', 'MockedPatch');

        System.assertEquals(200, result.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
        System.assertEquals('"0015g00000MwVhGAAV"', result.getBody());
    }

    @IsTest
    static void testPutMethod() {
        Test.setMock(HttpCalloutMock.class, new AccountHttpCalloutMock());
        Account account = new Account(Name = 'MockedPut');
        HttpResponse result = RestAccountCallout.makePutCallout(account);

        System.assertEquals(200, result.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
        System.assertEquals('"0015g00000MwVhGAAV"', result.getBody());
    }
}