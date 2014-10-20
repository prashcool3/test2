@isTest
public class AutoLogoutBatchTest{
    static testMethod void AutoLogoutBatchtest(){
        
        User__c u1=new User__c();
        u1.name='test';
        u1.Login_Status__c=true;
        insert u1;
        
        AutoLogoutBatch a=new AutoLogoutBatch();
        SchedulableContext sc;
        
        test.starttest();
        BatchApex_Job_Scheduler b=new  BatchApex_Job_Scheduler(a, 200);
        b.execute(sc);
        ID batchprocessid = Database.executeBatch(a);
       
        test.stoptest();
    }
}