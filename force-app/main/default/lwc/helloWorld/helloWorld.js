import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    fullname= ' Sayed Elyas Sadat';
    age=25;
    location={
        city:"Union City",
        Country:"United States"
    };

    //write a method to sum two numbers
    sum(a,b){
        return a+b;
    }
}