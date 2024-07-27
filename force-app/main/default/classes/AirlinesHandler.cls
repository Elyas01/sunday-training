public  class AirlinesHandler {
    public static void afterinsert(List<airlines__c> triggernew){
        for (Airlines__c air : triggernew) {
            //call the future method by passing airline id
            AirlinesCallouts.postAtirlinesDetails(air.Id);
        }
    }
}