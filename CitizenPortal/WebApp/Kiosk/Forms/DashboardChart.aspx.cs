using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class DashboardChart : BasePage
    {
        KioskRegistrationBLL m_KioskDashboardBLL = new KioskRegistrationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";

            LoginID = Session["KioskID"].ToString();
            DataTable dt = null;
            dt = m_KioskDashboardBLL.GetKioskDashboardGrid(LoginID);

            grdView.DataSource = dt;
            grdView.DataBind();

            //lblTotalRecords.InnerText = dt.Rows.Count.ToString();
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                string t_PaymentStatus = "U";
                string t_AckURL = "";

                TableCell Cell = GetCellByName(e.Row, "PaymentStatus");

                if(Cell != null && Cell.Text != "")
                {
                    if(Cell.Text.ToUpper() == "PAID")
                    {
                        t_PaymentStatus = "P";
                    }
                }

                Cell = GetCellByName(e.Row, "View");

                if (Cell != null && Cell.Text != "")
                {
                    t_AckURL = Cell.Text;
                }

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + t_PaymentStatus + "', '" + t_AckURL + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[1].Attributes.Add("style", "display:none");
            }
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }

        [WebMethod]
        public static List<Response> GetChartData()
        {
            DataTable dt = new DataTable();


            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Count", typeof(Int32));
           

           
            dt.Rows.Add("Pending for Approval", 28);
            dt.Rows.Add("Approved Certificate", 58);
            dt.Rows.Add("Rejected Certificate", 14);

            //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
            //{
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    con.Close();
            //}
            List<Response> dataList = new List<Response>();
            foreach (DataRow dtrow in dt.Rows)
            {
                Response details = new Response();
                details.Name = dtrow[0].ToString();
                details.Count = Convert.ToInt32(dtrow[1]);
                dataList.Add(details);
            }
            return dataList;
        }
        [WebMethod]
        public static List<Response> GetChartData2()
        {
            DataTable dt = new DataTable();


            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Count", typeof(Int32));



            dt.Rows.Add("Total Amount", 100000);
            dt.Rows.Add("Commission Earned", 40000);
            dt.Rows.Add("Balance", 60000);

            //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
            //{
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    con.Close();
            //}
            List<Response> dataList = new List<Response>();
            foreach (DataRow dtrow in dt.Rows)
            {
                Response details = new Response();
                details.Name = dtrow[0].ToString();
                details.Count = Convert.ToInt32(dtrow[1]);
                dataList.Add(details);
            }
            return dataList;
        }
        [WebMethod]
        public static List<Response1> GetChartData3()
        {
            DataTable dt = new DataTable();


            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Count", typeof(Int32));
            dt.Columns.Add("Count1", typeof(Int32));
            dt.Columns.Add("Count2", typeof(Int32));



            dt.Rows.Add("Senior Citizen", 56, 36, 23);
            dt.Rows.Add("Residence", 32,33,34);
            dt.Rows.Add("Income", 11,12,13);
            dt.Rows.Add("General Affidavit", 43,24,25);
            dt.Rows.Add("Seed Licencing", 23, 20, 12);
            //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
            //{
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    con.Close();
            //}
            List<Response1> dataList = new List<Response1>();
            foreach (DataRow dtrow in dt.Rows)
            {
                Response1 details = new Response1();
                details.Name = dtrow[0].ToString();
                details.Count3 = Convert.ToInt32(dtrow[1]);
                details.Count1 = Convert.ToInt32(dtrow[2]);
                details.Count2 = Convert.ToInt32(dtrow[3]);
                dataList.Add(details);
            }
            return dataList;
        }
    }
    public class Response
    {
        public string Name { get; set; }
        public int Count { get; set; }
    }
    public class Response1
    {
        public string Name { get; set; }
        public int Count3 { get; set; }
        public int Count1 { get; set; }
        public int Count2 { get; set; }
    }

}