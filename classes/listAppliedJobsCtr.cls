public class listAppliedJobsCtr{
    
   // TalentSignUpDisCtr c=new TalentSignUpDisCtr();
    
    Public List<Job_Application__c> jobs{get;set;}   
    Public List<String> jId{get;set;} 
    Public List<Project__c> appliedJobs{get;set;} 
    Public String gid{get; set;}
    public boolean isEdit{get;set;}
    public boolean checklogin {get;set;}
    public Grant_writer__c g;
    public list<Rating__c> rateList{get; set;}
    public String org;
    public String talentlogin{get;set;}
    public Grant_Writer__c navg{get;set;}
    
    public void listAppliedJobs(){
        checklogin = true;
        String id = ApexPages.currentPage().getParameters().get('gwid');
        talentlogin = ApexPages.currentPage().getParameters().get('talentlogin');
         navg=[Select name from Grant_Writer__c where id=:talentlogin];
        gid=id;
        jobs=new List<Job_Application__c>();
        jId=new List<String>();
        appliedJobs=new List<Project__c>();
        jobs=[Select id, Job__c from Job_Application__c where Grant_Writer__c=:gid];
        for (Job_Application__c j:jobs){
           jId.add(j.Job__c);
        }
        appliedJobs=[Select Name, Job_Category__c,Position_Type__c, Maximum_Salary__c, Minimum_Salary__c, CreatedDate, Short_Description__c, Salary__c,Employees__r.User__r.Login_Status__c, Organization__c
                     from Project__c where id in: jId];
        //System.debug('-----------------------'+appliedJobs[0].Grant_Writer__r.User__r.Login_Status__c);
        g = [select id,user__c,User__r.Login_Status__c from grant_writer__c where id =: gid];
        if(g.User__r.Login_Status__c  == false){
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
            checklogin = false;
        }
        
       /* for{Project__c o:appliedjobs}{ 
        org=o.Organization__c;
        rateList=new List<Rating__c>();
        rateList=[Select id, Organization__c, Grant_Writer__c, Comments__c from Rating__c where Organization__c=:org];
        String s=rateList.size() + 'reviews';
        } */
        
    }
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:g.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference viewReviews() {
        User__c u = [select id,Login_Status__c from User__c where id=:g.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
     public PageReference gotohome() {
       PageReference newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    public PageReference login() {
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