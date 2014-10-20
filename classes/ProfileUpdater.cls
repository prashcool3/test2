public class ProfileUpdater{
    
    public static integer profilepercentage(String obId){
        integer completness=0;
        integer completed=0;
        Department__c dep;
        
        Organization__c org = [Select id,name,Other_Name_Organisation_is_known_as__c,Annual_Budget_Size__c,of_employees_FTE__c,
                               Salutation__c,Title__c,Contact_Name__c,Phone__c,Tax_EIN__c,Phone_alternate__c,Federal_Tax_Exempt_Status__c,
                               Exempt_from_tax__c,Mailing_Street_Address__c,City__c,State__c,Zip_Postal_Code__c,Email__c,Website__c from 
                               Organization__c where id =: obId];
        try{
            dep = [Select name from Department__c where Organization__c=:obId LIMIT 1]; 
        }catch(Exception e){}
        if(org.name!=null){
            completness=completness+1;
        }
        if(org.Other_Name_Organisation_is_known_as__c!=null){
            completness=completness+1;
        }
        if(dep != null){
            completness=completness+1;
        }
        if(org.Annual_Budget_Size__c!=null){
            completness=completness+1;
        }
        if(org.of_employees_FTE__c!=null){
            completness=completness+1;
        }
        if(org.Salutation__c!=null){
            completness=completness+1;
        }
        if(org.Title__c!=null){
            completness=completness+1;
        }
        if(org.Contact_Name__c!=null){
            completness=completness+1;
        }
        if(org.Phone__c!=null){
            completness=completness+1;
        }
        if(org.Tax_EIN__c!=null){
            completness=completness+1;
        }
        if(org.Phone_alternate__c!=null){
            completness=completness+1;
        }
        if(org.Federal_Tax_Exempt_Status__c!=null){
            completness=completness+1;
        }
        if(org.Exempt_from_tax__c!=null){
            completness=completness+1;
        }
        if(org.Mailing_Street_Address__c!=null){
            completness=completness+1;
        }
        if(org.City__c!=null){
            completness=completness+1;
        }
        if(org.State__c!=null){
            completness=completness+1;
        }
        if(org.Zip_Postal_Code__c!=null){
            completness=completness+1;
        }
        if(org.Email__c!=null){
            completness=completness+1;
        }
        if(org.Website__c!=null){
            completness=completness+1;
        }
        
        return completness;
        
    }
    
    public static string fieldsremeaning(String obId){
        integer notcompleted = 0;
        String needToBeCompleted='To complete your profile, please fill';
        Department__c dep;

        Organization__c org = [Select id,name,Other_Name_Organisation_is_known_as__c,Annual_Budget_Size__c,of_employees_FTE__c,
                               Salutation__c,Title__c,Contact_Name__c,Phone__c,Tax_EIN__c,Phone_alternate__c,Federal_Tax_Exempt_Status__c,
                               Exempt_from_tax__c,Mailing_Street_Address__c,City__c,State__c,Zip_Postal_Code__c,Email__c,Website__c from 
                               Organization__c where id =: obId];
        try{
            dep = [Select name from Department__c where Organization__c=:obId LIMIT 1];
        }catch(Exception e){}
        if(org.name==null){
            needToBeCompleted=needToBeCompleted + ' Organization Name,';
            notcompleted=notcompleted+1;
        }
        if(org.Other_Name_Organisation_is_known_as__c==null){
            needToBeCompleted=needToBeCompleted + ' Other Name Organisation is known as,';
            notcompleted=notcompleted+1;
        }
        if(dep==null){
            needToBeCompleted=needToBeCompleted + ' Departments,';
            notcompleted=notcompleted+1;
        }
        if(org.Annual_Budget_Size__c==null){
            needToBeCompleted=needToBeCompleted + ' Annual Budget Size,';                    
            notcompleted=notcompleted+1;
        }
        if(org.of_employees_FTE__c==null){
            needToBeCompleted=needToBeCompleted + ' No. of employees,';
            notcompleted=notcompleted+1;
        }
        if(org.Salutation__c==null){
            needToBeCompleted=needToBeCompleted + ' Salutation,';
            notcompleted=notcompleted+1;
        }
       
        if(org.Title__c==null){
            needToBeCompleted=needToBeCompleted + ' Title,';
            notcompleted=notcompleted+1;
        }
        if(org.Contact_Name__c==null){
            needToBeCompleted=needToBeCompleted + ' Contact Name,';
            notcompleted=notcompleted+1;
        }
       
        if(org.Phone__c==null){
            needToBeCompleted=needToBeCompleted + ' Phone,';
            notcompleted=notcompleted+1;
        }
        if(org.Tax_EIN__c==null){
            needToBeCompleted=needToBeCompleted + ' Federal EIN/ Tax#,';
            notcompleted=notcompleted+1;
        }
        if(org.Phone_alternate__c==null){
            needToBeCompleted=needToBeCompleted + ' Phone Alternate,';
            notcompleted=notcompleted+1;
        }
        if(org.Federal_Tax_Exempt_Status__c==null){
            needToBeCompleted=needToBeCompleted + ' Federal_Tax_Exempt_Status,';
            notcompleted=notcompleted+1;
        }
        if(org.Exempt_from_tax__c==null){
            needToBeCompleted=needToBeCompleted + ' Exempt from tax,';
            notcompleted=notcompleted+1;
        }
        if(org.Mailing_Street_Address__c==null){
           needToBeCompleted=needToBeCompleted + ' Mailing Street Address,';
           notcompleted=notcompleted+1;
        }
        if(org.City__c==null){
           needToBeCompleted=needToBeCompleted + ' City,';
           notcompleted=notcompleted+1;
        }
        if(org.State__c==null){
           needToBeCompleted=needToBeCompleted + ' State,';
           notcompleted=notcompleted+1;
        }
        if(org.Zip_Postal_Code__c==null){
           needToBeCompleted=needToBeCompleted + ' Zip postal code,';
           notcompleted=notcompleted+1;
        }
        if(org.Email__c==null){
           needToBeCompleted=needToBeCompleted + ' Email';
           notcompleted=notcompleted+1;
        }
        if(org.Website__c==null){
           needToBeCompleted=needToBeCompleted + ' Website';
           notcompleted=notcompleted+1;
        }
        if(notcompleted==0){
            needToBeCompleted='Profile is completed';
        }
        return needToBeCompleted;
    }
}