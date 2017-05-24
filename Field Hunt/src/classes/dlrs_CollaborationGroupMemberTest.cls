/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_CollaborationGroupMemberTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_CollaborationGroupMemberTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new CollaborationGroupMember());
    }
}