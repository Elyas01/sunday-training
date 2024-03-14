public with sharing class Helper {
   @invocableMethod(label= 'Call Smarty street' descriptopn='makes callout to smartystreet')
   public static void makeCallout(List<Id> locationIds){
    run(locationIds[0]);
   
}catch(Exception exc){
    ErrorLogHelper.createErrorLog('Helper.makeCallout.run', run.getMessage());
}

   }

