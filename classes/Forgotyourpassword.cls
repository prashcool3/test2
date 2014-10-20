public class Forgotyourpassword{

    public string uname{get;set;}
    public string email{get;set;}
    public boolean recall{get;set;}
    public User__c u{get;set;}
    public User__c u1{get;set;}
    public Grant_Writer__c g{get;set;}
    public Organization__c o{get;set;}
    public Employees__c e{get;set;}
    public boolean nouser{get;set;}
    public boolean noemail{get;set;}
    public boolean sentmail{get;set;}
    public string tosend{get;set;}
    public Forgotyourpassword(){
        recall=true;
        nouser=false;
        noemail=false;
        sentmail=false;
        
    }
    
    public void canRecall(){
        recall=false;
    
    
    }
    public void resetPassword(){
    try{
            u=[Select name, id from User__c where name=:uname];
           
        }
        catch(Exception e){}
        try{
             u1=[Select name, email__c, id from User__c where email__c=:email];
        }catch(Exception e){}
        
        
        System.debug('Testing recall------------->'+recall);
        System.debug('Testing u1-------------->'+u1);
    
        if(recall==true){
                try{
                        e=[select id, email__c, user__c from employees__c where user__c=:u.id];
                       
                   }catch(Exception e){}
                   try{
                        
                        o=[select id, email__c, user__c from organization__c where user__c=:u.id ];
                        
                   }catch(Exception e){}
                   try{
                        
                        g=[select id, email__c, user__c from grant_writer__c where user__c=:u.id ]; 
                   }catch(Exception e){}
                   
                 if(u!=null){
                    
                 
                            if(e!=null){
                                 tosend=e.email__c;
                             }
                             else if(o!=null){
                                 tosend=o.email__c;
                             }
                             else if(g!=null){
                                 tosend=g.email__c;
                             }
                             
                            
                            List<String> tosendadd=new List<String>();
                            tosendadd.add(tosend);
                            
                            String body;
                            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                            mail.setToAddresses(tosendadd);
                            mail.setSubject('Grant Source: Reset you password.');
                            body='<html><div>Hi</div><br/>';
                            body+='Click on the following link to change your password: <br/><br/>';
                            body+='http://testgrant-grantsource.cs16.force.com/resetPassword?uid='+u.id;
                            
                            mail.setHTMLBody(body);
                            mails.add(mail);
                            mail.setSaveAsActivity(false);
                            Messaging.sendEmail(mails);
                             
                             
                             sentmail=true;
                      }
                      
                 
                 else if(u==null){
                     nouser=true;
                 }
                        
            
        }
        
        else if(recall==false){
            System.debug('Tesing u1------------>'+u1);
             try{
                        e=[select id, email__c, user__c from employees__c where user__c=:u1.id];
                         
                }catch(Exception e){}
                try{
                      
                        o=[select id, email__c, user__c from organization__c where user__c=:u1.id ];
                         
                }catch(Exception e){}
                try{
                        g=[select id, email__c, user__c from grant_writer__c where user__c=:u1.id ]; 
                }catch(Exception e){}
        
               if(u1!=null){
                    
                 
                             if(e!=null){
                                 tosend=e.email__c;
                             }
                             else if(o!=null){
                                 tosend=o.email__c;
                             }
                             else if(g!=null){
                                 tosend=g.email__c;
                             }
                            
                            List<String> tosendadd=new List<String>();
                            tosendadd.add(tosend);
                            System.debug('Testing u1 address--------------->'+tosendadd);
                            String body;
                            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                            mail.setToAddresses(tosendadd);
                            mail.setSubject('Grant Source: Reset you password.');
                            body='<html><div>Hi</div><br/>';
                            body+='Click on the following link to change your password: <br/>';
                            body+='http://testgrant-grantsource.cs16.force.com/resetPassword?uid='+u1.id;
                            
                            mail.setHTMLBody(body);
                            mails.add(mail);
                            mail.setSaveAsActivity(false);
                            Messaging.sendEmail(mails);
                             
                            sentmail=true;
                      }
                      
                 
                 else if(u1==null){
                     noemail=true;
                 }
                 
        
            }
            
            
        }

}