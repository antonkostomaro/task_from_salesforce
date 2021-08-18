trigger AccountTrigger on Account(
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
) {
AccountTriggerHandler handler = new AccountTriggerHandler();


if(Trigger.isBefore && Trigger.isInsert){
    handler.onBeforeInsert();
}
if(Trigger.isAfter && Trigger.isInsert){
    handler.onAfterInsert();
}
if(Trigger.isBefore && Trigger.isUpdate){
    handler.onBeforeUpdate();
}
if (Trigger.isAfter && Trigger.isUpdate) {
    handler.onAfterUpdate();
}
if (Trigger.isBefore && Trigger.isDelete) {
    handler.onBeforeDelete();
}
if (Trigger.isAfter && Trigger.isDelete) {
    handler.onAfterDelete();
}
if (Trigger.isUndelete) {
    handler.onUndelete();
}
}