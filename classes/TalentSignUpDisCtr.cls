public class TalentSignUpDisCtr {

    

    public Grant_Writer__c gr{get;set;}
    public boolean isEdit{get;set;}
    public boolean checklogin {get;set;}
    public List<Job_Application__c> workedForJobs{get;set;}
    public Project__c currentJob{get;set;}
    public Organization__c org{get; set;}
    public String o{get; set;}
    public Set<ID> currentJobIds{get;set;}
     public Set<ID> employedForJobs{get; set;}
    public List<Project__c> Projects{get;set;}
    public List<Job_Application__c> jobApp{get; set;}
    public Set<ID> employedForJobs1{get; set;}
    public List<Project__c> Projects1{get;set;}
    public List<Job_Application__c> jobApp1{get; set;}
    public List<Rating__c> ratingList{get;set;}
    public Boolean isOrgNull{get;set;}
    public Integer completness{get;set;}
    public Integer completed{get;set;}
    public Integer widthfactor{get;set;}
    public integer numberOfReviews{get;set;}
    public Set<ID> prevOrgsIds{get; set;}
    public List<Organization__c> prevOrgs{get;set;}
    public Integer orgCount{get;set;}
    public String talentlogin{get;set;}
    public String editinfo{get;set;}
    public String jbid{get;set;}
    public String npid{get;set;}
    public Grant_Writer__c navg{get;set;}
    public String needToBeCompleted{get;set;}
    public integer notcompleted{get;set;}
    public Blob Resumee {get;set;}
    public Blob cover {get;set;}
    public String contentType {get; set;}
    public String contentType1 {get; set;}
    public Attachment attc {get;set;}
    public Attachment att {get;set;}
    public integer num { get; set; }
    public List<Reference__c> refs {get; set;} 
    public String gId{get;set;}
    Public List<Reference__c> rList{get;set;}
    Public boolean isref{get;set;}
    
    public TalentSignUpDisCtr(){
        isref=false;
        prevOrgsIds=new Set<ID>();
        prevOrgs=new List<Organization__c>();
        checklogin = true;
        isEdit = false;
        workedForJobs=new List<Job_Application__c>();
        currentJob=new Project__c();
        currentJobIds=new Set<ID>();
        org=new Organization__c();
        ratingList=new List<Rating__c>();
        attc = new Attachment();
         att = new Attachment();
         
           
        
        jbid=ApexPages.currentPage().getParameters().get('jbid');
        editinfo=ApexPages.currentPage().getParameters().get('editinfo');
        talentlogin= ApexPages.currentPage().getParameters().get('gwid');
        gId = ApexPages.currentPage().getParameters().get('gwid');
        
        
        try{
            attc = [select id,name from Attachment where ParentId =: gId LIMIT 1];
            att = [select id,name from Attachment where ParentId =: gId and name like '%Cover%' LIMIT 1];
            }catch(Exception e){}
        
        try{
            ratingList=[select id, Organization__r.name, Rating_for__r.name, Comments__c,  Star_Rating__c, Grant_Writer__c  from  Rating__c where Rating_for__c=:gId];
            numberOfReviews=ratingList.size();
            }catch(Exception e){}
        //String gId = ApexPages.currentPage().getParameters().get('gwid');
        workedForJobs=[Select id, Job__c, Grant_Writer__c, Employment_accepted__c from Job_Application__c where Grant_Writer__c=:gId and Employment_accepted__c=true];
        for(Job_Application__c ja: workedForJobs){
                currentJobIds.add(ja.Job__c);
        }
        
        jobApp=new List<Job_Application__c>();
            jobApp=[Select id, Grant_Writer__c, Job__c, Employment_accepted__c from Job_Application__c where Employment_accepted__c=true and Grant_Writer__c=:gId];
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
            
            System.debug('Testing projects1----------->' +projects1);
              
        try{
            gr = [select id,Salutation__c,Name, First_Name__c , Facebook__c, Others__c, audience__c, Last_Name__c , User__r.name, User_Name__c,Phone__c, Average_Rating__c, Phone_alternate__c,Mailing_Street_Address__c,City__c,State__c,Talent_Skill__c,User__c,
                  Self_Evaluation_Writer__c,Seeking__c,Self_Evaluation_Editor_more__c,Self_Evalation_Researcher__c,Interest_In__c,Self_Evaluation_Editor__c,
                  Zip_Postal_Code__c, Email__c,Select_Reference_Type__c, Daytime_Phone_Colleague_Professional__c,Daytime_Phone_Colleague_Volunteer__c, Daytime_Phone_Family_Friend__c, Daytime_Phone_Friend__c, Daytime_Phone_Personal__c, Daytime_Phone_Professor__c, Daytime_Phone_Supervisor_Professional__c, Daytime_Phone_Supervisor_Volunteer__c, Email_Colleague_Professional__c, Email_Colleague_Volunteer__c, Email_Family_Friend__c, Email_Friend__c, Email_Personal__c, Email_Professor__c, Email_Supervisor_Professional__c, Email_Supervisor_Volunteer__c, First_Name_Colleague_Professional__c, First_Name_Colleague_Volunteer__c, First_Name_Family_Friend__c, First_Name_Friend__c, First_Name_Personal__c, First_Name_Professor__c, Website__c,User__r.Login_Status__c, Related_to_first_reference_as__c, First_Name_Supervisor_Professional__c, First_Name_Supervisor_Volunteer__c, Last_Name_Colleague_Professional__c, Last_Name_Colleague_Volunteer__c, Last_Name_Family_Friend__c, Last_Name_Friend__c, Last_Name_Personal__c, Last_Name_Professor__c, Last_Name_Supervisor_Professional__c, Last_Name_Supervisor_Volunteer__c, Relationship_Colleague_Professional__c, Relationship_Colleague_Volunteer__c, Relationship_Family_Friend__c, Relationship_Friend__c, Relationship_Personal__c, Relationship_Professor__c, Relationship_Supervisor_Professional__c, Relationship_Supervisor_Volunteer__c, Related_to_second_reference_as__c, First_reference_s_address__c, Second_reference_s_address__c, First_Reference_s_Name__c, Second_Reference_s_Name__c, First_reference_s_phone__c, Second_reference_s_phone__c, LinkedIn__c, Twitter__c from Grant_Writer__c where id =: gId];
               
             rList=[select id, name, first_name__c, last_name__c, grant_writer__c, email__c, phone__c, profession__c, relationship__c from reference__c where grant_writer__c=:gr.Id and User__c=:gr.User__c];
      
           navg=[Select name from Grant_Writer__c where id=:gr.id];
           
            if(gr.User__r.Login_Status__c == false){
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                checklogin = false;
            }  
            
            if(rList.size()>0){
                isref=true;
            }
            else{
                isref=false;
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
             if(rList!=null){
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
            if(attc!=null){
                completness=completness+1;
            }
            if(att!=null){
                completness=completness+1;
            }
            if(gr.LinkedIn__c!=null){
                completness=completness+1;
            }
            if(gr.Twitter__c!=null){
                completness=completness+1;
            }
            if(prevorgs.size()>0){
                completness=completness+1;
            }
            if(org!=null){
                completness=completness+1;
            }
            
            
            completed=(completness*100)/23;
            widthfactor=(completness*250)/23;
                  
            currentJob=[select Organization__c, End_Date__c, id from Project__c where id in:currentJobIds and End_Date__c>:System.Today() ];
            org=[Select id, name, Organization_Rating__c  from Organization__c where id=:currentJob.Organization__c];
            
            
        }catch(Exception e){}
        system.debug('testing---->>' +currentJob);
        
        notcompleted=0;
        needToBeCompleted='To complete your profile, please fill';
            if(gr.Salutation__c==null){
                needToBeCompleted=needToBeCompleted + ' Salutation,';
                notcompleted=notcompleted+1;
            }
            if(gr.Name==null){
                needToBeCompleted=needToBeCompleted + ' Name,';
                notcompleted=notcompleted+1;
            }
            if(gr.User__r.name==null){
                needToBeCompleted=needToBeCompleted + ' Username,';
                notcompleted=notcompleted+1;
            }
            if(gr.Phone__c==null){
                needToBeCompleted=needToBeCompleted + ' Phone,';
                notcompleted=notcompleted+1;
            }
            if(gr.Phone_alternate__c==null){
                needToBeCompleted=needToBeCompleted + ' Phone-alternate,';
                notcompleted=notcompleted+1;
            }
            if(gr.Talent_Skill__c==null){
                needToBeCompleted=needToBeCompleted + ' Talent Skill,';
                notcompleted=notcompleted+1;
            }
           
            if(gr.Seeking__c==null){
                needToBeCompleted=needToBeCompleted + ' Seeking,';
                notcompleted=notcompleted+1;
            }
            if(gr.Interest_In__c==null){
                needToBeCompleted=needToBeCompleted + ' Interest In,';
                notcompleted=notcompleted+1;
            }
            /*if((gr.Talent_Skill__c.contains('Writer')&& gr.Self_Evaluation_Writer__c==null) || (gr.Talent_Skill__c.contains('Researcher') && gr.Self_Evalation_Researcher__c==null) || (gr.Talent_Skill__c.contains('Editor') && gr.Self_Evaluation_Editor__c==null) || (gr.Talent_Skill__c.contains('Editor') && gr.Self_Evaluation_Editor_more__c==null)){
                needToBeCompleted=needToBeCompleted + ' Self Evaluation,';
                notcompleted=notcompleted+1;
            }*/
            if(gr.Mailing_Street_Address__c==null){
                 needToBeCompleted=needToBeCompleted + ' Mailing Street Address,';
                 notcompleted=notcompleted+1;
            }
            if(gr.City__c==null){
                 needToBeCompleted=needToBeCompleted + ' City,';
                 notcompleted=notcompleted+1;
            }
            if(gr.State__c==null){
                needToBeCompleted=needToBeCompleted + ' State,';
                notcompleted=notcompleted+1;
            }
            if(gr.Zip_Postal_Code__c==null){
                needToBeCompleted=needToBeCompleted + ' Zip/Postal Code,';
                notcompleted=notcompleted+1;
            }
            if(gr.Email__c==null){
                needToBeCompleted=needToBeCompleted + ' Email,';
                notcompleted=notcompleted+1;
            }
            if(gr.Website__c==null){
               needToBeCompleted=needToBeCompleted + ' Website,';
               notcompleted=notcompleted+1;
            }
             
             if(gr.LinkedIn__c==null){
               needToBeCompleted=needToBeCompleted + ' LinkedIn,';
               notcompleted=notcompleted+1;
            }
             if(gr.Twitter__c==null){
               needToBeCompleted=needToBeCompleted + ' Twitter,';
               notcompleted=notcompleted+1;
            }
             if(attc==null){
               needToBeCompleted=needToBeCompleted + ' Resume,';
               notcompleted=notcompleted+1;
            }
             if(att==null){
               needToBeCompleted=needToBeCompleted + ' Cover Letter,';
               notcompleted=notcompleted+1;
            }
             if(rList.size()==0){
               needToBeCompleted=needToBeCompleted + ' References,';
               notcompleted=notcompleted+1;
            }
             if(org==null){
               needToBeCompleted=needToBeCompleted + ' Current organizatio,';
               notcompleted=notcompleted+1;
            }
             if(prevorgs.size()==0){
               needToBeCompleted=needToBeCompleted + ' Previous Organizations';
               notcompleted=notcompleted+1;
            }
            
             if(notcompleted==0){
                  needToBeCompleted='Profile is completed';
             }
    
                    
        
        if(org==null){
            isOrgNull=true;
        }
        else{
            isOrgNull=false;
        }
    }

    public PageReference Edit() {
        IsEdit = true;
        return null;
    }

    public PageReference Save() {
        gr.name=gr.First_Name__c + ' ' + gr.Last_Name__c;
        upsert gr;
        
        Attachment a = new Attachment();
        a.body = resumee;
        a.ParentId = gr.id;
        a.OwnerId = UserInfo.getUserId();
        a.contentType = contentType;
        a.name = gr.name + ' Resume';
        if(a.body != NULL)
            insert a;
            
          Attachment a1 = new Attachment();
        a1.body = cover;
        a1.ParentId = gr.id;
        a1.OwnerId = UserInfo.getUserId();
        a1.contentType = contentType1;
        a1.name = gr.name + ' Cover Letter';
        if(a1.body != NULL)
            insert a1;
        try{
            attc = [select id,name from Attachment where ParentId =: gr.id LIMIT 1];
            att = [select id,name from Attachment where ParentId =: gr.id AND  name like '%Cover%' LIMIT 1 ];
        }catch(Exception e){}
        IsEdit = False;
        return null;
    }
    
    public PageReference cancel() {
        PageReference pr = new PageReference('/apex/TalentSignUpDisVF?gwid='+gr.id);
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference RLogin(){
        PageReference pf = new PageReference('/apex/UserLoginVF');
        pf.setRedirect(true);
        return pf;
    }

    public PageReference view() {
        PageReference pr = new PageReference('/apex/joblistpage?gwid='+gr.id+'&talentlogin='+talentlogin);
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference viewJobs() {
        PageReference pr = new PageReference('/apex/listAppliedJobsPage?gwid='+gr.id+'&talentlogin='+talentlogin);
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:gr.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
     public PageReference postJob() {
       String gId = ApexPages.currentPage().getParameters().get('gwid');
        PageReference newocp = new PageReference('/apex/addJobVF?orgId='+org.id + '&gwid=' +gId+'&talentlogin='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
     public PageReference viewOrgJobs() {
        PageReference newocp = new PageReference('/apex/viewsubmission?oid='+org.id+'&talentlogin='+talentlogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference viewprevJob() {
        PageReference newocp;
        if(talentlogin!=null && editinfo!=null && jbid!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jbid+'&isEdit=false'+'&talentlogin='+talentlogin+'&detail=true');  
        }
        /*else if(nplogin!=null && editinfo!=null && jbid!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jbid+'&isEdit=false'+'&nplogin='+nplogin+'&detail=true'); 
        }*/
         newocp.setRedirect(true);
        return newocp;
    
    }
    
    public PageReference viewNPInfo() {
        PageReference newocp;
        newocp = new PageReference('/apex/NonProfitInfoPage?orgId='+npid+'&gwid='+gr.id+'&talentlogin='+talentlogin);  
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