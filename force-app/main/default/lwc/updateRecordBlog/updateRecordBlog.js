import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import AUTHOR_FIELD from '@salesforce/schema/Blog__c.Author__c';
import TOPIC_FIELD from '@salesforce/schema/Blog__c.Topic__c';
import TITLE_FIELD from '@salesforce/schema/Blog__c.Title__c';
import BODY_FIELD from '@salesforce/schema/Blog__c.Body__c';

const FIELDS=[AUTHOR_FIELD, TOPIC_FIELD, TITLE_FIELD, BODY_FIELD];

export default class UpdateRecordBlog extends LightningElement {
    recordId= "a018Z000012MfjKQAS";

    @wire(getRecord, {recordId:'$recordId', fields: FIELDS})
    //property
    blog;
}