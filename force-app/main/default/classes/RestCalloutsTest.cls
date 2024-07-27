@isTest
public with sharing class RestCalloutsTest {
   @isTest
   private static void getAnimalsTest(){
    RestCalloutsMock mock =new RestCalloutsMock();
    Test.setMock(HttpCalloutMock.class, mock);
    HttpResponse response=RestCallouts.getAnimals();
    system.assertEquals(200, response.getStatusCode());
    system.assertEquals('OK', response.getStatus());
   }

   @isTest
   private static void getBlogsTest(){
      RestCalloutsMock mock= new RestCalloutsMock();
      Test.setMock(HttpCalloutMock.class, mock);
      HttpResponse response = RestCallouts.getBlogs();
      system.assertEquals(200, response.getStatusCode());
      system.assertEquals('OK', response.getStatus());
   }
   @isTest
   private static void getProductsTest(){
      RestCalloutsMock mock= new RestCalloutsMock();
      Test.setMock(HttpCalloutMock.class, mock);
      HttpResponse response = RestCallouts.getProducts();
      system.assertEquals(200, response.getStatusCode());
      system.assertEquals('OK', response.getStatus());
   }
   @isTest
   private static void postAnimalsTest(){
      RestCalloutsMock mock= new RestCalloutsMock();
      Test.setMock(HttpCalloutMock.class, mock);
      HttpResponse response = RestCallouts.postAnimal();
      system.assertEquals(201, response.getStatusCode());
      system.assertEquals('created', response.getStatus());
   }
   @isTest
   private static void postGoRestContatTest(){
      // prepare test gorest contact records 
      Gorest_Contact__c con = new Gorest_Contact__c();
      con.Name='test';
      con.Email__c='Test@gmail.com';
      con.gender__c='male';
      con.Status__c='Active';
      insert con;

      // test callout
      Test.startTest();
      RestCalloutsMock mock= new RestCalloutsMock();
      Test.setMock(HttpCalloutMock.class, mock);
      HttpResponse response = RestCallouts.postGorestContact();
      Test.stopTest();
      system.assertEquals(201, response.getStatusCode());
      system.assertEquals('created', response.getStatus());
   }
}