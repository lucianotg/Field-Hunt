<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Account_field_for_Funder_Type</fullName>
        <field>Funder_Category__c</field>
        <literalValue>Individual</literalValue>
        <name>Update Account field for Funder Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Individual Member - Update Account</fullName>
        <actions>
            <name>Update_Account_field_for_Funder_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.npe01__Member_Level__c</field>
            <operation>equals</operation>
            <value>Individual</value>
        </criteriaItems>
        <description>This workflow updates the account record for an individual member to make the Funder Category equal Individual.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
