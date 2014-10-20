/** **********************************************************
Name        : getRatingsBatch
Function    : Batch to update ratings of organizations and departments.
Description : getRatingsBatch update the ratings of organizations and departments everyday.
Author      : Himanshu Maheshwari
Created On  : 1-May-2014
************************************************************ */
global class getRatingsBatch implements Database.Batchable<sObject>,Database.AllowsCallouts  {
    public static boolean isApexTest = true;
    public List<Department__c> deptList = new List<Department__c>() ;
    public List<Organization__c> orgList= new List<Organization__c>() ;
    public Map<String,Decimal> deptRateMap =new Map<String,Decimal>();
    public Map<String,Decimal> orgRateMap = new Map<String,Decimal>();
    public Map<String,String> jaMap;
    
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        String sql = 'Select Id,Organization_Rating__c from Organization__c limit 1';
        return Database.getQueryLocator(sql); 
    }
   
    // Execute Logic
    global void execute(Database.BatchableContext BC, List<Organization__c> scope){
        Decimal total = 0;
        integer count = 0;
        Decimal average = 0;    
        
        jaMap = new Map<String,String>(); 
        for(Job_Application__c ja : [Select id,Job__c,Job__r.id,Grant_Writer__c,Grant_Writer__r.Average_Rating__c,Rated__c,Employment_accepted__c from Job_Application__c where Job__c <> NULL and Rated__c = TRUE]){
            jaMap.put(ja.Job__r.id,ja.Grant_Writer__r.Average_Rating__c);    
        }
        for(Project__c prj : [select id,departments__r.name,departments__c,Organization__c,Organization__r.name from Project__c where Departments__c <> NULL order by Organization__c,departments__c]){
            if(jaMap.get(prj.id) <> NULL){
                if(deptrateMap.get(prj.Organization__r.name+'-'+prj.departments__r.name) == null){
                    total = Integer.valueOf(jaMap.get(prj.id));
                    count = 1;
                }else{
                    total = total + Integer.valueOf(jaMap.get(prj.id));
                    count = count + 1;
                }
            average = math.round(total/count);
            deptrateMap.put(prj.Organization__r.name+'-'+prj.departments__r.name,average);
            }
        }
        //System.debug('Department Map is '+deptrateMap); 
    
        for(Department__c dept : [select id,name,Organization__r.name,Department_Rating__c from Department__c]){
            if(deptrateMap.get(dept.Organization__r.name+'-'+dept.name) != null){
                dept.Department_Rating__c = String.valueOf(deptrateMap.get(dept.Organization__r.name+'-'+dept.name));
                deptList.add(dept);
            }
        }
        update deptList;
        
        for(department__c dept : [select id,organization__c,department_Rating__c from department__c where department_Rating__c <> null and organization__c<> null order by organization__c]){
            if(orgRateMap.get(dept.organization__c) == null){
                total = Integer.valueOf(dept.department_Rating__c);
                count = 1;
            }else{
                total = total + Integer.valueOf(dept.department_Rating__c);
                count = count + 1;
            }
            average = math.round(total/count);
            orgRateMap.put(dept.organization__c,average);
        }
        for(organization__c org : [select id,Organization_Rating__c from organization__c]){
            if(orgRateMap.get(org.id) != null){
                org.Organization_Rating__c = String.valueOf(orgRateMap.get(org.id));
                orgList.add(org);
            }
        }
        update orgList;
    }
    
    // Logic to be Executed after finish
    global void finish(Database.BatchableContext BC){
        System.debug('Ratings of organizations and Departments are updated.');
    }
    
    public static void scheduleJob() {           
        //The following command schedules this job to run every day at midnight.
        BatchApex_Job_Scheduler scheduler = new BatchApex_Job_Scheduler(new getRatingsBatch(), 200);
        if (isApexTest)System.schedule('getRatingsBatch', '0 0 0/1 1/1 * ? *', scheduler);
    }
}