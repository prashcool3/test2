public class SubmitAccountController {
    public Grant_Writer__c a { get; set; }
    public String rsrch{get;set;}
    public Blob Resumee {get;set;}
     public Blob cover {get;set;}
     public String contentType1 {get; set;}
    public String contentType {get; set;}
    public integer num { get; set; }
      public List<Reference__c> accts {get; set;} 
    public String uid{get;set;}
    public list<reference__c> rlist{get;set;}
    public string[] str{get;set;}
    public string[] str1{get;set;}
    public string[] str2{get;set;}
    
    public SubmitAccountController() {
        str=new String[]{};
        str1=new String[]{};
        str2=new String[]{};
        a = new Grant_Writer__c();
        uid=ApexPages.currentPage().getParameters().get('uid');
       
    }
    public PageReference submitAccount() {
        //String id = ApexPages.currentPage().getParameters().get('uid');
        //System.debug('id....'+id);
        a.user__c = uid;
        System.debug('First_Name__c'+a.First_Name__c);
        System.debug('a.Last_Name__c....'+a.Last_Name__c);
        a.Name=a.First_Name__c +' '+a.Last_Name__c;
        String s='';
        for(integer i = 0;i< str.size(); i++){
                 if(str[i] !=null){
                     s=s+str[i]+'; ';
            
                 }
        }
        
         a.seeking__c=s;
         
         String s1='';
         for(integer i = 0;i< str1.size(); i++){
                 if(str1[i] !=null){
                     s1=s1+str1[i]+'; ';
            }
         }
             
         a.Interest_In__c=s1;
         
         String s2='';
          for(integer i = 0;i< str2.size(); i++){
                 if(str2[i] !=null){
                     s2=s2+str2[i]+'; ';
            }
         }
        a.audience__c=s2;
        
        insert a;
        
        
         try{
                rList=[select id, name, User__c, grant_writer__c, last_name__c, profession__c, relationship__c, phone__c, email__c from reference__c where  user__c=:uid];
        }catch(Exception e){}
        for(reference__c r:rList){
            r.grant_writer__c=a.id;
        }
        upsert rList;
        
        Attachment attc = new Attachment();
        attc.body = resumee;
        attc.ParentId = a.id;
        attc.OwnerId = UserInfo.getUserId();
        attc.contentType = contentType;
        attc.name = a.name + ' Resume';
        if(attc.body != NULL)
            insert attc;
            
        Attachment attc1 = new Attachment();
        attc1.body = cover;
        attc1.ParentId = a.id;
        attc1.OwnerId = UserInfo.getUserId();
        attc1.contentType = contentType1;
        attc1.name = a.name + ' Cover Letter';
        if(attc1.body != NULL)
            insert attc1;
            
        PageReference newocp = new PageReference('/apex/TalentSignUpDisVF?gwid='+a.id);   
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
}