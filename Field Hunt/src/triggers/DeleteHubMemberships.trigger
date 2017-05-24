trigger DeleteHubMemberships on CollaborationGroupMember (before delete) {
    //Create instance of Update object
    UpdateHubMemberships uhm = new UpdateHubMemberships();   
    //Call method to delete Hub Memberships
    uhm.deleteHubMemberships(Trigger.old);
}