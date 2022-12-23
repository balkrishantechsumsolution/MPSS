﻿using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class Acknowledgement : CommonBasePage
    {
      
        string m_AppID, m_ServiceID;
        static data sqlhelper = new data();

        protected void Page_Load(object sender, EventArgs e)
         {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

            m_AppID = Request.QueryString["AppID"].ToString();


            DataTable dtApp = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@AppID", m_AppID),
                 new SqlParameter("@ServiceID", m_ServiceID)
            };

            dtApp = sqlhelper.ExecuteDataTable("GetScholarShipFormDataSP", parameter);
           

            if (dtApp.Rows.Count != 0)
            {
                if (dtApp.Rows[0]["StudentName"].ToString() != "")
                {

                    FullName.Text = dtApp.Rows[0]["StudentName"].ToString();
                    gender.Text = dtApp.Rows[0]["Gender"].ToString();
                    FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                    MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                    DOBConverted.Text = dtApp.Rows[0]["Birthdate"].ToString();
                   
                    Category.Text = dtApp.Rows[0]["Caste"].ToString();
                    lblAdmittedCategory.Text = dtApp.Rows[0]["Regilion"].ToString();
                    MobileNo.Text = dtApp.Rows[0]["MobieNoParent"].ToString();
                    Subject.Text = dtApp.Rows[0]["Subject"].ToString();
                    School.Text = dtApp.Rows[0]["School"].ToString();
                    Section.Text = dtApp.Rows[0]["Section"].ToString();
                    Class.Text = dtApp.Rows[0]["Class"].ToString();
                    lblAdmissionDate.Text = dtApp.Rows[0]["DateAdmisCurrSch"].ToString();
                    AdmissionNo.Text = dtApp.Rows[0]["StudentName"].ToString();
                    StudentID.Text = dtApp.Rows[0]["StudentID"].ToString();
                    LadliLaxmiNo.Text = dtApp.Rows[0]["LadliLaxmiNo"].ToString();
                    Nationality.Text ="Indian";

                    PAddressLine1.Text = dtApp.Rows[0]["HouseNo"].ToString();
                    PRoadStreetName.Text = dtApp.Rows[0]["Colony"].ToString();
                    PLandMark.Text = dtApp.Rows[0]["Colony"].ToString();
                    PLocality.Text = dtApp.Rows[0]["City"].ToString();
                    PddlDistrict.Text = dtApp.Rows[0]["AddressDISTRICT"].ToString();
                    PddlState.Text = dtApp.Rows[0]["StateName"].ToString();
                    PPinCode.Text = dtApp.Rows[0]["pincode"].ToString();

                    CAddressLine1.Text = dtApp.Rows[0]["HouseNo"].ToString();
                    CRoadStreetName.Text = dtApp.Rows[0]["Colony"].ToString();
                    CLandMark.Text = dtApp.Rows[0]["Colony"].ToString();
                    CLocality.Text = dtApp.Rows[0]["City"].ToString();
                    CddlDistrict.Text = dtApp.Rows[0]["AddressDISTRICT"].ToString();
                    CddlState.Text = dtApp.Rows[0]["StateName"].ToString();
                    CPinCode.Text = dtApp.Rows[0]["pincode"].ToString();

                    var val = dtApp.Rows[0]["Img"].ToString();
                    var valTC = dtApp.Rows[0]["ImgTC"].ToString();
                    
                    ProfilePhoto.Attributes.Add("src", val);
                    ProfilePhoto.DataBind();

                    ProfileTC.Attributes.Add("src", valTC);
                    ProfileTC.DataBind();

                    txtAadharNo.Text = dtApp.Rows[0]["Aadhar"].ToString();
                    txtFamilyID.Text = dtApp.Rows[0]["FamilySamagraID"].ToString();
                    SamagraNo.Text = dtApp.Rows[0]["SamagraID"].ToString();
                    txtAppID.Text = m_AppID;
                    lblDiceCode.Text = dtApp.Rows[0]["DiceCode"].ToString();
                    lblAffiliationCode.Text = dtApp.Rows[0]["SambathaCode"].ToString();

                    lblSchoolName.Text = dtApp.Rows[0]["SchoolName"].ToString();
                    lblNative.Text = dtApp.Rows[0]["IsMPOrigin"].ToString();
                    lblPassExam.Text = dtApp.Rows[0]["IsPassOtherBoard"].ToString();

                }

                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);

                }

                catch
                {

                }
            }
        }
        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                if (e.Row.Cells[2].Text == "Attached")
                {
                    i = e.Row.Cells.Count - 1;
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDoc_" + e.Row.RowIndex;
                    t_Anchor.InnerHtml = "View";
                    t_Anchor.Attributes.Add("onclick", "ViewDoc('" + m_AppID + "', '" + m_ServiceID + "','" + e.Row.Cells[3].Text + "')");
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[i].Controls.Add(t_Anchor);
                    e.Row.Cells[i].Attributes.Add("Title", "View");
                    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    i++;
                }
                t_Anchor = null;
            }
        }
    }
}