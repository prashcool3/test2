public Class rateEmployee{
    public string eid{get;set;}
    public Employees__c emp{get;set;}
    public grant_writer__c g{get;set;}
    public project__c p{get;set;}
    public string jbid{get;set;}
    public string gwid{get;set;}
    public rating__c r{get;set;}
    public boolean popupclose{get;set;}
    
    public rateEmployee(){
        popupclose = true;
        eid=ApexPages.currentPage().getParameters().get('eid');
        gwid=ApexPages.currentPage().getParameters().get('gwid');
        jbid=ApexPages.currentPage().getParameters().get('jbid');
        emp=[select id, name, organization__c, role__c from employees__c where id=:eid];
        g=[select id, name from grant_writer__c where id=:gwid];
        p=[select id from project__c where id=:jbid];
        r=new rating__c();
        
    }
    
    public void save(){
        r.Organization__c=emp.Organization__c;
        r.Rating_for_emp__c=emp.id;
        r.grant_writer__c=g.id;
        r.project__c=p.id;
        insert r;
        popupclose = false;
    }
}