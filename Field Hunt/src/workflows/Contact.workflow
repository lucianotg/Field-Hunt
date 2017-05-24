<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>MGO_Send_First_Reminder_Email</fullName>
        <ccEmails>info@mcf.org</ccEmails>
        <description>MGO Send First Reminder Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@mcf.org</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/MGO_Reminder_Email</template>
    </alerts>
    <alerts>
        <fullName>MGO_Send_Second_Reminder_Email</fullName>
        <ccEmails>info@mcf.org</ccEmails>
        <description>MGO Send Second Reminder Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@mcf.org</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/MGO_Reminder_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Check_Giving_Forum_checkbox</fullName>
        <field>Giving_Forum__c</field>
        <literalValue>1</literalValue>
        <name>Check Giving Forum checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_MCF_Notes_checkbox</fullName>
        <field>MCF_Notes__c</field>
        <literalValue>1</literalValue>
        <name>Check MCF Notes checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Capitalize_Country_Value_for_US_and_CA</fullName>
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
        <fullName>gf_sf__Set_Account_Member_status_by_default</fullName>
        <field>gf_sf__Account_Membership_Status__c</field>
        <formula>text(Account.gf_sf__Membership_Status__c)</formula>
        <name>Set Account Member status by default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>gf_sf__Set_Account_Membership_Level_by_default</fullName>
        <field>gf_sf__Account_Last_Membership_Level__c</field>
        <formula>Account.npo02__LastMembershipLevel__c</formula>
        <name>Set Account Membership Level by default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactAlternateEmailUpdate</fullName>
        <field>npe01__AlternateEmail__c</field>
        <formula>Email</formula>
        <name>Contact.AlternateEmail.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactHomePhoneUpdate</fullName>
        <field>HomePhone</field>
        <formula>Phone</formula>
        <name>Contact.HomePhone.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactMobilePhoneUpdate</fullName>
        <field>MobilePhone</field>
        <formula>Phone</formula>
        <name>Contact.MobilePhone.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactOtherEmailUpdate</fullName>
        <field>OtherPhone</field>
        <formula>Phone</formula>
        <name>Contact.OtherEmail.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactPersonalEmailUpdate</fullName>
        <field>npe01__HomeEmail__c</field>
        <formula>Email</formula>
        <name>Contact.PersonalEmail.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactPreferredEmail</fullName>
        <field>Email</field>
        <formula>CASE( 
npe01__Preferred_Email__c , 

&quot;Work&quot;, 
if(len(npe01__WorkEmail__c)&gt;0, npe01__WorkEmail__c, 
if(len(npe01__HomeEmail__c)&gt;0, npe01__HomeEmail__c, 
npe01__AlternateEmail__c)), 

&quot;Personal&quot;, 
if(len(npe01__HomeEmail__c)&gt;0, npe01__HomeEmail__c, 
if(len(npe01__WorkEmail__c)&gt;0, npe01__WorkEmail__c, 
npe01__AlternateEmail__c)), 

&quot;Home&quot;, 
if(len(npe01__HomeEmail__c)&gt;0, npe01__HomeEmail__c, 
if(len(npe01__WorkEmail__c)&gt;0, npe01__WorkEmail__c, 
npe01__AlternateEmail__c)), 

&quot;Alternate&quot;, 
if(len(npe01__AlternateEmail__c)&gt;0, npe01__AlternateEmail__c, 
if(len(npe01__WorkEmail__c)&gt;0, npe01__WorkEmail__c, 
npe01__HomeEmail__c)), 

If(LEN(npe01__WorkEmail__c)&gt;0 , npe01__WorkEmail__c , 
if(LEN( npe01__HomeEmail__c)&gt;0, npe01__HomeEmail__c, 
npe01__AlternateEmail__c 
)))</formula>
        <name>Contact.PreferredEmail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactPreferredPhone</fullName>
        <description>Populates the standard Phone field displayed on activities based on the Preferred Phone field value.</description>
        <field>Phone</field>
        <formula>CASE(
  npe01__PreferredPhone__c ,
&quot;Work&quot;,
  npe01__WorkPhone__c  ,
&quot;Home&quot;,
 HomePhone,
&quot;Mobile&quot;,
 MobilePhone,
&quot;Other&quot;,
 OtherPhone,
If(LEN( npe01__WorkPhone__c )&gt;0 , npe01__WorkPhone__c  ,
if(LEN(  HomePhone)&gt;0,  HomePhone,
if(LEN( MobilePhone)&gt;0, MobilePhone,
OtherPhone
))))</formula>
        <name>Contact.PreferredPhone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactWorkEmailUpdate</fullName>
        <field>npe01__WorkEmail__c</field>
        <formula>Email</formula>
        <name>Contact.WorkEmail.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__ContactWorkPhoneUpdate</fullName>
        <field>npe01__WorkPhone__c</field>
        <formula>Phone</formula>
        <name>Contact.WorkPhone.Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__PreferredPhonetoWork</fullName>
        <field>npe01__PreferredPhone__c</field>
        <literalValue>Work</literalValue>
        <name>Preferred Phone to Work</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__SetPrefEmailtoWork</fullName>
        <field>npe01__Preferred_Email__c</field>
        <literalValue>Work</literalValue>
        <name>Set Pref Email to Work</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__SetWorkEmailtoEmail</fullName>
        <field>npe01__WorkEmail__c</field>
        <formula>Email</formula>
        <name>Set Work Email to Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npe01__WorkPhonetoPhone</fullName>
        <field>npe01__WorkPhone__c</field>
        <formula>Phone</formula>
        <name>Work Phone to Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>npo02__ContactPreferredPhone_WithHousehold</fullName>
        <description>FOR USE WITH HOUSEHOLDS. Populates the standard Phone field displayed on activities based on the Preferred Phone field value.</description>
        <field>Phone</field>
        <formula>CASE( 
npe01__PreferredPhone__c , 
&quot;Work&quot;, 
npe01__WorkPhone__c , 
&quot;Household&quot;,
 npo02__Formula_HouseholdPhone__c ,
&quot;Home&quot;, 
HomePhone, 
&quot;Personal&quot;,
HomePhone,
&quot;Mobile&quot;, 
MobilePhone, 
&quot;Other&quot;, 
OtherPhone, 
If(LEN( npe01__WorkPhone__c )&gt;0 , npe01__WorkPhone__c , 
if(LEN( HomePhone)&gt;0, HomePhone, 
if(LEN( MobilePhone)&gt;0, MobilePhone, 
OtherPhone 
))))</formula>
        <name>Contact.PreferredPhone_WithHousehold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Contact%2EGiving Forum and MCF Notes auto-check - MEMBER contacts</fullName>
        <actions>
            <name>Check_Giving_Forum_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Check_MCF_Notes_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.gf_sf__Account_Membership_Status__c</field>
            <operation>equals</operation>
            <value>Current</value>
        </criteriaItems>
        <description>Always check Giving Forum and MCF Notes on new member contacts.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Contact%2EGiving Forum for NON-MEMBER contacts</fullName>
        <actions>
            <name>Check_Giving_Forum_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.gf_sf__Account_Membership_Status__c</field>
            <operation>notEqual</operation>
            <value>Current</value>
        </criteriaItems>
        <description>Checks the Giving Forum checkbox whenever a non-member contact is added.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>MGO Send First Reminder Email</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.MGO_Membership_Status__c</field>
            <operation>equals</operation>
            <value>MGO-Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MGO_Membership_End_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>NEXT 45 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.gf_sf__Account_Membership_Status__c</field>
            <operation>notEqual</operation>
            <value>Current</value>
        </criteriaItems>
        <description>Send the first reminder email 6 weeks before expiration.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>MGO_Send_First_Reminder_Email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Contact.MGO_Membership_End_Date__c</offsetFromField>
            <timeLength>-45</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>MGO Send Second Reminder Email</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.MGO_Membership_Status__c</field>
            <operation>equals</operation>
            <value>MGO-Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MGO_Membership_End_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>NEXT 21 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.gf_sf__Account_Membership_Status__c</field>
            <operation>notEqual</operation>
            <value>Current</value>
        </criteriaItems>
        <description>Send the second reminder email 3 weeks before expiration.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>MGO_Send_Second_Reminder_Email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Contact.MGO_Membership_End_Date__c</offsetFromField>
            <timeLength>-21</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>gf_sf__Capitalize Country Value for US and CA</fullName>
        <actions>
            <name>gf_sf__Capitalize_Country_Value_for_US_and_CA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( MailingCountry = &quot;us&quot;, MailingCountry = &quot;Us&quot;, MailingCountry = &quot;ca&quot;, MailingCountry = &quot;Ca&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>gf_sf__Set Account Member fields by default</fullName>
        <actions>
            <name>gf_sf__Set_Account_Member_status_by_default</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>gf_sf__Set_Account_Membership_Level_by_default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>1=1</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EEmailChanged_Alternate</fullName>
        <actions>
            <name>npe01__ContactAlternateEmailUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__Preferred_Email__c ,&quot;Alternate&quot;),      OR(           AND(                ISNEW(),                LEN(Email)&gt;0           ),           ISCHANGED( Email )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EEmailChanged_Personal</fullName>
        <actions>
            <name>npe01__ContactPersonalEmailUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(     OR( ISPICKVAL( npe01__Preferred_Email__c ,&quot;Personal&quot;),ISPICKVAL( npe01__Preferred_Email__c ,&quot;Home&quot;)),      OR(           AND(                ISNEW(),                LEN(Email)&gt;0           ),           ISCHANGED( Email )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EEmailChanged_Work</fullName>
        <actions>
            <name>npe01__ContactWorkEmailUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__Preferred_Email__c ,&quot;Work&quot;),      OR(           AND(                ISNEW(),                LEN(Email)&gt;0           ),           ISCHANGED( Email )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPhoneChanged_Home</fullName>
        <actions>
            <name>npe01__ContactHomePhoneUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__PreferredPhone__c ,&quot;Home&quot;),      OR(           AND(                ISNEW(),                LEN(Phone)&gt;0           ),           ISCHANGED( Phone )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPhoneChanged_Mobile</fullName>
        <actions>
            <name>npe01__ContactMobilePhoneUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__PreferredPhone__c ,&quot;Mobile&quot;),      OR(           AND(                ISNEW(),                LEN(Phone)&gt;0           ),           ISCHANGED( Phone )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPhoneChanged_Other</fullName>
        <actions>
            <name>npe01__ContactOtherEmailUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__PreferredPhone__c ,&quot;Other&quot;),      OR(           AND(                ISNEW(),                LEN(Phone)&gt;0           ),           ISCHANGED( Phone )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPhoneChanged_Work</fullName>
        <actions>
            <name>npe01__ContactWorkPhoneUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL( npe01__PreferredPhone__c ,&quot;Work&quot;),      OR(           AND(                ISNEW(),                LEN(Phone)&gt;0           ),           ISCHANGED( Phone )      ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPreferred_Email%5F%5Fc</fullName>
        <actions>
            <name>npe01__ContactPreferredEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This workflow OVERWRITES the existing value in the standard Email field based on the Preferred Email field value.  This rule needs to be turned on manually after an Upgrade to this package.</description>
        <formula>OR( LEN(Email)=0, ISCHANGED(npe01__Preferred_Email__c) , ISCHANGED(npe01__WorkEmail__c) , ISCHANGED(npe01__HomeEmail__c) , ISCHANGED(npe01__AlternateEmail__c)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Contact%2EPreferred_Phone%5F%5Fc</fullName>
        <actions>
            <name>npe01__ContactPreferredPhone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This workflow OVERWRITES the existing value in the standard Phone field based on the Preferred Phone field value.  This rule needs to be turned on manually after an Upgrade to this package.</description>
        <formula>OR(  LEN(Phone)=0, ISCHANGED(npe01__PreferredPhone__c) ,  ISCHANGED(npe01__WorkPhone__c) ,  ISCHANGED(HomePhone) ,  ISCHANGED(MobilePhone) , ISCHANGED(OtherPhone)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Email only%3A Paste to Work</fullName>
        <actions>
            <name>npe01__SetPrefEmailtoWork</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>npe01__SetWorkEmailtoEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__Preferred_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__HomeEmail__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__AlternateEmail__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__WorkEmail__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>If there is a value in Email but no values in any email fields or Preferred Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>npe01__Phone only%3A Paste to Work</fullName>
        <actions>
            <name>npe01__PreferredPhonetoWork</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>npe01__WorkPhonetoPhone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__PreferredPhone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.npe01__WorkPhone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MobilePhone</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.HomePhone</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.OtherPhone</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>A new phone value is added to the Phone field and there is no preferred Phone</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>npo02__Contact%2EPreferred_Phone%5F%5Fc WithHousehold</fullName>
        <active>false</active>
        <description>DEPRICATED: This workflow does not do anything yet.</description>
        <formula>1=2</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
