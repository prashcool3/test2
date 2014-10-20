public class addJobCtr {

    public String oid { get; set; }
    public String jobid { get; set; }
    public Employees__c e{get;set;}
    public String org{get;set;}
    public String jid{get;set;}
    public Project__c jb{get;set;}
    public boolean isEdit{get;set;}
    public boolean checklogin {get;set;}
    public String edit{get;set;}
    public List<Job_Application__c> applicants{get; set;}
    public String appId{get;set;}
    public integer applicantCount{get;set;}
    public String gwid{get; set;}
    public list<selectoption> options{get;set;}
    public list<Department__c> stat{get;set;}
    public string selectedVal{get;set;}
    public String talentlogin{get;set;}
    public string detail{get;set;}
    public boolean navtojobapp{get;set;}
    public boolean navtojobapp1{get;set;}
    public boolean navtojobapp3{get;set;}
    public boolean navtojobapp4{get;set;}
    public boolean navtojobapp5{get;set;}
    public boolean navtojobapp6{get;set;}
    public String nplogin{get;set;}
    public boolean nav1{get;set;} 
    public boolean nav2{get;set;} 
    public boolean nav3{get;set;} 
    public boolean nav4{get;set;} 
    public boolean nav5{get;set;} 
    public boolean nav6{get;set;} 
    public boolean editInfo{get;set;}
    public Grant_Writer__c navg{get;set;}
    public Organization__c navo{get;set;}
    public Grant_Writer__c gr{get;set;}
    public Map<String,String> dMap;
    public Organization__c o;
    public String role{get;set;}
    public String eid{get;set;}
    public boolean ronly{get;set;}
    public Employees__c emp{get;set;}

     
    public addJobCtr(){
        editinfo=false;
        nav5=false;
        nav6=false;
        nav1=false;
        nav2=false;
        nav3=false;
        nav4=false;
        ronly=false;
        isEdit = true;
        checklogin = true;
        dMap = new Map<String,String>();
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        try{
            emp=[Select id, name from employees__c where id=:eid];
            
            if(role!=null && role.contains('Read')){
                ronly=true;
            }    
         }catch(Exception e){}
         
        detail=ApexPages.currentPage().getParameters().get('detail');
        org = ApexPages.currentPage().getParameters().get('orgid');
        oid=ApexPages.currentPage().getParameters().get('oid');
        jid = ApexPages.currentPage().getParameters().get('jbid');
        gwid=ApexPages.currentPage().getParameters().get('gwid');
        talentlogin=ApexPages.currentPage().getParameters().get('talentlogin');
        edit=ApexPages.currentPage().getParameters().get('isEdit');
        
        if(jid==null && detail==null && eid!=null){
            nav1=true;
        }
        else if(jid==null && detail==null & nplogin!=null){
            nav2=true;
        }
        else if(jid!=null && detail==null & eid!=null){
            nav3=true;
        }
        else if(jid!=null && detail==null & nplogin!=null){
            nav4=true;
        }
        if(jid!=null && detail!=null && eid!=null){
            nav5=true;
        }
        else if(jid!=null && detail!=null & nplogin!=null){
            nav6=true;
        }
        
        
        if(edit=='false'){
            isEdit=false;
            
        }
        
        if(talentlogin!=null){
            navg=[Select name from Grant_Writer__c where id=:talentlogin];
        }
        else if(nplogin!=null){
             navo=[Select name from Organization__c where id=:nplogin];
        }
        
            for(Department__c d : [select id,name,Organization__r.name from department__c where Organization__c = : org]){
                System.debug('Organization name : '+d.Organization__r.name);
                dMap.put(d.name+'-'+d.Organization__r.name,d.id);
            }System.debug('Map is : '+dMap);   
            
            
              if(org!=null){
                o = [select id,User__c,User__r.Login_Status__c,name from Organization__c where id=:org];
            }
            else if(oid!=null){
                o = [select id,User__c,User__r.Login_Status__c,name from Organization__c where id=:oid];
            }
           
        
        try{
        
           
            jb = [select id,name,Job_Category__c,Tagline__c, Job_Code__c , Short_Description__c,Department__c, Project_Description__c,Tags_Keywords__c,Email__c,Website__c,Visibility__c,Organization__r.Paid_User__c,
                  Job_Type__c,Organization__c,Organization__r.User__r.Login_Status__c,Position_Type__c,Salary_Type__c, Minimum_Salary__c, Maximum_Salary__c, SNo__c, GWNo__c, GENo__c, GRNo__c, End_Date__c, Employees__c, Employees__r.name from Project__c where id =: jid limit 1];
          
                org = jb.Organization__c;
                        
        }catch(Exception e){}
        if(jb == null){
            jb = new Project__c();
            jb.Employees__c=emp.id;
        }
       
       /* if(o.User__r.Login_Status__c == false){
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                checklogin = false;
        }*/
        
        applicants=new List<Job_Application__c>();
        applicants = [Select id, name, Grant_Writer__c, Proposal_Bid_Price__c from Job_Application__c where Job__c =: jb.id];
        applicantCount=applicants.size();
        
        
            options= new list<selectoption>();
            stat= [select name from Department__c where Organization__c=:org];
           // options.add(new selectoption(‘—-Select Country—-’, ‘—-Select Country—-’));
            for(Department__c s:stat){
                options.add(new selectoption(s.name,s.name));
            }
    } 
    
    
    public PageReference viewOrgJobs() {
        PageReference newocp;
        if(talentlogin!=null){
        newocp = new PageReference('/apex/viewsubmission?oid='+org+'&talentlogin='+talentlogin);   }
         if(nplogin!=null){
        newocp = new PageReference('/apex/viewsubmission?oid='+org+'&nplogin='+nplogin);   }
        if(eid!=null){
            newocp = new PageReference('/apex/viewsubmission?orgId='+org+'&eid='+eid+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
    }
       
    public PageReference Submit(){ 
        isEdit = false;
        if(org!=null){
            jb.Organization__c = org;
        }
        else if(oid!=null){
             jb.Organization__c = oid;
        }
        //jb.Grant_Writer__c = gwid;
        jb.Department__c = selectedVal;
      /*  if(dMap <> NULL)
            System.debug('Map Values : '+dMap);
            System.debug('Map Key : '+selectedVal);
            System.debug('Map Key : '+selectedVal+'-'+o.name);
            jb.Departments__c = dMap.get(selectedVal+'-'+o.name); */
        try {
            upsert jb;
        }catch (DMLException e) {
            ApexPages.addMessages(e);
            isEdit = true;
            return null;
        }
        return null;
    }
    public PageReference edit() {
        isEdit = true;
        upsert jb;
        PageReference newocp;
        if(talentlogin!=null && detail==null){
          newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&talentlogin='+talentlogin); 
        }
        else if(talentlogin!=null && detail!=null){
          newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&talentlogin='+talentlogin+'&detail='+detail); 
        }
        
        else if(nplogin!=null && detail==null){
        newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&nplogin='+nplogin); 
        }  
        
        else if(nplogin!=null && detail!=null){
        newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&nplogin='+nplogin+'&detail='+detail); 
        }  
        
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference home() {
         editinfo=true;
         PageReference newocp;
        if(talentlogin!=null){
                newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin+'&talentlogin='+talentlogin+'&editinfo='+editinfo+'&jbid='+jb.id);   
           
        }
        else if(nplogin!=null){
             newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+jb.Organization__c+'&nplogin='+nplogin+'&editinfo='+editinfo+'&jbid='+jb.id);   
        
        }
        else if(eid!=null){
            newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgid='+oid);
        }
        newocp.setRedirect(true);
         return newocp;
    }
    
    
    public PageReference Logout() {
        User__c u;
        if(nplogin!=null){
            navo=[Select id, User__c from Organization__c where id=:nplogin];
             u = [select id,Login_Status__c from User__c where id=:navo.User__c];
        }
        else if(eid!=null){
            e=[Select id, User__c from Employees__c where id=:eid];
            u = [select id, name, Login_Status__c from User__c where id=:e.user__c];
        }
        
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    public PageReference Login() {
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference gotohome(){
        PageReference newocp;
        /*if(talentlogin!=null){
            newocp=new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);
        }*/
        if(nplogin!=null){
            newocp=new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin+'&nplogin='+org);
        }
        else if(eid!=null){
            newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgid='+org);
        }
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    public PageReference npinfo(){
         PageReference newocp;
       
             newocp=new Pagereference('/apex/NonProfitInfoPage?orgId='+org+'&eid='+eid+'&role='+role); 
         
         newocp.setRedirect(true);
         return newocp;
    }
    
    
    public PageReference cancelSubmit() {
           
           PageReference newocp;
           if(nav3==true){
               newocp=new PageReference('/apex/viewsubmission?oid='+org+'&eid='+eid+'&role='+role);
           }
          else if(nav1==true){
               newocp=new PageReference('/apex/employeePage?eid='+eid+'&role='+role);
           } 
           if(nav4==true){
               newocp=new PageReference('/apex/viewsubmission?oid='+org+'&nplogin='+nplogin);
           }
           else if(nav2==true){
               
               newocp=new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin);
           }
           else if(nav5==true ){
               newocp=new PageReference('/apex/addJobVF?detail=true&isEdit=false&jbid='+jid+'&eid='+eid+'&role='+role);
           }
           else if(nav6==true){
                newocp=new PageReference('/apex/addJobVF?detail=true&isEdit=false&jbid='+jid+'&oid='+org+'&nplogin='+nplogin);
           }
          
           
           newocp.setRedirect(true);
            return newocp;
       }
    
    
    
    
     public PageReference viewJob() {
        
        isEdit=false;
        PageReference newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&isEdit='+isEdit);   
        newocp.setRedirect(true);
        return newocp;
       }
   
   public PageReference viewApplicant() {
        
        isEdit=false;
        //appId=ApexPages.currentPage().getParameters().get('appId') ;
        System.debug('---------------------------------'+appid);
        PageReference newocp = new PageReference('/apex/jobApplicantInfo?gwid='+appId);   
        newocp.setRedirect(true);
        return newocp;
       }
       
       
       
       public PageReference back(){
           PageReference newocp;
           if(nav1==true){
               newocp=new PageReference('/apex/employeePage?eid='+eid+'&role='+role);
           }
           else if(nav3==true){
               newocp=new PageReference('/apex/viewsubmission?oid='+org+'&eid='+eid+'&role='+role);
           }
           if(nav4==true){
               newocp=new PageReference('/apex/viewsubmission?oid='+org+'&nplogin='+nplogin);
           }
           else if(nav6==true){
               newocp=new PageReference('/apex/jobApplicants?isEdit=false&jbid='+jid+'&orgId='+org+'&nplogin='+nplogin);
           }
           else if(nav5==true){
               newocp=new PageReference('/apex/jobApplicants?isEdit=false&jbid='+jid+'&orgId='+org+'&eid='+eid+'&role='+role);
           }
           else if(nav2==true){
             newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin+'&orgId='+nplogin);
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
       
      public PageReference gotoemp() {
        PageReference newocp = new PageReference('/apex/empDetailPage?orgId='+oId+'&empId='+eId+'&eid='+eid+'&role='+role);
        newocp.setRedirect(true);
        return newocp;
    } 
       
       
       
 }