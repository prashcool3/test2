@isTest
private class  UserLoginCtrTest {
    static testMethod void UserLoginCtrTesting() {
        test.startTest();
        
  
        UserLoginCtr m = new UserLoginCtr();
        m.signup();
        
        m.u.name='tests';
        m.u.password__c='test';
        m.u.user_type__c='Non-Profit';
        m.u.Login_Status__c=true;
        m.Login();
        
        m.u.name='test';
        m.u.user_type__c='Talent';
        m.u.password__c='tests';
        m.Login();
      
        User__c u1=new User__c();
        u1.name=m.u.name;
        u1.password__c= 'Cehck';
        insert u1;
        
         
        Organization__c o=new Organization__c();
        o.name='test';
        o.User__c=u1.id;
        insert o;
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='test';
        g.User__c=u1.id;
        insert g;
       
        
        UserLoginCtr m1 = new UserLoginCtr();
        m1.u.name='TestName';
        m1.u.User_Type__c='Talent';
        m1.u.password__c='testing';
        m1.Login();
        m1.gotosite();
        m1.blog();
        test.stopTest();
    
  }
  
  
      static testMethod void UserLoginCtrTesting1() {
        test.startTest();
        
        UserLoginCtr m = new UserLoginCtr();
        m.u.name='tests';
        m.u.password__c='test';
        m.u.user_type__c='Non-Profit';
        m.u.Login_Status__c=true;
        m.signup();
        insert m.u;

        
        Organization__c o=new Organization__c();
        o.name='test';
        o.User__c=m.u.id;
        insert o;
        
        Grant_Writer__c g=new Grant_Writer__c();
        g.name='test';
        g.User__c=m.u.id;
        insert g;
         
        UserLoginCtr m1 = new UserLoginCtr();
        m1.u.name='TestName';
        m1.u.User_Type__c='Talent';
        m1.u.password__c='testing';
        m1.Login();
        m1.gotosite();
        m1.blog();
        test.stopTest();
     
  }
  
  
}