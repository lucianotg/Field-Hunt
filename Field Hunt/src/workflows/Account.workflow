<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Last_Memb_Level_Subsidiary</fullName>
        <description>Change &quot;Last Membership Level&quot; to &quot;Subsidiary&quot;.</description>
        <field>npo02__LastMembershipLevel__c</field>
        <formula>&quot;Subsidiary&quot;</formula>
        <name>Account. Last Memb Level - Subsidiary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Capitalize_Country_Value_for_US_and_CA</fullName>
        <field>BillingCountry</field>
        <formula>Case( BillingCountry, 
&quot;us&quot;, &quot;US&quot;, 
&quot;Us&quot;, &quot;US&quot;, 
&quot;ca&quot;, &quot;CA&quot;, 
&quot;Ca&quot;, &quot;CA&quot;, 
BillingCountry 
)</formula>
        <name>Capitalize Country Value for US and CA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Set_Sort_Name_by_Default</fullName>
        <description>This field update is used to set the Sort Name if a value has not already been entered.</description>
        <field>gf_sf__Sort_Name__c</field>
        <formula>IF(BEGINS(Name,&quot;The &quot;),MID(Name,4,LEN(Name)-3),Name)</formula>
        <name>Set Sort Name by Default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>gf_sf__Capitalize Country Value for US and CA</fullName>
        <actions>
            <name>gf_sf__Capitalize_Country_Value_for_US_and_CA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(  BillingCountry = &quot;us&quot;,  BillingCountry = &quot;Us&quot;,  BillingCountry = &quot;ca&quot;,  BillingCountry = &quot;Ca&quot;  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>gf_sf__Set Sort Name by Default</fullName>
        <actions>
            <name>gf_sf__Set_Sort_Name_by_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.gf_sf__Sort_Name__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>This workflow runs to set the Sort Name field on the Account if it has not been set already.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
