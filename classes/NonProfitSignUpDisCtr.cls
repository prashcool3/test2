public class NonProfitSignUpDisCtr {

   

   // public String addEmpPage { get; set; }

    public boolean checklogin {get;set;}
    public String dept{get;set;}
    public Organization__c org{get;set;}
    public boolean isEdit{get;set;}
    public Department__c d{get;set;}
    public List<Department__c> dList{get; set;}
    public Integer completness{get;set;}
    public Integer completed{get;set;}
    public Integer widthfactor{get;set;}
    public Boolean depExists{get;set;}
    public Integer dExists{get;set;}
    public String nplogin{get;set;}
    public String jbid{get;set;}
    public String editinfo{get;set;}
    public list<selectoption> options{get;set;}
    public String depts{get;set;}
    public String needToBeCompleted{get;set;}
    public integer notcompleted{get;set;}
    public String oId;
    public List<employees__c> eList{get;set;}
    public Integer e{get;set;}
    public List<rating__c> rlist{get;set;}
    public integer totalrating{get;set;}
    public integer rnumber{get;set;}
    public integer avgrating{get;set;}
    public integer rating{get;set;}
    public String[] str3 {get;set;}
    public String[] str4 {get;set;}
    public String[] str5 {get;set;}
    
    public NonProfitSignUpDisCtr(){
        str3 = new String[]{};
        str4 = new String[]{};
        str5 = new String[]{};
        notcompleted=0;
        completness=0;
        completed=0;
        depExists=false;
        checklogin = true;
        isEdit = false;
        dList=new List<Department__c>();
        jbid=ApexPages.currentPage().getParameters().get('jbid');
        editinfo=ApexPages.currentPage().getParameters().get('editinfo');
        nplogin=ApexPages.currentPage().getParameters().get('orgId');
        oId = ApexPages.currentPage().getParameters().get('orgId');
        totalrating=0;
        rnumber=0;
        avgrating=0;
        try{
            org = [select id,Email__c,Website__c,User__c,User__r.Login_Status__c,Salutation__c, Seeking_talent_type__c, Area_of_expertise_topic__c, audience__c,  Type_of_opportunity__c, Organization_Rating__c, Title__c,Name,Phone__c,Tax_EIN__c,Phone_alternate__c,Federal_Tax_Exempt_Status__c,If_yes__c,
                   Exempt_from_tax__c,type__c,University_Type__c,Other_Name_Organisation_is_known_as__c,Department_Name__c,Department_Size__c,City__c,State__c,
                   Mailing_Street_Address__c,Zip_Postal_Code__c,Annual_Budget_Size__c, No_of_employees__c, of_employees_FTE__c,Contact_Name__c from Organization__c where id =: oId];
             eList=[select id from employees__c where organization__c=:org.id]; 
             rList=[select id, Rating_for_emp__c, organization__c, star_rating__c from rating__c where organization__c=:org.id];   
             
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
             /*if(avgrating==1){
                 org.Organization_Rating__c='1';
             }
             else if(avgrating==2){
                 org.Organization_Rating__c='2';
             }
             else if(avgrating==3){
                 org.Organization_Rating__c='3';
             }
             else if(avgrating==4){
                 org.Organization_Rating__c='4';
             }
             else if(avgrating==5){
                 org.Organization_Rating__c='6';
             }*/
             
             
            if(org.User__r.Login_Status__c == false){
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please Login to Conitunue'));    
                checklogin = false;
            }
            dList=[Select name from Department__c where Organization__c=:oId];    
            options= new list<selectoption>(); 
            for(Department__c s:dList){
                options.add(new selectoption(s.name,s.name));
            }
        }catch(Exception e){}
        e=eList.size();
        completness = ProfileUpdater.profilepercentage(oId);
        completed=(completness*100)/19;
        widthfactor=(completness*250)/19;
        needToBeCompleted = ProfileUpdater.fieldsremeaning(oId);
    }
    
    public PageReference Edit() {
        IsEdit = true;
        return null;
        
    }
    public PageReference Save() {
        upsert org;
        completness = ProfileUpdater.profilepercentage(oId);
        completed=(completness*100)/19;
        widthfactor=(completness*250)/19;
        needToBeCompleted = ProfileUpdater.fieldsremeaning(oId);

        IsEdit = False;
        return null;
    }
    public PageReference Cancel() {
        PageReference newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgId='+org.id);   
        newocp.setRedirect(true);
        return newocp;
    }

    public PageReference postjob() {
        PageReference newocp = new PageReference('/apex/addJobVF?orgId='+org.id+'&nplogin='+nplogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference view() {
        PageReference newocp = new PageReference('/apex/viewsubmission?orgid='+org.id+'&nplogin='+nplogin);   
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference Logout() {
        User__c u = [select id,Login_Status__c from User__c where id=:org.User__c];
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
    
    public PageReference addDept(){
        dExists=0;
        String oId = ApexPages.currentPage().getParameters().get('orgId');
        for (Department__c dep:dList){
            if(dep.name==dept){
                dExists=dExists+1;
            }
        }
        if(dExists>0){
            //depExists=true ;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please do not choose an already existing department name!!');//Same old drama 
            ApexPages.addMessage(myMsg);
        }
        
        else{
                d=new Department__c();
                d.name=dept;
                d.Organization__c=oId;
                insert d;
                dList.add(d);
                options.add(new selectoption(d.name,d.name));
                dept=null;
            }
        return null;
    }
    
    public PageReference deletedept(){
        
       String oId = ApexPages.currentPage().getParameters().get('orgId');
       for(integer i = 0;i<dList.size();i++){
           if(dList.get(i).name==depts){
               
                Department__c department=[Select name, Organization__c from department__c where name=:depts and Organization__c=:oId];
                delete department;
                dList.remove(i);
                options.remove(i);
                i--;
           
           }
       
       }
         return null;
    }
    
    public PageReference viewPrevJob(){
        PageReference newocp;
         if(nplogin!=null && editinfo!=null && jbid!=null){
            newocp = new PageReference('/apex/addJobVF?jbid='+jbid+'&isEdit=false'+'&nplogin='+nplogin+'&detail=true'); 
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
    public PageReference addEmpPage(){
         PageReference newocp = new PageReference('/apex/addEmpPage?orgid='+oId+'&nplogin='+nplogin);
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    public PageReference listEmp(){
         PageReference newocp = new PageReference('/apex/listEmp?orgid='+oId+'&nplogin='+oId);
        newocp.setRedirect(true);
        return newocp;
        
    }
    
    
}