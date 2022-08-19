using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.DTE
{
    public partial class CollegePGDetail : System.Web.UI.Page
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        string CurrentDate = "";
        string ExamYear = "";
        string Semester = "";
        string College = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "DTESecretaryAdmin";
            int Department = 0;


            //LoginID = Session["LoginID"].ToString();
            //Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("21");
                BindService("121");
            }

            CurrentDate = Request.QueryString["SvcID"].ToString();
            Semester = Request.QueryString["SEM"].ToString();
            ExamYear = Request.QueryString["YEAR"].ToString();
            College = Request.QueryString["COLLEGE"].ToString();
            BindGrid(LoginID, Department);

        }

        private void BindGrid(string LoginID, int Department)
        {
            string FromDate = "";
            string ToDate = "";            
            
            FromDate = CurrentDate;

            DataTable dt = null;
            //dt = m_G2GDashboardBLL.GetTransactionOUATDetail(LoginID, Department, Service, District, Status, FromDate, ToDate, "2",Semester,ExamYear);
            dt = m_G2GDashboardBLL.GetPaymentSummary(LoginID, Department, FromDate, ToDate, "2", Semester, ExamYear, College);
            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }

        private void BindService(string departmentcode)
        {
            //ServicesBLL t_ServicesBLL = new ServicesBLL();
            //System.Data.DataTable dtServices = t_ServicesBLL.GetDeptServices(departmentcode);

            //ddlServices.DataTextField = "ServiceName";
            //ddlServices.DataValueField = "ServiceCode";
            //ddlServices.DataSource = dtServices;
            //ddlServices.DataBind();

            //ddlServices.Items.Insert(0, new ListItem("-Select Services-", "0"));
        }

        private void BindDistrict(string districtcode)
        {
            //KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            //System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(districtcode);

            //ddlDistrict.DataTextField = "DistrictName";
            //ddlDistrict.DataValueField = "DistrictCode";
            //ddlDistrict.DataSource = dtDistrict;
            //ddlDistrict.DataBind();

            //ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }

    }
}