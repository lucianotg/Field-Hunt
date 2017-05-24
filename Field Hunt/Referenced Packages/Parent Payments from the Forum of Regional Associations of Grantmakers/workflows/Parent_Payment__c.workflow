<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Parent_Payment_Name</fullName>
        <field>Name</field>
        <formula>LEFT(
Account__r.Name &amp;&quot;-Parent Payment-&quot;&amp; Text(Payment_Date__c )
, 80)</formula>
        <name>Set Parent Payment Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Parent Payment Name</fullName>
        <actions>
            <name>Set_Parent_Payment_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Parent_Payment__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
