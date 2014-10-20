public class JobApplicatnInfoCtr{

    public String oid { get; set; }
    public String checkRating { get; set; }
    public Grant_Writer__c gr{get;set;}
    public boolean isEdit{get;set;}
    public String gid{get;set;}
    public String eid{get;set;}
    public String role{get;set;}
    public boolean checklogin {get;set;}
    public Rating__c r{get;set;}
    public Rating__c ExistingRating{get;set;}
    public boolean ratingExists{get;set;}
    public List<Rating__c> ratingList{get;set;}
    //public boolean checkReviews{get;set;}
    public integer numberOfReviews{get;set;}
    public List<Job_Application__c> jobApp{get; set;}
    public List<Job_Application__c> jobApp1{get; set;}
    public Set<ID> isProjectCompleted{get; set;}
    public Set<ID> employedForJobs{get; set;}
    public List<Project__c> Projects{get;set;}
    public Set<ID> employedForJobs1{get; set;}
    public List<Project__c> Projects1{get;set;}
    public Integer completness{get;set;}
    public Integer completed{get;set;}
    public List<Reference__c> rList{get;set;}
    public Integer widthfactor{get;set;}
    public Set<ID> prevOrgsIds{get; set;}
    public List<Organization__c> prevOrgs{get;set;}
    public Set<ID> currentJobIds{get;set;}
    public Project__c currentJob{get;set;}
    public List<Job_Application__c> workedForJobs{get;set;}
    public Organization__c org{get; set;}
    public String RoleOfEmployee{get;set;}
    public String jId{get;set;}
    public Job_Application__c jobapplication{get;set;}
    public String Job{get; set;}
    public Job_Application__c ja{get;set;}
    public Job_Application__c jobapp3{get;set;}
    public Project__c cjob{get;set;}
    public boolean ratingPermission{get;set;}
    public String talentlogin{get;set;}
    public String nplogin{get;set;}
    public String jinfo{get;set;}
    public boolean var1{get;set;}
    public boolean var2{get;set;}
    public boolean var3{get;set;}
    public boolean var4{get;set;}
    public String gwid{get;set;}
    public String supapplied{get;set;}
    public String supview{get;set;}
    public String npid{get;set;}
    public String orgId{get;set;}
    public Boolean roleSaved{get;set;}
    public Boolean isref{get;set;}
    public Grant_Writer__c navg{get;set;}
    public Organization__c navo{get;set;}
    public Attachment attc {get;set;}
    public Attachment att {get;set;}
    public boolean changerole{get;set;}
    public boolean canrate{get;set;}
    
    public JobApplicatnInfoCtr(){
        changerole=true;
        isref=false;
        roleSaved=false;
        var1=false;
        var2=false;
        var3=false;
        var4=false;
        jobapp3=new Job_Application__c();
        cjob=new Project__c();
        //ratingPermission=true;
        org=new Organization__c();
        workedForJobs=new List<Job_Application__c>();
         currentJob=new Project__c();
        currentJobIds=new Set<ID>();
        prevOrgsIds=new Set<ID>();
        prevOrgs=new List<Organization__c>();
        //checkReviews=false;
        ratingList=new List<Rating__c>();
        ExistingRating = new Rating__c();
        r = new Rating__c();
        checklogin = true;
        isEdit = false;
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        String gId = ApexPages.currentPage().getParameters().get('gwid');
        gwid= ApexPages.currentPage().getParameters().get('gid');
        String oId = ApexPages.currentPage().getParameters().get('orgId'); 
        jId = ApexPages.currentPage().getParameters().get('JobId');
        supview=ApexPages.currentPage().getParameters().get('supview');
        supapplied=ApexPages.currentPage().getParameters().get('supapplied');
        talentlogin=ApexPages.currentPage().getParameters().get('talentlogin'); 
        orgId=ApexPages.currentPage().getParameters().get('orgId');
        //ratingExists=false;
        
        if(jinfo==null && talentlogin!=null){
        
            var1=true;
        }
        if(jinfo==null && nplogin!=null){
        
            var2=true;
        }
        if(jinfo!=null && talentlogin!=null){
        
            var3=true;
        }
        if(jinfo!=null && talentlogin!=null){
        
            var4=true;
        }
        
        
         workedForJobs=[Select id, Job__c, Grant_Writer__c, Employment_accepted__c from Job_Application__c where Grant_Writer__c=:gId and Employment_accepted__c=true];
       for(Job_Application__c ja: workedForJobs){
                currentJobIds.add(ja.Job__c);
        
        }
            
             jobApp=new List<Job_Application__c>();
             jobApp=[Select id, Grant_Writer__c, Grant_accepted__c, Job__c, Employment_accepted__c from Job_Application__c where Employment_accepted__c=true and Grant_Writer__c=:gId];
             employedForJobs=new Set<ID>();
             for(Job_Application__c j:jobApp){
                
                 employedForJobs.add(j.Job__c);
             }
             
             projects=new List<Project__c>();
             projects=[Select id, Organization__c from Project__c where id in:employedForJobs and End_Date__c <:System.Today()];
             for(project__c p:projects){
                 prevOrgsIds.add(p.Organization__c);
             }
             
             prevOrgs=[Select id, name from Organization__c where id in:prevOrgsIds];
               
             
              jobApp1=new List<Job_Application__c>();
             jobApp1=[Select id, Grant_Writer__c, Grant_accepted__c, Job__c, Employment_accepted__c from Job_Application__c where Employment_accepted__c=true and Grant_accepted__c=true and Grant_Writer__c=:gId];
            employedForJobs1=new Set<ID>();
            for(Job_Application__c j:jobApp1){
                
                 employedForJobs1.add(j.Job__c);
             }
    
              projects1=new List<Project__c>();
             projects1=[Select id from Project__c where id in:employedForJobs1 and End_Date__c <:System.Today()];
             if(talentlogin!=null){
                  navg=[Select name from Grant_Writer__c where id=:talentlogin];
             }
             else if(nplogin!=null){
                 navo=[Select name from Organization__c where id=:nplogin];
             }
        
        
        try{
            gr = [select id,Salutation__c,Name, First_Name__c , Last_Name__c , User__r.name, User_Name__c,Phone__c, Average_Rating__c, Phone_alternate__c,Mailing_Street_Address__c,City__c,State__c,Talent_Skill__c,User__c,
                  Self_Evaluation_Writer__c,Seeking__c,Self_Evaluation_Editor_more__c,Self_Evalation_Researcher__c,Interest_In__c,Self_Evaluation_Editor__c,
                  Zip_Postal_Code__c,Email__c, Select_Reference_Type__c, Daytime_Phone_Colleague_Professional__c,Daytime_Phone_Colleague_Volunteer__c, Daytime_Phone_Family_Friend__c, Daytime_Phone_Friend__c, Daytime_Phone_Personal__c, Daytime_Phone_Professor__c, Daytime_Phone_Supervisor_Professional__c, Daytime_Phone_Supervisor_Volunteer__c, Email_Colleague_Professional__c, Email_Colleague_Volunteer__c, Email_Family_Friend__c, Email_Friend__c, Email_Personal__c, Email_Professor__c, Email_Supervisor_Professional__c, Email_Supervisor_Volunteer__c, First_Name_Colleague_Professional__c, First_Name_Colleague_Volunteer__c, First_Name_Family_Friend__c, First_Name_Friend__c, First_Name_Personal__c, First_Name_Professor__c, Website__c,User__r.Login_Status__c, Related_to_first_reference_as__c, First_Name_Supervisor_Professional__c, First_Name_Supervisor_Volunteer__c, Last_Name_Colleague_Professional__c, Last_Name_Colleague_Volunteer__c, Last_Name_Family_Friend__c, Last_Name_Friend__c, Last_Name_Personal__c, Last_Name_Professor__c, Last_Name_Supervisor_Professional__c, Last_Name_Supervisor_Volunteer__c, Relationship_Colleague_Professional__c, Relationship_Colleague_Volunteer__c, Relationship_Family_Friend__c, Relationship_Friend__c, Relationship_Personal__c, Relationship_Professor__c, Relationship_Supervisor_Professional__c, Relationship_Supervisor_Volunteer__c, Related_to_second_reference_as__c, First_reference_s_address__c, Second_reference_s_address__c, First_Reference_s_Name__c, Second_Reference_s_Name__c, First_reference_s_phone__c, Second_reference_s_phone__c, LinkedIn__c, Twitter__c from Grant_Writer__c where id =: gId];
                 ratingList=[select id, Organization__r.name, Rating_for__r.name, Comments__c,  Star_Rating__c, Grant_Writer__c  from  Rating__c where Rating_for__c=:gr.id];
             numberOfReviews=ratingList.size();
          
           }catch(Exception e){}
           
           
           
          try{
            attc = [select id,name from Attachment where ParentId =: gId LIMIT 1];
            att = [select id,name from Attachment where ParentId =: gId and name like '%Cover%' LIMIT 1];
         }catch(Exception e){}
         
         try{
                 rList=[select id, first_name__c, last_name__c, profession__c, relationship__c, phone__c, email__c, user__c from reference__c where user__c=:gr.user__c ];
                      if(rList.size()>0){
                    isref=true;
                }
                else{
                    isref=false;
                }
        }catch(Exception e){}
        
        try{
                currentJob=[select Organization__c, End_Date__c, id from Project__c where id in:currentJobIds and End_Date__c>:System.Today() ];
                org=[Select id, name, Organization_Rating__c, user__c  from Organization__c where id=:currentJob.Organization__c];
                
           }catch(Exception e){}
         
                    
         try{    
           ExistingRating=[Select id, Organization__c, Grant_Writer__c  from  Rating__c where Organization__c=:oId and Rating_for__c=:gId and project__c=:cjob.id];
           }catch(Exception e){}   
               
           /*try{
            if(org.User__r.Login_Status__c == false){
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                checklogin = false;         
               }
           }catch(Exception e){} */
               
              
            try{ cJob=[Select id, end_date__c from Project__c where id=:jId]; }catch(Exception e){}
            
                Jobapp3=[Select id, Job__c, end_date__c, Employment_accepted__c, grant_writer__c from Job_Application__c where Job__c=:jId and grant_writer__c=:gId ];
               if(jobapp3.Employment_accepted__c==false){
                   changerole=false;
               }
               
               
               /*if(nplogin!=null || jobapp3.Employment_accepted__c==false || cJob.End_Date__c>System.Today()){
                   canrate=false;
               }
               else if(eid!=null && cJob.End_Date__c<System.Today() &&  jobapp3.Employment_accepted__c==false && nplogin==null){
                   canrate=true;
               }*/
               
               
                   if( ExistingRating==null || (eid!=null && cJob.End_Date__c<System.Today() &&  jobapp3.Employment_accepted__c==false && nplogin==null)){
                            ratingExists=false;
                   }
                   else if(nplogin!=null || jobapp3.Employment_accepted__c==false || cJob.End_Date__c>System.Today()){
                       ratingExists=true;
                   }
                  
                
                   if(ratingExists=true || cJob.End_Date__c>System.Today() || jobapp3.Employment_accepted__c==false ){
                       ratingPermission=false;
                   }
               
              
        
        completness=0;
        completed=0;
        
        
        if(gr.Salutation__c!=null){
            completness=completness+1;
        }
        if(gr.Name!=null){
            completness=completness+1;
        }
        if(gr.User__r.name!=null){
            completness=completness+1;
        }
        if(gr.Phone__c!=null){
            completness=completness+1;
        }
        if(gr.Phone_alternate__c!=null){
            completness=completness+1;
        }
        if(gr.Talent_Skill__c!=null){
            completness=completness+1;
        }
        if(gr.Self_Evaluation_Writer__c!=null){
            completness=completness+1;
        }
        if(gr.Seeking__c!=null){
            completness=completness+1;
        }
        if(gr.Interest_In__c!=null){
            completness=completness+1;
        }
        if(gr.Self_Evalation_Researcher__c!=null || gr.Self_Evaluation_Editor__c!=null || gr.Self_Evaluation_Editor_more__c!=null){
            completness=completness+1;
        }
        if(gr.Mailing_Street_Address__c!=null){
            completness=completness+1;
        }
        if(gr.City__c!=null){
            completness=completness+1;
        }
        if(gr.State__c!=null){
            completness=completness+1;
        }
        if(gr.Zip_Postal_Code__c!=null){
            completness=completness+1;
        }
        if(gr.Email__c!=null){
            completness=completness+1;
        }
        if(gr.Website__c!=null){
            completness=completness+1;
        }
        
        
        completed=(completness*100)/16;
        widthfactor=(completness*250)/16;
        
       //  system.debug('testing---->>' +currentJob);
        
       }
 
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:gr.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference rate() {
        //= [select id,Comments__c,Star_Rating__c from Rating__c where Organization__c =: ];
        return null;
    }
    
    public PageReference saveRating() {
        String oId = ApexPages.currentPage().getParameters().get('orgId'); 
        Employees__c emp;
        try{
            emp=[Select id from employees__c where id=:eid];
        }catch(Exception e){}
        r.Organization__c = oId;
        r.Rating_for__c = gr.id;
        r.Employees__c=emp.id;
        r.Project__c=cjob.id;
        
        upsert r;
        
        Decimal total = 0;
        Integer count = 0;
        for(Rating__c rt : [select id,Star_Rating__c,Rating_for__c from Rating__c where Rating_for__c =: gr.id]){
            total = total + Integer.ValueOf(rt.Star_Rating__c);
            count = count + 1;
        }
        gr.Average_Rating__c = String.ValueOf(math.round(total/count));
        upsert gr;
        
        PageReference newocp = new PageReference('/apex/jobApplicantInfo?gwid='+gr.id+'&JobId='+jid+'&orgId='+orgId+'&eid='+eid+'&role='+role);   
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    /*public void checkRating(){
        
        checkReviews=true;     
    }*/
    
    public PageReference saveRole(){
     /*if(ja!=null && RoleOfEmployee!='Supervisor') { 
             System.debug('Job Application------------>' +jId+'---'+gId);
             roleSaved=true;
             String gId = ApexPages.currentPage().getParameters().get('gwid');*/
             jobApplication=new Job_Application__c();
             jobApplication=[select id, name, job__c, Role__c, Employment_accepted__c, End_Date__c from Job_Application__c where Job__c=:jid and Grant_Writer__c=:gId and Employment_accepted__c=true];  
          
             
          
             jobApplication.Role__c=RoleOfEmployee;
             upsert jobApplication; 
             
             PageReference newocp;
             if(eid!=null){
                newocp=new Pagereference('/apex/jobApplicants?isEdit=false&JobId='+jid+'&orgId='+orgid+'&eid='+eid+'&role='+role);
            }
            else if(nplogin!=null){
                newocp=new Pagereference('/apex/jobApplicants?isEdit=false&JobId='+jid+'&orgId='+nplogin+'&nplogin='+nplogin);
            }
                newocp.setRedirect(true);
                return newocp;
            
             
          /* }
           
          else if(ja!=null && RoleOfEmployee=='Supervisor'){
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please do not choose more than 1 supervisors!!!'); 
            ApexPages.addMessage(myMsg);
            
          }*/
           
          
           
          return null;
    }
    
        public PageReference back(){
            PageReference newocp;
            
            if(nplogin!=null){
                newocp=new Pagereference('/apex/jobApplicants?isEdit=false&JobId='+jid+'&orgId='+orgId+'&nplogin='+nplogin);
            }
            else if(eid!=null){
                newocp=new Pagereference('/apex/jobApplicants?isEdit=false&JobId='+jid+'&orgId='+orgId+'&eid='+eid+'&role='+role);
            }
            newocp.setRedirect(true);
        return newocp;
        
        }
        
        public PageReference viewNPInfo() {
        PageReference newocp;
           if(eid!=null){
            newocp = new PageReference('/apex/NonProfitInfoPage?orgId='+npid+'&gwid='+gr.id+'&eid='+eid+'&role='+role);  
        }
        else{
            newocp = new PageReference('/apex/NonProfitInfoPage?orgId='+npid+'&gwid='+gr.id+'&nplogin='+nplogin);  
        }
        
        newocp.setRedirect(true);
        return newocp;
    }
     
     
      public PageReference gotohome(){
        PageReference newocp;
            if(eid!=null){
                newocp=new PageReference('/apex/employeepage?eid='+eid+'&role='+role);
            }
            else if(nplogin!=null){
                newocp=new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin);
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