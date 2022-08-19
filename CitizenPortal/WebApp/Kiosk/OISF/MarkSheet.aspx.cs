using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class MarkSheet : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();

            DataSet dt = m_OISFBLL.OSIFGetScoreSheet(m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtScore = dt.Tables[1];

            if (dt.Tables[0].Rows.Count == 0) {
                string m_Message = "Sorry! Roll Number Not generated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                return;
            }

            if (dtScore.Rows[0]["rollnumber"].ToString() != null && dtScore.Rows[0]["rollnumber"].ToString() != "")
            {
                if (dtApp.Rows.Count != 0)
                {
                    lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                    lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                    lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                    lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                    lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                    lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                    lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                    lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                    lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                    ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                    lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                    lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                    lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                    try
                    {
                        QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                    }
                    catch { }
                }

                if (dtScore.Rows.Count != 0)
                {
                    lblPM.Text = dtScore.Rows[0]["PhysicalMeasurement Status"].ToString();
                    lblPMS.Text = dtScore.Rows[0]["PhysicalMeasurement Marks"].ToString();
                    lblBM.Text = dtScore.Rows[0]["BioMetrixStatus"].ToString();
                    lblBMS.Text = dtScore.Rows[0]["BioMetrixMarks"].ToString();
                    lblMF.Text = dtScore.Rows[0]["Medical Status"].ToString();
                    lblMFS.Text = dtScore.Rows[0]["Medical Marks"].ToString();
                    lblRC.Text = dtScore.Rows[0]["Rope Climbing Status"].ToString();
                    lblRCS.Text = dtScore.Rows[0]["Rope Climbing Marks"].ToString();
                    
                    lblHJ.Text = dtScore.Rows[0]["High Jump Status"].ToString();
                    lblHJS.Text = dtScore.Rows[0]["High Jump Marks"].ToString();
                    lblBJ.Text = dtScore.Rows[0]["Broad Junp Status"].ToString();
                    lblBJS.Text = dtScore.Rows[0]["Broad Jump Marks"].ToString();
                    
                    lblRun.Text = dtScore.Rows[0]["Running Status"].ToString();
                    lblRunS.Text = dtScore.Rows[0]["Running Marks"].ToString();
                    lblCC.Text = dtScore.Rows[0]["Cross Country Status"].ToString();
                    lblCCS.Text = dtScore.Rows[0]["Cross Country Marks"].ToString();

                    lblSwim.Text = dtScore.Rows[0]["Swimming Status"].ToString();
                    lblSwimS.Text = dtScore.Rows[0]["Swimming Marks"].ToString();
                    lblDrive.Text = dtScore.Rows[0]["Driving Status"].ToString();
                    lblDriveS.Text = dtScore.Rows[0]["Driving Marks"].ToString();
                    lblResult.Text = dtScore.Rows[0]["EventResult"].ToString();
                }
            }
            else
            {
                lblMsg.Text = "";
                string m_Message = "Sorry! Score for Reference No. " + m_AppID + " not available. Either the Candidate has not appeared in Event Exam, OR the Score has not been entered";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }
        }
    }
}