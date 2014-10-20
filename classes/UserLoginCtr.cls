public class UserLoginCtr {

    public User__c u{get;set;}
    public User__c u1;
    public Employees__c e{get;set;}
    public UserLoginCtr() {
        u = new User__c();
    }
    
    public PageReference Login(){
        try{
            u1 = [select id,If_Employee__c, name,user_type__c,password__c,Login_Status__c,(select id from Organizations__r),(select id from Grant_Writers__r) from user__c where name=:u.name limit 1];
           e=[Select id, username__c,role__c, password__c, organization__c from employees__c where username__c=:u.name];
        }catch(Exception e){}
        //System.debug('-------------------'+u1.accounts__r[0].id);
        if(u1==null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'UserName is incorrect'));
            return null;
        }
        if(u1 != null && u1.password__c != u.password__c){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Password is incorrect'));
            return null;
        }
        
        
        u1.Login_Status__c = true;
        update u1;
        PageReference newocp;
        if(u1.user_type__c == 'Non-Profit')
            newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+u1.Organizations__r[0].id);
        else if(u1.user_type__c == 'Talent')
            newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+u1.Grant_Writers__r[0].id);   
       else if(u1.If_Employee__c==true)
           newocp = new PageReference('/apex/employeePage?eid='+e.id+'&orgid='+e.organization__c+'&role='+e.role__c);
           
        
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    public PageReference signup() {
        PageReference newocp = new PageReference('/apex/UserSignUp');
        newocp.setRedirect(true);
        return newocp;
    }
     public PageReference emplogin() {
        PageReference newocp = new PageReference('/apex/emploginpage');
        newocp.setRedirect(true);
        return newocp;
    }
      public PageReference gotosite() {
        PageReference newocp = new PageReference('http://www.grantsourcellc.com/');
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference blog() {
        PageReference newocp = new PageReference('http://www.grantsourcellc.com/category/blog/');
        newocp.setRedirect(true);
        return newocp;
    }
}