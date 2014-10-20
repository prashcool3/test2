@isTest
public class JobApplicatnInfoCtrTest{
    static testMethod void JobApplicatnInfoCtrtest(){
    
        User__c u=new User__c();
        u.name='test';
        insert u;
        
        Organization__c o = new Organization__c();
        o.name = 'testorg';
        o.User__c=u.id;
        insert o;
        
        Project__c prj = new Project__c();
        prj.name = 'test';
        prj.Organization__c=o.id;
        insert prj;
        
        
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='TestGW';
        g.Salutation__c='Mr.';
        //g.User__r.name=u.name;
        g.Phone__c='9998886665';
        g.Phone_alternate__c='9997765554';
        g.Talent_Skill__c='Grant Writer';
        g.Self_Evaluation_Writer__c='check';
        g.Seeking__c='check';
        g.Interest_In__c='test';
        g.Self_Evalation_Researcher__c='check';
        g.Mailing_Street_Address__c='testtest';
        g.City__c='testcity';
        g.State__c='teststate';
        g.Zip_Postal_Code__c='110087';
        g.Email__c='test@test.in';
        g.Website__c='www.test.com';
        insert g;
        
       
        
        ApexPages.currentPage().getParameters().put('jbid',prj.id);
        ApexPages.currentPage().getParameters().put('orgid',o.id);
        ApexPages.currentPage().getParameters().put('gwid',g.id);
        ApexPages.currentPage().getParameters().put('talentlogin',g.id);
        //ApexPages.currentPage().getParameters().put('nplogin',o.id);
        //ApexPages.currentPage().getParameters().put('detail','true');
        
        
        Job_Application__c ja= new Job_Application__c();
        ja.Job__c=prj.id;
        ja.Grant_Writer__c=g.id;
        ja.name=g.name;
        ja.Role__c='Supervisor';
        insert ja; 
        
        
        Rating__c r=new Rating__c();
        r.Rating_for__c = g.id;
        
        insert r;
        
        
        JobApplicatnInfoCtr jb=new JobApplicatnInfoCtr();
        jb.supview='true';
        jb.rate();
        //jb.saverating();
       // jb.saverole();
        jb.back();
        jb.viewNPInfo();
        jb.gotohome();
        jb.gotosite();
        jb.blog();
        
        
        
        NonProfitInfoCtr n=new NonProfitInfoCtr();
        n.npview='true';
        
        n.back();
        n.RLogin();
        n.gotohome();
        n.gotosite();
        n.blog();
        
        
          
        viewsubmissionctr v=new viewsubmissionctr();
        v.Edit();
        v.EditJob();
        v.viewJob();
        v.gotohome();
        v.gotosite();
        v.blog() ;
        v.logout();
        
        
    }
    
    static testMethod void JobApplicatnInfoCtrtest1(){
        Organization__c o = new Organization__c();
        o.name = 'testorg';
        insert o;
        
        Project__c prj = new Project__c();
        prj.name = 'test';
        insert prj;
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='TestGW';
        insert g;
        
        
        ApexPages.currentPage().getParameters().put('jbid',prj.id);
        ApexPages.currentPage().getParameters().put('orgid',o.id);
        ApexPages.currentPage().getParameters().put('gwid',g.id);
       // ApexPages.currentPage().getParameters().put('talentlogin',g.id);
        ApexPages.currentPage().getParameters().put('nplogin',o.id);
        //ApexPages.currentPage().getParameters().put('detail','true');
        
        Job_Application__c ja= new Job_Application__c();
        
        ja.Job__c=prj.id;
        ja.Grant_Writer__c=g.id;
        ja.name=g.name;
        insert ja;
        
        JobApplicatnInfoCtr jb=new JobApplicatnInfoCtr();
        jb.supview='true';
        jb.rate();
        //jb.saverating();
        //jb.saverole();
        jb.back();
        jb.viewNPInfo();
        jb.gotohome();
        jb.gotosite();
        jb.blog();
        
      
         NonProfitInfoCtr n=new NonProfitInfoCtr();
        n.npapplied='true';
        
        n.back();
        n.RLogin();
        n.gotohome();
        n.gotosite();
        n.blog();
        
         viewsubmissionctr v=new viewsubmissionctr();
        v.Edit();
        v.EditJob();
        v.viewJob();
        v.gotohome();
        v.gotosite();
        v.blog() ;
        //v.logout();
      
        
    }
    
    
    static testMethod void JobApplicatnInfoCtrtest2(){
        Organization__c o = new Organization__c();
        o.name = 'testorg';
        insert o;
        
        Project__c prj = new Project__c();
        prj.name = 'test';
        insert prj;
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='TestGW';
        insert g;
        
        
        ApexPages.currentPage().getParameters().put('jbid',prj.id);
        ApexPages.currentPage().getParameters().put('orgid',o.id);
        ApexPages.currentPage().getParameters().put('gwid',g.id);
        ApexPages.currentPage().getParameters().put('talentlogin',g.id);
        //ApexPages.currentPage().getParameters().put('nplogin',o.id);
        ApexPages.currentPage().getParameters().put('jinfo','yes');
      
      
      Job_Application__c ja= new Job_Application__c();
        ja.Job__c=prj.id;
        ja.Grant_Writer__c=g.id;
        ja.name=g.name;
        insert ja;
        
        JobApplicatnInfoCtr jb=new JobApplicatnInfoCtr();
        jb.supapplied='true';
        jb.rate();
        //jb.saverating();
        //jb.saverole();
        jb.back();
        jb.viewNPInfo();
        jb.gotohome();
        jb.gotosite();
        jb.blog();
        
      
        
        
    }
    
    
    static testMethod void JobApplicatnInfoCtrtest3(){
        Organization__c o = new Organization__c();
        o.name = 'testorg';
        insert o;
        
        Project__c prj = new Project__c();
        prj.name = 'test';
        insert prj;
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='TestGW';
        insert g;
        
        
        ApexPages.currentPage().getParameters().put('jbid',prj.id);
        ApexPages.currentPage().getParameters().put('orgid',o.id);
        ApexPages.currentPage().getParameters().put('gwid',g.id);
        //ApexPages.currentPage().getParameters().put('talentlogin',g.id);
        ApexPages.currentPage().getParameters().put('nplogin',o.id);
        ApexPages.currentPage().getParameters().put('jinfo','yes');
        
        
        Job_Application__c ja= new Job_Application__c();
        ja.Job__c=prj.id;
        ja.Grant_Writer__c=g.id;
        ja.name=g.name;
        insert ja;
      
      JobApplicatnInfoCtr jb=new JobApplicatnInfoCtr();
        jb.supapplied='true';
        jb.rate();
        //jb.saverating();
        //jb.saverole();
        jb.back();
        jb.viewNPInfo();
        jb.gotohome();
        jb.gotosite();
        jb.blog();
        
      
        
        
    }
    
}