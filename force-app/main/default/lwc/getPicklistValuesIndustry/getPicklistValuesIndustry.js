import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class GetPicklistValuesIndustry extends LightningElement {
    
    accountRtId;
    industryOptions = [];
    selectedIndustry;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    infoHandler({data, error}){
        if(data){
            this.accountRtId=data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }

    @wire(getPicklistValues,{fieldApiName: INDUSTRY_FIELD, recordTypeId:
        '$accountRtId'})
        picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOptions=data.values;
        }
        if(error){
            console.log(error);
        }
    }
    changeHandler(event){
        this.selectedIndustry=event.target.value;
    }
}