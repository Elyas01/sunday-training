import { LightningElement } from 'lwc';

export default class UcFamousPerson extends LightningElement {

    contacts=[
        {name: "Jeff Bezos", title: "Executive Chairman", company: "Amazon"
            , stay: "US"
        },
        {name: "Sundar Pichai", title: "Chief Executive Officer", company: "Google"
            , stay: "US"
        },
        {name: "Bill Cook", title: "Chief Executive Officer", company: "Apple"
            , stay: "US"
        },
        {name: "Mark Zuckerberg", title: "Chief Executive Officer", company: "Facebook"
            , stay: "US"
        }
    ]
}