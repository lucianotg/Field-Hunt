<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_Complete_to_RSVP_d_Yes</fullName>
        <description>This update changes the campaign member&apos;s status from &quot;Complete&quot; (passed by Drupal) to the Salesforce value of &quot;RSVP&apos;d Yes&quot;</description>
        <field>Status</field>
        <literalValue>RSVP&apos;d-Yes</literalValue>
        <name>Change Complete to RSVP&apos;d Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_the_paid_box</fullName>
        <field>Paid__c</field>
        <literalValue>Yes</literalValue>
        <name>Check the paid box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change Complete to RSVP%27d Yes</fullName>
        <actions>
            <name>Change_Complete_to_RSVP_d_Yes</name>
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
        <fullName>Check the paid box</fullName>
        <actions>
            <name>Check_the_paid_box</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>This update checks the paid box when the campaign member is saved and the related opportunity is closed/won.</description>
        <formula>Opportunity__r.IsWon = true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
