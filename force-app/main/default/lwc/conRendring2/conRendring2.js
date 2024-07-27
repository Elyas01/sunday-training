import { LightningElement } from 'lwc';

export default class ConRendring2 extends LightningElement {
    country;

    changeHandler(event){
        this.country=event.target.value;

    }
    get showContent(){
        if (this.country=== "United States" || this.country==="US") {
            return true;
        }else{
            return false;
        }
    }
}