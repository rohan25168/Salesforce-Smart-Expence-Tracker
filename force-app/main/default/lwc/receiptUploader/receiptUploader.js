import { LightningElement, track } from 'lwc';
import uploadReceipt from '@salesforce/apex/ExpenseController.uploadReceipt';

export default class ReceiptUploader extends LightningElement {
    @track message = '';

    handleFileChange(event){
        const file = event.target.files[0];
        if(!file){
            this.message = 'No file selected!';
            return;
        }

        // Upload file to Salesforce ContentVersion
        const reader = new FileReader();
        reader.onloadend = () => {
            const base64 = reader.result.split(',')[1];

            const contentVersion = {
                Title: file.name,
                PathOnClient: file.name,
                VersionData: base64
            };

            const action = uploadReceipt({ contentVersionId: contentVersion.Id });
            action.then(() => {
                this.message = 'Receipt uploaded successfully!';
            }).catch(error => {
                this.message = 'Error: ' + error.body.message;
            });
        };
        reader.readAsDataURL(file);
    }
}
