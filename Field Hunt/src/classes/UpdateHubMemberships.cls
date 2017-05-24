public with sharing class UpdateHubMemberships {

    //Method to create Hub Memberships on Insert
    public void createHubMemberships (List<collaborationGroupMember> membersFromTrigger){
        //Instantiate a list to hold the Hub Memberships to add
        List<Hub_Membership__c> hmAddList = new List<Hub_Membership__c>();
        
        //Loop through the list from the trigger and add Hub Memberships
        for(collaborationGroupMember cgm:membersFromTrigger){
            //Create string. Populate with ContactID from current group member (cgm).
            String conID = [SELECT ContactId FROM User WHERE Id = :cgm.MemberID].ContactID;
            
            //If there is a Contact ID (Customer User), create the Hub Membership
            If (string.isNotBlank(conID)) {          
                //Instantiate a new Hub Membership (hm)
                Hub_Membership__c hm = new Hub_Membership__c();
                
                //Add attributes to each Hub Membership (hm)
                hm.Hub_Contact__c = conID;
                hm.Hub_Group_Link__c = 'https://mcf.force.com/s/group/' + cgm.CollaborationGroupId;
                hm.Hub_Group_Name__c = [SELECT Name FROM CollaborationGroup 
                                        WHERE Id = :cgm.CollaborationGroupId 
                                        LIMIT 1].Name;
                hm.Hub_Group_ID__c = cgm.CollaborationGroupId;
                hm.Hub_User__c = cgm.MemberID;
                
                //Add to List
                hmAddList.add(hm);
            }
        }
        //If there are Hub Memberships to add, insert.
        if (!hmAddList.IsEmpty()) {
            insert(hmAddList);
        }
    }

    //Method to remove Hub Memberships on Delete
        public void deleteHubMemberships (List<collaborationGroupMember> membersFromTrigger){
        //Instantiate a list to hold the Hub Memberships to delete
        List<Hub_Membership__c> hmDeleteList = new List<Hub_Membership__c>();
        
        //Loop through the list from the trigger and add Hub Memberships
            for(collaborationGroupMember cgm:membersFromTrigger){
                //Instantiate a new Hub Membership
                List<Hub_Membership__c> hm = new List<Hub_Membership__c>();
                
                //Add Ids to delete list
                hm = [SELECT Id 
                FROM Hub_Membership__c 
                WHERE Hub_User__c = :cgm.MemberID AND Hub_Group_ID__c = :cgm.CollaborationGroupId];
                
                //Add to list
                hmDeleteList.addall(hm);
            }
         //If there are Hub Memberships to delete, remove them.
         if (!hmDeleteList.IsEmpty()) {
         delete(hmDeleteList);
         }
        }


}