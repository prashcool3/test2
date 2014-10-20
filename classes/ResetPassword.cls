public Class ResetPassword{

    public String password{get;set;}
    public String cpassword{get;set;}
    public String user{get;set;}
    public String uid{get;set;}
    public Grant_Writer__c g{get;set;}
    public Organization__c o{get;set;}
    public Employees__c e{get;set;}
    public User__c u{get;set;}
    public boolean notequal{get;set;}
    
    public ResetPassword(){
        notequal=false;
        uid=ApexPages.currentPage().getParameters().get('uid');
        u=[select id from user__c where id=:uid];
        
        try{
                        e=[select id, name, last_name__c, email__c, user__c from employees__c where user__c=:u.id];
         }catch(Exception e){}
         
         try{
              o=[select id, name, email__c, user__c from organization__c where user__c=:u.id];
                       
         }catch(Exception e){}
         try{
              g=[select id, name, email__c, user__c from grant_writer__c where user__c=:u.id ];
         }catch(Exception e){}
         
         
        
        if(e!=null){
            user=e.name+' '+e.last_name__c;
        }
        else if(o!=null){
            user=o.name;
        }
        else if(g!=null){
            user=g.name;
        }
        
    }
    
    public PageReference resetPassword(){
        
        if(password!=cpassword){
            notequal=true;
            
        }
        else{
             u.password__c=cpassword;
             upsert u;
             Pagereference p=new Pagereference('/apex/userloginvf');
             p.setRedirect(true);
             return p;
            }
            
        return null;
    }

}