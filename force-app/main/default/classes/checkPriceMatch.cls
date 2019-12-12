//STUB METHOD

global with sharing class checkPriceMatch {
    @InvocableMethod(label='Check a Price Match for fraudulent activity' )
    global static List<Boolean> checkPriceMatch(List<String> priceMatches) {
        List<Boolean> returnBool = new List<Boolean>();
        Boolean dummyBool = True;
        returnBool.add(dummyBool);
        return returnBool;
    }
}
