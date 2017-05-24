<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Check_Sent_to_GP</fullName>
        <field>Sent_to_Great_Plains__c</field>
        <literalValue>1</literalValue>
        <name>Check Sent to GP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deposit_Name_Update</fullName>
        <field>Name</field>
        <formula>TEXT(Deposit_Date__c) &amp; &quot; &quot; &amp; TEXT(Payment_Method__c)</formula>
        <name>Deposit.Name Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Deposit%2EName - Standardize</fullName>
        <actions>
            <name>Deposit_Name_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Deposit__c.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>1/1/2014</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Deposit%2ESent to GP - Check refunds never go to GP</fullName>
        <actions>
            <name>Check_Sent_to_GP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Deposit__c.Payment_Method__c</field>
            <operation>equals</operation>
            <value>Check/Cash Refund</value>
        </criteriaItems>
        <description>Check refunds never go to Great Plains via our integration file. We create the Refund to account for the change in the Remaining Balance on the Opportunity, and then the accountant makes the changes in Great Plains when they write the check.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
