using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DAL;
using System.Data;
namespace CitizenPortal.WebApp.G2G.OISF.PM
{
    public partial class FrmPMEntryForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Epass.Visible = false;
                }
            }
            catch (Exception)
            {


            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OP11", txtAppId.Text, "", "", "", "", "", "", "", "", "");
                if (ds.Tables[0].Rows.Count == 1)
                {
                    lblAppID.Text = ds.Tables[0].Rows[0]["AppID"].ToString();
                    lblName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                    lblFatherName.Text = ds.Tables[0].Rows[0]["FatherName"].ToString();
                    lblDistrict.Text = ds.Tables[0].Rows[0]["District"].ToString();
                    lblCategory.Text = ds.Tables[0].Rows[0]["Category"].ToString();
                    lblVenue.Text = ds.Tables[0].Rows[0]["Venue"].ToString();
                    lblReportingTime.Text = ds.Tables[0].Rows[0]["ReportingTime"].ToString();
                    lblDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                    Epass.Visible = true;
                }
                else { Epass.Visible = false; }
            }
            catch (Exception ex)
            {

                Epass.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                OISFDALReport obj = new OISFDALReport();


                bool result = obj.UpdateOISFAppDetails("OP12", lblAppID.Text, lblCategory.Text, txtHeight.Text, txtWeight.Text, txtChestUnexpanded.Text, txtChestExpanded.Text, "", "", "", "");
                if (result)
                {


                    DataSet ds = obj.GetOISFAppDetails("OP13", txtAppId.Text, "", "", "", "", "", "", "", "", "");
                    if (ds.Tables[0].Rows.Count == 1)
                    {
                        lblSeletionStatus.Text = ds.Tables[0].Rows[0]["Status"].ToString();
                    }


                    }

                }
            catch (Exception)
            {

                
            }
        }
    }
}