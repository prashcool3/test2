public class JobsList{

    public Id ids{get;set;}
    public Id gid{get;set;}
    public boolean checklogin {get;set;}
    public List<Project__c> listJobs  {get;set;}
    public Grant_Writer__c g;
    public String talentlogin{get;set;}
    public Grant_Writer__c navg{get;set;}
    
    public PageReference RLogin(){
        PageReference pf = new PageReference('/apex/UserLoginVF');
        pf.setRedirect(true);
        return pf;
    }    
        
    public void fetchRecords(){
        checklogin = true;
        talentlogin=ApexPages.currentPage().getParameters().get('talentlogin');
         navg=[Select name from Grant_Writer__c where id=:talentlogin];
        gid = ApexPages.currentPage().getParameters().get('gwid');
        listJobs = new List<Project__c>();
        listJobs =[Select id, Name, Maximum_Salary__c, Minimum_Salary__c, End_Date__c, Job_Category__c,Position_Type__c, CreatedDate, Organization__r.name ,Short_Description__c, Salary__c from Project__c where End_Date__c > :System.Today()];
        g = [select id,User__c,User__r.Login_Status__c from Grant_Writer__c where id =: gid];
        if(g.User__r.Login_Status__c == false){
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
            checklogin = false;
        }    
    }
    
    
    public PageReference gotohome() {
       PageReference newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:g.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
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