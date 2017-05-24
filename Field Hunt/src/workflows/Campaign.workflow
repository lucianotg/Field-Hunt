<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Campaign_End_Date_Copy_Date_Time</fullName>
        <description>Copy the DateValue of the End Date and Time.</description>
        <field>EndDate</field>
        <formula>DATEVALUE(gf_sf__End_Date_and_Time__c)</formula>
        <name>Campaign.End Date - Copy Date/Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Campaign_Start_Date_Copy_Date_Time</fullName>
        <description>Copy DateValue of Start Date and Time.</description>
        <field>StartDate</field>
        <formula>DATEVALUE(gf_sf__Start_Date_and_Time__c)</formula>
        <name>Campaign.Start Date - Copy Date/Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Campaign%2EStart %26 End Date - copy from Start%2FEnd Date and Time for Events</fullName>
        <actions>
            <name>Campaign_End_Date_Copy_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Campaign_Start_Date_Copy_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.RecordTypeId</field>
            <operation>equals</operation>
            <value>Events and Meetings</value>
        </criteriaItems>
        <description>If the Campaign is of type &quot;Event&quot;, copy the date values from Start Date and Time &amp; End Date and Time, and copy them to the Start Date and End Date fields.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
