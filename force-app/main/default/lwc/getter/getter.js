import { LightningElement } from 'lwc';

export default class Getter extends LightningElement {
    cars=["Porsche", "Lexus", "Brabus"];

    num1=10;
    num2=21;

    get sum(){
        return this.num1+this.num2;
    }

    get car(){
        return this.cars[1];
    }
}