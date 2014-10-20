global class AutoLogoutBatch implements Database.Batchable<sObject>,Database.AllowsCallouts  {
    public static boolean isApexTest = true;
    public List<User__c> userList = new List<User__c>();
    public List<User__c> uList = new List<User__c>();
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        String sql = 'select id,Login_Status__c from User__c limit 1';
        return Database.getQueryLocator(sql); 
    }
   
    global void execute(Database.BatchableContext BC, List<User__c> scope){
        
        userList = [select id,Login_Status__c,LastModifiedDate from User__c where Login_Status__c = True];
        if(userList != NULL && !userList.isEmpty()){
            for(User__c u : userList){
                if(u.LastModifiedDate.date()<datetime.now().date()){
                    u.Login_Status__c = false;
                    uList.add(u);
                }
                else{
                    Decimal d = u.LastModifiedDate.getTime()/60000;
                    Decimal d1 = datetime.now().getTime()/60000;
                    Integer mins  = math.round(d1-d);
                    if(mins >= 240){
                        u.Login_Status__c = false;
                        uList.add(u);
                    }
                }
            }
            if(uList != NULL && uList.size() > 0)
                update uList;
        }
    }
    
    global void finish(Database.BatchableContext BC){
        System.debug('Auto Logout is completed successfully.');
    }
    
    public static void scheduleJob() {           
        BatchApex_Job_Scheduler scheduler = new BatchApex_Job_Scheduler(new AutoLogoutBatch(), 200);
        if (isApexTest)System.schedule('AutoLogoutBatch', '0 0 0,4,8,12,16,20 ? * *', scheduler);
    }
}