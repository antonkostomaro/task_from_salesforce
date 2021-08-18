trigger AccountTriggerr on Account (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete) {

        if (Trigger.isBefore && Trigger.isInsert){
            AccountTriggerHandlerNumOne.handleBeforeInsert(Trigger.new);
        }

        if (Trigger.isBefore && Trigger.isUpdate){
            AccountTriggerHandlerNumOne.handleBeforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }

        if (Trigger.isBefore && Trigger.isDelete){
            AccountTriggerHandlerNumOne.handleBeforeDelete(Trigger.old, Trigger.oldMap);
        }
        
        if (Trigger.isAfter && Trigger.isInsert){
            AccountTriggerHandlerNumOne.handleAfterInsert(Trigger.new, Trigger.newMap);
        }

        if (Trigger.isAfter && Trigger.isUpdate){
            AccountTriggerHandlerNumOne.handleAfterUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }

        if (Trigger.isAfter && Trigger.isDelete){
            AccountTriggerHandlerNumOne.handleAfterDelete(Trigger.old, Trigger.oldMap);
        }

        if (Trigger.isAfter && Trigger.isUndelete){
            AccountTriggerHandlerNumOne.handleAfterUndelete(Trigger.new, Trigger.newMap);
        }


}