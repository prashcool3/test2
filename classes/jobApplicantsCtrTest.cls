@isTest
public class jobApplicantsCtrTest{
    static testMethod void jobApplicantsCtrTest(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
    Project__c prj = new Project__c();
    prj.name = 'test';
    prj.Organization__c=o.id;
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
    Job_Application__c ja=new Job_Application__c();
    ja.name='test';
    ja.Short_Listed__c = false;
    insert ja;
    
    
    ApexPages.currentPage().getParameters().put('jbid',prj.id);
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
  //   ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
    // ApexPages.currentPage().getParameters().put('detail','true');
    String s;
    
    jobApplicantsCtr jb = new jobApplicantsCtr();
    jb.JobApplcnt();
    jb.JobApplcnt1();
    jb.home();
    jb.Login();
    jb.viewJob();
    //jb.Logout();
    jb.viewApplicant();
    jb.viewEmployee() ;
    jb.getSortDirection();
    jb.setSortDirection(s);
    jb.getShortListed();
    jb.getMail();
    jb.approveEmp();
    jb.approveGrant();
    jb.gotohome();
    jb.back();
    jb.gotosite();
    jb.blog();
    
    }
    
    
    static testMethod void jobApplicantsCtrTest1(){
    
    User__c u=new User__c();
    u.name='test';
    insert u;
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    o.User__c=u.id;
    insert o;
    
    
    
    Project__c prj = new Project__c();
    prj.Organization__c=o.id;
    prj.name = 'test';
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
     Job_Application__c ja=new Job_Application__c();
    ja.name='test';
    ja.Short_Listed__c = false;
    insert ja;
    
    ApexPages.currentPage().getParameters().put('jbid',prj.id);
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
     ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     //ApexPages.currentPage().getParameters().put('nplogin',o.id);
    // ApexPages.currentPage().getParameters().put('detail','true');
    
    String s;
    
    jobApplicantsCtr jb = new jobApplicantsCtr();
    jb.JobApplcnt();
    jb.JobApplcnt1();
    jb.home();
    jb.Login();
    jb.viewJob();
    jb.Logout();
    jb.viewApplicant();
    jb.viewEmployee() ;
    jb.getSortDirection();
    jb.setSortDirection(s);
    jb.getShortListed();
    jb.getMail();
    jb.approveEmp();
    jb.approveGrant();
    jb.gotohome();
    jb.back();
    jb.gotosite();
    jb.blog();
    
    }
    
    
}