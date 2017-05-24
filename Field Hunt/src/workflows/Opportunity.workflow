<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>npsp__Opportunity_Email_Acknowledgment</fullName>
        <description>Opportunity Email Acknowledgment</description>
        <protected>false</protected>
        <recipients>
            <field>npsp__Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>npsp__NPSP_Email_Templates/npsp__NPSP_Opportunity_Acknowledgment</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Stage_Pledged_to_Bill_Me_Now</fullName>
        <field>StageName</field>
        <literalValue>Bill Me Now</literalValue>
        <name>Change Stage - Pledged to Bill Me Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Stage_Posted_to_Paid</fullName>
        <field>StageName</field>
        <literalValue>Paid</literalValue>
        <name>Change Stage - Posted to Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Stage_to_Bill_Me_Now</fullName>
        <description>On the Bill Me Later date, change to Bill Me Now.</description>
        <field>StageName</field>
        <literalValue>Bill Me Now</literalValue>
        <name>Change Stage to Bill Me Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Reminder_Letter_Sent</fullName>
        <field>x2nd_Renewal_Letter_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Check Reminder Letter Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Renewal_Letter_Sent</fullName>
        <field>X1st_Renewal_Letter_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Check Renewal Letter Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Name_Standardize</fullName>
        <field>Name</field>
        <formula>Invoice_Number__c &amp; 
&quot; - &quot;&amp;  LEFT(Account.Name,40) &amp; 
&quot; - &quot; &amp; IF(RecordTypeId = &quot;012j0000000z3Rt&quot;,  Membership_Year__c &amp; &quot; &quot; &amp; Opportunity_Record_Type_Name_Short__c, Opportunity_Record_Type_Name_Short__c) &amp;
IF( RecordTypeId = &quot;012j0000000z3Rr&quot;, &quot; - &quot; &amp; LEFT(Campaign.gf_sf__Event_Title__c,40), &quot;&quot;) &amp;
&quot; - &quot; &amp; TEXT(CloseDate)</formula>
        <name>Opportunity.Name Standardize</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Invoice_Date</fullName>
        <description>Check the Record Type and, if necessary, the Stage. Set Invoice Date based on those criteria.</description>
        <field>Invoice_Date__c</field>
        <formula>IF (NOT(ISBLANK( Bill_Me_Later_Date__c )), 
Bill_Me_Later_Date__c,
CloseDate 
)</formula>
        <name>Set Invoice Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Name_Grants_and_Donations</fullName>
        <field>Name</field>
        <formula>Invoice_Number__c &amp; 
