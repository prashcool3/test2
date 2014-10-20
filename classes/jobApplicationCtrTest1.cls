@isTest
public class jobApplicationCtrTest1{
    static testMethod void jobApplicationCtrtest1(){
    
        Project__c prj1 = new Project__c();
    prj1.name = 'test';
    prj1.End_Date__c=System.Today()+1;
    insert prj1;
    
    Project__c prj2 = new Project__c();
    prj2.name = 'test';
    prj2.End_Date__c=System.Today()+2;
    insert prj2;
    
    Project__c prj3 = new Project__c();
    prj3.name = 'test';
    prj3.End_Date__c=System.Today()+3;
    insert prj3;
    
    Project__c prj4 = new Project__c();
    prj4.name = 'test';
    prj4.End_Date__c=System.Today()+4;
    insert prj4;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    g.Phone__c='9998887776';
    g.Email__c='test@test.com';
    insert g;
    
    
    Job_Application__c j1=new Job_Application__c ();
    
    j1.job__c=prj1.id;
    j1.grant_writer__c=g.id;
    j1.Name=g.name;
        j1.Phone__c=g.Phone__c;
        j1.Email__c=g.Email__c;
       
    insert j1;
    
    Job_Application__c j2=new Job_Application__c ();
    j2.Name=g.name;
        j2.Phone__c=g.Phone__c;
        j2.Email__c=g.Email__c;
    j2.job__c=prj2.id;
    j2.grant_writer__c=g.id;
    insert j2;
    
    Job_Application__c j3=new Job_Application__c ();
    j3.Name=g.name;
        j3.Phone__c=g.Phone__c;
        j3.Email__c=g.Email__c;
    j3.job__c=prj3.id;
    j3.grant_writer__c=g.id;
    insert j3;
    
    Job_Application__c j4=new Job_Application__c ();
    j4.Name=g.name;
        j4.Phone__c=g.Phone__c;
        j4.Email__c=g.Email__c;
    j4.job__c=prj4.id;
    j4.grant_writer__c=g.id;
    insert j4;
    
    
    
    ApexPages.currentPage().getParameters().put('gwid',g.id);
    
    JobApplicationCtr jb=new JobApplicationCtr();
    jb.Apply();
    
    }
    
    
    
    static testMethod void jobApplicationCtrtest2(){
    
        Project__c prj1 = new Project__c();
    prj1.name = 'test';
    prj1.End_Date__c=System.Today()+1;
    insert prj1;
    
    Project__c prj2 = new Project__c();
    prj2.name = 'test';
    prj2.End_Date__c=System.Today()+2;
    insert prj2;
    
    Project__c prj3 = new Project__c();
    prj3.name = 'test';
    prj3.End_Date__c=System.Today()+3;
    insert prj3;
    
    Project__c prj4 = new Project__c();
    prj4.name = 'test';
    prj4.End_Date__c=System.Today()+4;
    insert prj4;
    
    Grant_Writer__c g=new Grant_Writer__c();
    g.name='TestGW';
    g.Phone__c='9998887776';
    g.Email__c='test@test.com';
    insert g;
    
    
    Job_Application__c j1=new Job_Application__c ();
    
    j1.job__c=prj1.id;
    j1.grant_writer__c=g.id;
    j1.Name=g.name;
        j1.Phone__c=g.Phone__c;
        j1.Email__c=g.Email__c;
       
    insert j1;
     
    
    ApexPages.currentPage().getParameters().put('gwid',g.id);
    ApexPages.currentPage().getParameters().put('id',prj1.id);
    
    Blob b = Blob.valueOf('Test Data');  
    
    Attachment a = new Attachment();
            a.body = b;
            a.ParentId = j1.id;
            a.OwnerId = UserInfo.getUserId();
            a.contentType = 'test';
            a.name = j1.name + ' Resumee';
            
            insert a;
    
    JobApplicationCtr jb=new JobApplicationCtr();
    jb.Apply();
    
    }
    
    
    
    
}