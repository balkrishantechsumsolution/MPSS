using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G
{
    public partial class DBQuery : System.Web.UI.Page
    {
        string[] m_Databases = { "Sambalpur_MasterDB"};
        string m_Exception = "";
        Hashtable htControls = new Hashtable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserType"] != null && Session["UserType"].ToString() != "")
            //{
            //    if (Session["sRole"].ToString() != "MolAdmin")
            //        Response.Redirect("~/Home/Login.aspx");
            //}
            pnlResults.Visible = false;

            if (!IsPostBack)
            {
                BindDatabases();
            }

            if (HFSelected.Value != "")
            {
                if (HFSelected.Value == "S")
                {
                    btnShowData_Click(null, null);
                }
                else
                {
                    btnExecute_Click(null, null);
                }
            }
        }

        void BindDatabases()
        {
            for (int i = 0; i < m_Databases.Length; i++)
            {
                ddlDB.Items.Add(m_Databases[i]);
            }
            ddlDB_SelectedIndexChanged(null, null);
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            if (txtQuery.Text == "") return;

            string t_DBName = "";
            string t_SQLQuery = "";
            DataTable t_DT;

            t_DBName = ddlDB.SelectedItem.Value;
            t_SQLQuery = txtQuery.Text;

            t_DT = ExecuteQuery(t_DBName, t_SQLQuery);

            if (t_DT != null)
                BindGrid(t_DT);

            if (m_Exception != "")
            {
                ClearGrid();
                lblMsg.Text = m_Exception;
            }

            pnlResults.Visible = true;
        }

        DataTable ExecuteQuery(string DBName, string SQLQuery)
        {
            DataTable t_DT = null;

            
            try
            {
                t_DT = ExecuteOnDB(DBName, SQLQuery);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                m_Exception = ex.Message;
            }

            if (t_DT == null) return null;

            return t_DT;
        }

        internal DataTable GetDBObjectsV1(string DB)
        {           
            using (DbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString()))
            {
                connection.Open();
                //connection.ChangeDatabase(DB);
                DataTable schema = connection.GetSchema("Tables");
                DataTable dataTable = new DataTable();
                dataTable.Columns.Add("Object_Name", typeof(string));
                dataTable.AcceptChanges();
                foreach (DataRow row1 in (InternalDataCollectionBase)schema.Rows)
                {
                    DataRow row2 = dataTable.NewRow();
                    row2["Object_Name"] = (object)row1[2].ToString();
                    dataTable.Rows.Add(row2);
                }
                dataTable.AcceptChanges();
                dataTable.DefaultView.Sort = "Object_Name ASC";
                return dataTable;
            }
        }

        internal DataTable ExecuteOnDB(string DBName, string SQLQuery)
        {
            DataSet dataSet = new DataSet();
            
            using (IDbConnection connection = (IDbConnection)new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString()))
            {
                connection.Open();
                connection.ChangeDatabase(DBName);
                using (IDbCommand command = connection.CreateCommand())
                {
                    try
                    {
                        IDbDataAdapter dbDataAdapter = (IDbDataAdapter)new SqlDataAdapter();
                        command.CommandText = SQLQuery;
                        command.Connection = connection;
                        dbDataAdapter.SelectCommand = command;
                        dbDataAdapter.Fill(dataSet);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    return dataSet.Tables[0];
                }
            }
        }

        protected void btnClearResults_Click(object sender, EventArgs e)
        {
            txtQuery.Text = "";

            ClearGrid();
            pnlResults.Visible = false;
        }

        void ClearGrid()
        {
            gvResults.Columns.Clear();
            gvResults.DataSource = null;
            gvResults.DataBind();
        }

        void BindGrid(DataTable DT)
        {
            if (DT == null) return;

            gvResults.Columns.Clear();

            gvResults.DataSource = DT;
            gvResults.DataBind();

            lblMsg.Text = DT.Rows.Count + " row(s) affected";
        }

        protected void ddlDB_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDBObjects(ddlDB.SelectedItem.Value);
        }

        void GetDBObjects(string DB)
        {
            BoundField t_BoundField;
            DataTable t_DT;

            
            t_DT = GetDBObjectsV1(DB);

            if (t_DT == null) return;

            for (int i = 0; i < t_DT.Columns.Count; i++)
            {
                t_BoundField = new BoundField();
                t_BoundField.DataField = t_DT.Columns[i].ColumnName;
                t_BoundField.SortExpression = t_DT.Columns[i].ColumnName;
                if (t_DT.Columns[i].DataType.Equals(typeof(int)) ||
                    t_DT.Columns[i].DataType.Equals(typeof(decimal)))
                {
                    t_BoundField.ItemStyle.CssClass = "tdRT";
                    t_BoundField.HeaderStyle.CssClass = "tdRT";
                }
                else
                {
                    t_BoundField.ItemStyle.CssClass = "tdLT";
                    t_BoundField.HeaderStyle.CssClass = "tdLT";
                }
                t_BoundField.HeaderText = t_DT.Columns[i].ColumnName;

                gvResults.Columns.Add(t_BoundField);
            }

            ddlTables.DataTextField = "Object_Name";
            ddlTables.DataValueField = "Object_Name";
            ddlTables.DataSource = t_DT;
            ddlTables.DataBind();
        }

        protected void btnShowData_Click(object sender, EventArgs e)
        {
            string t_SQLQuery = "";
            DataTable t_DT;
            string t_DBName = ddlDB.SelectedItem.Value;
            string t_TableName = ddlTables.SelectedItem.Value;
            t_SQLQuery = "Select * From " + t_TableName;

            t_DT = ExecuteQuery(t_DBName, t_SQLQuery);

            BindGrid(t_DT);
            pnlResults.Visible = true;
        }

        protected void gvResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResults.PageIndex = e.NewPageIndex;
            gvResults.DataBind();
        }

        protected void btn_Excel_Click(object sender, EventArgs e)
        {
            PrepareGridViewForExport(gvResults);
            ExportGridView();

        }

        private void PrepareGridViewForExport(System.Web.UI.Control gv)
        {
            LinkButton lb = new LinkButton();
            Literal l = new Literal();
            string name = String.Empty;
            for (int i = 0; i < gv.Controls.Count; i++)
            {
                if (gv.Controls[i].GetType() == typeof(LinkButton))
                {
                    l.Text = (gv.Controls[i] as LinkButton).Text;
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                else if (gv.Controls[i].GetType() == typeof(DropDownList))
                {
                    l.Text = (gv.Controls[i] as DropDownList).SelectedItem.Text;
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                else if (gv.Controls[i].GetType() == typeof(CheckBox))
                {
                    l.Text = (gv.Controls[i] as CheckBox).Checked ? "True" : "False";
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                if (gv.Controls[i].HasControls())
                {
                    PrepareGridViewForExport(gv.Controls[i]);
                }
            }
        }

        private void ExportGridView()
        {
            if (gvResults.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('No record found to export');", true);
                return;
            }

            string t_FileName = "Export";
            string attachment = "";


            attachment = "attachment; filename=" + t_FileName + "_" + DateTime.Now.ToString("dd-MM-yyyy_hh-mm-ss") + ".xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter htw = new HtmlTextWriter(sw);

            //// Create a form to contain the grid
            //HtmlForm frm = new HtmlForm();
            //gvDetail.Parent.Controls.Add(frm);
            //frm.Attributes["runat"] = "server";
            //frm.Controls.Add(gvDetail);

            //gvDetail.AllowPaging = false;
            //gvDetail.DataBind();

            //for (int i = 0; i < gvDetail.Rows.Count; i++)
            //{
            //    GridViewRow row = gvDetail.Rows[i];
            //    //Apply text style to each Row
            //    row.Attributes.Add("class", "text");
            //}

            //frm.RenderControl(htw);
            ////GridView1.RenderControl(htw);
            //string style = @"<style> .text { mso-number-format:\@; } </style>";
            //Response.Write(style);
            //Response.Write(sw.ToString());
            //Response.End();




            gvResults.HeaderRow.Style.Add("width", "30%");
            gvResults.HeaderRow.Style.Add("font-size", "13px");
            gvResults.HeaderRow.Style.Add("font-family", "verdana");
            gvResults.Style.Add("font-family", "verdana");
            gvResults.Style.Add("text-decoration", "none");
            gvResults.Style.Add("font-size", "11px");


            //gvDetail.Parent.Controls.Add(frm);
            //frm.Attributes["runat"] = "server";
            //frm.Controls.Add(gvDetail);

            gvResults.AllowPaging = false;
            gvResults.DataBind();

            for (int i = 0; i < gvResults.Rows.Count; i++)
            {
                //GridViewRow row = gvDetail.Rows[i];
                ////Apply text style to each Row
                //row.Attributes.Add("class", "text");

                for (int j = 0; j < gvResults.Columns.Count; j++)
                {
                    gvResults.Rows[i].Cells[j].Attributes.Add("class", "text");

                }
            }
            string style = @"<style> .text { mso-number-format:\@; } </style> ";
            Response.ClearContent();
            //Response.AddHeader("content-disposition", "attachment; filename=TransactionReport.xls");
            //Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            System.Web.UI.HtmlControls.HtmlForm hform = new System.Web.UI.HtmlControls.HtmlForm();
            gvResults.Parent.Controls.Add(hform);
            hform.Attributes["runat"] = "server";
            hform.Controls.Add(gvResults);
            hform.RenderControl(htw);
            Response.Write(style);
            Response.Write(" <span style='font-size:25px;font-weight:bold;font-family:verdana'> <center> Topup " + t_FileName + " Report</center></span> " + sw.ToString());
            Response.Flush();
            Response.End();

        }

        private string GetControlPropertyValue(System.Web.UI.Control control)
        {
            Type controlType = control.GetType();
            string strControlType = controlType.Name;
            string strReturn = "Error";
            bool bReturn;

            PropertyInfo[] ctrlProps = controlType.GetProperties();
            string ExcelPropertyName = (string)htControls[strControlType];
            if (ExcelPropertyName == null)
            {
                ExcelPropertyName = (string)htControls[control.GetType().BaseType.Name];
                if (ExcelPropertyName == null)
                    return strReturn;
            }
            foreach (PropertyInfo ctrlProp in ctrlProps)
            {
                if (ctrlProp.Name == ExcelPropertyName &&
                ctrlProp.PropertyType == typeof(String))
                {
                    try
                    {
                        strReturn = (string)ctrlProp.GetValue(control, null);
                        break;
                    }
                    catch
                    {
                        strReturn = "";
                    }
                }
                if (ctrlProp.Name == ExcelPropertyName &&
                ctrlProp.PropertyType == typeof(bool))
                {
                    try
                    {
                        bReturn = (bool)ctrlProp.GetValue(control, null);
                        strReturn = bReturn ? "True" : "False";
                        break;
                    }
                    catch
                    {
                        strReturn = "Error";
                    }
                }
                if (ctrlProp.Name == ExcelPropertyName &&
                ctrlProp.PropertyType == typeof(ListItem))
                {
                    try
                    {
                        strReturn = ((ListItem)(ctrlProp.GetValue(control, null))).Text;
                        break;
                    }
                    catch
                    {
                        strReturn = "";
                    }
                }
            }
            return strReturn;
        }

    }
}