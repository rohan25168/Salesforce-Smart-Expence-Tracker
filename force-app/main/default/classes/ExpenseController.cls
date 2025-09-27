public with sharing class ExpenseController {

    @AuraEnabled(cacheable=true)
    public static List<Expense__c> getExpenses() {
        // Replace Expense_Date__c with your actual Date field API name
        return [SELECT Id, Name, Vendor__c, Amount__c, Expense_Date__c, Status__c 
                FROM Expense__c 
                ORDER BY CreatedDate DESC];
    }

    @AuraEnabled
    public static void updateStatus(Id expenseId, String status) {
        Expense__c exp = [SELECT Id, Status__c 
                          FROM Expense__c 
                          WHERE Id = :expenseId 
                          LIMIT 1];
        exp.Status__c = status;
        update exp;
    }
    
    @AuraEnabled
    public static void uploadReceipt(Id contentVersionId){
        System.enqueueJob(new OCRQueueable(contentVersionId, UserInfo.getUserId()));
    }
}
