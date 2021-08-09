trigger AccountTrigger on Account(
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
) {
  String jsonTriggerNew = json.serialize(Trigger.New);
  String jsonTriggerOld = json.serialize(Trigger.Old);
  String jsonTriggerOldMap = json.serialize(Trigger.OldMap);

  AccountTriggerHandler.setTaskIsSyncedToFalse(jsonTriggerNew);
  AccountTriggerHandler.checkBillingAddress(
    jsonTriggerNew,
    jsonTriggerOld,
    jsonTriggerOldMap
  );
  AccountTriggerHandler.checkByQueueable(Trigger.new, Trigger.old, Trigger.oldMap);
}