import { LightningElement, track, wire } from 'lwc';

import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

const FIELDS =[NAME_FIELD, ANNUALREVENUE_FIELD, INDUSTRY_FIELD,TYPE_FIELD];

export default class UpdateAccountRecord extends LightningElement {
    industryOptions=[];
    typeOptions=[];
    recordId='0018Z00003Fxw7DQAR';
    @track formdata={};

    @wire(getRecord, {recordId:"$recordId", fields: FIELDS })
    acc; // store the outcome
    
    
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT}) //trying to get record type id
    accInfo; // data, error

    @wire(getPicklistValuesByRecordType, {objectApiName:ACCOUNT_OBJECT, recordTypeId: 
    '$accInfo.data.defaultRecordTypeId'})
    picklistHandler({data,error}) {
        if(data){
            this.industryOptions=data.picklistFieldValues.Industry.values;
            this.typeOptions=data.picklistFieldValues.Type.values;
        }
        if(error) {
            console.error(error);
        }
    }

    changeHandler(event){
        const{name,value}=event.target;
        this.formdata[name]=value;
    }

    updateAcc(){
        this.formdata.Id=this.recordId;
        const recordInput={
            fields: this.formdata
        };

        updateRecord(recordInput)
        .then(result=> {
            console.log(result);
            const successToast = new ShowToastEvent({
                title: 'Success',
                message: 'Account Updated',
                variant: 'success',
            });
            this.dispatchEvent(successToast);
        })
        .catch(error=>{
           console.error(error);
        })
    }

}