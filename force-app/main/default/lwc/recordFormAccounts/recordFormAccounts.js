import { LightningElement } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
/* these are not visible to html if you eant to use you create a local property and you can use it ACCOUNT_OBJECT*/
export default class RecordFormAccounts extends LightningElement {

    fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD];

    objectName=ACCOUNT_OBJECT;
    recordId="0018Z00003Fwd3UQAR";
    successHandler(){
        const successEvent= new ShowToastEvent({
            title: "success",
            message: "Account record has been saved successfully!",
            variant: "success",
            mode: "sticky"
        });
        this.dispatchEvent(successEvent);
    }
}