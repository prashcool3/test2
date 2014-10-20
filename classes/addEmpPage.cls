public class addEmpPage{
        
      public String oid{get;set;}
      public Organization__c org{get;set;}
      public String mailmsg{get;set;}
      public String email1{get;set;}
      public String email2{get;set;}
      public String email3{get;set;}
      public String email4{get;set;}
      public String email5{get;set;}
      public String email6{get;set;}
      public String email7{get;set;}
      public String email8{get;set;}
      public String email9{get;set;}
      public String email10{get;set;}
      public List<String> sendTo{get;set;}
      public String body{get;set;}
      public String selectedRole1{get;set;}
      public String selectedRole2{get;set;}
      public String selectedRole3{get;set;} 
      public String selectedRole4{get;set;}
      public String selectedRole5{get;set;}
      public String selectedRole6{get;set;}
      public String selectedRole7{get;set;}
      public String selectedRole8{get;set;}
      public String selectedRole9{get;set;}
      public String selectedRole10{get;set;}
      public List<SelectOption> Roles{get;set;}
      public String eid{get;set;}
      public String role{get;set;}
      public String nplogin{get;set;}
      
      public addEmpPage(){
            nplogin=ApexPages.currentPage().getParameters().get('nplogin');
            eid=ApexPages.currentPage().getParameters().get('eid');
            role=ApexPages.currentPage().getParameters().get('role');
            oid=ApexPages.currentPage().getParameters().get('orgid');
            org=[select id, name from Organization__c where id=:oid];
            mailmsg='Please register on Grant Source';
            roles=new List<SelectOption>();
              Roles.add(new SelectOption('Read Only','Read Only'));
              Roles.add(new SelectOption('Regular User','Regular User'));
              Roles.add(new SelectOption('Admin User','Admin User'));
              
             
        }    
        
        public PageReference invited(){   
            if(email1!='' || email2!='' || email3!='' || email4!='' || email5!='' || email6!='' || email7!='' || email8!='' || email9!='' ||email10!='' ){
                System.debug('Why enterting here!!!!!');
                
                sendTo=new List<String>();
                if(email1!=''){
                    String role;
                    if(selectedRole1=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole1=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole1=='Read Only'){
                        role='ReadOnly';
                    }
                    String[] s= new String[] {email1};   
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                   // body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email2!=''){
                String role;
                    if(selectedRole2=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole2=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole2=='Read Only'){
                        role='ReadOnly';
                    }
                    String[] s= new String[] {email2};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email3!=''){
                    String role;
                    if(selectedRole3=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole3=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole3=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email3};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email4!=''){
                    String role;
                    if(selectedRole4=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole4=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole4=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email4};  
                   List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email5!=''){
                String role;
                    if(selectedRole5=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole5=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole5=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email5};  
                   List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email6!=''){
                    String role;
                    if(selectedRole6=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole6=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole6=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email6};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email7!=''){
                    String role;
                    if(selectedRole7=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole7=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole7=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email7};  
                   List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    //body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email8!=''){
                    String role;
                    if(selectedRole8=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole8=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole8=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email8};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email9!=''){
                    String role;
                    if(selectedRole9=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole9=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole9=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email9};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                   // body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                if(email10!=''){
                    String role;
                    if(selectedRole10=='Admin User'){
                        role='Admin';
                    }
                     if(selectedRole10=='Regular User'){
                        role='RegularUser';
                    }
                     if(selectedRole10=='Read Only'){
                        role='ReadOnly';
                    }

                    String[] s= new String[] {email10};  
                    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(s);
                    mail.setSubject('Invitation to join Grant Source');
                    body='<html><div>Hi</div><br/>';
                    body+=mailmsg+' pasting the following link in your web browser: <br/>';
                    body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id+'&role='+role;
                    //body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id+'&role='+role;
                    mail.setHTMLBody(body);
                    mails.add(mail);
                    mail.setSaveAsActivity(false);
                    Messaging.sendEmail(mails);
                }
                
                
                
               /* mail.setToAddresses(sendTo);
                mail.setSubject('Invitation to join Grant Source');
                body='<html><div>Hi</div><br/>';
                body+=mailmsg+' pasting the following link in your web browser: <br/>';
                //body+='http://testgrant-grantsource.cs16.force.com/empsignuppage?orgid='+org.id;
                body+='https://c.cs16.visual.force.com/apex/empsignuppage?orgid='+org.id;
                mail.setHTMLBody(body);
                mails.add(mail);
                mail.setSaveAsActivity(false);
                Messaging.sendEmail(mails);*/
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Invitation sent!'));
                
            }
            
            else{
                    ApexPages.addMessage(new ApexPages.message (ApexPages.severity.ERROR, 'Please enter e-mail Ids!!!'));
                }
                return null;
        }
        public PageReference goback(){
             PageReference newocp;
            if(nplogin!=null){ 
              newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgId='+oId);
            }
            else if(eid!=null){
                newocp = new PageReference('/apex/employeePage?eid='+eid+'&role='+role+'&orgId='+oId);
            }
            newocp.setRedirect(true);
            return newocp;
        }

}