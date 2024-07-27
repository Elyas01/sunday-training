import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesByRecordTypeAccount extends LightningElement {

    accountRtId;
    industryOptions = [];
    typeOptions =[];
@wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    infoHandler({data, error}){
        if(data){
            this.accountRtId=data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }

    @wire(getPicklistValuesByRecordType, { objectApiName: ACCOUNT_OBJECT,
    recordTypeId: '$accountRtid' })
    picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOptions=data.picklistFieldValues.Industry.values;
            this.typeOptions=data.picklistFieldValues.type.values;
        }
        if(error){
            console.log(error);
        }
    }

    
}