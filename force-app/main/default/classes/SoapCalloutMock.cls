@IsTest
public with sharing class SoapCalloutMock implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        //Start - specify the response you want to send
        CalculatorServices.doMultiplyResponse response_x = new CalculatorServices.doMultiplyResponse();
        response_x.return_x = 10.0;
        //Assign Response to Callout
        response.put('response_x', response_x);
    }
}