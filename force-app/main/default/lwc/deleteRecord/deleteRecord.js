import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class DeleteRecord extends LightningElement {
    recordId;

    cahngeHandler(event){
        this.recordId=event.target.value;
        }

    deleteRec(){
        const recordId= this.recordId;
        deleteRecord(recordId)

        .then(result => {
            this.displayToast("Success", "Record has been deleted successfully", "Success");
        })
        .catch(error => {
            this.displayToast("Error", error.body.message, "Error");
        })
    }

    displayToast(title, message, variant){

        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);

    }

}