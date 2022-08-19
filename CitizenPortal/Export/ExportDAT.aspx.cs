using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Configuration;
using System.Text.RegularExpressions;


namespace CitizenPortal.Export
{
    public partial class ExportDAT : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adp;
        SqlDataReader rd;
        DataSet ds;
        string query;
        DataTable dtTable = new DataTable();
        SqlConnection conself = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
        //public void dbcon()s
        //{
        //    string connn = (System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ToString());
        //    con = new SqlConnection(connn);
        //    con.Open();

        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            // gridbind();
        }
        protected void gridbind()
        {


        }
        protected void dat()
        {
            // gridbind();



            using (FileStream fs1 = new FileStream(Server.MapPath("~") + "//" + "myfile.dat", FileMode.Create))
            {
                string text1 = string.Empty;
                if (TextBox2.Text == "" || TextBox3.Text == "")
                {


                }
                else
                {
                    //text1 += "\r\n";
                    DateTime sdate = DateTime.Parse(TextBox2.Text);
                    string ssdate = sdate.Date.ToString("yyyy-MM-dd");
                    DateTime edate = DateTime.Parse(TextBox3.Text);
                    string eedate = edate.Date.ToString("yyyy-MM-dd");
                    //string que = "select * from emp1 where date between '" + ssdate + "' and '" + eedate + "'";
                    DataTable dt = new DataTable();

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());

                    try
                    {

                        cmd = new SqlCommand("SPV_GetReconDataSP", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@OMTID", string.Empty);
                        cmd.Parameters.AddWithValue("@StartDate", ssdate);
                        cmd.Parameters.AddWithValue("@EndDate", eedate);

                        con.Open();

                        using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        {
                            dt.Load(rdr);                        
                        }                    

                    }
                    catch (Exception ex)
                    {                       
                        throw ex;
                    }
                    finally
                    {
                        // trans.Dispose();
                        // con.Dispose();
                        con.Close();
                    }


                    //SqlDataAdapter da = new SqlDataAdapter(que, conself);
                    //DataSet ds = new DataSet();
                    //da.Fill(ds);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            foreach (TableCell Tblcell in row.Cells)
                            {
                                text1 += Tblcell.Text + "|";
                            }

                            text1 += "\r\n";
                        }

                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=" + DateTime.Now.ToString("yyyy-MM-dd") + ".dat");
                        Response.Charset = "";
                        Response.ContentType = "application/text1";
                        Response.Output.Write(text1);
                        Response.Flush();
                        Response.End();
                    }
                }
                //end trial code 2-------------------------------------------------------------------------------

            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        private void Download_File(string FilePath)
        {
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
            Response.WriteFile(FilePath);
            Response.End();
        }
        protected void Button7_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            dat();
            TextBox2.Text = "";
            TextBox3.Text ="";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
    }
}