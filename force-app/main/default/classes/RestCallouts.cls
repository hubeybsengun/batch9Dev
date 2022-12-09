/**
Main GOAL: APEX REST Callout from Salesforce to External System
Step 1: Create Remote Site Setting
Step 2: Dry Run with Insomnia/Postman to replicate Our Callout Scenario
Step 3: Create REST Request
Step 3a:Authentication
Step 4: Sending REST Request
Step 5: Geting REST Response
Step 6: Parsing REST Response
    6.a - Manually Deserialising JSON Response. Then Looping through and find the correct Key and Value
    6.b - Using Apex Wrapper Class for desearialisation
*/
public with sharing class RestCallouts {

/**
 * REST Callout - GET MEthod
 * Fetch Information from External System
 */
public static HTTPResponse getAnimals(){
    //Prepare REST Request
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    //Make REST Callout
    Http http = new Http();
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    //Receive REST Response
    System.debug('Response Object: '+ response);
    System.debug('Response Status: '+ response.getStatus());
    System.debug('Response StatusCode: '+ response.getStatusCode());
    System.debug('Response Body: '+ response.getBody());
    //Parsing JSON/REST REsponse Content
    if(response.getStatusCode() == 200){ // Successful Response
        /**
         * Status Code to remember:
         * 200 - Success Reposne code for GET Request
         * 201 - Sucess Response code for POST/PUT Request
         * 204 - Success Response code for Delete 
         * 401 - UnAuthroized
         * 400 - Error URI
         */
         
        String jsonString = response.getBody();
        Map<String,Object> animalInfo = (Map<String,Object>) JSON.deserializeUntyped(jsonString);
        List<Object> animals = (List<Object>) animalInfo.get('animals');
        for(Object animal : animals){
            String animalName = (String) animal;
            System.debug('Final Parse Result : '+ animalName);
        }
    }
    return response;
}

/**
 * REST Callout - POST MEthod
 * Create Resource/Data Information in External System
 */
public static HttpResponse postAnimals(){
    //Prepare REST Request
    HttpRequest request = new HttpRequest();
    request.setMethod('POST');
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setHeader('Content-Type','application/json');
    String requestBody = '{ "name" : "fluffy bunny" }';
    request.setBody(requestBody);
    //Make REST Callout
    Http http = new Http();
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    //Receive REST Response
    System.debug('Response Object: '+ response);
    System.debug('Response Status: '+ response.getStatus());
    System.debug('Response StatusCode: '+ response.getStatusCode());
    System.debug('Response Body: '+ response.getBody());
    //Process REST Response
    if(response.getStatusCode() == 201){ //Sucess Code
        System.debug('Animal Resource is CREATED !!!');
    } else {
        System.debug('Animal Resource is not CREATED :( !!!');
    }
    return response;
}

/**
 * REST Callout - GET MEthod
 * Fetch Information from External System
 */
public static HttpResponse getUsers(){
    //Prepare HTTP Request
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint('https://gorest.co.in/public/v2/users');
    //Make REST Callout
    Http http = new Http();
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    //Receive REST Response
    System.debug('Response Object: '+ response);
    System.debug('Response Status: '+ response.getStatus());
    System.debug('Response StatusCode: '+ response.getStatusCode());
    System.debug('Response Body: '+ response.getBody());
    //Parse JSON Response
    if(response.getStatusCode() == 200){ //Success Response
        String jsonString = response.getBody();
        /*
            Quick Summary:
            JSON.deserializeUntyped:
            It converts (deserialize) the specified JSON into collections of primitive data types.
            It means you will be converting the returned JSON response and stored in the map/list/other apex collection types to get the required information.
            JSON.deserializeStrict/ deserialize:
            It converts (deserialize) the specified JSON into an Apex object(wrapper class) of the specified type.
            It means you will be converting the returned JSON response and stored in the wrapper class objects to get the required information.
            */
        // Approach 1 - Manual Deserialisation
        List<Object> userInfo = (List<Object>) JSON.deserializeUntyped(jsonString);
        for(Object user : userInfo){
            Map<String,Object> result = (Map<String,Object>) user;
            String userName = (String) result.get('name');
            System.debug('Famous Person Name : ' + userName);
            String userEmail = (String) result.get('email');
            System.debug('Famous Person Email #1: '+ userEmail);
            System.debug('Famous Person Gender #1: '+ result.get('gender'));
            System.debug('Famous Person Status #1: '+ result.get('status'));
            System.debug('Famous Person Id #1: '+ result.get('id'));
        }

        // Aproach 2 - Wrapper Class
        list<UserResponse> users = (List<UserResponse>) JSON.deserializeStrict(jsonString, List<UserResponse>.class);
        for(UserResponse user: users){
            String userName = user.name;
            System.debug('Famous Person Name : #2' + user.name);
            String userEmail = user.email;
            System.debug('Famous Person Email #2: '+ user.email);
            System.debug('Famous Person Gender #2: '+ user.gender);
            System.debug('Famous Person Status #2: '+ user.status);
            System.debug('Famous Person Id #2: '+ user.id);
        }
    }
    return response;
}

// Inner Wrapper Class
public class UserResponse {
    public Integer id;
    public String name;
    public String email;
    public String gender;
    public String status;
}
/*
Rest Callout - Delete Method
Delete Information/data on Server/in External System
*/
public static HttpResponse deleteUser(){
    HttpRequest request = new HttpRequest();
    request.setMethod('DELETE');
    Request.setEndpoint('https://reqres.in/api/users/2');

    Http http = new Http();
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    System.debug('Response Object: '+ response);
    System.debug('Response Status: '+ response.getStatus());
    System.debug('Response StatusCode: '+ response.getStatusCode());
    System.debug('Response Body: '+ response.getBody());

    if (response.getStatusCode() == 204) {
        System.debug('Resources Successfully Deleted');
    }else {
        System.debug('Resources Deletion Failed !');
    }
    return response;
}

/**
 * REST Callout - Post Method
 * Create a resource in Server, i.e. New User
 */
public static void postUser(){
    HttpRequest request = new HttpRequest();
    request.setMethod('POST');
    Request.setEndpoint('https://reqres.in/api/users');

    //Prepare JSON Body
    // Aproach 2
    UserRequest obj = new UserRequest();
    obj.name = 'Omer';
    obj.job = 'Unemployed';
    String jsonString = JSON.serialize(obj);
    request.setBody(jsonString);

    // Aproach 1 
    request.setHeader('Content-Type', 'application/json');
    Http http = new Http();
    HttpResponse response = new HttpResponse();
    response = http.send(request);
    System.debug('Response Object: '+ response);
    System.debug('Response Status: '+ response.getStatus());
    System.debug('Response StatusCode: '+ response.getStatusCode());
    System.debug('Response Body: '+ response.getBody());

    if (response.getStatusCode() == 201) {
        System.debug('Resources Successfully Created');
    }else {
        System.debug('Resources Creation Failed');
    }

}


    //Inner Wrapper Class
    public class UserRequest{
        public String name;
        public String job;
    }



 /**
	 * REST Callout - GET Method with Authentication
	 * Authentication is mandatory in all Enterprise Application
	 */
    public static HttpResponse getAnimalWithAuthentication(){

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        //pass on Authentication Details  
      /**
         * 3 Commonly Used AUthentication Modules/Approaches
         * 1. BASIC Authenication - Username & Password are key attributes.
         * 2. API Token Authentication - APi Token 30-128 Characters Alpha Numeric act as Identifier
         * 3. OAuth 2.0 - ClientId, ClientSecret (Identify Client identication), Username, Password (Identify User/Account)
         */
        string username = 'ohsengun@gmail.com';
        string password = 'ohs';
        Blob requestblob = Blob.valueOf(username + ' : ' +password);
        string authroziationString = 'BASIC' + EncodingUtil.base64Encode(requestblob);
        request.setHeader('Authorization', authroziationString);
        //make REST callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        //recieve REST response
        System.debug('Response Object: ' + response);
        System.debug('Response Status: ' + response.getStatus());
        System.debug('Response Status Code: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());
        //parse JSON/REST response content
        if (response.getStatusCode() == 200) {//successful response check
            String jsonString = response.getBody();
            Map<String, Object> animalInfo = (Map<String, Object>) JSON.deSerializeUntyped(jsonString);
            List<Object> animals = (List<Object>) animalInfo.get('animals');
            for (object animal : animals) {
                String animalName = (String) animal;
                System.debug('Animal\'s name is ' + animalName);
            }
        } return response;
    }


     /**
	 * REST Callout - GET Method with Authentication Using Named Credential
	 * As a best practise, Authentication details for Outbound Integration Callout needs to be stored in Named Crdentials
	 */
    public static HttpResponse getAnimalWithAuthenticationUsingNamedCredential(){

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndPoint('callout:Animal_Heroku_App');
        //make REST callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        //recieve REST response
        System.debug('Response Object: ' + response);
        System.debug('Response Status: ' + response.getStatus());
        System.debug('Response Status Code: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());
        //parse JSON/REST response content
        if (response.getStatusCode() == 200) {//successful response check
            String jsonString = response.getBody();
            Map<String, Object> animalInfo = (Map<String, Object>) JSON.deSerializeUntyped(jsonString);
            List<Object> animals = (List<Object>) animalInfo.get('animals');
            for (object animal : animals) {
                String animalName = (String) animal;
                System.debug('Animal\'s name is ' + animalName);
            }
        } return response;
    }

}