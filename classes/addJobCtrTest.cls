@isTest
public class addJobCtrTest{
    static testMethod void addJobCtrtest(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
   /* Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;*/
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
   // ApexPages.currentPage().getParameters().put('jbid',prj.id);
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
     ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
    // ApexPages.currentPage().getParameters().put('detail','true');
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();    
    jb.back();
    jb.cancelsubmit();
    
   
    }
    
    static testMethod void addJobCtrtest1(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
   /* Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;*/
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
   // ApexPages.currentPage().getParameters().put('jbid','');
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
    // ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
   //  ApexPages.currentPage().getParameters().put('detail','');
    // ApexPages.currentPage().getParameters().put('jid','');
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();    
   // jb.back();
    jb.cancelsubmit();
    
    }
    
    static testMethod void addJobCtrtest2(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
    Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
   ApexPages.currentPage().getParameters().put('jbid','prj.id');
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
     ApexPages.currentPage().getParameters().put('talentlogin',g.id);
    // ApexPages.currentPage().getParameters().put('nplogin',o.id);
   //  ApexPages.currentPage().getParameters().put('detail','');
    ApexPages.currentPage().getParameters().put('jid','prj.id');
    
     
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();    
    jb.viewOrgJobs();
    jb.edit();    
    jb.back();
    jb.cancelsubmit();
    
    }
    
    static testMethod void addJobCtrtest5(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
    Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
    ApexPages.currentPage().getParameters().put('jbid','prj.id');
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
   //  ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
   //  ApexPages.currentPage().getParameters().put('detail','');
     ApexPages.currentPage().getParameters().put('jid','prj.id');
    
    addJobCtr jb = new addJobCtr();
    jb.edit();
    jb.viewOrgJobs();
    jb.back();
    jb.cancelsubmit();
    }
    
    static testMethod void addJobCtrtest3(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
    Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
    ApexPages.currentPage().getParameters().put('jbid','prj.id');
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
     ApexPages.currentPage().getParameters().put('talentlogin',g.id);
   //  ApexPages.currentPage().getParameters().put('nplogin',o.id);
     ApexPages.currentPage().getParameters().put('detail','true');
     ApexPages.currentPage().getParameters().put('jid','prj.id');
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();    
    jb.edit();
    jb.home();
    //jb.logout();
    jb.gotosite();
    jb.blog();
    jb.gotohome();
    jb.back();
    jb.cancelsubmit();
    }
    
    static testMethod void addJobCtrtest4(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
   /* Project__c prj = new Project__c();
    prj.name = 'test';
    insert prj;*/
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    insert g;
    
    ApexPages.currentPage().getParameters().put('jbid','prj.id');
    ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
   //  ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
     ApexPages.currentPage().getParameters().put('detail','true');
     ApexPages.currentPage().getParameters().put('jid','prj.id');
    ApexPages.currentPage().getParameters().put('isEdit','false');
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();   
    jb.edit='false';
    jb.edit(); 
    jb.home();
  //  jb.logout();
    jb.gotosite();
    jb.blog();
    jb.login();
    jb.gotohome();
    jb.viewApplicant();
    jb.back();
    jb.cancelsubmit();
    jb.viewjob();
    
   // jb.logout();
    }
    
    
    static testMethod void addJobCtrtest6(){
    
    Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
    User__c u=new User__c();
    u.name='test';
    insert u;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    g.User__c=u.id;
    insert g;
    
    ApexPages.currentPage().getParameters().put('jbid','prj.id');
    //ApexPages.currentPage().getParameters().put('orgid',o.id);
    ApexPages.currentPage().getParameters().put('oid',o.id);
    ApexPages.currentPage().getParameters().put('gwid',g.id);
   //  ApexPages.currentPage().getParameters().put('talentlogin',g.id);
     ApexPages.currentPage().getParameters().put('nplogin',o.id);
     ApexPages.currentPage().getParameters().put('detail','true');
   //  ApexPages.currentPage().getParameters().put('jid','prj.id');
    ApexPages.currentPage().getParameters().put('isEdit','false');
    
    addJobCtr jb = new addJobCtr();
    jb.Submit();   
    jb.edit='false';
    jb.edit(); 
    jb.home();
    jb.logout();
    jb.gotosite();
    jb.blog();
    jb.login();
    jb.gotohome();
    jb.viewApplicant();
    jb.back();
    jb.cancelsubmit();
    jb.viewjob();
    
   // jb.logout();
    }
    
    
    
}