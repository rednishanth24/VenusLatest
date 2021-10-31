trigger InvoiceTrigger on Invoice__c (after update) {
    
    List<Invoice__c> invlist = new List<Invoice__c>();
    
    InvoiceTriggerHandler InvHandler = new InvoiceTriggerHandler();
    
    for(Invoice__c inv : trigger.new)
    {
        if(trigger.oldmap.get(inv.ID).status__c!='Approved' &&  inv.status__c == 'Approved')
        invlist.add(inv);
    }
    
    if(invlist.size()>0)
    InvHandler.AfterUpdate(invlist);


}