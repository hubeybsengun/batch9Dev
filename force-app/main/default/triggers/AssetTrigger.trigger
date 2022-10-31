trigger AssetTrigger on Asset (before insert, before update, after insert, after update) {
if (trigger.isBefore) {
    AssetTriggerHandler.updateDescription(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
}


}