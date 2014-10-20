public class JobApplicationCtr {

    public Job_Application__c ja { get; set; }
    public Grant_Writer__c gw{ get; set; }
    public Map<String,Integer> countjobMap;
    public String showApply{get;set;}
    public Project__c proj{get;set;}
    public String id{get;set;}
    public List<Job_Application__c> jb{get; set;}
    public Boolean popupclose {get;set;}
    
    public JobApplicationCtr(){
        proj=new Project__c();
        popupclose = true;
        //showApply = 'true';
        ja = new Job_Application__c();
        //countjobMap = new Map<String,Integer>();
        id = ApexPages.currentPage().getParameters().get('ids');
        String gid = ApexPages.currentPage().getParameters().get('gwid');
        ja.Job__c = id;
        ja.Grant_Writer__c = gid;
        ja.Covering_Note__c='Please consider my application.';
        gw=new Grant_Writer__c();
        gw=[Select id, name, Email__c, First_Name__c, Last_Name__c, Phone__c from Grant_Writer__c where id=:gid];
        ja.Name=gw.First_Name__c + ' ' + gw.Last_Name__c;
        ja.Phone__c=gw.Phone__c;
        ja.Email__c=gw.Email__c;
       
       
    }
    
    public Pagereference Apply(){
        
        integer count=1; 
        String key = System.today().year()+'-'+System.today().month();
        
        try{
            List<Job_Application__c> jb = [select id,Createddate, Job__c from Job_Application__c where Grant_Writer__c =: gw.id];
            
            for(Job_Application__c j : jb){
                proj=[Select id,End_Date__c from Project__c where id=:j.Job__c];
                String key1 = j.Createddate.year()+'-'+j.Createddate.month();
                if(key1 == key &&  proj.End_Date__c>System.Today())
                    count++;
            }
        }
        catch(Exception e){} 
        
        if(count>3){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'User can apply only three Jobs per month'));
            return null;
        }
        else{
            String id = ApexPages.currentPage().getParameters().get('ids');
            String gid = ApexPages.currentPage().getParameters().get('gwid');
            ja.Job__c = id;
            ja.Grant_Writer__c = gid;
            insert ja;
        
            popupclose = false;
        }
        return null;
    }
}