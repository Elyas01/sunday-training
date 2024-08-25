import getOpportunity from '@salesforce/apex/OpportunityCtrl.getOpportunity';
import { LightningElement, wire } from 'lwc';

const COLUMNS=[

    {label: 'Opp Name', fieldName: 'Name', type: 'text' },
    {label: 'Opp Type', fieldName: 'Type', type: 'text' },
    {label: 'Stage', fieldName: 'StageName', type: 'text' },
    {label: 'Amount', fieldName: 'Amount', type: 'curency' }
  
]

export default class WiredApex2 extends LightningElement {

    stageName = 'Closed Won';
    columns= COLUMNS;

    @wire(getOpportunity, {stage: '$stageName'})
    opps;
}