public class viewsubmissionctr {

    public boolean checklogin {get;set;}
    public String jjid{get;set;}
    public List<Project__c> jList{get;set;}
    public User__c u;
    public String editId{get;set;}
    public boolean isEdit{get;set;}
    public List<Job_Application__c> applicants{get; set;}
    public String oId{get;set;}
    public String orgId{get;set;}
    public String talentlogin{get;set;}
    public string nplogin{get;set;}
     public Grant_Writer__c navg{get;set;}
     public String eid{get;set;}
     public String role{get;set;}
     public boolean noReadOnly{get;set;}
     public boolean ronly{get;set;}
 public Organization__c navo{get;set;}
    
    
    public viewsubmissionctr(){
        ronly=false;
        noReadOnly=true;
        talentlogin=ApexPages.currentPage().getParameters().get('talentlogin');
        role=ApexPages.currentPage().getParameters().get('role');
        eid=ApexPages.currentPage().getParameters().get('eid');
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
         if(role!=null && role.contains('Read') ){
            ronly=true;
        }
        
        if(role!=null && !role.contains('Read') && nplogin==null ){
            noReadOnly=false;
        }
       
        
        checklogin = true;
        jList = new List<Project__c>();
        //oId = ApexPages.currentPage().getParameters().get('oid');
        orgId = ApexPages.currentPage().getParameters().get('orgid');
        
        
        
        try{
        jList = [select id,name,Organization__c,Organization__r.User__r.login_status__c,Job_Category__c,Project_Description__c,Tags_Keywords__c,Email__c,Visibility__c,
                  Website__c,Tagline__c,Short_Description__c,Job_Type__c,Salary_Type__c from Project__c where Organization__c =: orgid];
        }catch(Exception e){}
        
        if(talentlogin!=null){
            navg=[Select name from Grant_Writer__c where id=:talentlogin];
        }
        else if(nplogin!=null){
            navo=[Select name from Organization__c where id=:nplogin];
        
        }
        
        
        applicants=new List<Job_Application__c>();
        applicants = [Select id, name from Job_Application__c where Job__c =: editId];
        
    }
    
    public PageReference Edit() {
      PageReference pr;
    if(talentlogin!=null){
        pr = new PageReference('/apex/addJobVF?jbid='+jjid+'&talentlogin='+talentlogin);
       
     }
     else if(nplogin!=null){
        pr = new PageReference('/apex/addJobVF?jbid='+jjid+'&nplogin='+nplogin);
       
     }
     else if(eid!=null){
        pr = new PageReference('/apex/addJobVF?jbid='+jjid+'&eid='+eid+'&role='+role);
     }
     
      pr.setRedirect(true);
        return pr;
     
    }
    public PageReference Logout() {
        User__c u = [select id,login_status__c from user__c where id=:jList[0].Organization__r.User__r.Id];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference EditJob() {
     PageReference newocp;
      if(talentlogin!=null){
        newocp = new PageReference('/apex/addJobVF?jbid='+editId+'&talentlogin='+talentlogin); 
      }
      else if(nplogin!=null){
        newocp = new PageReference('/apex/addJobVF?jbid='+editId+'&nplogin='+nplogin);   
      }
      else if(eid!=null){
         newocp = new PageReference('/apex/addJobVF?jbid='+editId+'&eid='+eid+'&role='+role);    
      }
         newocp.setRedirect(true);
        return newocp;
    }
     public PageReference viewJob() {
        PageReference newocp;
        isEdit=false;
      if(talentlogin!=null){
        newocp = new PageReference('/apex/jobApplicants?jbid='+editId+'&orgId='+orgId+'&isEdit='+isEdit+'&talentlogin='+talentlogin);   
       }
      else if(nplogin!=null){
        newocp = new PageReference('/apex/jobApplicants?jbid='+editId+'&orgId='+orgId+'&isEdit='+isEdit+'&nplogin='+nplogin);   
      } 
      else if(eid!=null){
          newocp = new PageReference('/apex/jobApplicants?jbid='+editId+'&orgId='+orgId+'&isEdit='+isEdit+'&eid='+eid+'&role='+role);
      }
         
          newocp.setRedirect(true);
        return newocp;
      
       }
       
       
       public PageReference gotohome(){
        PageReference newocp;
        if(talentlogin!=null){
            newocp=new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);
        }
        else if(nplogin!=null){
            newocp=new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin);
        }
        else if(eid!=null){
          newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgId='+orgId+'&role='+role);
        }
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