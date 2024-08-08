import { LightningElement, track, wire } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { createRecord } from 'lightning/uiRecordApi';
import Result from '@salesforce/schema/FlowTestResult.Result';
import Message from '@salesforce/schema/ApexTestResult.Message';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class CreateRecordAccount extends LightningElement {
    industryOptions=[];
    @track formdata = {};

    /* Aim is to prepare data in this format
    formdata={
    Name: "Test Account"
    Industry:"Biotechnology"
    AnnualRevenue:100001}*/
    
    //trying to get record type id
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    accInfo;

    @wire(getPicklistValues, {fieldApiName:INDUSTRY_FIELD, recordTypeId: 
    '$accInfo.data.defaultRecordTypeId'})
    picklistHandler({data,error}) {
        if(data){
            this.industryOptions=data.values;
        }
        if(error) {
            console.error(error);
        }
    }

    //because we need to get the data from the user thats why we get event as parameter
    changeHandler(event){
        const name= event.target.name;
        const value=event.target.value;
        this.formdata[name]=value;
    }

    cancelAccount(){
        this.template.querySelector("form.accountform").reset();
        this.formdata={};
    }

    saveAccount(){
        //populate rating and customerPriority based on revenue
        const revenue= Number(this.formdata.AnnualRevenue);
        if(revenue>= 100000000){
            this.formdata["Rating"] = "Hot";
            this.formdata["CustomerPriority__c"] = "High";
        }else if(revenue>10000000 && revenue<=100000000){
            this.formdata["Rating"] = "Warm";
            this.formdata["CustomerPriority__c"] = "Medium";
        }else{
            this.formdata["Rating"] = "Cold";
            this.formdata["CustomerPriority__c"] = "Low";
        }
        //log the object so far
        console.log("entered data"+ JSON.stringify(this.formdata));

        //prepare record input for create record
        const recordInput={
            apiName:ACCOUNT_OBJECT.objectApiName,
            fields:this.formdata
        }
        //create record
        createRecord(recordInput)
        .then(Result=>{
            console.log(Result);
            this.template.querySelector("form.accountform").reset();
            this.formdata={};
            //add toast message
            
            
    
        })
        .catch(error=>{
            console.error(error);
        })
    }
    
}