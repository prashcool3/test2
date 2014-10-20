@isTest
public class NonProfitSignUpDisCtrTest{
    static testMethod void NonProfitSignUpDisCtrtest(){
    
    
    user__c u=new User__c();
    u.name='test';
    insert u;
    
    Organization__c o = new Organization__c();
    o.Name = 'test';
    o.Email__c = 'test@gmail.com';
    o.User__c=u.id;
    o.Other_Name_Organisation_is_known_as__c='testing';
        o.Annual_Budget_Size__c='3';
        o.of_employees_FTE__c='4';
        o.Salutation__c='Mr.';
        o.Title__c='check';
        o.Contact_Name__c='check';
        o.Phone__c='8887776665';
        o.Tax_EIN__c='yes';
        o.Phone_alternate__c='8887774445';
        o.Federal_Tax_Exempt_Status__c='true';
        o.Exempt_from_tax__c='yes';
        o.Mailing_Street_Address__c='Address';
        o.City__c='city';
        o.State__c='state';
        o.Zip_Postal_Code__c=201301;
        o.Email__c='test@test.com';
        o.Website__c='www.test.com';
     insert o;
    
    
    Department__c d =new Department__c();
    d.name='test';
    d.Organization__c=o.id;
    insert d;
    
     Department__c d2 =new Department__c();
    d2.name='testing';
    d2.Organization__c=o.id;
    
    
    
    Project__c p=new Project__c();
    p.name='test';
    p.Organization__c=o.id;
    insert p;
   
    ApexPages.currentPage().getParameters().put('orgid',o.id);
     ApexPages.currentPage().getParameters().put('editinfo','true');
      ApexPages.currentPage().getParameters().put('jbid',p.id);
       ApexPages.currentPage().getParameters().put('dept','testing');
    
    NonProfitSignUpDisCtr np = new NonProfitSignUpDisCtr();
    np.Edit();
    np.Save();
    np.postjob();
    np.view();
    np.login();
    //np.addDept();
    np.deletedept();
    np.viewPrevJob();
    np.gotosite();
    np.blog();
    np.cancel();
    np.logout();
    
    
    
    }
    
    
    static testMethod void NonProfitSignUpDisCtrtest1(){
    
    
    user__c u=new User__c();
    u.name='test';
    insert u;
    
    Organization__c o = new Organization__c();
    o.Name = 'test';
    o.Email__c = '';
    o.User__c=u.id;
    o.Other_Name_Organisation_is_known_as__c='';
        o.Annual_Budget_Size__c='';
        o.of_employees_FTE__c='';
        o.Salutation__c='';
        o.Title__c='';
        o.Contact_Name__c='';
        o.Phone__c='';
        o.Tax_EIN__c='yes';
        o.Phone_alternate__c='';
        o.Federal_Tax_Exempt_Status__c='';
        o.Exempt_from_tax__c='';
        o.Mailing_Street_Address__c='';
        o.City__c='';
        o.State__c='';
       // o.Zip_Postal_Code__c=201301;
        o.Email__c='';
        o.Website__c='';
     insert o;
    
    
    Department__c d =new Department__c();
    d.name='test';
    d.Organization__c=o.id;
    insert d;
    
     Department__c d2 =new Department__c();
    d2.name='testing';
    d2.Organization__c=o.id;
    
    
    
    Project__c p=new Project__c();
    p.name='test';
    p.Organization__c=o.id;
    insert p;
   
    ApexPages.currentPage().getParameters().put('orgid',o.id);
     ApexPages.currentPage().getParameters().put('editinfo','true');
      ApexPages.currentPage().getParameters().put('jbid',p.id);
       ApexPages.currentPage().getParameters().put('dept','testing');
    
    NonProfitSignUpDisCtr np = new NonProfitSignUpDisCtr();
    np.Edit();
    np.Save();
    np.postjob();
    np.view();
    np.login();
    //np.addDept();
    np.deletedept();
    np.viewPrevJob();
    np.gotosite();
    np.blog();
    np.cancel();
    np.logout();
    
    
    
    }
    
  
    
}