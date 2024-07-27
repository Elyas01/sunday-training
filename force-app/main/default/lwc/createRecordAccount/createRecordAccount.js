import { LightningElement, track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { createRecord } from 'lightning/uiRecordApi';
import Result from '@salesforce/schema/FlowTestResult.Result';
export default class CreateRecordAccount extends LightningElement {

    @track formdata = {};

    /* Aim is to prepare data in this format
    formdata={
    Name: "Test Account"
    Industry:"Biotechnology"
    AnnualRevenue:100001}*/
    
    //because we need to get the data from the user thats why we get event as parameter
    changeHandler(event){
        const name= event.target.name;
        const value=event.target.value;
        this.formdata[name]=value;
    }

    cancelAccount(){

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
        .then(result=>{
            console.log(result);
            toastMessage
        })
        .catch(error=>{
            console.error(error);
        })
    }
    
}