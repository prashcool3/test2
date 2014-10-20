@isTest
public class  BatchApex_Job_SchedulerTest{
    static testMethod void  BatchApex_Job_Schedulertest(){
           Database.Batchable<User__c> batchApexObject;
          BatchApex_Job_Scheduler b=new  BatchApex_Job_Scheduler( batchApexObject, 10);
          SchedulableContext sc;
         // b.execute(sc);
         // Database.executebatch(batchApexObject, 20);
    }
}