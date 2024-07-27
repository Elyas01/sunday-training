
import { LightningElement, track } from 'lwc';

export default class StateAndCountry extends LightningElement {
    
  @track  Countries=[
        {Label: "United States", Value:"United States"},
        {Label: "United Kingdom", Value:"United Kingdom"},
        {Label: "Afghanistan", Value:"Afghanistan"}
    ];
    States=[
        {Label:"California", Value:"California"},
        {Label:"Massachusettes", Value:"Massachusettes"},
        {Label:"New York", Value:"New York"}
    ];
    selectedState;
    selectedCountry;
    changeHandler(event){
        const fields=event.target.label;
        if(fields ==="My State"){
            this.selectedState=event.target.Value;
        }else{
            this.selectedCountry=event.target.Value;
        }
    }
}