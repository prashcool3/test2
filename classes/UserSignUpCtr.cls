public class UserSignUpCtr {
    public User__c u{get; set;}
    
    public UserSignUpCtr(){
        u = new User__c();
    }
    
    public PageReference submit(){
        User__c u1;
        try{
            u1 = [select id,name from User__c where name =: u.name limit 1];
        }catch(Exception e){}
        if(u1!=null){
            u.name.adderror('User Name already exists');
            return null;
        }    
        try{
            u.Login_Status__c = true;
            insert u;
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'Unable to Sign Up. Please try again'));
            return null;
        }
        if(u.User_Type__c == 'Non-Profit'){
            PageReference newocp = new PageReference('/apex/NonProfitSignUpVF?uid='+u.id);   
            newocp.setRedirect(true);
            return newocp;
        }
        else if(u.User_Type__c == 'Talent'){
            PageReference newocp = new PageReference('/apex/TalentSignUp?uid='+u.id);   
            newocp.setRedirect(true);
            return newocp;
        }
        return null;
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