public class empsignup{
    
    public Employees__c emp{get;set;}
    public Employees__c e{get;set;}
    public string oid{get;set;}
    public string uname{get;set;}
    public string password{get;set;}
    public Organization__c org{get;set;}
    public User__c u{get; set;}
    public String role{get;set;}
    public String roleOfEmp{get;set;}
    public user__c u1{get;set;}
    public empsignup(){
        
        oid=ApexPages.currentPage().getParameters().get('orgid');
        org=[select id, name from Organization__c where id=:oid];
        emp=new Employees__c();
        role=ApexPages.currentPage().getParameters().get('role');
        if(role=='ReadOnly'){
            roleOfEmp='Read Only';
        }
        else if(role=='RegularUser'){
            roleOfEmp='Regular User';
        }
        else if(role=='Admin'){
            roleOfEmp='Admin User';
        }
        
         
    }
    public PageReference insertEmp(){
    try{
            u1 = [select id,name from User__c where name =: emp.username__c];
       }catch(Exception e){}
    if(u1!=null){
            System.debug('Existing user---------->'+u1);
            emp.username__c.adderror('User Name already exists. Please refresh the page and try again!');
            
    }    
      else{  
            u=new User__c();
            u.name=emp.username__c;
            u.Password__c=emp.password__c;
            u.email__c=emp.email__c;
            u.If_Employee__c=true;
            insert u;
            
            emp.Organization__c=org.id;
            emp.role__c=roleOfEmp;
            emp.User__c=u.id;
            insert emp;
            
            PageReference p=new PageReference('/apex/employeePage?orgid='+oid+'&eid='+emp.id+'&role='+emp.role__c);
            p.setRedirect(true);
            return p;
     }
     return null;
    }
    
    public pageReference gotosite(){
        PageReference p=new PageReference('www.gratsourcellc.com');
        p.setRedirect(true);
        return p;
    }
    public PageReference blog() {
        PageReference newocp = new PageReference('http://www.grantsourcellc.com/category/blog/');
        newocp.setRedirect(true);
        return newocp;
    }
  

}