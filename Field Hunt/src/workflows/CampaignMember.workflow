<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CampaignMember_Status_Attended</fullName>
        <description>Change the Campaign Member Status to Attended</description>
        <field>Status</field>
        <literalValue>Attended</literalValue>
        <name>CampaignMember Status.Attended</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Change_Complete_to_RSVP_d_Yes</fullName>
        <description>This update changes the campaign member&apos;s status from &quot;Complete&quot; (passed by Drupal) to the Salesforce value of &quot;RSVP&apos;d Yes&quot;</description>
        <field>Status</field>
        <literalValue>RSVP&apos;d-Yes</literalValue>
        <name>Change Complete to RSVP&apos;d Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Check_the_paid_box</fullName>
        <field>gf_sf__Paid__c</field>
        <literalValue>Yes</literalValue>
        <name>Check the paid box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CampaignMember Status%2EAuto-update to Attended</fullName>
        <active>true</active>
        <criteriaItems>
            <field>CampaignMember.Start_Date_From_Campaign__c</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>CampaignMember.Status</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <description>Four days after an event, auto-update anyone who shows &quot;Complete&quot; to &quot;Attended&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>CampaignMember_Status_Attended</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>CampaignMember.Start_Date_From_Campaign__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>gf_sf__Change Complete to RSVP%27d Yes</fullName>
        <actions>
            <name>gf_sf__Change_Complete_to_RSVP_d_Yes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CampaignMember.Status</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <description>This update changes the campaign member&apos;s status from &quot;Complete&quot; (passed by Drupal) to the Salesforce value of &quot;RSVP&apos;d Yes&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>gf_sf__Check the paid box</fullName>
        <actions>
            <name>gf_sf__Check_the_paid_box</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>This update checks the paid box when the campaign member is saved and the related opportunity is closed/won.</description>
        <formula>gf_sf__Opportunity__r.IsWon = true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
