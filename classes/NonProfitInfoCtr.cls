public class NonProfitInfoCtr{

    public String oid { get; set; }
    public boolean checklogin {get;set;}

    public String jid { get; set; }
    public Organization__c org{get; set;}
    public Project__c p{get; set;}
    public String JobId{get; set;}
    public String orgId{get; set;}
    public String gId{get; set;}
    public Integer completness{get;set;}
    public Integer completed{get;set;}
    public Integer widthfactor{get;set;}
    public List<Department__c> dList{get; set;}
    public String eid{get;set;}
    public String nplogin{get;set;}
    public String talentlogin{get;set;}
    public boolean var1{get;set;}
    public boolean var2{get;set;}
    public boolean var3{get;set;}
    public boolean var4{get;set;}
    public String jinfo{get;set;}
    Public String npview{get;set;}
    Public String npapplied{get;set;}
    Public grant_writer__c gr{get;set;}
    public Grant_Writer__c navg{get;set;}
     public Organization__c navo{get;set;}
    //public String eid{get;set;}
    public integer totalrating{get;set;}
    public integer rnumber{get;set;}
    public integer avgrating{get;set;}
    public integer rating{get;set;}
    public List<rating__c> rlist{get;set;}
    public String role{get;set;}
    public employees__c emp{get;set;}
    
    public NonProfitInfoCtr(){
        checklogin = true;
        var1=false;
        var2=false;
        var3=false;
        var4=false;
        
        jid=ApexPages.currentPage().getParameters().get('jid');
        jobid=ApexPages.currentPage().getParameters().get('jobid');
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        
        oid=ApexPages.currentPage().getParameters().get('orgId');
        jinfo=ApexPages.currentPage().getParameters().get('jinfo');
        npview=ApexPages.currentPage().getParameters().get('npview');
        npapplied=ApexPages.currentPage().getParameters().get('npapplied');
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        
        try{
            emp=[select id, name from employees__c where id=:eid];
        }catch(Exception e){}
        
            
        
        if(jinfo==null && eid!=null){
        
            var1=true;
        }
        if(jinfo==null && nplogin!=null){
        
            var2=true;
        }
        if(jinfo!=null && eid!=null){
        
            var3=true;
        }
        if(jinfo!=null && nplogin!=null){
        
            var4=true;
        }
        
    jinfo=ApexPages.currentPage().getParameters().get('eid');
    eid=ApexPages.currentPage().getParameters().get('eid');
    nplogin=ApexPages.currentPage().getParameters().get('nplogin');
    
    dList=new List<Department__c>();
        
            orgId = ApexPages.currentPage().getParameters().get('orgId');
          
          try{
            gid=ApexPages.currentPage().getParameters().get('gwid');}catch(Exception e){}
            
            try{
                navg=[Select name from Grant_Writer__c where id=:eid];
            }catch(Exception e){}
            try{
                navo=[Select name from Organization__c where id=:nplogin];
            }catch(Exception e){}
            try{
                gr=[Select User__c,id,User__r.login_status__c from Grant_Writer__c where id=:gid];
                if(org.User__r.Login_Status__c == false){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                    checklogin = false;
                } 
            }catch(Exception e){}
            
           try{
            dList=[Select name from Department__c where Organization__c=:orgId];  
           }catch(Exception e){}
        if(orgId!=null){
            org=[Select id, name, Other_Name_Organisation_is_known_as__c, Organization_Rating__c, Department_Name__c, Department_Size__c, Annual_Budget_Size__c, of_employees_FTE__c, Salutation__c, Title__c, Contact_Name__c, Phone__c, Tax_EIN__c, Phone_alternate__c, Federal_Tax_Exempt_Status__c, Exempt_from_tax__c, If_yes__c, Mailing_Street_Address__c, City__c, State__c, Zip_Postal_Code__c, Email__c, Website__c from Organization__c where id=:orgId];
        }
        else if(oId!=null){
           org=[Select id, name, Other_Name_Organisation_is_known_as__c, Organization_Rating__c, Department_Name__c, Department_Size__c, Annual_Budget_Size__c, of_employees_FTE__c, Salutation__c, Title__c, Contact_Name__c, Phone__c, Tax_EIN__c, Phone_alternate__c, Federal_Tax_Exempt_Status__c, Exempt_from_tax__c, If_yes__c, Mailing_Street_Address__c, City__c, State__c, Zip_Postal_Code__c, Email__c, Website__c from Organization__c where id=:oId];  
        } 
        completness=0;
        completed=0;
        
        System.debug('Testing org-------------->'+orgId);
        
        if(org.name!=null){
            completness=completness+1;
        }
        if(org.Other_Name_Organisation_is_known_as__c!=null){
            completness=completness+1;
        }
        if(dList!=null){
            completness=completness+1;
        }
        if(org.Annual_Budget_Size__c!=null){
            completness=completness+1;
        }
        if(org.of_employees_FTE__c!=null){
            completness=completness+1;
        }
        if(org.Salutation__c!=null){
            completness=completness+1;
        }
        if(org.Title__c!=null){
            completness=completness+1;
        }
        if(org.Contact_Name__c!=null){
            completness=completness+1;
        }
        if(org.Phone__c!=null){
            completness=completness+1;
        }
        if(org.Tax_EIN__c!=null){
            completness=completness+1;
        }
        if(org.Phone_alternate__c!=null){
            completness=completness+1;
        }
        if(org.Federal_Tax_Exempt_Status__c!=null){
            completness=completness+1;
        }
        if(org.Exempt_from_tax__c!=null){
            completness=completness+1;
        }
        if(org.Mailing_Street_Address__c!=null){
            completness=completness+1;
        }
        if(org.City__c!=null){
            completness=completness+1;
        }
        if(org.State__c!=null){
            completness=completness+1;
        }
        if(org.Zip_Postal_Code__c!=null){
            completness=completness+1;
        }
        if(org.Email__c!=null){
            completness=completness+1;
        }
        if(org.Website__c!=null){
            completness=completness+1;
        }
        
        
        completed=(completness*100)/19;
        widthfactor=(completness*250)/19;
        
        
        try{
            rList=[select id, Rating_for_emp__c, organization__c, star_rating__c from rating__c where organization__c=:orgid];   
      
             for(rating__c r:rList){
                 if(r.star_rating__c=='1'){
                     rating=1;
                 }
                 else if(r.star_rating__c=='2'){
                     rating=2;
                 }
                 else if(r.star_rating__c=='3'){
                     rating=3;
                 } 
                 else if(r.star_rating__c=='4'){
                     rating=4;
                 }
                 else if(r.star_rating__c=='5'){
                     rating=5;
                 }
                 totalrating=totalrating+rating;
                 rnumber=rnumber+1;
                 
                 
             }
             avgrating=totalrating/rnumber;
         }catch(Exception e){}
       
    }
    
     public PageReference gotohome() {
       PageReference newocp;  
       if(eid!=null){
            newocp = new PageReference('/apex/employeepage?eid='+eid+'&role='+role);   
       }
       else if(nplogin!=null){
            newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+nplogin);   
       }
        newocp.setRedirect(true);
        return newocp;
    }
    
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:gr.User__c];
        u.Login_Status__c = false;
        update u;
        PageReference newocp = new PageReference('/apex/UserLoginVF');   
        newocp.setRedirect(true);
        return newocp;
    }
    
    
    public PageReference back(){
         PageReference newcop;  
        /* if(npview!=null){
             newcop=new PageReference('/apex/jobdesc?ids='+jobid+'&gwid='+eid+'&eid='+eid); 
         }
         else if(npapplied!=null){
             newcop=new PageReference('/apex/AppliedJobDesc?ids='+jobid+'&gwid='+eid+'&eid='+eid);        
         }*/
         if(var1==true){
             newcop=new PageReference('/apex/employeepage?eid='+eid+'&role='+role); 
         }
         else if(var2==true){
             newcop=new PageReference('/apex/NonProfitInfoPage?orgId='+nplogin);
         }
         else if(var3==true){
              newcop=new PageReference('/apex/jobApplicants?isEdit=false&jbid='+jid+'&orgId='+oid+'&eid='+eid+'&role='+role);  
         }
         else if(var4==true){
               newcop=new PageReference('/apex/jobApplicants?isEdit=false&jbid='+jid+'&orgId='+oid+'&nplogin='+nplogin); 
         }
         else if(eid!=null){
             newcop=new PageReference('/apex/employeePage?eid='+eid+'&role='+role); 
         }
            newcop.setRedirect(true);
        return newcop;
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