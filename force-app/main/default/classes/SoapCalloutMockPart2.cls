@isTest
public with sharing class SoapCalloutMockPart2 implements  WebServiceMock{
    public void doInvoke(
    Object stub,
    Object request,
    Map<String, Object> response,
    String endpoint,
    String soapAction,
    String requestName,
    String responseNS,
    String responseName,
    String responseType) {
        ParkServices.byCountryResponse response_x = new ParkServices.byCountryResponse();
        List<String> usPark = new List<String>{'Yellowstone', 'Mackinac National Park', 'Yosemite'};
        response_x.return_x = usPark;
        response.put('response_x',response_x );
    }
}
