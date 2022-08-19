using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;
using System.Web.Services;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class SpotAdmission : BasePage
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (!IsPostBack)
            {
                btnSubmit.Visible = false;
                btnPrint.Visible = false;
                divDecl.Visible = false;
                btnPrint.Visible = false;
                btnPayment.Visible = false;
                divTrans.Visible = false;
                GetApplicantDetails(m_AppID, m_ServiceID);
                GetSpotAdmissionData(lblRollNo.Text, "");
            }
        }

        private void GetApplicantDetails(string m_AppID, string m_ServiceID)
        {
            DataSet dt = m_OUATBLL.OUATUGSpotRank(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtRank = dt.Tables[1];
            DataTable dtCouncel = dt.Tables[2];

            if (dtApp.Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["aadhaarNumber"].ToString();
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();

                lblDate.Text = dtApp.Rows[0]["AllocationTime"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();

                lblProvisional.Text = dtRank.Rows[0]["TotalWeightage"].ToString();
                lblRankGen.Text = dtRank.Rows[0]["Rank_General"].ToString();

                if (dtRank.Rows[0]["IsCommunityScience"].ToString() == "1")
                {
                    divPref.Visible = false;
                    ddlFirstPref.Enabled = false;
                    ddlFirstPref.SelectedIndex = ddlFirstPref.Items.IndexOf(ddlFirstPref.Items.FindByText("College of Community Science, Bhubaneswar"));
                    lblCourseName.Text = "B.Sc.(Hons.) Community Science";
                    lblCollegeName.Text = "College of Community Science, Bhubaneswar";
                    ddlSeconPref.SelectedIndex = ddlFirstPref.Items.IndexOf(ddlFirstPref.Items.FindByText("College of Community Science, Bhubaneswar"));
                    ddlThirdPref.SelectedIndex = ddlFirstPref.Items.IndexOf(ddlFirstPref.Items.FindByText("College of Community Science, Bhubaneswar"));
                }
                else
                {
                    divPref.Visible = true;
                }
                try
                {
                    //QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
            else
            {
                btnSubmit.Visible = false;
                btnPrint.Visible = false;
                divDecl.Visible = false;
                string m_Message = @"Sorry! Your are not in merit list.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }
        }

        private void GetSpotAdmissionData(string RollNo, string AppID)
        {
            DataSet DS = m_OUATBLL.GetOUATUGSpotAdmissionData(RollNo, AppID);

            DataTable dtApp = DS.Tables[0];
            DataTable dtTrans = DS.Tables[1];

            if (dtApp.Rows.Count != 0)
            {
                btnSubmit.Visible = false;
                btnPrint.Visible = true;
                //divStudentDetails.Visible = true;
                //divDoc.Visible = true;

                //lblDate.Text = System.DateTime.Now.ToString("DD-MM-YYYY HH:MM:SS");
                lblDate.Text = dtApp.Rows[0]["CreatedOn"].ToString();
                lblRef.Text = dtApp.Rows[0]["AppID"].ToString();
                lblCourseName.Text = dtApp.Rows[0]["CourseFirstPreferance"].ToString();
                lblCourseName0.Text = dtApp.Rows[0]["CourseSecondPreferance"].ToString();
                lblCourseName1.Text = dtApp.Rows[0]["CourseThirdPreferance"].ToString();

                lblCollegeName.Text = dtApp.Rows[0]["CollegeFirstPreferance"].ToString();
                lblCollegeName0.Text = dtApp.Rows[0]["CollegeSecondPreferance"].ToString();
                lblCollegeName1.Text = dtApp.Rows[0]["CollegeThirdPreferance"].ToString();
                PayStatus.Text = "UPAID";
                ddlFirstPref.Enabled = false;
                ddlSeconPref.Enabled = false;
                ddlThirdPref.Enabled = false;
                chkDeclare.Checked = true;
                chkDeclare.Enabled = false;
                divDecl.Visible = true;
                divTrans.Visible = true;

                lblAppname1.Text = lblAppname.Text;
                lblAppID0.Text = lblAppID.Text;
                lblRollNo0.Text = lblRollNo.Text;
                lblAppname0.Text = lblAppname.Text;
                lblMsg.Text = "";

                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }

                if (dtTrans.Rows.Count != 0)
                {
                    btnPayment.Visible = false;
                    btnPrint.Visible = true;
                    divTrans.Visible = true;

                    lblRef.Text = dtTrans.Rows[0]["AppID"].ToString();
                    PayStatus.Text = dtTrans.Rows[0]["paid_status"].ToString();
                    lblTransAmt.Text = dtTrans.Rows[0]["Total"].ToString();
                    lblTransDate.Text = dtTrans.Rows[0]["Trans_Date"].ToString();

                    lblMsg.Text = "";
                }
                else
                {
                    btnPrint.Visible = false;
                    btnPayment.Visible = true;
                    lblMsg.Text = "Please Make Payment to Participate in OUAT UG Spot Admission";
                }

            }
        }

        protected void chkDeclare_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDeclare.Checked)
            {
                if (ddlFirstPref.SelectedValue != "0" && ddlSeconPref.SelectedValue != "0" && ddlThirdPref.SelectedValue != "0")
                {
                    btnSubmit.Visible = true;
                    divDecl.Visible = true;
                    lblDate.Text = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                    lblAppname1.Text = lblAppname.Text;
                    lblAppID0.Text = lblAppID.Text;
                    lblRollNo0.Text = lblRollNo.Text;
                    lblAppname0.Text = lblAppname.Text;
                    lblMsg.Text = "";
                }
                else
                {
                    btnPrint.Visible = false;
                    btnPayment.Visible = false;
                    chkDeclare.Checked = false;
                    btnSubmit.Visible = false;
                    divDecl.Visible = false;
                    string m_Message = @"Please select choise of College Preferance";
                    lblMsg.Text = m_Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                }
            }
            else {
                btnPrint.Visible = false;
                btnPayment.Visible = false;
                chkDeclare.Checked = false;
                btnSubmit.Visible = false;
                divDecl.Visible = false;
            }
        }

        protected void ddlFirstPref_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFirstPref.SelectedValue != "0")
            {
                lblCourseName.Text = ddlFirstPref.SelectedValue;
                lblCollegeName.Text = ddlFirstPref.SelectedItem.Text;
            }
            else
            {
                lblCourseName.Text = "";
                lblCollegeName.Text = "";
                chkDeclare.Checked = false;
                btnSubmit.Visible = false;
                divDecl.Visible = false;
                btnPrint.Visible = false;
                btnPayment.Visible = false;
            }
        }

        protected void ddlSeconPref_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSeconPref.SelectedValue != "0")
            {
                lblCourseName0.Text = ddlSeconPref.SelectedValue;
                lblCollegeName0.Text = ddlSeconPref.SelectedItem.Text;
            }
            else
            {
                lblCourseName0.Text = ""; lblCollegeName0.Text = "";
                chkDeclare.Checked = false;
                btnSubmit.Visible = false;
                divDecl.Visible = false;
                btnPrint.Visible = false;
                btnPayment.Visible = false;
            }

        }

        protected void ddlThirdPref_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlThirdPref.SelectedValue != "0")
            {
                lblCourseName1.Text = ddlThirdPref.SelectedValue;
                lblCollegeName1.Text = ddlThirdPref.SelectedItem.Text;
            }
            else
            {
                lblCourseName1.Text = "";
                lblCollegeName1.Text = "";
                chkDeclare.Checked = false;
                btnSubmit.Visible = false;
                divDecl.Visible = false;
                btnPrint.Visible = false;
                btnPayment.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (chkDeclare.Checked || ddlFirstPref.SelectedValue != "0" || ddlSeconPref.SelectedValue != "0" || ddlThirdPref.SelectedValue != "0")
            {
                btnSubmit.Visible = false;
                divDecl.Visible = true;
                lblDate.Text = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");



                string[] AFields =
                {

                     "RollNo"
                    ,"FormAAppID"
                    ,"AadhaarNumber"
                    ,"CreatedBy"
                    ,"CourseFirstPreferance"
                    ,"CourseSecondPreferance"
                    ,"CourseThirdPreferance"
                    ,"CollegeFirstPreferance"
                    ,"CollegeSecondPreferance"
                    ,"CollegeThirdPreferance"

            };

                OUATUGSpotAdmissionData_DT t_OUATSpotAdmissionData_DT = new OUATUGSpotAdmissionData_DT();

                t_OUATSpotAdmissionData_DT.RollNo = lblRollNo.Text;
                t_OUATSpotAdmissionData_DT.FormAAppID = lblAppID.Text;
                t_OUATSpotAdmissionData_DT.AadhaarNumber = lblAadhaar.Text;

                t_OUATSpotAdmissionData_DT.CourseFirstPreferance =  lblCourseName.Text;
                t_OUATSpotAdmissionData_DT.CourseSecondPreferance = lblCourseName0.Text;
                t_OUATSpotAdmissionData_DT.CourseThirdPreferance = lblCourseName1.Text;
                t_OUATSpotAdmissionData_DT.CollegeFirstPreferance =  lblCollegeName.Text;
                t_OUATSpotAdmissionData_DT.CollegeSecondPreferance = lblCollegeName0.Text;
                t_OUATSpotAdmissionData_DT.CollegeThirdPreferance = lblCollegeName1.Text;
                t_OUATSpotAdmissionData_DT.CreatedBy = Session["LoginID"].ToString();



                System.Data.DataTable result = null;
                string UID = "";

                result = m_OUATBLL.InsertOUATUGSpotAdmissionData(t_OUATSpotAdmissionData_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string m_Message = "Record Saved Sucessfully! Please Make Payment to Participate in OUAT UG Spot Admission";

                        CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
                        string MobileNo = result.Rows[0]["Mobile"].ToString();
                        string AppID = result.Rows[0]["AppID"].ToString();
                        string SvcID = result.Rows[0]["ServiceID"].ToString();

                        if (MobileNo != "")
                        {
                            string smsText = result.Rows[0]["SMSText"].ToString();

                            //test.sendsms(MobileNo, "Payment is successful for Reference No " + m_AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
                            test.sendsms(MobileNo, smsText);
                        }

                        GetSpotAdmissionData(lblRollNo.Text, AppID);
                        btnPayment.Visible = true;
                        lblMsg.Text = m_Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location.href = '/WebApp/KIOSK/Forms/ConfirmPayment.aspx?AppID=" + AppID + "&SvcID=" + SvcID + "';", true);
                    }
                }

            }
            else
            {
                btnSubmit.Visible = true;
                string m_Message = @"Please select choise of College Preferance & Accept the Declaration";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

            }

        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("/WebApp/KIOSK/Forms/ConfirmPayment.aspx?AppID=" + lblRef.Text + "&SvcID=434");
        }

        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }



        [WebMethod]
        public static string PrintAdmitLog(string prefix, string RollNo, string AppID)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //List<Tuple<string, string>> nvc = GetSessionValues();

                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.PrintAdmitLog(RollNo, AppID);

                }
            }

            return text;

        }
    }
}