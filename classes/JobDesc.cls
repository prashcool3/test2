public class JobDesc{

    public Project__c job{get;set;}
    public String Jobid{get;set;}
    public boolean chk1{get;set;}
    public String gid{get;set;}
    public boolean checklogin {get;set;}
    public String orgid{get;set;}
    Public List<Rating__c> rate{get;set;}
    Public Job_Application__c jobapp{get;set;}
    Public Job_Application__c jobapp2{get;set;}
    Public boolean canRequest{get;set;}
    Public boolean jobDone{get;set;}
    Public boolean canReqGrant{get;set;}
    Public List<Job_Application__c> jobapp1{get;set;}
    Public Boolean cannotReqEmp{get;set;}
    Public Project__c project{get;set;}
    Public Boolean chk{get;set;}
    Public boolean isworking{get;set;}
    Public boolean hasWorked{get;set;}
    Public boolean canRate{get;set;}
    Public String talentlogin{get;set;}
    Public String supapplied{get;set;}
    Public String npapplied{get;set;}
    Public String supview{get;set;}
    Public String npview{get;set;}
    Public Grant_Writer__c gr{get;set;}
    public Grant_Writer__c navg{get;set;}
    public String sss {get;set;}
    public Employees__c emp{get;set;}
    public rating__c existingrating{get;set;}
    public boolean popupclose{get;set;}
    
    public JobDesc(){
        sss = ApexPages.currentPage().getHeaders().get('Referer');
        popupclose = true;
        checklogin = true;
        supapplied='true';
        npapplied='true';
        npview='true';
        supview='true';
        canRate=false;
        canRequest=false;
        isworking=false;
        hasworked=false;
        chk=false;
        chk1=false;
        project=new Project__c();
        jobDone=false;
        Jobid = ApexPages.currentPage().getParameters().get('ids');
        talentlogin = ApexPages.currentPage().getParameters().get('talentlogin');
         navg=[Select name from Grant_Writer__c where id=:talentlogin];
         
        gid = ApexPages.currentPage().getParameters().get('gwid');
        jobapp1=new List<Job_Application__c>();
        job=new Project__c(); 
         orgid=job.Organization__c;
       
        
        if(job.End_Date__c < System.Today()){
            jobDone=true;
        }
        
        gr=[Select User__c,id,User__r.Login_Status__c from grant_writer__c where id=:gid];
        if(gr.User__r.Login_Status__c == false){
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
            checklogin = false;
        }
        
        try{
            job=[Select id, name, Organization__r.name, Organization__c,  Employees__r.name, Department__c, Project_Description__c ,Position_Type__c, Salary_Type__c, End_Date__c, Employees__c, Job_Category__c, Salary__c, Maximum_Salary__c, Minimum_Salary__c, Short_Description__c from Project__c where id=:jobid ];
             emp=[select id, role__c, organization__c, name from employees__c where id=:job.Employees__c];
         
          }catch(Exception e){}  
            try{jobapp=[Select id, Grant_Writer__c, Job__c, Selected__c, Grant_requested__c, Grant_accepted__c, Employment_accepted__c, Employment_Request__c from Job_Application__c where Grant_Writer__c=:gid and Job__c=:Jobid];
               if(jobapp.Employment_Request__c==true && jobapp.Employment_accepted__c==false && job.End_Date__c > System.today()){
               chk1=true;}
            }catch(Exception e){}
            try{jobapp2=[Select id,  Grant_Writer__c, Role__c, Job__c, Selected__c, Grant_requested__c, Grant_accepted__c, Employment_accepted__c, Employment_Request__c from Job_Application__c where Role__c=:'Supervisor' and Job__c=:Jobid ];}catch(Exception e){}
            try{jobapp1=[Select id, Grant_Writer__c, Job__c, Selected__c, Grant_requested__c, Grant_accepted__c, Employment_accepted__c, Employment_Request__c from Job_Application__c where Grant_Writer__c=:gid];}catch(Exception e){}
       
        try{
            existingrating=[Select Organization__c, Grant_Writer__c, id, Rating_for_emp__c, project__c from Rating__c where Organization__c=:job.Organization__c and Grant_Writer__c=:gid and project__c=:job.id and rating_for_emp__c=:emp.id  ];
        }catch(Exception e){}
        
        System.debug('Testing rating================>'+existingrating);
        
        if(jobapp!=null && job!=null &&  jobapp.selected__c==true && job.End_Date__c>date.today() && jobapp.Employment_Request__c==false && jobapp.Employment_accepted__c==false){
                canRequest=true;
        }
        if( jobapp!=null && job!=null && job.End_Date__c < System.Today() && jobapp.Employment_accepted__c==true && jobapp.Grant_requested__c==false && jobapp.Grant_accepted__c==false){
            canReqGrant=true;
        }
        else if( jobapp!=null && job!=null && jobapp.Employment_accepted__c==true && job.End_Date__c>date.today()){
            isworking=true;
        
        }
        
         if( jobapp!=null && job!=null && job.End_Date__c < System.Today() && jobapp.Employment_accepted__c==true && jobapp.Grant_requested__c==false && jobapp.Grant_accepted__c==false){
            canReqGrant=true;
        }
        else if( jobapp!=null && job!=null && jobapp.Employment_accepted__c==true && job.End_Date__c<date.today())
        {
             hasworked=true;
        }
        if( jobapp!=null && job!=null && job.End_Date__c < System.Today() && jobapp.Employment_accepted__c==true && existingrating==null){
            canRate=true;
        }
        else{
            canRate=false;
        }
        
        System.debug('Testing jobapp-------------->' +jobapp);
        System.debug('Tseting job------------->' +job);
    }
    
    public PageReference SubmitNPRating() {
        if(rate.size()==0){
            PageReference pr = new PageReference('/apex/ratingPage?ids='+jobid +'&gwid='+gid+'&talentlogin='+talentlogin);
            pr.setRedirect(true);
            return pr;
        }
        else{
            PageReference pr = new PageReference('/apex/ShowError');
            pr.setRedirect(true);
            return pr;
        }
    }
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:gr.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference NPInfo() {
        Jobid = ApexPages.currentPage().getParameters().get('ids');
        gid = ApexPages.currentPage().getParameters().get('gwid');
        job=new Project__c(); 
        job=[Select id, name, Organization__r.name, Project_Description__c ,Position_Type__c, Salary_Type__c, End_Date__c, Job_Category__c, Salary__c, Maximum_Salary__c, Minimum_Salary__c, Short_Description__c from Project__c where id=:jobid ];
        orgid=job.Organization__c;
        
        PageReference pr = new PageReference('/apex/NonProfitInfoPage?orgId='+orgid +'&gwid='+gid+'&talentlogin='+talentlogin+'&npapplied='+npapplied+'&jobid='+jobid);
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference NPInfo1() {
        Jobid = ApexPages.currentPage().getParameters().get('ids');
        gid = ApexPages.currentPage().getParameters().get('gwid');
        job=new Project__c(); 
        job=[Select id, name, Organization__r.name, Project_Description__c ,Position_Type__c, Salary_Type__c, End_Date__c, Job_Category__c, Salary__c, Maximum_Salary__c, Minimum_Salary__c, Short_Description__c from Project__c where id=:jobid ];
        orgid=job.Organization__c;
        
        PageReference pr = new PageReference('/apex/NonProfitInfoPage?orgId='+orgid +'&gwid='+gid+'&talentlogin='+talentlogin+'&npview='+npview+'&jobid='+jobid);
        pr.setRedirect(true);
        return pr;
    }
    
    public void requestEmp(){
        for(Job_Application__c j:jobapp1){
            project=[Select id, End_date__c from Project__c where id=:j.Job__c];
                
                    if(j.Employment_accepted__c==true && project.End_Date__c>System.Today() ){
                        cannotReqEmp=true;
                    }
                    
        }
        
        if(cannotReqEmp==true){
          
          chk=true;
          canRequest=false;
        }
        else{
            canRequest=false;
            
            if(jobapp.Employment_Request__c==false && job.End_Date__c > System.today()){
                jobapp.Employment_Request__c=true;
                chk1=true;
            }
            update jobapp;
        }
    }

    public void requestGrant(){
        jobapp.Grant_requested__c=true;
        System.debug('Testin jobapp----->' +jobapp.Grant_requested__c);
        upsert jobapp;
    }
    
     public PageReference gotohome() {
       PageReference newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    /* public PageReference viewsupinfo() {
      PageReference newocp;
       
       if(jobapp2!=null)   {
           newocp = new PageReference('/apex/jobApplicantInfo?gwid='+jobapp2.Grant_Writer__c+'&orgId='+job.Organization__c+'&talentlogin='+talentlogin+'&supapplied='+supapplied+'&gid='+gid+'&jobId='+jobid);
       }
       else {
           newocp = new PageReference('/apex/jobApplicantInfo?gwid='+job.Employees__c+'&orgId='+job.Organization__c+'&talentlogin='+talentlogin+'&supapplied='+supapplied+'&gid='+gid+'&jobId='+jobid);
       }
       
       
    }*/
    
    
    public PageReference viewsupinfo1() {
       PageReference newocp;
       
       if(jobapp2!=null)   {
           newocp = new PageReference('/apex/jobApplicantInfo?gwid='+jobapp2.Grant_Writer__c+'&orgId='+job.Organization__c+'&talentlogin='+talentlogin+'&supview='+supview+'&gid='+gid+'&jobId='+jobid);
       }
       else {
           newocp = new PageReference('/apex/jobApplicantInfo?gwid='+job.Employees__c+'&orgId='+job.Organization__c+'&talentlogin='+talentlogin+'&supview='+supview+'&gid='+gid+'&jobId='+jobid);
       }
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    
    public PageReference back() {
       PageReference newocp = new PageReference('/apex/joblistpage?gwid='+gid+'&talentlogin='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference back1() {
       PageReference newocp = new PageReference('/apex/listAppliedJobsPage?gwid='+gid+'&talentlogin='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference RLogin(){
        PageReference pf = new PageReference('/apex/UserLoginVF');
        pf.setRedirect(true);
        return pf;
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