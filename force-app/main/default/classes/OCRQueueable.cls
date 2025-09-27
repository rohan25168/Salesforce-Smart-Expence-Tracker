public class OCRQueueable implements Queueable, Database.AllowsCallouts {
    private Id contentVersionId;
    private Id uploadedBy;

    public OCRQueueable(Id cvId, Id userId){
        contentVersionId = cvId;
        uploadedBy = userId;
    }

    public void execute(System.QueueableContext context){
        Map<String,String> data = OCRService.extractReceiptData(contentVersionId);

        Expense__c exp = new Expense__c(
            Vendor__c = data.get('Vendor'),
            Amount__c = Decimal.valueOf(data.get('Amount')),
            Expense_Date__c = Date.valueOf(data.get('Date')), // Replace with actual field API name
            Status__c = 'Draft',
            OwnerId = uploadedBy
        );

        insert exp;
    }
}
