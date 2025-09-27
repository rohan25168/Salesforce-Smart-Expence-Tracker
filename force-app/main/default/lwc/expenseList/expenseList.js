import { LightningElement, track, wire } from 'lwc';
import getExpenses from '@salesforce/apex/ExpenseController.getExpenses';
import updateStatus from '@salesforce/apex/ExpenseController.updateStatus';

export default class ExpenseList extends LightningElement {
    @track expenses = [];
    @track message = '';
    @track isManagerOrFinance = false;

    connectedCallback(){
        // Simple logic: if not Employee profile, allow Approve/Reject
        // Adjust based on your org roles or profiles
        this.isManagerOrFinance = true; 
    }

    @wire(getExpenses)
    wiredExpenses({ data, error }){
        if(data){
            this.expenses = data;
        } else if(error){
            this.message = error.body.message;
        }
    }

    handleApprove(event){
        const expenseId = event.target.dataset.id;
        updateStatus({ expenseId: expenseId, status: 'Approved' })
            .then(() => { this.message = 'Expense Approved!'; })
            .catch(error => { this.message = error.body.message; });
    }

    handleReject(event){
        const expenseId = event.target.dataset.id;
        updateStatus({ expenseId: expenseId, status: 'Rejected' })
            .then(() => { this.message = 'Expense Rejected!'; })
            .catch(error => { this.message = error.body.message; });
    }
}
