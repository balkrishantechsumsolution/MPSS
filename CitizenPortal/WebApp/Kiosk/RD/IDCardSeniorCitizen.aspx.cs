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
    public partial class IDCardSeniorCitizen : System.Web.UI.Page
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
                    lblappid.Text = ds.Tables[0].Rows[0]["appid"].ToString();
                    lbldob.Text = ds.Tables[0].Rows[0]["dob"].ToString();
                    lblpaddress.Text = ds.Tables[0].Rows[0]["currentfulladdress"].ToString();
                    // + " ," + ds.Tables[0].Rows[0]["currentstate"].ToString() + " -" + ds.Tables[0].Rows[0]["currentpincode"].ToString();
                    profilephoto.Src = ds.Tables[0].Rows[0]["ApplicantImageStr"].ToString();
                    imgsignature.Src = ds.Tables[0].Rows[0]["ImageSign"].ToString();
                    lblbloodgroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    //back side
                    //lblname1.Text = ds.Tables[0].Rows[0]["appname"].ToString();
                    //lblappid1.Text = ds.Tables[0].Rows[0]["appid"].ToString();
                    lbldob.Text = ds.Tables[0].Rows[0]["dob"].ToString();
                    lblpermanentaddress.Text = ds.Tables[0].Rows[0]["Permanentfulladdress"].ToString();
                    // + " ," + ds.Tables[0].Rows[0]["currentstate"].ToString() + " -" + ds.Tables[0].Rows[0]["currentpincode"].ToString();
                    /*------------passing parameters for QR Code---------------------------*/
                    QRCode1.GenerateQRCode("Name:" + ds.Tables[0].Rows[0]["appname"].ToString() + " \nApplication ID:" + ds.Tables[0].Rows[0]["appid"].ToString() + " \nDOB:" +
                          ds.Tables[0].Rows[0]["dob"].ToString() + " \nBlood Group:" + ds.Tables[0].Rows[0]["BloodGroup"].ToString());

                }
            }
        }
    }
}