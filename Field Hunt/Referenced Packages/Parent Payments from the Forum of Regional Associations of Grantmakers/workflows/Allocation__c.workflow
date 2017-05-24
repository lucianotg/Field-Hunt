<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Allocation_Check_Reference</fullName>
        <field>Check_Reference_Number__c</field>
        <formula>Parent_Payment__r.Check_Reference_Number__c</formula>
        <name>Set Allocation Check Reference #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Allocation_Method</fullName>
        <field>Method__c</field>
        <formula>TEXT(Parent_Payment__r.Payment_Method__c )</formula>
        <name>Set Allocation Method</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Allocation Check Reference %23</fullName>
        <actions>
            <name>Set_Allocation_Check_Reference</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Allocation__c.Check_Reference_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Allocation Method</fullName>
        <actions>
            <name>Set_Allocation_Method</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Allocation__c.Method__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
