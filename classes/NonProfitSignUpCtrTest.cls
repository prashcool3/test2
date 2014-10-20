@isTest
public class NonProfitSignUpCtrTest{
    static testMethod void NonProfitSignUpCtrtest(){
    
     User__c u = new User__c();
    u.name = 'testuser';
    insert u;

    
    Organization__c org = new Organization__c();
    org.name = 'test';
    insert org;
    
      ApexPages.StandardController sc = new ApexPages.StandardController(org);
      NonProfitSignUpCtr n = new NonProfitSignUpCtr(sc);

     n.str.add('true');
    n.str1.add('true');
    n.str2.add('true');
    n.depList.add('true');
     n.depList.add('test');
    
    
   
    org.User__c=u.id;
    org.Exempt_from_tax__c=n.str[0];
    org.Federal_Tax_Exempt_Status__c=n.str1[0];
    org.If_yes__c=n.str2[0];
    upsert org;
    
    Department__c d=new department__c();
    d.name='test';
    d.Organization__c=org.id;
    insert d;
    
    ApexPages.currentPage().getParameters().put('orgId',org.id);
  
    ApexPages.currentPage().getParameters().put('uid',u.id);
    

    n.save();
    n.refreshdept();
    n.gotosite();
    n.blog();
    
    
    }
}