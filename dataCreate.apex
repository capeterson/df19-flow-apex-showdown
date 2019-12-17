Simple_customer__c newCustomer = new Simple_Customer__c();
newCustomer.name = 'Lauren Boyle';
newCustomer.Stripe_Account_ID__c = 'acct_1FpON0GWAEwDeUrd';

insert newCustomer;

Simple_Sales_Order__c newOrder = new Simple_Sales_Order__c();
newOrder.simple_customer__c = newCustomer.id;
insert newOrder;

List<Order_Item__c> items = new List<Order_Item__c>();

Order_Item__c item1 = new Order_Item__c();
item1.name = 'Redmi K20 Pro';
item1.quantity__c = 1;
item1.price__c = 289;
item1.Simple_Sales_Order__c = newOrder.id;
items.add(item1);

Order_Item__c item2 = new Order_Item__c();
item2.name='Gorilla armor K20 screen protector';
item2.quantity__c = 2;
item2.price__c = 8;
item2.Simple_Sales_Order__c = newOrder.id;
items.add(item2);

insert items;
