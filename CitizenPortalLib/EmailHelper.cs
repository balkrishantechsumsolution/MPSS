using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CitizenPortalLib
{

    public enum EmailEvent
    {
        SCARegistration,
        SCARegistrationDetail,
        AccountActivation,
        SupervisorApproval,
        SupervisorRejection,
        FinancerApproval,
        FinancerRejection,
        ConfirmPayment,
        CitizenRegistration,
        TopUpApproval,
        SuggestionDetail,
        BalanceReminder
    }

    public static class EmailTemplates
    {

        public static Dictionary<EmailEvent, string> EmailBodies;

        public static Dictionary<EmailEvent, string> EmailSubject;

        static EmailTemplates()
        {
            PopulateBodies();
            PopulateSubjects();
        }

        public static void PopulateBodies()
        {
            string Prefix, suffix;

            Prefix = "<HTML><BODY> Dear Sir/Madam, <br/>";
            suffix = "<br/>Regards,<br/>support@CitizenPortal.gov.in<br/>Phone 022-67784015 <br>Note: This is an automated email notification. Please do not reply this email.</Body></Html>";

            EmailBodies = new Dictionary<EmailEvent, string>();

            EmailBodies.Add(EmailEvent.SCARegistration, @"<br /> Dear {0},<br />
                            <br />
                            Welcome to official portal of Government of Maharashtra, <b>MahaOnline</b>.
                            <br/>
                            <br/><p>
                            Now you can avail all G2G and G2C services online (A shift from citizen In line to citizen Online) and
                            you can make payments to these services through Net Banking, Credit / Debit Cards or cash at CSC / Kiosk.</p>
                            <br/>
                            <br/>
                            You have successfully registered at MahaOnline with,
                            <br/>
                            SCA ID      : {1} <br />
                            LoginId     : {2} <br />
                            Password    : {3} <br />
                            <br/>
                            Please log into portal https://www.services.mahaonline.gov.in with your User ID and password. 
                            <br/>
                            For any queries write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/>
                            <br/>
                            Regards, 
                            <br/>
                            MahaOnline Limited 
                            <br/>
                            This is an auto generated mail; please do not reply to this mail.
                            ");

            EmailBodies.Add(EmailEvent.SCARegistrationDetail, @"<br /> Dear {0},<br />
                            <br />
                            Welcome to official portal of Government of Maharashtra, <b>MahaOnline</b>.
                            <br/>
                            <br/><p>
                            Now you can avail all G2G and G2C services online (A shift from citizen In line to citizen Online) and
                            you can make payments to these services through Net Banking, Credit / Debit Cards or cash at CSC / Kiosk.</p>
                            <br/>
                            <br/>
                            You have successfully registered at MahaOnline with,
                            <br/>
                            SCA ID      : {1} <br />
                            LoginId     : {2} <br />
                            Password    : {3} <br />
                            <br/>
                            Please log into portal https://www.services.mahaonline.gov.in with your User ID and password. 
                            <br/>
                            For any queries write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/>
                            <br/>
                            Regards, 
                            <br/>
                            MahaOnline Limited 
                            <br/>
                            This is an auto generated mail; please do not reply to this mail.
                            ");
     
            EmailBodies.Add(EmailEvent.AccountActivation, @"<br /> Dear {0},<br />
                            <br />
                            Welcome to official portal of Government of Maharashtra, <b>MahaOnline</b>.
                            <br/>
                            <br/><p>
                            Now you can avail all G2G and G2C services online (A shift from citizen In line to citizen Online) and
                            you can make payments to these services through Net Banking, Credit / Debit Cards or cash at CSC / Kiosk.</p>
                            <br/>
                            <br/>
                            You have successfully registered at MahaOnline with,
                            <br/>
                            KIOSK ID    : {1} <br />
                            LoginId     : {2} <br />
                            Password    : {3} <br />
                            <br/>
                            Please log into portal https://www.mahaonline.gov.in with your User ID and password. 
                            <br/>
                            For any queries write to us on support@mahaonline.gov.in or call us on 022-42187000.<br/>
                            <br/>
                            Regards, 
                            <br/>
                            MahaOnline Limited 
                            <br/>
                            This is an auto generated mail; please do not reply to this mail.
                            ");

            EmailBodies.Add(EmailEvent.SupervisorApproval, @"<br /> Dear {0},<br />
                            Congratulations and Welcome to MahaOnline.<br/>
                            Your KIOSK ID has been verified and approved.<br/>
                            Please deposit the Security and Operational amount to activate your account and use our services.<br/><br/>

                            For any queries please write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/>

                            Regards, <br/>
                            MOL Support Team.
                            <br/>");

            EmailBodies.Add(EmailEvent.SupervisorRejection, @"<br /> Dear {0},<br />                            
                            Oops! Supervisor has rejected your Kiosk Account for {1} for {2}<br/>
                            You can re-apply after 3 Months.<br/><br/>

                            For any queries please write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/><br/>

                            Regards, <br/>
                            MOL Support Team.<br/>                            
                            <br/>");

            EmailBodies.Add(EmailEvent.FinancerApproval, @"<br /> Dear {0},<br />
                            Congratulations and Welcome to MahaOnline.<br/>
                            Your security amount has been credited in to MOL account.<br/>
                            Now you can create operator to avail our services.<br/><br/>

                            For any queries Please write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/><br/>

                            Regards, <br>
                            MOL Support Team.
                            <br/>");

            EmailBodies.Add(EmailEvent.FinancerRejection, @"<br /> Dear {0},<br />
                            Oops!
                            Your security amount has been rejected by our Finance Department for .br/>
                            Please try again.<br/>

                            For any queries write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/>

                            Regards, <br/>
                            MOL Support Team.
                 
                            <br/>");

            EmailBodies.Add(EmailEvent.ConfirmPayment, @"<br /> Dear {0},<br />
                            Thank you for using MahaOnline Services.<br/>
                            Rs.{1} has been deducted from your account for Application No.{2} and your current balance is Rs.{3}.<br/>
                            Do visit us again.<br/><br/>

                            For any queries Please write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/><br/>

                            Regards, <br/>
                            MOL Support Team.<br/>                            
                            
                            <br/>");

            EmailBodies.Add(EmailEvent.CitizenRegistration, @"<br /> Dear {0},<br />
                            Welcome to MahaOnline.<br/>
                            Thank you for registering with MahaOnline Limited (Government Portal).<br/>
                            You can access our trusted services by using Login details mentioned below:<br/>                            
                                    Login ID : {1}
                                    Password : {2}
                            <br />  <br />                            
                            For any queries please write to us on support@mahaonline.gov.in or call us on 022-42187000. <br/><br/>
                            Regards,<br/>
                            MOL Support Team.
                            <br/>");

            EmailBodies.Add(EmailEvent.TopUpApproval, @"<br /> Dear {0},<br />
                            Thank you for the payment. <br/>
                            The topup amount of Rs.{1} deposited with reference no {2} in account No. {3} has been {4} on {5}. <br/>
                            Now the available balance is Rs {6} <br/><br/>
                            Thank you for using MahaOnline Services.<br/><br/>
                            For any queries please write to us on support@mahaonline.gov.in or call us on 022-42187000.<br/><br/>
                            Regards,<br/>
                            Finance Department.  <br />
                            <br/>");

            EmailBodies.Add(EmailEvent.SuggestionDetail, @"<br /> Dear {0},<br />
                            Thank you for valuable suggestion. <br/>
                            Your suggestion :<br/>
                            {1} <br/>
                            will processed shortly. <br/>
                            <br/>
                            Thank you for using MahaOnline Portal.<br/><br/>                            
                            Regards,<br/>
                            MOL Team.  <br />                            
                            <br/>");

            EmailBodies.Add(EmailEvent.BalanceReminder, @"<br /> Dear {0},<br />
                            Your current balance is {1}. <br/>
                            Kindly refill your wallet immediately with MOL bank acount,<br/>                            
                            to avail uninterrupted Services. <br/>
                            <br/>
                            Thank you,<br/><br/>                            
                            Regards,<br/>
                            MOL Service Desk.  <br />                            
                            <br/>");
            //TODO: Review email bodies
        }

        public static void PopulateSubjects()
        {
            EmailSubject = new Dictionary<EmailEvent, string>();

            EmailSubject.Add(EmailEvent.AccountActivation, @"Link for Account Activation in MOLPortal");
         
            EmailSubject.Add(EmailEvent.SupervisorApproval, @"Account approved by MOL Supervisor");
            EmailSubject.Add(EmailEvent.SupervisorRejection, @"Account rejected by MOL Supervisor");
            
            EmailSubject.Add(EmailEvent.FinancerApproval, @"Account approved by MOL Financer");
            EmailSubject.Add(EmailEvent.FinancerRejection, @"Account rejected by MOL Financer");
            
            EmailSubject.Add(EmailEvent.SCARegistration, @"SCA Account Registered Successfully");
            EmailSubject.Add(EmailEvent.SCARegistrationDetail, @"SCA Account Registered Detail");
            EmailSubject.Add(EmailEvent.ConfirmPayment, @"Payment Confirmation Mail");
            EmailSubject.Add(EmailEvent.CitizenRegistration, @"Citizen Registered Sucessfully");
            EmailSubject.Add(EmailEvent.TopUpApproval, @"Topup status from MOL Finance Department");
            EmailSubject.Add(EmailEvent.SuggestionDetail, @"Confirmation of your sugestion");
            EmailSubject.Add(EmailEvent.BalanceReminder, @"Reminder! Refill your Wallet");
            //TODO: Review email subjects
        }
    }

    public enum SMSEvent
    {
        AccountActivation
    }
    public static class SMSTemplates
    {

        public static Dictionary<SMSEvent, string> SMSTexts;
        static SMSTemplates()
        {
            PopulateSMSText();
        }

        public static void PopulateSMSText()
        {
            SMSTexts = new Dictionary<SMSEvent, string>();            
            SMSTexts.Add(SMSEvent.AccountActivation, @"Account is Activated Id: {0}. ");
            //TODO: Review email bodies
        }
    }



}
