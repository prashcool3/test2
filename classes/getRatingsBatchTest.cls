@isTest
public class  getRatingsBatchTest{
    static testMethod void  getRatingsBatchtest(){
    
       Organization__c o=new Organization__c();
       o.name='test';
       insert o;
        
       Department__c d=new department__c();
       d.name='test';
       d.Organization__c=o.id;
       d.department_Rating__c='4';
       insert d;
       
       Grant_Writer__c g=new Grant_Writer__c();
       g.name='test';
       g.Department__c=d.id;
       g.Average_Rating__c='4';
       insert g;
       
       
        
        getRatingsBatch a=new getRatingsBatch();
        
       
       
       test.starttest();
       ID batchprocessid = Database.executeBatch(a);
      // AutoLogoutBatch.scheduleJob();
       test.stoptest();
         
    }
    
    
}