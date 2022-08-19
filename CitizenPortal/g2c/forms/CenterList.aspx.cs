using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CitizenPortalLib.BLL;

namespace CitizenPortal.g2c.forms
{
    public partial class CenterList : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();

        public DataTable GridData
        {
            get
            {
                if (Session["GridData"] == null)
                {
                    DataTable dt = null;
                    string districtCode = SelectDistrict.SelectedValue;
                    if (string.IsNullOrEmpty(districtCode) || districtCode.ToUpper() == "ALL")
                        dt = m_KioskRegistrationBLL.GetCSCCenterList();
                    else
                        dt = m_KioskRegistrationBLL.GetCSCCenterList(SelectDistrict.SelectedValue);

                    Session["GridData"] = dt;
                }

                return (DataTable)Session["GridData"];
            }
            set { Session["GridData"] = value; }
        }

        public string SortExpression
        {
            get { return Convert.ToString(ViewState["SortExpression"]); }
            set { ViewState["SortExpression"] = value; }
        }

        public string FilterString
        {
            get { return Convert.ToString(ViewState["FilterString"]); }
            set { ViewState["FilterString"] = value; }
        }

        public SortDirection dir
        {
            get
            {
                if (ViewState["directionState"] == null)
                {
                    ViewState["directionState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["directionState"];
            }
            set
            { ViewState["directionState"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    ViewState["Column"] = "District Name";
            //    ViewState["Sortorder"] = "ASC";
            //    BindDistrictList(SelectDistrict);
            //    BindGrid();
            //}
            Response.Redirect("CenterListV2.aspx");

        }
        private void BindDistrictList(DropDownList ControlName)
        {
            DataTable DataTbl = null;
            DataTbl = m_KioskRegistrationBLL.GetDistrictFromState("21");
            ControlName.DataSource = DataTbl;
            ControlName.DataTextField = "DistrictName";
            ControlName.DataValueField = "DistrictCode";
            ControlName.DataBind();
        }
        public void BindBlockList(DropDownList ControlName)
        {
            DataTable DataTbl = null;
            DataTbl = m_KioskRegistrationBLL.GetBlock(SelectDistrict.SelectedValue);
            ControlName.DataSource = DataTbl;
            ControlName.DataTextField = "BlockName";
            ControlName.DataValueField = "BlockCode";
            ControlName.DataBind();
        }

        private void BindGrid()
        {
            DataTable dt = null;
            DataView dv = new DataView(GridData);

            if (!string.IsNullOrEmpty(SortExpression))
                dv.Sort = SortExpression;

            if (!string.IsNullOrEmpty(FilterString))
                dv.RowFilter = FilterString;

            dt = dv.ToTable();
            GridView.DataSource = dt;
            GridView.DataBind();
            TotalRecords.Text = dt.Rows.Count.ToString();

            dv.RowFilter = string.Empty;
            dv.Sort = string.Empty;
            GridData = dv.ToTable();
        }

        protected void SelectDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridData = null;
            FilterString = string.Empty;
            SortExpression = string.Empty;
            BindGrid();
            GridView.SetPageIndex(0);
            SrcCscName.Text = "";
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void SelectBlock_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
            GridView.SetPageIndex(0);
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortOrder = string.Empty;
            if (dir == SortDirection.Ascending)
            {
                dir = SortDirection.Descending;
                sortOrder = "Asc";
            }
            else
            {
                dir = SortDirection.Ascending;
                sortOrder = "Desc";
            }

            SortExpression = e.SortExpression + " " + sortOrder;

            BindGrid();
        }

        protected void SrcCscName_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(SrcCscName.Text.Trim()))
            {
                GridData = null;
                FilterString = string.Empty;
            }
            else
                FilterString = "[CSC Name] like '" + SrcCscName.Text + "%'";

            BindGrid();
        }

        protected void Clear_Filters(object sender, EventArgs e)
        {
            
            SrcCscName.Text = null;
            GridData = null;
            Response.Redirect("~/g2c/forms/CenterList.aspx");
            BindGrid();
        }
    }
}