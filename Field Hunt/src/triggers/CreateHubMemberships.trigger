trigger CreateHubMemberships on CollaborationGroupMember (after insert) {
    //Create instance of Update object
    UpdateHubMemberships uhm = new UpdateHubMemberships();   
    //Call method to insert Hub Memberships
    uhm.createHubMemberships(Trigger.new);
}