@isTest
public with sharing class ParksServicesTest {
   
    @isTest 
    private static void getParksByCountryTest(){
        Test.startTest();
        ParksSservicesMock mock = new ParksSservicesMock();
        Test.setMock(WebServiceMock.class, mock);
        string country='Turkey';
        string[] parks = SoapCallouts.getParksByCountry(country);
        Test.stopTest();
        system.assertEquals(2, parks.size());

    }
}