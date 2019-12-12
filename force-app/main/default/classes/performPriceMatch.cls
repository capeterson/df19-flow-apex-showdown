// NON-BULKIFIED FOR READABILITY

global with sharing class performPriceMatch {
    @InvocableMethod(label='Perform a Price Match' )
    public static List<String> performPriceMatch(List<String> adjustmentRecordIDs) {
        List<String> priceMatchOutcomes = new List<String>();

        String recordId = adjustmentRecordIds[0];

        String outcome = '';

        if (qualifiesForInstantReimbursement(recordId)){
            Order_Item_Price_Adjustment__c currentAdjustment = [SELECT Id, Approved__c, Original_Price__c, New_Price__c, Order_Item__r.Id FROM Order_Item_Price_Adjustment__c  WHERE Id = :recordId];
            Order_Item__c currentOrderItem = [Select Id, Name, Price__c, Quantity__c, Simple_Sales_Order__r.Id FROM Order_Item__c WHERE Id = :currentAdjustment.Order_Item__r.Id];
            Simple_Sales_Order__c currentOrder = [Select Id, Simple_Customer__r.Stripe_Account_ID__c FROM Simple_Sales_Order__c WHERE Id= :currentOrderItem.Simple_Sales_Order__r.id];
            currentAdjustment.Approved__c = true;
            currentOrderItem.Price__c = currentAdjustment.New_Price__c;
            Integer adjustmentCreditAmountInCents = (100*(currentOrderItem.Quantity__c * (currentAdjustment.Original_Price__c - currentAdjustment.New_Price__c))).intValue();
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            req.setEndpoint('callout:StripeBasic/transfers');
            String description = 'Price Match: ' + currentOrderItem.Name;
            String body ='amount='+String.ValueOf(adjustmentCreditAmountInCents)+'&description='+description+'&currency=usd&destination='+currentOrder.Simple_Customer__r.Stripe_Account_ID__c;
            req.setBody(body);
            HttpResponse res = http.send(req);
            System.debug(res.getBody());
            update currentAdjustment;
            update currentOrderItem;   
            outcome = 'Instant Reimbursement Approved'; 
        }else{
            outcome = 'Price Match Submitted';

        }


        priceMatchOutcomes.add(outcome);
        return priceMatchOutcomes;
    }

    public static Boolean qualifiesForInstantReimbursement(String adjustmentRecordId){

        return true;

    }

    public static void submitPriceMatchForApproval(String adjustmentRecordId){

    }

} 
        



