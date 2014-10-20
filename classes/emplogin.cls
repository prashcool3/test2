public class emplogin{
    public Employees__c e{get;set;}
    public Employees__c emp{get;set;}
    public emplogin(){
        emp=new employees__c();
       
    }
    public PageReference login(){
        try{
             e=[select id, name, username__c, password__c, organization__c from employees__c where username__c=:emp.username__c];
        }catch(Exception e){}
        
        if(e==null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'UserName is incorrect'));
            return null;
        }
        if(e != null && e.password__c != emp.password__c){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Password is incorrect'));
            return null;
        }
    
        PageReference p=new PageReference('/apex/employeePage?eid='+e.id+'&orgid='+e.organization__c);
        p.setRedirect(true);
        return p;
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
     public PageReference back() {
        PageReference newocp = new PageReference('/apex/userloginvf');
        newocp.setRedirect(true);
        return newocp;
    }
}