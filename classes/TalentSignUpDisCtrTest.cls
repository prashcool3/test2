@isTest
public class TalentSignUpDisCtrTest{
    static testMethod void TalentSignUpDisCtrtest(){
  
    
    Grant_Writer__c gw = new Grant_Writer__c();
    gw.name = 'test';
    insert gw;
    
     Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
     Project__c prj = new Project__c();
    prj.name = 'test';
    prj.End_Date__c = System.Today()-5;
    insert prj;
    
     Project__c prj1 = new Project__c();
    prj1.name = 'test';
     prj1.End_Date__c = System.Today()+5;
    insert prj1;
    
    Job_Application__c j=new Job_Application__c();
    j.Job__c=prj.id;
    j.Employment_accepted__c=true;
    j.Grant_Writer__c=gw.id;
    insert j;
    
    
     Job_Application__c j1=new Job_Application__c();
    j1.Job__c=prj1.id;
    j1.Employment_accepted__c=true;
    j1.Grant_Writer__c=gw.id;
    insert j1;
    
    
    ApexPages.currentPage().getParameters().put('gwid',gw.id);
    ApexPages.currentPage().getParameters().put('talentlogin',gw.id);
    ApexPages.currentPage().getParameters().put('jbid',prj.id);
    ApexPages.currentPage().getParameters().put('editinfo','true');
    
    TalentSignUpDisCtr t = new TalentSignUpDisCtr();
    t.Edit();
    t.Save();
    t.cancel();
    t.RLogin();
    t.view();
    t.viewJobs();
    t.PostJob();
    t.viewOrgJobs();
    t.viewPrevJob();
    t.viewNPInfo();
    t.gotosite();
    t.blog();
    }
    
    
    static testMethod void TalentSignUpDisCtrtest1(){
    
      
    User__c u=new User__c();
    u.name='test';
    insert u;
    
    Grant_Writer__c gw = new Grant_Writer__c();
    gw.name = 'test';
    gw.Salutation__c='Mr.';
    //gw.User__r.name=u.name;
    gw.Phone__c='9997776665';
    gw.Phone_alternate__c='8887776665';
    gw.Talent_Skill__c='Grant Writer';
    gw.Self_Evaluation_Writer__c='test';
    gw.Seeking__c='test';
    gw.Interest_In__c='test';
    gw.Self_Evalation_Researcher__c='test';
    gw.Mailing_Street_Address__c='test';
    gw.City__c='test';
    gw.State__c='test';
    gw.Zip_Postal_Code__c='110087';
    gw.Email__c='test@test.com';
    gw.Website__c='www.test.com';
    insert gw;
    
     Organization__c o = new Organization__c();
    o.name = 'testorg';
    insert o;
    
     Project__c prj = new Project__c();
    prj.name = 'test';
    prj.End_Date__c = System.Today()-5;
    insert prj;
    
     Project__c prj1 = new Project__c();
    prj1.name = 'test';
     prj1.End_Date__c = System.Today()+5;
    insert prj1;
    
    Job_Application__c j=new Job_Application__c();
    j.Job__c=prj.id;
    j.Employment_accepted__c=true;
    j.Grant_Writer__c=gw.id;
    insert j;
    
    
     Job_Application__c j1=new Job_Application__c();
    j1.Job__c=prj1.id;
    j1.Employment_accepted__c=true;
    j1.Grant_Writer__c=gw.id;
    insert j1;
    
    
    ApexPages.currentPage().getParameters().put('gwid',gw.id);
    ApexPages.currentPage().getParameters().put('talentlogin',gw.id);
    ApexPages.currentPage().getParameters().put('jbid',prj.id);
    ApexPages.currentPage().getParameters().put('editinfo','true');
    
    TalentSignUpDisCtr t = new TalentSignUpDisCtr();
    t.Edit();
    t.Save();
    t.cancel();
    t.RLogin();
    t.view();
    t.viewJobs();
    t.PostJob();
    t.viewOrgJobs();
    t.viewPrevJob();
    t.viewNPInfo();
    t.gotosite();
    t.blog();
    }
    
    
    
    
    
    
}