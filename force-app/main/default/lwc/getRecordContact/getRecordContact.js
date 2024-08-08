import { LightningElement, wire } from 'lwc';


import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import DEPT_FIELD from '@salesforce/schema/Contact.Department';
import { getFieldValue, getRecord} from 'lightning/uiRecordApi';
const FIELDS = [FIRSTNAME_FIELD, LASTNAME_FIELD, TITLE_FIELD, PHONE_FIELD, EMAIL_FIELD, DEPT_FIELD];

export default class GetRecordContact extends LightningElement {

    recordId="0038Z00003a5GFUQA2";
    contact;
    
        @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
        recordHandler({data, error}){
            if(data){
                this.contact=data;
            }
            if(error){
                console.error(error);
            }
        }
        get name(){
            return getFieldValue(this.contact, FIRSTNAME_FIELD) + ' ' + getFieldValue(this.contact, LASTNAME_FIELD);
        }
        get title(){

            return getFieldValue(this.contact, TITLE_FIELD);
        }
        get phone(){
            
            return getFieldValue(this.contact, PHONE_FIELD);
        }
        get email( ){
            
            return getFieldValue(this.contact, EMAIL_FIELD);
        }
        get dept(){
            
            return getFieldValue(this.contact, DEPT_FIELD);
        }
}