public with sharing class ParksSservicesMock implements webServiceMock {
  public void doInvoke(Object a, Object b, Map<string,Object> response, string c, string d, string e, string f, string g, string h){
    ParksServices.byCountryResponse response_x=new parksService.byCountryResponse();
    response_x.return_x= new List<string>{'My park 1', 'My Park 2'};
    response.put('response_x', response_x);
    
  }
}