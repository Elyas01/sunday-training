import Label from '@salesforce/schema/ActionLinkTemplate.Label';
import { LightningElement } from 'lwc';

export default class NameAndRole extends LightningElement {
    username='Sayed';
    role;
    roleOptions=[
        {Label: "Salesforce Admin", value:"Salesforce Admin"},
        {Label: "Salesforce Developer", value:"Salesforce Developer"},
        {Label: "Salesforce Architect", value:"Salesforce Architect"}
    ];
    changeHandler(event){
        const field=event.target.Label;
        if(field === "Enter Your Username"){
            this.username=event.target.value;
        }else{
            this.role=event.target.value;
        }
    }
     
}