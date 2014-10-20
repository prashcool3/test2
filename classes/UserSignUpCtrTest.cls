@isTest
private class  UserSignUpCtrTest {
    static testMethod void UserSignUpCtrTesting() {
    
        test.startTest();
        
        UserSignUpCtr m = new UserSignUpCtr();
        m.u.name='TestName123';
        m.u.User_Type__c='Non-Profit';
        m.submit();
        
        m.u.name='TestName123';
        m.u.User_Type__c='Non-Profit';
        m.submit();
        
         
         
        UserSignUpCtr m1 = new UserSignUpCtr();
        m1.u.name='TestName';
        m1.u.User_Type__c='Talent';
        //insert m1.u;
        m1.submit();
        m1.gotosite();
        m1.blog();
    
        test.stopTest();
        
    }
}