&quot; - Grant&quot; &amp; 
IF (ISBLANK( Account.Name), 
  IF(ISBLANK( gf_sf__Product_Sale_Contact__c ),
  &quot;&quot;,
  &quot; - &quot; &amp;  Invoice_Contact__c ) 
,
&quot; - &quot; &amp; Account.Name) &amp;
IF (ISBLANK( Invoice_Date__c ) , &quot;&quot; , &quot; - &quot; &amp; TEXT(Invoice_Date__c))</formula>
        <name>Set Name - Grants and Donations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Opportunity_Amount</fullName>
        <description>Sets Opportunity Amount with Invoiced Amount for Membership Opportunity records</description>
        <field>Amount</field>
        <formula>Projected_Amount__c</formula>
        <name>Set Opportunity Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Opportunity_Name_Product_Sale</fullName>
        <field>Name</field>
        <formula>Invoice_Number__c &amp; &quot; - &quot; &amp;  TEXT(Type)  &amp; &quot; - &quot; &amp;  Account.Name &amp; IF (ISBLANK( Invoice_Date__c ) , &quot;&quot; , &quot; - &quot; &amp; TEXT(Invoice_Date__c) )</formula>
        <name>Set Opportunity Name Product Sale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Opportunity_Type_to_Job_Posting</fullName>
        <field>Type</field>
        <literalValue>Job Posting</literalValue>
        <name>Set Opportunity Type to Job Posting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Product_Sales_to_Paid</fullName>
        <description>All product sales must be paid for before they are done with the website. This sets the stage accordingly, which prevents invoices from going out, etc.</description>
        <field>StageName</field>
        <literalValue>Invoiced</literalValue>
        <name>Set Product Sales to Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Stage_to_Paid</fullName>
        <field>StageName</field>
        <literalValue>Paid</literalValue>
        <name>Set Stage to Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Closed_Date_to_Invoiced_Date</fullName>
        <description>Copies the Invoiced Date to Closed Date is there is an Invoiced Date.</description>
        <field>CloseDate</field>
        <formula>IF(ISBLANK( Invoice_Date__c ), CloseDate , Invoice_Date__c)</formula>
        <name>Update Closed Date to Invoiced Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Update_Account_field_for_Funder_Type</fullName>
        <field>gf_sf__Funder_Category__c</field>
        <literalValue>Individual</literalValue>
        <name>Update Account field for Funder Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npsp__Opportunity_AcknowledgmentStatus_Update</fullName>
        <description>Sets the Acknowledgment Status to &quot;Acknowledged&quot;</description>
        <field>npsp__Acknowledgment_Status__c</field>
        <literalValue>Acknowledged</literalValue>
        <name>Opportunity Acknowledgment Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npsp__Opportunity_Acknowledgment_Date_Update</fullName>
        <description>sets the Acknowledgment Date to Today.</description>
        <field>npsp__Acknowledgment_Date__c</field>
        <formula>Today()</formula>
        <name>Opportunity Acknowledgment Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npsp__Opportunity_Copy_FMV_to_Amount</fullName>
        <description>Copy the Opportunities Fair Market Value field to the Amount field.</description>
        <field>Amount</field>
        <formula>npsp__Fair_Market_Value__c</formula>
        <name>Opportunity Copy FMV to Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Amount Field Update</fullName>
        <actions>
            <name>Set_Opportunity_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Membership Detail</value>
        </criteriaItems>
        <description>Sets Opportunity Amount with Invoiced Amount for Membership Opportunity records</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EInvoice Date</fullName>
        <actions>
            <name>Set_Invoice_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets the Invoice Date on the Opportunity. There should be no Invoice Date if the Opportunity is not Closed/Won. Invoice should = Bill Me Later Date (if there is one) or Close Date. Once set, the date should not change automatically.</description>
        <formula>ISBLANK(Invoice_Date__c) &amp;&amp;  IsClosed = TRUE &amp;&amp;  IsWon = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EName - Standardize</fullName>
        <actions>
            <name>Opportunity_Name_Standardize</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Standardizes the name of all opportunities. The Opportunity Name is used for the comment field in Great Plains.</description>
        <formula>1=1</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EPaid - Check when Remaining Balance is 0</fullName>
        <actions>
            <name>Set_Stage_to_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.npe01__Amount_Outstanding__c</field>
            <operation>lessOrEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Paid,Declined</value>
        </criteriaItems>
        <description>Change Opportunities to Paid when the Remaining Balance is 0. Ignores Declined opportunities. To prevent Opportunities from being set to Paid when created, only runs if the Opportunity was not created today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2ERenewal Sent - Check if Closed</fullName>
        <actions>
            <name>Check_Reminder_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Check_Renewal_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Membership Detail</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If Membership Renewals have been Closed, then members do not need renewal or reminder letters, so check those boxes.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EStage - Opps from Website as Pledged</fullName>
        <actions>
            <name>Change_Stage_Pledged_to_Bill_Me_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Username</field>
            <operation>equals</operation>
            <value>info@mcf.org</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pledged</value>
        </criteriaItems>
        <description>This changes the stage for opportunities coming from the website (Pledged -&gt; Bill Me Now).</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EStage - Opps from Website as Posted</fullName>
        <actions>
            <name>Change_Stage_Posted_to_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Username</field>
            <operation>equals</operation>
            <value>info@mcf.org</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Posted</value>
        </criteriaItems>
        <description>This changes the stage for opportunities coming from the website (Posted -&gt; Paid).</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%2EStage Change to Bill Me Now</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Bill Me Later</value>
        </criteriaItems>
        <description>When we arrive at the Bill Me Later date, change the stage of the Opportunity to Bill Me Now.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Change_Stage_to_Bill_Me_Now</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Opportunity.Bill_Me_Later_Date__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity%2EType - Product Sales from Website %3D Job Posting</fullName>
        <actions>
            <name>Set_Opportunity_Type_to_Job_Posting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Username</field>
            <operation>equals</operation>
            <value>info@mcf.org</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Opp_Record_Type_ID__c</field>
            <operation>equals</operation>
            <value>012j0000000z3RuAAI</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>It the Opportunity was created by the API User, and it is a Product Sale, and the Type is blank, then select Type &quot;Job Posting&quot;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>gf_sf__Individual Member - Update Account</fullName>
        <actions>
            <name>gf_sf__Update_Account_field_for_Funder_Type</name>
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
    <rules>
        <fullName>npsp__Opportunity Copy FMV to Amount</fullName>
        <actions>
            <name>npsp__Opportunity_Copy_FMV_to_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.npsp__Fair_Market_Value__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <description>Enable this rule if you would like the Fair Market Value copied to the Amount, if the Amount is zero or is blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>npsp__Opportunity Email Acknowledgment</fullName>
        <actions>
            <name>npsp__Opportunity_Email_Acknowledgment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>npsp__Opportunity_AcknowledgmentStatus_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>npsp__Opportunity_Acknowledgment_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Emails an acknowledgment to the Primary Contact when Email Acknowledgment is set.</description>
        <formula>TEXT(npsp__Acknowledgment_Status__c) = $Label.npsp__sendAcknowledgmentFireStatus &amp;&amp;  npsp__Primary_Contact__r.Email &lt;&gt; NULL &amp;&amp;  npsp__Primary_Contact__r.npsp__Do_Not_Contact__c &lt;&gt; True &amp;&amp;  npsp__Primary_Contact__r.HasOptedOutOfEmail &lt;&gt; True &amp;&amp;  npsp__Primary_Contact__r.npsp__Deceased__c &lt;&gt; True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
