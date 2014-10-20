public class jobApplicantsCtr{

    public String saveRoleEmp { get; set; }

    public Project__c jb{get;set;}
    public String jid{get;set;}
     public String JobId{get;set;}
    Public String orgId{get;set;}
    public boolean isEdit{get;set;}
    public boolean checklogin {get;set;}
    public List<Job_Application__c> applicants{get; set;}
    public String appId{get;set;}
    public integer applicantCount{get;set;}
    public integer shortListCount{get;set;}
    public Organization__c o;
    private String sortDirection = 'ASC'; 
    private String sortExp = 'grant_writer__r.name';
    public List<Job_Application__c> ShortList{get;set;}
     public List<Job_Application__c> Employees{get;set;}
     public List<Job_Application__c> EmployeesSupervisor{get;set;}
    public String chkReq{get;set;}
    //public List<Job_Application__c> employedList{get;set;}
    public integer employedCount{get;set;}
    public String RoleofEmployee{get;set;}
    public Boolean editR{get;set;}
    public List<String> Roles{get;set;}
    public String talentlogin{get;set;}
    public string detail{get;set;}
    public string nplogin{get;set;}
     public Grant_Writer__c navg{get;set;}
     public String eid{get;set;}
     public String role{get;set;}
     public boolean ronly{get;set;}
     public boolean appVisibility{get;set;}
     public boolean sentConfirmation{get;set;}
 public Organization__c navo{get;set;}
    
    public jobApplicantsCtr(){  
        sentConfirmation=false;
        appVisibility=false;
        ronly=false;
        detail='true';  
        editR=false;
        checklogin = true;
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        if(role!=null && role.contains('Read')){
            ronly=true;
        }
       
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        orgid=ApexPages.currentPage().getParameters().get('orgId');
        jid = ApexPages.currentPage().getParameters().get('jbid');
        jobId = ApexPages.currentPage().getParameters().get('JobId');
        if(JobId!=null){
            jid=JobId;
        }
       // Roles=new List<String>('Supervisor', 'Grant Writer', 'Grant Editor', 'Grant Researcher');
        talentlogin=ApexPages.currentPage().getParameters().get('talentlogin');
        applicants = new List<Job_Application__c>();
        ShortList = new List<Job_Application__c>();
        Employees = new List<Job_Application__c>();
        
       try{
            navo=[Select name from Organization__c where id=:nplogin];
        
        }catch(Exception e){}
        
        
        try{
            jb = [select id,name,Job_Category__c,Tagline__c,Short_Description__c,Project_Description__c,Tags_Keywords__c,Email__c,Website__c,Visibility__c,
                  Organization__r.Paid_User__c,Job_Type__c,Organization__c,Organization__r.User__r.Login_Status__c,Organization__r.email__c,Organization__r.name,
                  Organization__r.Contact_Name__c,Salary_Type__c, Minimum_Salary__c, Maximum_Salary__c from Project__c where id =: jid limit 1];
        }catch(Exception e){}
        try{
                o = [select id,User__c,User__r.Login_Status__c from Organization__c where id=:jb.Organization__c];
            }catch(Exception e){}
      /*  if(o.User__r.Login_Status__c == false){
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                checklogin = false;
        }*/
        JobApplcnt1();
        
        if(jb.Organization__r.Paid_User__c==true || !ronly){
             appVisibility=true;
        }
        else{
             appVisibility=false;
        }
        
        
        
    }
    
    public PageReference JobApplcnt(){
        string sortFullExp = sortExpression  + ' ' + sortDirection;
        applicants = Database.query('Select id,name,Selected__c,Short_Listed__c,Grant_Writer__c,Grant_Writer__r.name,Grant_Writer__r.city__c,Grant_Writer__r.state__c,grant_writer__r.Email__c,Grant_Writer__r.Number_of_projects__c, Proposal_Bid_Price__c from Job_Application__c where Job__c = \''+jb.id+'\' and Short_Listed__c = false order by ' + sortFullExp );
        applicantCount=applicants.size();
        return null;
    }
    
    public PageReference JobApplcnt1(){
        string sortFullExp1 = sortExpression  + ' ' + sortDirection;
        shortList = Database.query('Select id,name,Selected__c,Short_Listed__c,Grant_Writer__c,Grant_Writer__r.name,Grant_Writer__r.city__c,Grant_Writer__r.state__c,grant_writer__r.Email__c,Grant_Writer__r.Number_of_projects__c, Grant_Requested__c, Grant_accepted__c, Employment_Request__c , Employment_accepted__c, Proposal_Bid_Price__c from Job_Application__c where Employment_accepted__c=false and Job__c = \''+jb.id+'\' and Short_Listed__c = true order by ' + sortFullExp1 );
        shortListCount=shortList.size();
        Employees= Database.query('Select id,name,Selected__c,Short_Listed__c, Role__c, Grant_Writer__c,Grant_Writer__r.name,Grant_Writer__r.city__c,Grant_Writer__r.state__c,grant_writer__r.Email__c,Grant_Writer__r.Number_of_projects__c, Grant_Requested__c, Grant_accepted__c, Employment_Request__c , Employment_accepted__c, Proposal_Bid_Price__c from Job_Application__c where Employment_accepted__c=true and Job__c = \''+jb.id+'\' and Short_Listed__c = true order by ' + sortFullExp1 );
        employedCount=Employees.size();
        return null;
    }
     
    public PageReference home() {
        PageReference newocp;
        if(talentlogin!=null){
            newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+jb.Organization__c+'&talentlogin='+talentlogin);   
        }
        else if(nplogin!=null){
            newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+jb.Organization__c+'&nplogin='+nplogin);   
        }
        if(eid!=null){
             newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgid='+orgId+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference Login() {
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference viewJob() {
    PageReference newocp;
        if(talentlogin!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&isEdit='+'false'+'&talentlogin='+talentlogin+'&detail='+detail);  
        } 
        else if(nplogin!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&isEdit='+'false'+'&nplogin='+nplogin+'&detail='+detail+'&orgId='+orgId);  
        } 
        else if(eid!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jb.id+'&isEdit='+'false'+'&orgId='+orgId+'&detail='+detail+'&eid='+eid+'&role='+role);  
        }
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:o.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference viewApplicant() {
        //String oId = ApexPages.currentPage().getParameters().get('orgId');
        PageReference newocp;
        if(eid!=null){
            newocp = new PageReference('/apex/jobApplicantInfo?gwid='+appId+'&orgId='+orgId+'&eid='+eid+'&role='+role);   
        }
        else if(nplogin!=null){
            newocp = new PageReference('/apex/jobApplicantInfo?gwid='+appId+'&orgId='+orgId+'&nplogin='+nplogin+'&jbid='+jid);   
        }
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference viewEmployee() {
        //String oId = ApexPages.currentPage().getParameters().get('orgId');
        PageReference newocp;
        if(eid!=null){
            newocp = new PageReference('/apex/jobApplicantInfo?gwid='+appId+'&orgId='+orgId+'&JobId='+jid+'&eid='+eid+'&role='+role);
        }
        else if(nplogin!=null){
            newocp = new PageReference('/apex/jobApplicantInfo?gwid='+appId+'&orgId='+orgId+'&JobId='+jid+'&nplogin='+nplogin);
        }   
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    public void paiduser(){
        
        Organization__c o=[select id, Paid_User__c from Organization__c where id=:jb.Organization__c];
        o.Paid_User__c=true;
        upsert o;
    }
    
    public String sortExpression{
        get{
            return sortExp;
        }
        set{
            if (value == sortExp)
                sortDirection = (sortDirection == 'ASC')? 'DESC' : 'ASC';
            else
                sortDirection = 'ASC';
            sortExp = value;
        }
    }
    
    public String getSortDirection(){
        if (sortExpression == null || sortExpression == '')
            return 'ASC';
        else
            return sortDirection;
    }

    public void setSortDirection(String value){  
        sortDirection = value;
    }
    
    public void getShortListed(){
        for(integer i = 0;i<applicants.size();i++){
            if(applicants.get(i).Short_Listed__c == true){
                shortList.add(applicants.get(i));
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {applicants.get(i).grant_writer__r.email__c};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Shortlisted for '+ jb.name);
                mail.setHtmlBody('Dear '+applicants.get(i).grant_writer__r.name+',<br/><p>Your profile for <b>'+jb.name+'</b> has been considered.</p>Thanks,<br/>'+jb.Organization__r.Contact_Name__c);
                mail.setSenderDisplayName(jb.Organization__r.Name);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                
                applicants.remove(i);
                i--;
            }
        }
        applicantCount=applicants.size();
        shortListCount=shortList.size();
        update applicants;
        update shortList;
    }
    
    public void getMail(){
         sentConfirmation=true;
        for(integer i = 0;i<shortList.size();i++){
            if(shortList.get(i).short_listed__c == false){
                shortList.get(i).selected__c=false;
                applicants.add(shortList.get(i));
                shortList.remove(i);
                i--;
                
            }
            else if(shortList.get(i).selected__c==true){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {shortList.get(i).grant_writer__r.email__c};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Selected for '+ jb.name);
                mail.setHtmlBody('Dear '+shortList.get(i).grant_writer__r.name+',<br/><p>Congratulations!!!</p><p>You are selected for the project <b>'+jb.name+'</b>. We welcome you.</p>Thanks,<br/>'+jb.Organization__r.Contact_Name__c);
                mail.setSenderDisplayName(jb.Organization__r.Name);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
        applicantCount=applicants.size();
        shortListCount=shortList.size();
        update applicants;
        update shortList;
    }
    
    public void approveEmp(){
      for(integer i = 0;i<shortList.size();i++){
        if(shortList.get(i).Employment_Request__c==true ){
            shortList.get(i).Employment_accepted__c=true;
            shortList.get(i).Employment_Request__c=false;
            Employees.add(shortList.get(i));
            shortList.remove(i);
        }  
       }
           update shortList;
           update Employees;
           employedCount=Employees.size();
           shortListCount=shortList.size();
    }
    
    
     public void approveGrant(){
      for(integer i = 0;i<shortList.size();i++){
        if(shortList.get(i).Grant_Requested__c==true ){
            shortList.get(i).Grant_accepted__c=true;
            shortList.get(i).Grant_Requested__c=false;
            Employees.add(shortList.get(i));
             shortList.remove(i);
        }  
        
       }
           update shortList;
           update Employees;
           employedCount=Employees.size();
    }
    
    
    
    public PageReference gotohome(){
        PageReference newocp;
        if(talentlogin!=null){
            newocp=new PageReference('/apex/TalentSignUpDisVF?gwid='+talentlogin);
        }
        else if(nplogin!=null){
            newocp=new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin);
        }
        if(eid!=null){
             newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgid='+orgId+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    
    public PageReference back(){
        PageReference newocp;
        if(talentlogin!=null){
            newocp=new PageReference('/apex/viewsubmission?orgid='+orgId+'&talentlogin='+talentlogin);
        }
        else if(nplogin!=null){
            newocp=new PageReference('/apex/viewsubmission?orgid='+orgId+'&nplogin='+nplogin);
        }
        else if(eid!=null){
              newocp=new PageReference('/apex/viewsubmission?orgid='+orgId+'&eid='+eid);   
        }
        newocp.setRedirect(true);
        return newocp;    
    
    }
    
    
   /* public void saveRoleEmp(){
        
        System.debug('testing---------->' +RoleofEmployee);
        
        for(integer i = 0;i<Employees.size();i++){
           
            Employees.get(i).Role__c=RoleofEmployee;
            editR=false;
            
            
             
        } 
        update Employees;
            
            
             
           
    }
        
      
      public void editRole(){
          editR=true;
      }  */
       
   
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