/**
 * Example of Inbound Integration to Salesforce
 * Create Apex WebService - Expose it through REST Api
 * HTTP Methods - GET, POST, PATCH, DELETE
 * Good Pratice - Always try to Use Global modifier when exposing Web Service - So it can be accessed externally
 * UrlMapping - Resource Identifier. e.g. Domain + UrlMapping = EndPoint
 * 
 * 
 * Whenever we are setting up any Inbound Integration with Salesforce
 * 1. Authroziation - Create Connected App (Monitoring tool) -BEST PRACTICE
 * 2. Authentication - Create a User Account (Username + Password)
 * https://login.salesforce.com
 * 
 * 
 * Connected App Details
 * Consumer Key: 3MVG9kBt168mda_.3kROMgHWA4u3gVwbDC9xAnUcOQfod46ouKGUlBXdU61JAEd3vJw8Xh26Apr42n7992kkb
 * Consumer Secret: 0FF5BE21CD67175D67E45F586A51DF75378F636D7711FB8957C9210E6C47AA4A
 */


@RestResource(urlmapping='/CaseManager/*')
global with sharing class RestWebService {

    /**
     * This Method is exposing Case record by their Salesforce Id
     * Endpoint - https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5004x00000LEtYCAA1 
     */

    @HttpGet
    global static Case getCasebyId(){
        // grab the caseId from the end of tyhe URL
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug('Case RecordId : '+ caseId);
        Case result = [SELECT CaseNumber, Status, Subject, Origin, Priority, Description FROM Case WHERE Id=: caseId];
        System.debug('Case Record : '+ result);
        return result;

    }
 /**
     * This Method is exposing Case record by their Salesforce Id
     * Endpoint - https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5004x00000LEtYCAA1 
     * Http method - DELETE
     */

    /* HTTP Method - DELETE
     */
    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        List<Case> result = [SELECT Id FROM Case WHERE Id =: caseId];
        RestResponse response = RestContext.response;
        if(!result.isEmpty()){
            delete result[0];
            response.statusCode = 204;
        } else {
            response.statusCode = 404;
            response.responseBody = Blob.valueOf('Error encountered, Record doesnot exist ! :(');
        }
        

    }
    
 /**
     * This method is creating Case record by parsing all required parameters from request
     * Endpoint - https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/
     * Http Method - POST
     * Request Body - { 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx' }
     * Return meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxxxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxxx'}
     */
    @HttpPost
    global static void createCase(String subject, String description, String status, String priority, String origin){
        //Get Incoming REST Callout Request Context
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        //Create Case Sobject
        Case newRec = new Case();
        newRec.Subject = subject;
        newRec.Description = description;
        newRec.Status = status;
        newRec.Priority = priority;
        newRec.Origin = origin;

        //Prepare Response Content
        response.addHeader('Content-Type', 'application/json;charset=utf-8');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            //insert Case record
            insert newRec;
            response.statusCode = 201;

            //Successful Insertion will make Id field populate
            responseContent.id = newRec.Id;
            responseContent.status = 'Success';
            responseContent.errorMessage = '';

        } catch (Exception ex) {
            response.statusCode = 404;

            responseContent.id = '';
            responseContent.status = 'Failure';
            responseContent.errorMessage = ex.getMessage();

        }

        //Convert Wrapper to JSON String
        String responseBody = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseBody);

    }

    public class PostResponseWrapper {
        public String id;
        public String status;
        public String errorMessage;
    }

        /**
     * This method is upsert (update/insert) Case record by parsing all required parameters from request.
     * Incase of Upsert, if Salesforce Id is provided then it is Upsdate scenario. If not, it is an insert scenario
     * Endpoint - https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager/
     * Http Method - PUT
     * Request Body - { 'id' : 'xxxx', 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx' }
     * Return meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxxxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxxx'}
     */
    @HttpPut
    global static void upsertCase(){
        //Get Incoming Invbound REST Api Request Current Context
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        //Extract Information/data from Request Body by deserailizing JSON
        String requestBody = request.requestBody.toString();
        PutRequestWrapper requestContent = (PutRequestWrapper) JSON.deserialize(requestBody, PutRequestWrapper.class);

        //Prepare case Object record
        Case newRec = new Case();
        if (requestContent.id != null && requestContent.id != '') {
            newRec.Id = Id.valueOf(requestContent.id);
        }
        newRec.Status = requestContent.status;
        newRec.Subject = requestContent.subject;
        newRec.Description = requestContent.description;
        newRec.Origin = requestContent.origin;
        newRec.Priority = requestContent.priority;

        //Prepare Response Content
        response.addHeader('Content-Type', 'application/json');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            //Upsert Operation
            upsert newRec;
            response.statusCode = 201;

            //Success Response
            responseContent.status = 'Success';
            responseContent.id = newRec.Id;
            responseContent.errorMessage = '';
        } catch (Exception ex) {
            //Error Response
            response.statusCode = 404;
            responseContent.status = 'Failed';
            responseContent.id = '';
            responseContent.errorMessage = ex.getMessage();
        }

        //JSON Serialise
        String responseJSON = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseJSON);

    }

    //Wrapper Class to be used for Deserialization
    public class PutRequestWrapper {
        public String id;
        public String subject;
        public String description;
        public String priority;
        public String origin;
        public String status;
    }


    /**
	 * This Method is update Case record by their Salesforce Id followed by request Body
	 * Endpoint - https://hub5-dev-ed.my.salesforce.com/services/apexrest/CaseManager
	 * HttpMethod - PATCH
     * Request Body - { 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx' }
     * Request Body will only contain fieldname which you are going to update
     * Return Type will be Case JSOn record
	 */
    @HttpPatch
    global static Case updateCaseFields(){
        //Grab Current Inbound Integration Request
        RestRequest request = RestContext.request;
        //Grab Case Record Id from Endpoint URI
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //Fetch case record using record Id
        Case existingRec = [SELECT Id FROM Case WHERE Id=: caseId];
        //Deserialize the JSON string into name-value pair
        String requestJson = request.requestBody.toString();
        Map<String,Object> fieldValues = (Map<String,Object>) JSON.deserializeUntyped(requestJson);
        //Iterate through each parameter field and value
        for(String fieldName : fieldValues.keySet()){
            //Set the field and value on the Case sOvbject
            existingRec.put(fieldName, fieldValues.get(fieldName));
            //Below 2 lines meant same thing.
            //existingRec.Status = 'New';
            //existingRec.put('Status','New');
        }
        update existingRec;
        return existingRec;
    }
}
































