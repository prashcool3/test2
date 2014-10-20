global class BatchApex_Job_Scheduler implements Schedulable { 
    private Database.Batchable<SObject> batchApexObject;
    private Integer batchSize;
    public static Boolean isTest = false;
    
    //Public constructor used to pass the batch apex object which is later used to invoke.
    public BatchApex_Job_Scheduler(Database.Batchable<SObject> batchApexObject, Integer batchSize) {
        this.batchApexObject = batchApexObject;
        this.batchSize = batchSize;
    }
    
    //Private constructor is used to avoid creating instance of this class without passing 
    //any value for the batchApexObject variable
    private BatchApex_Job_Scheduler() {
        //do nothing
    }
     
    //Execute method which contains the logic to invoke the batch apex code based on the batchApexObject variable.
    global void execute(SchedulableContext sc) {
        Database.executebatch(batchApexObject, batchSize);
    }     
}