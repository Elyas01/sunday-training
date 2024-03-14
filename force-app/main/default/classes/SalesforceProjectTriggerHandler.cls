public class SalesforceProjectTriggerHandler {
    //Create default salesforce ticket record
    public static void createDefaultSalesforceTicket(List<Salesforce_Project__c> conTriggerNew){
        try{
        List<Salesforce_Ticket__c> newSTList= new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : conTriggerNew) {
            Salesforce_Ticket__c st= new Salesforce_Ticket__c();
            st.Subject__c='Default';
            newSTList.add(st);
            if (!newSTList.isEmpty()) {
                insert newSTList;
            }
        }
        }catch(Exception e){
            system.debug('Some error here');
            for(Salesforce_Project__c eachSp : conTriggerNew){
                eachSp.addError('Some error in creating default ticket, please contact admin, Not the devolper');
            }
        }
    }

    public static void validateProjectCompletion(List<Salesforce_Project__c> sptriggernew, List<Salesforce_Project__c> sptriggerold,
                                     Map<id, Salesforce_Project__c> sptriggernewmap, map<id,Salesforce_Project__c> sptriggeroldmap){
        //get projects for which STATUS is Changed To COMPLETED
        Set<Id> setProjectId= new set<id>();
        for (Salesforce_Project__c eachSp : sptriggernew) {
            if (eachSp.Status__c != sptriggeroldmap.get(eachSp.id).Status__c && eachSp.Status__c =='Completed') {
                setProjectId.add(eachSp.Id);
            }
        }
        // get all tickets of' setProjectid' which are not completed 
        List<Salesforce_Ticket__c> listSt= [SELECT id, status__c, Salesforce_Project__c from Salesforce_Ticket__c 
                                            WHERE Salesforce_Project__c in : setProjectId and status__c != 'Completed' ];
        
        for (Salesforce_Ticket__c eachSt : listSt) {
            
            Salesforce_Project__c  sp=sptriggernewmap.get(eachSt.Salesforce_Project__c);
            sp.addError('You cant complete project because its all tickets are not completed, OKAY !');
        }
        
    }
    //Static
    //returns void.
    //pass primitive datatype,collection of primitive datatype.
    //update project description
    @future
    public static void updateDescription(set<id> projectIds){
        List<Salesforce_Project__c> listSp= [select id ,Description__c from Salesforce_Project__c where id in : projectIds];
        for (Salesforce_Project__c sp : listSp) {
            sp.Description__c='Update from future Method';
            
        }
        update listSp;
       
    }
    // update all tickets if project is completed
    public static void spCompletedStatus(List<Salesforce_Project__c> sptriggernew, List<Salesforce_Project__c> sptriggerold,
    Map<id, Salesforce_Project__c> sptriggernewmap, map<id,Salesforce_Project__c> sptriggeroldmap){

        Set<Id> spIds= new Set<Id>();
        for (Salesforce_Project__c sp : sptriggernew) {
            Salesforce_Project__c spNew=sp;
            Salesforce_Project__c spOld=sptriggeroldmap.get(sp.Id);
            if (spNew.Status__c=='Completed' && spOld.Status__c!='Completed') {
                spIds.add(sp.Id);
            }
        }//Call future Method
        if (!spIds.isEmpty()) {
            updateTicketStatusCompleted(spIds);
        }
        
        
    }
    @future
    private static void updateTicketStatusCompleted(Set<Id> spIds){

        List<Salesforce_Ticket__c> listSt= [select id, status__c , salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in:spIds and status__c!='Completed'];
        for (Salesforce_Ticket__c st : listSt) {
            st.Status__c='Completed';
        }
        update listSt;
    }

    
}