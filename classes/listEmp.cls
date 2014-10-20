public class listEmp{

    public String org { get; set; }
    public String oId{get;set;}
    public String empId{get;set;}
    public employees__c eDel{get;set;}
    public List<Employees__c> empList{get;set;}
    public Organization__c organization{get;set;}
    public String eid{get;set;}
    public String role{get;set;}
    public String nplogin{get;set;}
        public listEmp(){
        oid=ApexPages.currentPage().getParameters().get('orgid');
        eid=ApexPages.currentPage().getParameters().get('eid');
        role=ApexPages.currentPage().getParameters().get('role');
        nplogin=ApexPages.currentPage().getParameters().get('nplogin');
        try{
            if(eid==null){
                empList=[Select id, name, last_name__c, organization__c from Employees__c where organization__c=:oid];
            }
            else{
                empList=[Select id, name, last_name__c, organization__c from Employees__c where organization__c=:oid and id!=:eid];
            }
            organization=[select name from organization__c where id=:oid];
        }
        catch(Exception e){}
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
    
     public PageReference empDetail(){
      PageReference newocp;
      if(nplogin!=null){
        newocp = new PageReference('/apex/empDetailPage?orgid='+oId+'&empId='+empId+'&orgId='+oId+'&nplogin='+nplogin);
      }
      else if(eid!=null){
         newocp = new PageReference('/apex/empDetailPage?orgId='+oId+'&empId='+empId+'&eid='+eid+'&role='+role);
      }
        newocp.setRedirect(true);
        return newocp;
        
    }
      public void deleteEmp(){
        //e=[select id from employees__c where id=:empId];
        delete eDel;
        
        
    }
    
}