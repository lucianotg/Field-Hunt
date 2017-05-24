<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Capitalize_Country_Value_for_US_and_CA</fullName>
        <field>MailingCountry</field>
        <formula>Case( MailingCountry,
&quot;us&quot;, &quot;US&quot;,
&quot;Us&quot;, &quot;US&quot;,
&quot;ca&quot;, &quot;CA&quot;,
&quot;Ca&quot;, &quot;CA&quot;,
MailingCountry
)</formula>
        <name>Capitalize Country Value for US and CA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Account_Member_status_by_default</fullName>
        <field>Account_Membership_Status__c</field>
        <formula>text(Account.Membership_Status__c)</formula>
        <name>Set Account Member status by default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Account_Membership_Level_by_default</fullName>
        <field>Account_Last_Membership_Level__c</field>
        <formula>Account.npo02__LastMembershipLevel__c</formula>
        <name>Set Account Membership Level by default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Capitalize Country Value for US and CA</fullName>
        <actions>
            <name>Capitalize_Country_Value_for_US_and_CA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( MailingCountry = &quot;us&quot;, MailingCountry = &quot;Us&quot;, MailingCountry = &quot;ca&quot;, MailingCountry = &quot;Ca&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Account Member fields by default</fullName>
        <actions>
            <name>Set_Account_Member_status_by_default</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Account_Membership_Level_by_default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>1=1</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
