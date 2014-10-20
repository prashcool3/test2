public class NonProfitSignUpCtr {
    public Organization__c org;    
    public Boolean depExists{get;set;}
    public Integer dExists{get;set;}
    public String dept{get;set;}
    public Department__c d{get;set;}
    public List<Department__c> dList{get; set;}
    public List<String> depList{get;set;}
    public String[] str {get;set;}
    public String[] str1 {get;set;}
    public String[] str2 {get;set;}
     public String[] str3 {get;set;}
    public String[] str4 {get;set;}
    public String[] str5 {get;set;}
        
    public NonProfitSignUpCtr(ApexPages.StandardController controller) {
        str = new String[]{};
        str1 = new String[]{};
        str2 = new String[]{};
        str3 = new String[]{};
        str4 = new String[]{};
        str5 = new String[]{};
        depExists=false;
         dList=new List<Department__c>();
        org = (Organization__c)controller.getRecord();
        
      //  String oId = ApexPages.currentPage().getParameters().get('uid');
        
        depList=new List<String>();
        
    }
    
    public void refreshdept(){}
    
    public PageReference save(){
        String id = ApexPages.currentPage().getParameters().get('uid');
        org.user__c = id;
        //org.Name=org.Contact_Person_First_Name__c+' '+org.Last_Name__c;
        org.Contact_Name__c=org.Contact_Person_First_Name__c+' '+org.Last_Name__c;
        
        
        /*if(str[0]!=null){
            org.Exempt_from_tax__c = str[0];
            org.Federal_Tax_Exempt_Status__c = str1[0];}
            if(str2[0]!=null){
            org.If_yes__c = str2[0];
            upsert org;  
        } 
        else if(str[0]==null){
            upsert org;  
        }*/
        
        
        String s='';
        for(integer i = 0;i< str.size(); i++){
                 if(str3[i] !=null){
                     s=s+str3[i]+'; ';
            
                 }
        }
        
         org.Type_of_opportunity__c=s;
         
         String s1='';
         for(integer i = 0;i< str1.size(); i++){
                 if(str4[i] !=null){
                     s1=s1+str4[i]+'; ';
            }
         }
             
         org.Area_of_expertise_topic__c=s1;
         
         String s2='';
          for(integer i = 0;i< str2.size(); i++){
                 if(str5[i] !=null){
                     s2=s2+str5[i]+'; ';
            }
         }
        org.audience__c=s2;
        
        
        
        insert org;
        
        PageReference newocp = new PageReference('/apex/NonProfitSignUpDisVF?orgId='+org.id);   
        newocp.setRedirect(true);
       
        
        for(String s3:depList){
            d=new Department__c();
            d.name=s3;
            d.Organization__c=org.id;
            insert d;
        }
        
        return newocp;  
        
    } 
    
   
    
    public PageReference addDept(){
        System.debug('testing--------------dept------>>' +dept);
        if(dept.equals('')){
             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter department name!!'); 
             ApexPages.addMessage(myMsg);
        }
        else {
            dExists=0;
            if(depList!=null){
              for (String dep:depList){
                if(dep==dept){
                dExists=dExists+1;
              }
            }
          }
            if(dExists>0){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please do not choose an already existing department name!!'); 
                ApexPages.addMessage(myMsg);
            }
        
            else{
                depList.add(dept);
                dept='';
            }
        }
        return null;
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