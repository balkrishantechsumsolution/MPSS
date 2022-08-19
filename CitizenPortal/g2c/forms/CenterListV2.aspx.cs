using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data.SqlClient;

namespace CitizenPortal.g2c.forms
{
    public partial class CenterListV2 : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
            }
        }

        public void GetData()
        {
            DataTable dt = null;
            dt = m_KioskRegistrationBLL.GetCSCCenterList();
            DataGridView.DataSource = dt;
            int i;

            for (i = 0; i < dt.Columns.Count; i++)
            {
                BoundField test = new BoundField();
                test.DataField = dt.Columns[i].ToString();
                test.HeaderText = dt.Columns[i].ToString();
                DataGridView.Columns.Add(test);
                test = null;
            }
            DataGridView.DataBind();
        }

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            DataGridView.UseAccessibleHeader = false;
            DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            int CellCount = DataGridView.FooterRow.Cells.Count;
            DataGridView.FooterRow.Cells.Clear();
            DataGridView.FooterRow.Cells.Add(new TableCell());
            DataGridView.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
            DataGridView.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            DataGridView.FooterRow.Cells.Add(new TableCell());

            TableFooterRow tfr = new TableFooterRow();
            for (int i = 0; i < CellCount; i++)
            {
                tfr.Cells.Add(new TableCell());
                //tfr.Cells[i].i
                //tfr.Cells[i].ColumnSpan = CellCount;
                //tfr.Cells[0].Text = "Footer 2";
            }
            DataGridView.FooterRow.Controls[1].Controls.Add(tfr);
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDataFromDB()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Select [District Name],[Block Name],[Grampanchayat Name],[CSC ID],[VLE Name] As[CSC Name],[Contact No] From mstCSCDataTb", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    string a = DataTableToJSONWithStringBuilder(dt);
                    return a;
                }
            }
        }

        public static string DataTableToJSONWithStringBuilder(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
    }
}