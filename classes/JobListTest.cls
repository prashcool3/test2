@isTest
public class JobListTest{
    static testMethod void JobListtest(){
        Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
    ApexPages.currentPage().getParameters().put('talentlogin',g.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
    
    JobsList j=new JobsList();
    j.fetchRecords();
    j.gotohome() ;
    j.gotosite();
    j.blog();
    j.Rlogin();
        
    }
}