/**
    @HttpPut
    global static void upsertCase(){
        //Get Incoming Invbound REST Api Request Current Context
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        //Extract Information/data from Request Body by deserailizing JSON
        String requestBody = request.requestBody.toString();
        //PutRequestWrapper requestContent = (PutRequestWrapper) JSON.deserialize(requestBody, PutRequestWrapper.class);

        Case requestCase = (Case) JSON.deserialize(requestBody, Case.class);

        //Prepare case Object record
        // Case newRec = new Case();
        // if (requestContent.id != null && requestContent.id != '') {
        //     newRec.Id = Id.valueOf(requestContent.id);
        // }
        // //newRec.Id = requestContent.id;
        // newRec.Status = requestContent.status;
        // newRec.Subject = requestContent.subject;
        // newRec.Description = requestContent.description;
        // newRec.Origin = requestContent.origin;
        // newRec.Priority = requestContent.priority;

        //Prepare Response Content
        response.addHeader('Content-Type', 'application/json');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            //Upsert Operation
            upsert requestCase;
            response.statusCode = 201;

            //Success Response
            responseContent.status = 'Success';
            responseContent.id = requestCase.Id;
            responseContent.errorMessage = '';
        } catch (Exception ex) {
            //Error Response
            response.statusCode = 404;
            responseContent.status = 'Failed';
            responseContent.id = '';
            responseContent.errorMessage = ex.getMessage();
        }

        //JSON Serialise
        String responseJSON = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseJSON);
    }
 */