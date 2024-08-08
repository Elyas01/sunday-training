import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import AUTHOR_FIELD from '@salesforce/schema/Blog__c.Author__c';
import TOPIC_FIELD from '@salesforce/schema/Blog__c.Topic__c';
import TITLE_FIELD from '@salesforce/schema/Blog__c.Title__c';
import BODY_FIELD from '@salesforce/schema/Blog__c.Body__c';

const FIELDS=[AUTHOR_FIELD, TOPIC_FIELD, TITLE_FIELD, BODY_FIELD];

export default class UpdateRecordBlog extends LightningElement {
    recordId= "a018Z000012MfjKQAS";
    @track formdata={};

    @wire(getRecord, {recordId:'$recordId', fields: FIELDS})
    //property
    blog;

    changeHandler(event){
        const{name,value}=event.target;
        this.formdata[name]=value;
    }

    saveblog(){
        //changing id to formdata
        this.formdata.Id=this.recordId;
        const recordInput={
            fields: this.formdata
        };

        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                const successToast= new ShowToastEvent({
                    title:"Success",
                    message:"Blog has been saved successfully",
                    variant:"Success"
                });
                this.dispatchEvent(successToast);
                //this.cancelBlog();//eliminate all data from the form
                })
                .catch(error=> {
                    console.error(error);
            })
    }
}