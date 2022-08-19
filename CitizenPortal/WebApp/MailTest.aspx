<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailTest.aspx.cs" Inherits="CitizenPortal.WebApp.MailTest" %>


<%@ Import Namespace="CitizenPortalLib" %>
<%@ Import Namespace="CitizenPortalLib.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

        string MailID = txtMailID.Text;
        string Mailtext = @"
                
<!DOCTYPE html>

<html>
<head>
    <title>+3 EXAMINATION ENROLLMENT - 2017</title>

</head>
<body>    
        <div>
            <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
                <table style='padding: 1% 0; width: 100%'>
                    <tr>
                        <td align='left'>
                            <img src='http://sambalpur.lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png' alt='Sambalpur University'
                                style='margin-left: 15%; height: 70px;' />
                        </td>
                        <td style='text-align: center;'>
                            <div style='font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000'>SAMBALPUR UNIVERSITY</div>
                            <div style='font-size: 13px; font-weight: normal; padding: 5px;'>Accredited with Grade-A by NAAC (Second Cycle)</div>
                            <div style='font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; font-weight: bold; color: #003500'>Jyoti Vihar, Burla</div>
                        </td>
                        <td align='right'>
                            <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='LOKASEBA ADHIKARA'
                                style='margin-right: 15%; height: 70px;' />
                        </td>
                    </tr>
                </table>

                <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                    <h1 style='color: #fff; font-size: 20px; font-weight: bold; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;'>+3 Examination EnroLlment - 2017</h1>
                </div>
                <div style='margin: 5% 5% 0; font-family: Arial;'>
                    <p>
                        Dear @Name,
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    </p>
                    <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>Your, +3 Examination Enrollment for 2017 process has been initiated.</span></b><p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Please find the details
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        ADMISSION NO : <b>@AdmissionNo</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        APPLICATION NO. : <b>@ReferenceID</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        STUDENT NAME: <b>@StudentName</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        DATE OF BIRTH : <b>@DOB</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        MOBILE NO. : <b>@MobileNo</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        You are requested to visit website&nbsp; <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a> to complete the +3 Examination Process
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        OR else you will NOT BE ELIGIABLE to appear in SEMESTER EXAMINATION
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        STEPS TO COMPLETE THE APPLICATION :
                    </p>
                    <ol class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <li>Visit Website  <a href='@Weblink0' target='_blank'>@Weblink0</a>
                        </li>

                        <li class='MsoNormal'
                            style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>Search Your Application by entering
                        <ul>
                            <li>
								a. <strong>Admission No</strong>
                            </li>
                            <li>
                                b. <strong>Date of Birth</strong></li>
                            <li>
                                c. OR any one&nbsp; &quot;<strong>Mobile No</strong>&quot; OR &quot;<strong>Student Name</strong>&quot; OR &quot;<strong>Application No</strong>&quot;</li>
                            <li>
                                d. <strong>Captcha</strong></li>

                        </ul>
                        </li>
                        <li>
                            Pre-filled application open</li>
                        <li>
                            Upload the Recent <strong>Photograph</strong> and <strong>Signature</strong> (as per prescribed specification)</li>
                        <li>
                            Enter the <strong>Education Qualification</strong></li>
                        <li>
                            Fill all the fields</li>
                        <li>
                            After filling the FORM click on &quot;<strong>Register &amp; Proceed</strong>&quot; button</li>
                        <li>
                            <strong>SMS</strong> and <strong>EMAIL</strong> will be send - containg the LOGIN details for Exam related activities</li>
                        <li>
                            Upload the supporting <strong>Documents</strong></li>
                        <li>
                            <strong>Make Payment</strong></li>
                        <li>
                            Acknowledgement will be generated - <strong>PRINT</strong> the acknowledgment</li>
                        <li>
                            You need to <strong>SUMBIT</strong> the Acknowledgment to college after signing it

                        </li>
                    </ol>
                    <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        After completing the process, please Login into <a href='https://lokaseba-odisha.in' target='_blank'>LOKASEBA ADHIKARA (Common Application Portal - CAP) </a>to check the Application.
                    </p>
                    <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        Last date for submission of FORM is <strong>Monday, 16th November 2017</strong></p>
                </div>
                <div style='margin: 0 5% 5%;'>
                    <p style='font-family calibri, sans-serif; font-size: 20px; !important; color :red; letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        <strong>PLEASE NOTE:</strong>   Examination <strong>ROLL NO</strong> and <strong>REGISTRATION NO</strong> shall <strong>NOT be GENERATED</strong> if any of the above step is not completed and you not be allowed to apear in examination.</p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;</p>

                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>Regards</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span class='auto-style1'>SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span class='auto-style1'>Burla</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Website : <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp; <a href='https://lokaseba-odisha.in' target='_blank'>https://lokaseba-odisha.in</a>
                    </p>
                </div>
            </div>
        </div>
</body>
</html>
        
                ";
        if (MailID != "")
        {

            DataTable result = new DataTable();

            result = InsertLog(txtMailID.Text);

           
            string UID = "";
            Mailtext = Mailtext.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString()).Replace("@Login", UID).Replace("@StudentName", result.Rows[0]["Name"].ToString()).Replace("@DOB", result.Rows[0]["DOB"].ToString()).Replace("@MobileNo", result.Rows[0]["Mobile"].ToString()).Replace("@Weblink0", result.Rows[0]["Weblink0"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString());

            string subject = txtSubject.Text;
            string bcc = result.Rows[0]["BCCMailID"].ToString();
            //Mailtext = Mailtext.Replace("@AppID","1234567890").Replace("@Name","Niraj Gupta").Replace("@Password","Password").Replace("@LoginId","Login ID");
            try
            {
                CommonUtility.SendEmailWithAttachment("", "", "", MailID, null, bcc,
                    subject,
                    Mailtext, true, null);
            }
            catch(Exception ex)
            {
                //throw ex;
            }
        }
    }

    protected DataTable InsertLog(string EmailID)
    {
        DataTable dt = new DataTable();

        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);
        //  string [] array = new  string [8] ;
        SqlCommand cmd = null;
        //  cmd = con.CreateCommand();
        cmd = new SqlCommand("SendTestEmailSP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmailID", EmailID);
        
        //SqlTransaction trans = null;
        try
        {

            con.Open();

            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {

                dt.Load(rdr);
                
            }

            return dt;


        }
       
        finally
        {            
            con.Close();

        }


    }

</script>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div >

        <h3>Email Test</h3>
         <asp:Label ID="Label1" runat="server" Text="To"></asp:Label>
        <asp:TextBox ID="txtMailID" runat="server"></asp:TextBox>
       <asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label>
        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
        
    </div>
      <div>   <asp:Label ID="Label3" runat="server" Text="Body"></asp:Label> 




     <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine"></asp:TextBox>    </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Email Send" OnClick="Button1_Click" />
        </div>

       
        
    </form>
</body>
</html>
