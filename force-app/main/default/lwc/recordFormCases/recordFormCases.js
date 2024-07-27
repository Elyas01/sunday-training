import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import ACCOUNT_NAME_FIELD from '@salesforce/schema/Case.AccountId';
import TYPE_FIELD from '@salesforce/schema/Case.Type';
import CONTACT_NAME_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import CASE_OBJECT from '@salesforce/schema/Case';


export default class RecordFormCases extends LightningElement {
    fields=[ACCOUNT_NAME_FIELD, TYPE_FIELD, CONTACT_NAME_FIELD, SUBJECT_FIELD,DESCRIPTION_FIELD,
            PRIORITY_FIELD];
    objectName= CASE_OBJECT;
    recordId="5008Z00002Mq75bQAB";
    successHandler(){
        const successEvent= new ShowToastEvent({
            title:"success",
            message:"Case record has been created successfully !!!",
            variant:"success"
        });
        this.dispatchEvent(successEvent);
    }
}