import { LightningElement } from 'lwc';

export default class Blogs extends LightningElement {
    blogs=[
        {
            Id:"1",
            Topic: "Salesforce Flows",
            Description:"Salesforce flows are hot in the industry. Salesforce has invested a lot in ordcer to make these floes really powerfull and make the one andonly automation tool"

        },
        {
            Id:"2",
            Topic: "Apex Triggers",
            Description:"Salesforce is going to fade apex triggers slowly... not immediately but definiely. flows are going to occupy its space!"
            
        },
        {
            Id:"3",
            Topic: "Lightning Web Component",
            Description:"The awesome UI tool using which we can build beautifull sceens"
            
        }
    ];
}