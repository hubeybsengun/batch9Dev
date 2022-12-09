
@istest
public with sharing class RestCalloutsTest {
    /**
     * Unit Test Sccess Response Scenario for Animal Heroku Callout - GET Method
     * Static resource Mock Approach
     * Step 1: Upload Response Body as a Static Resource
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the MOCK Response to Unit Test context
     * Step 4: Invoke REST Callout
     * Step 5: Assertion Statements
     */
    @istest
  public static void getAnimalSuccessTest(){
    RestCallouts.getAnimals();
  }
/**
 * Error: Methods defined as TestMethod do not support Web service callouts
 * Rest Callout Test Scenario can be covered using 2 Approaches:
 *  1. Static Resource Callout Mock
 *  2. Creating a Mock Response Using HttpCallout
 */


    /**
     * Unit Test Sccess Response Scenario for Animal Heroku Callout - GET Method
     * Static resource Mock Approach
     * Step 1: Upload Response Body as a Static Resource
     * Step 2 : Fetching Mock Response from Static Resource
     */
    @IsTest
    public static void getAnimalSuccessTestUsingStaticResource(){
        //Create a mock response based on our Static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json; charset=utf-8');
        //Assosiate the callout with this mock response
        test.setMock(HttpCalloutMock.class, mock);

        //Rest Callout in test context
        test.startTest();
        HttpResponse response = RestCallouts.getAnimals();
        test.stopTest();

        //Assertion Statements
        system.assertNotEquals(null, response, 'The Callout returned not a null Response');
        System.assertEquals(200, response.getStatusCode(), 'Success Response should be 200');
        system.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'), 'Response Content should be JSON');

        //Verify JSON body
        System.debug('Mock response prepared is : ' + response.getBody());
    }

    /**
     * Unit Test Sccess Response Scenario for Animal Heroku Callout - GET Method
     * Static resource Mock Approach
     * Step 1: Upload Response Body as a Static Resource
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the MOCK Response to Unit Test context
     * Step 4: Invoke REST Callout
     * Step 5: Assertion Statements
     */

     @istest
     public static void getAnimalSuccessTestUsingCalloutMock(){
        //Set callout Mock Response
        Test.setMock(HttpCalloutMock.class, new GetAnimalCalloutMockResponse());
                //Rest Callout in test context
                test.startTest();
        HttpResponse response = RestCallouts.getAnimals();
        test.stopTest();

        //Assertion Statements
        system.assertNotEquals(null, response, 'The Callout returned not a null Response');
        System.assertEquals(200, response.getStatusCode(), 'Success Response should be 200');
        system.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'), 'Response Content should be JSON');

        //Verify JSON body
        System.debug('Mock response prepared is : ' + response.getBody());

     }

     /**
     * Unit Test Sccess Response Scenario for Animal Heroku Callout - POST Method
      */
      @istest
     public static void postAnimalsSuccessTest(){
    //Set callout Mock Response
    Test.setMock(HttpCalloutMock.class, new PostAnimalCalloutMockSuccessResponse());
                //Rest Callout in test context
                test.startTest();
        HttpResponse response = RestCallouts.postAnimals();
        test.stopTest();

        //Assertion Statements
        system.assertNotEquals(null, response, 'The Callout returned not a null Response');
        System.assertEquals(201, response.getStatusCode(), 'Success Response should be 201');
        system.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'), 'Response Content should be JSON');

        //Verify JSON body
        System.debug('Mock response prepared is : ' + response.getBody());
     }

}
