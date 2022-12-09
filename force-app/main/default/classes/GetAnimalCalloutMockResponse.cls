@istest
public with sharing class GetAnimalCalloutMockResponse implements HttpCalloutMock{
    
    //Implement respond Interface method      2-5 hep ayni
    public HttpResponse respond(HttpRequest request){

        //Create a fake response 

        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setBody('{ "animals": [ "majestic badger", "fluffy bunny", "scary bear", "chicken" ] }');
        //if Response Body is very big/complex. Always follow JSON serialisation method from Wrapper apex class
        response.setHeader('Content-Type', 'application/json; charset=utf-8');
        return response;
    }

}
