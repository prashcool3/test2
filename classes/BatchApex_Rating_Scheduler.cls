global class BatchApex_Rating_Scheduler implements Schedulable { 
    private Database.Batchable<SObject> batchApexObject;
    public static Boolean isTest = false;
    public static String sched = '0 00 00 * * ?';  //Every Day at Midnight 

    private BatchApex_Rating_Scheduler() {
    }
     
    global static String scheduleMe() {
        BatchApex_Rating_Scheduler SC = new BatchApex_Rating_Scheduler(); 
        return System.schedule('My batch Job', sched, SC);
    }

    global void execute(SchedulableContext sc) {

        getRatingsBatch b1 = new getRatingsBatch();
        ID batchprocessid = Database.executeBatch(b1,50);           
    }  
}