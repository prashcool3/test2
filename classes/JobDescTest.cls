@isTest
public class JobDescTest{
    static testMethod void JobDesctest(){
    
         Grant_Writer__c g=new Grant_Writer__c();
         g.name='TestGW';
         insert g;
         
         ApexPages.currentPage().getParameters().put('talentlogin',g.id);
         
         Organization__c o = new Organization__c();
         o.name = 'testorg';
         insert o;
         
         Project__c prj = new Project__c();
         prj.name = 'test';
         insert prj;
         
         ApexPages.currentPage().getParameters().put('ids',prj.id);
         ApexPages.currentPage().getParameters().put('gwid',g.id);   
            
         Job_Application__c ja=new Job_Application__c();
         ja.name='test';
         ja.Grant_Writer__c=g.id;
         ja.Job__c=prj.id;
         insert ja;
         
         Job_Application__c ja1=new Job_Application__c();
         ja1.name='test';
         ja1.Role__c='Supervisor';
         ja1.Job__c=prj.id;
         insert ja1;
         
         
         /*Project__c prj1 = new Project__c();
         prj1.name = 'test';
         prj1.id=ja1.Job__c;
         insert prj1;*/
         
         Job_Application__c ja2=new Job_Application__c();
         ja2.name='test';
         ja2.Grant_Writer__c=g.id;
         //ja2.Job__c=prj.id;
         insert ja2;
         
         Rating__c r=new Rating__c();
         //r.name='test';
         r.Organization__c=o.id;
         r.Grant_Writer__c=g.id;
         insert r;
         
         JobDesc j=new JobDesc();
         j.SubmitNPRating();
         j.NPInfo();
         j.NPInfo1();
         j.requestGrant();
         j.gotohome();
         j.viewsupinfo();
         j.viewsupinfo1();
         j.back();
         j.back1();
         j.RLogin();
         j.gotosite();
         j.blog();
         //j.requestEmp();
         //j.logout();
         
         
         
         
            
    }
}