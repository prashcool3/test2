public class employee{

    public Organization__c org{get;set;}
    public String oid{get;set;}
    public employees__c e{get;set;}
    public String eid{get;set;}
    public string role{get;set;}
    public List<employees__c> eList{get;set;}
    public boolean adminRights{get;set;}
    public boolean regularRights{get;set;}
    public boolean edit{get;set;}
    public List<rating__c> ratingList{get;set;}
    public integer numberOfReviews{get;set;}
    public integer rnumber{get;set;}
    public integer avgrating{get;set;}
    public integer rating{get;set;}
    public integer totalrating{get;set;}
    public employee(){
        totalrating=0;
        rnumber=0;
        avgrating=0;
        adminRights=false;
        regularRights=false;
        edit=false;
        oid=ApexPages.currentPage().getParameters().get('orgid');
        org=[select id, name from Organization__c where id=:oid];
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        
        e=[select id, name, role__c, last_name__c, username__c, email__c, phone__c,  address__c, city__c, state__c, Country__c, Pin__c, Organization__c from employees__c where id=:eid];
        try{ 
            eList=[select id, name from employees__c where organization__c=:oid];
            
        }
        catch(Exception e){}
        try{
            
            ratingList=[select id, Organization__r.name, organization__c, Rating_for_emp__c, Rating_for_emp__r.name, project__c, project__r.name, Comments__c,  Star_Rating__c, Grant_Writer__c, grant_writer__r.name  from  Rating__c where Rating_for_emp__c=:e.id];
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
        
        if(eList.size()>0 && e.role__c=='Admin User'){
            System.debug('Check list of employees---------->' +eList);
            adminRights=true;
        }
        if(e.role__c=='Admin User' || e.role__c=='Regular User'){
            regularRights=true;
        }
        
    }   
    
     public PageReference postjob() {
        PageReference newocp = new PageReference('/apex/addJobVF?orgId='+org.id+'&role='+e.role__c+'&eid='+e.id);   
        newocp.setRedirect(true);
        return newocp;
    }
       
       public PageReference view() {
        PageReference newocp = new PageReference('/apex/viewsubmission?orgid='+org.id+'&role='+e.role__c+'&eid='+e.id);   
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
         PageReference newocp = new PageReference('/apex/addEmpPage?orgid='+oId+'&role='+e.role__c+'&eid='+e.id);
        newocp.setRedirect(true);
        return newocp;
        
    }
      public PageReference listEmp(){
         PageReference newocp = new PageReference('/apex/listEmp?orgid='+oId+'&role='+e.role__c+'&eid='+e.id);
        newocp.setRedirect(true);
        return newocp;
        
    }
    
     public PageReference gotoOrg(){
         PageReference newocp = new PageReference('/apex/NonProfitInfoPage?orgid='+oId+'&role='+e.role__c+'&eid='+e.id);
        newocp.setRedirect(true);
        return newocp;
        
    }
     
    public void edit(){
        edit=true;
    }
     public void save(){
        edit=false;
        upsert e;
    }

}