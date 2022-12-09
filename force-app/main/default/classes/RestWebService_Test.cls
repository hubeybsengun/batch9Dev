@isTest
public with sharing class RestWebService_Test {
    @TestSetup
    public static void makeData(){
        //Craete Tset Case record
        Case testRec = new Case();
        testRec.Subject = 'Test Case';
        testRec.Description = 'Test Description';
        testRec.Origin = 'Phone';
        testRec.Status = 'New';
        testRec.Priority = 'High';
        insert testRec;
    }

    @IsTest
    public static void getCaseByIdSuccessTest(){
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        //Setup a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/' + caseId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        //Call the WebService method
        Case testRec = RestWebService.getCasebyId();
        //Verify results
        System.assertEquals(testRec.Id, caseId, 'Test Case Record Id should be matching with Webservice method returned');
        System.assertNotEquals(testRec.Subject, null, 'We are expecting Case Subject to be populated');
    }

    @IsTest
    private static void deleteCaseSuccessTest(){
        //Fetch Case Record Id
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        //Setup a test Request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/' + caseId;
        request.httpMethod = 'DELETE';
        RestContext.Request = request;
        RestContext.Response = new RestResponse();
        //Call the Webservice method to test
        Test.startTest();
        RestWebService.deleteCase();
        Test.stopTest();
        //Verify results
        List<Case> testRecList = [SELECT Id FROM Case];
        System.assertEquals(0, testRecList.size(), 'Not expecting any Case record to be prest in Test context');
    }


    @IsTest
    private static void deleteCaseFailureTest(){
        //Setup a test Request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/xxxxxxxxx';
        request.httpMethod = 'DELETE';
        RestContext.Request = request;
        RestContext.Response = new RestResponse();
        //Call the Webservice method
        Test.startTest();
        RestWebService.deleteCase();
        Test.stopTest();
        //Verify Results
        List<Case> testrecList = [SELECT Id FROM Case];
        System.assertEquals(1, testrecList.size(), 'As testing failed scenario, no record will be deleted');
    }


    @IsTest
    public static void createCaseSuccessTest(){
        //Setup a Tset request
        RestRequest request = new RestRequest();
        request.httpMethod = 'POST';
        request.requestURI = 'https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/';
        RestContext.Request = request;
        RestContext.Response = new RestResponse();
        //Call the WebService Method
        Test.startTest();
        RestWebService.createCase('Test Case #2', 'Test Case Description', 'New', 'High', 'Phone');
        Test.stopTest();
        //Verify Results
        Case testRec = [SELECT Id,Subject FROM Case WHERE Subject = 'Test Case #2'];
        System.assertEquals('Test Case #2', testRec.Subject, 'New Test Record is created');
    }

}
