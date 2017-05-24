@isTest(SeeAllData = true)
public class HubMembershipTest {

    static testMethod void newHubMemberTest() {
    test.startTest();
        //Create a new CollaborationGroupMember instance
        CollaborationGroupMember cgm = new CollaborationGroupMember();
        
        //Fill with data
        cgm.CollaborationGroupID = [SELECT Id
                                    FROM CollaborationGroup
                                    WHERE Name = 'Test Group' LIMIT 1].Id;
        cgm.MemberID = [SELECT Id
                        FROM User
                        WHERE Username = 'luciano22@gmail.com' LIMIT 1].Id;
        
        //Insert the list       
        insert(cgm);
        
        //Pull a Hub Membership and make sure it matches
        String newID;
        
        newID = [SELECT Id 
                FROM Hub_Membership__c 
                WHERE Hub_User__c = :cgm.MemberID AND Hub_Group_ID__c = :cgm.CollaborationGroupID].Id;
        
        System.assert(string.isnotblank(newID));
        
        cgm = [SELECT Id, CollaborationGroupID, MemberID
            FROM CollaborationGroupMember
            WHERE CollaborationGroupID = :cgm.CollaborationGroupID AND MemberID = :cgm.MemberID];
        
        delete(cgm);
        
        Hub_Membership__c  hm = new Hub_Membership__c();
        
        hm = [SELECT Id, IsDeleted
            FROM Hub_Membership__c
            WHERE Hub_User__c = :cgm.MemberID AND Hub_Group_ID__c = :cgm.CollaborationGroupID LIMIT 1 ALL ROWS];
        
        System.assertEquals(hm.IsDeleted, true);
        
        test.stopTest();
     }    
     
}