import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
export default class GetObjectInfoContact extends LightningElement {

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    conRtId;
    contactInfoHandler({data, error}) {
        if(data){
            console.log(data);
           this.conRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
}