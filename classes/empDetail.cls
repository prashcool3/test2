public class empDetail{

    public String save { get; set; }
    public Employees__c emp{get;set;}
    public String empId{get;set;}
    public String oId{get;set;}
    public Boolean selectR{get;set;}
    public Organization__c org{get;set;}
    public String eid{get;set;}
    public String role{get;set;}
    public String nplogin{get;set;}
    public List<rating__c> ratingList{get;set;}
    public integer numberOfReviews{get;set;}
    public integer rnumber{get;set;}
    public integer avgrating{get;set;}
    public integer rating{get;set;}
    public integer totalrating{get;set;}
    
    public empDetail(){
        selectR=false;
        totalrating=0;
        rnumber=0;
        avgrating=0;
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        oId=ApexPages.currentPage().getParameters().get('orgId');
        org=[Select id, name from Organization__c where id=:oId];
        empId=ApexPages.currentPage().getParameters().get('empId');
        emp=[Select id, name, role__c, last_name__c,Address__c, City__c, Phone__c, Pin__c, State__c, Country__c, Organization__c, Organization__r.name from Employees__c where id=:empId];
           try{
            
            ratingList=[select id, Organization__r.name, organization__c, Rating_for_emp__c, Rating_for_emp__r.name, project__c, project__r.name, Comments__c,  Star_Rating__c, Grant_Writer__c, grant_writer__r.name  from  Rating__c where Rating_for_emp__c=:empid];
            numberOfReviews=ratingList.size();
             for(rating__c r:ratingList){
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
     public PageReference gotoOrg(){
         PageReference newocp = new PageReference('/apex/NonProfitInfoPage?orgid='+oId+'&role='+emp.role__c+'&eid='+emp.id);
        newocp.setRedirect(true);
        return newocp;
    }
    public PageReference goback(){
        PageReference newocp;
        if(nplogin!=null){
            newocp = new PageReference('/apex/listemp?orgid='+oId+'&nplogin='+nplogin);
        }
        else if(eid!=null){
            newocp = new PageReference('/apex/listemp?orgid='+oId+'&eid='+eid+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
        
    }
    
     public PageReference gotohome(){
         PageReference newocp;
        if(nplogin!=null){
            newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgid='+oId);
        }
        else if(eid!=null){
            newocp = new PageReference('/apex/employeePage?eid='+eid+'&orgId='+oId+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
        
    }
    public void selectRole(){
        selectR=true;
    }
     public void save(){
        selectR=false;
        upsert emp;
    }
    public PageReference deleteEmp(){
        delete emp;
         PageReference newocp;
        if(nplogin!=null){
            newocp = new PageReference('/apex/listemp?orgid='+oId+'&nplogin='+nplogin);
        }
        else if(eid!=null){
            newocp = new PageReference('/apex/listemp?orgid='+oId+'&eid='+eid+'&role='+role);
        }
        newocp.setRedirect(true);
        return newocp;
    }
}