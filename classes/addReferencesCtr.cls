public class addReferencesCtr{
    public List<refWrapper> refwrapperList{get;set;}
    public List<Reference__c> rList{get;set;}
    public String gId{get;set;}
    public String uId{get;set;}
    public String delId{get;set;}
    public String deletingref{get;set;}
    public Grant_Writer__c g{get;set;}
    public boolean popupclose{get;set;}
    public Boolean noref{get;set;}
    public Integer index {get;set;}
    
    public addReferencesCtr(){
        noref=false;
        popupclose=true;
        gId= ApexPages.currentPage().getParameters().get('gwid'); 
        uid=ApexPages.currentPage().getParameters().get('uid');
        try{
              g=[select id, user__c from grant_writer__c where id=:gId];
              rList=[select id, first_name__c, User__c, grant_writer__c, last_name__c, profession__c, relationship__c, phone__c, email__c from reference__c where user__c=:g.user__c];
        }catch(Exception c){}
        
        refwrapperList = new List<refWrapper>();
        integer count =0;
        if(rList!=null){
            for(Reference__c r : rList){
                refwrapperList.add(new refWrapper(r,count)); 
                count++;
            }
        }
        else{
            refwrapperList.add(new refWrapper(new Reference__c(),count)); 
        }
    }
    
    public void add_rows() {
        refwrapperList.add(new refWrapper(new Reference__c(),refwrapperList.size()));
    }
     
    public PageReference deleteRef(){
        if(refwrapperList[index].ref.id <> NULL){
            Reference__c r=[Select id from reference__c where id=:refwrapperList[index].ref.id];
            delete r;
            refwrapperList.remove(index);
        }
        else if(refwrapperList[index].ref.id == null){
            if(refwrapperList.size()>0){
                refwrapperList.remove(index);
            }
       }
       for(integer i = index ; i < refwrapperList.size(); i++)
           refwrapperList[i].counter = i;
       return null;
    }
    
    
  public PageReference save_close(){
      List<Reference__c> refList = new List<Reference__c>();   
      for(refwrapper rwrap : refwrapperList){
          Reference__c r = rwrap.ref;
          if(r.last_name__c!=null && r.email__c!=null && r.relationship__c!=null && r.phone__c!=null){
              if(r.User__c==null){
                  if(g!=null){
                      r.User__c=g.User__c;
                   }
                   else if(uid!=null){
                       r.User__c=uid;
                   }
              }
              if(r.grant_writer__c==null && g!=null){
                  r.grant_writer__c=g.id;
              }
              refList.add(r);
          }
      }
      upsert refList;
      popupclose=false;
      return null;
  }
  
  public class refWrapper{
        public Reference__c ref {get; set;}
        public Integer counter {get; set;}
        public refWrapper(Reference__c r,Integer con){
            ref = r;
            counter = con;
        }
    }
}