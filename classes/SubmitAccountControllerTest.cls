@isTest
public class SubmitAccountControllerTest{
    static testMethod void SubmitAccountControllertest(){
    
        User__c u=new User__c();
        u.name='test';
        insert u;
        
        Grant_Writer__c g=new Grant_writer__c();
        g.First_Name__c='test';
        g.Last_Name__c='test';
        g.name=g.First_Name__c +' '+g.Last_Name__c;
        insert g;
        
         SubmitAccountController s=new  SubmitAccountController();
         s.submitAccount();
         s.blog();
         s.gotosite();
        
        
    
    }
    
}