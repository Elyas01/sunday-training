import { LightningElement } from 'lwc';

export default class TWayBinding extends LightningElement {
    fullname='Jospehine';
    title='Salesforce developer';
    changeHandler(event){
        this.title=event.target.value;
    }
}