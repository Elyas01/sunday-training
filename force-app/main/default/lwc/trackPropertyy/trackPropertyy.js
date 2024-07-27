import Country from '@salesforce/schema/AccountCleanInfo.Country';
import { LightningElement, track } from 'lwc';

export default class TrackPropertyy extends LightningElement {
   @track location = { 
        state: "California",
        country: "United States"
    };

    changeHandler(event){
        this.location.state =event.target.value;
    }
}