import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';
import Result from '@salesforce/schema/FlowTestResult.Result';
import { LightningElement, wire } from 'lwc';

const COLUMNS =[
    {label: 'Account Name',fieldName: 'Name', type:"text"},
    {label: 'Account Type', fieldName: 'Type', type:"text"},
    {label: 'Industry', fieldName: 'Industry', type:"text"},
    {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type:"currency"}
];
export default class ImperativeApex1 extends LightningElement {

    accounts;
    columns = COLUMNS;

    fetchAccounts(){ //we dont have any inputs to pass thats why it is empty()
      
        getTopAccounts()
        .then(result=>{
            this.accounts=result;
        })
        .catch(error=>{
            console.error(error);
        })
    }
    hideAccounts(){
        this.accounts = undefined;
    }
}