import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
export default class GetObjectInfoAccounts extends LightningElement {

    accRtId;
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    infoHandler(data, error) {
        if (data) {
            console.log('Object Info Retrieved: ', data);
            this.accRtId = data.defaultRecordTypeId;

        } 
        if (error) {
            console.log('Error retrieving object info: ', error);
        }
    }
       
}