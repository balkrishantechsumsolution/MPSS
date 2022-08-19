using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.RD
{
    public partial class SeniorCitizenIDCard : System.Web.UI.Page
    {
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = "";
            DataSet ds = null;
            if (m_AppID != "")
            {
                ds = m_SeniorCitizenBLL.GetSCIDCardData(m_ServiceID, m_AppID);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblname.Text = ds.Tables[0].Rows[0]["appname"].ToString();
                    lblappid.Text = Convert.ToString(ds.Tables[0].Rows[0]["RunningSeqNo"]);
                    lbldob.Text = ds.Tables[0].Rows[0]["dob"].ToString();
                    lblpaddress.Text = ds.Tables[0].Rows[0]["currentfulladdress"].ToString();
                    // + " ," + ds.Tables[0].Rows[0]["currentstate"].ToString() + " -" + ds.Tables[0].Rows[0]["currentpincode"].ToString();
                    profilephoto.Src = ds.Tables[0].Rows[0]["ApplicantImageStr"].ToString();
                    imgsignature.Src = ds.Tables[0].Rows[0]["ImageSign"].ToString();
                    lblbloodgroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    lblmobile.Text = ds.Tables[0].Rows[0]["mobileno"].ToString();
                    //lblage.Text = ds.Tables[0].Rows[0]["year"].ToString();
                    lblPS.Text= ds.Tables[0].Rows[0]["policestation"].ToString();
                    //back side
                    //lblname1.Text = ds.Tables[0].Rows[0]["appname"].ToString();
                    //lblappid1.Text = ds.Tables[0].Rows[0]["appid"].ToString();
                    lbldob.Text = ds.Tables[0].Rows[0]["dob"].ToString();
                    //lblpermanentaddress.Text = ds.Tables[0].Rows[0]["Permanentfulladdress"].ToString();
                    // + " ," + ds.Tables[0].Rows[0]["currentstate"].ToString() + " -" + ds.Tables[0].Rows[0]["currentpincode"].ToString();
                    lblrelativename.Text = ds.Tables[0].Rows[0]["NameOfRelative"].ToString();
                    lblrelativemobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    lblrelativeaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                    if (lblrelativename.Text == "")
                    {
                        emergencydetail.Visible = false;
                    }
                    else
                    {
                        emergencydetail.Visible = true;
                    }
                    /*------------passing parameters for QR Code---------------------------*/
                    QRCodeSr1.GenerateQRCode("Name:" + ds.Tables[0].Rows[0]["appname"].ToString() + " \nApplication ID:" + ds.Tables[0].Rows[0]["appid"].ToString() + " \nDOB:" +
                          ds.Tables[0].Rows[0]["dob"].ToString() + " \nBlood Group:" + ds.Tables[0].Rows[0]["BloodGroup"].ToString());

                }
            }
        }
    }
}