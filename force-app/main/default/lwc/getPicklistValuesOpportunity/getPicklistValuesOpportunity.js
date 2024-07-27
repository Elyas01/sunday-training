import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';


export default class GetPicklistValuesOpportunity extends LightningElement {
opportunityRtId;
stageOptions = [];//picklistValues
selectedStage;// changeHandler

@wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
infoHandler({data, error}){
    if(data){
        this.opportunityRtId=data.defaultRecordTypeId;
    }
    if(error){
        console.log(error);
    }
}

@wire(getPicklistValues,{fieldApiName: STAGE_FIELD, recordTypeId:
    '$opportunityRtId'})
    picklistHandler({data, error}){
    if(data){
        console.log(data);
        this.stageOptions=data.values;
}if(error){
    console.log(error);}
}
changeHandler(event){
    this.selectedStage=event.target.value;
}
}