@isTest
public class listAppliedJobsCtrTest{
    static testMethod void listAppliedJobsCtrtest(){
    Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;
    
    User__c u=new User__c();
    u.name='test';
    insert u;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.User__c=u.id;
    g.name='TestGW';
    insert g;
    
    Job_Application__c ja=new Job_Application__c();
    ja.Grant_Writer__c=g.id;
    ja.name='test';
    insert ja;
    
    ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('gwid',g.id);
    
    listAppliedJobsCtr l=new listAppliedJobsCtr();
    l.listAppliedJobs();
    l.viewReviews();
    l.gotohome();
    l.login();
    l.gotosite();
    l.blog();
    
    
    
    }
}