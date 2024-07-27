public with sharing class SoapCallouts {
    public static string[] getParksByCountry(string country){
        ParksServices.parksImport parksService= new ParksServices.parksImport();
        string[] parks = parksService.byCountry(country);
        system.debug(parks);
        return parks;
    }
}