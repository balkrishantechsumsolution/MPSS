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
    public partial class ExportAll : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adp;
        SqlDataReader rd;
        DataSet ds;
        string query;
        DataTable dtTable = new DataTable();
        SqlConnection conself = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        //public void dbcon()
        //{
        //    string connn = (System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ToString());
        //    con = new SqlConnection(connn);
        //    con.Open();

        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            // gridbind();
        }
        protected void gridbind()
        {
            if (TextBox2.Text == "" || TextBox3.Text == "")
            {
            }
            else
            {
                DateTime sdate = DateTime.Parse(TextBox2.Text);
                string ssdate = sdate.Date.ToString("yyyy-MM-dd");
                DateTime edate = DateTime.Parse(TextBox3.Text);
                string eedate = edate.Date.ToString("yyyy-MM-dd");
                string que = "select * from emp1 where date between '" + ssdate + "' and '" + eedate + "'";
                SqlDataAdapter da = new SqlDataAdapter(que, conself);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        protected void dat()
        {
            gridbind();



            //StreamReader objInput = new StreamReader("d:\\values.dat", System.Text.Encoding.Default);
            //string contents = objInput.ReadToEnd().Trim();
            //string[] split = System.Text.RegularExpressions.Regex.Split(contents, "\\s+", RegexOptions.None);
            //StringBuilder sb = new StringBuilder();
            //foreach (string s in split)
            //{
            //    sb.AppendLine(s);
            //}
            //show string
            // MessageBox.Show(sb.ToString());

            //string text = string.Empty;

            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    foreach (TableCell Tblcell in row.Cells)
            //    {

            //        text += Tblcell.Text + ",";
            //        FileStream myFile = File.Create(Server.MapPath("myFile.dat"));
            //        BinaryWriter binaryfile = new BinaryWriter(myFile);
            //        string myString = text;
            //        binaryfile.Write(myString);
            //        binaryfile.Close();
            //        myFile.Close();
            //    }


            //}



            ////start trial code 1
            //using (FileStream fs = new FileStream(@"d:\myfile.dat", FileMode.Create))
            //{
            //    string text = string.Empty;
            //    text += "\r\n";
            //    foreach (GridViewRow row in GridView1.Rows)
            //    {
            //        foreach (TableCell Tblcell in row.Cells)
            //        {
            //            text += Tblcell.Text + ",";
            //        }

            //        text += "\r\n";
            //    }
            //    Response.Clear();
            //    Response.Charset = "";
            //    Response.ContentType = "application/text";
            //    Response.Write(text);
            //    Response.End();
            //    //fs.Seek(5, SeekOrigin.Begin);
            //    //fs.Write(Encoding.ASCII.GetBytes("String1"), 0, "String1".Length);
            //    //fs.Seek(45, SeekOrigin.Begin);
            //    //fs.Write(Encoding.ASCII.GetBytes("String2"), 0, "String2".Length);
            //    //fs.Seek(78, SeekOrigin.Begin);
            //    //fs.Write(Encoding.ASCII.GetBytes("String3"), 0, "String3".Length);

            //    //end trial code 1

            //start trial code2-----------------------------------------------------------------
            using (FileStream fs1 = new FileStream(@"d:\myfile.dat", FileMode.Create))
            {
                string text1 = string.Empty;

                //text1 += "\r\n";


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
                Response.AddHeader("content-disposition", "attachment;filename=Gridtxt.dat");
                Response.Charset = "";
                Response.ContentType = "application/text1";
                Response.Output.Write(text1);
                Response.Flush();
                Response.End();

                //end trial code 2-------------------------------------------------------------------------------

            }
        }
        protected void txt()
        {
            gridbind();
            string text = string.Empty;

            foreach (TableCell Tblcell in GridView1.HeaderRow.Cells)
            {

                text += Tblcell.Text + "\t\t";
            }


            text += "\r\n";

            foreach (GridViewRow row in GridView1.Rows)
            {
                foreach (TableCell Tblcell in row.Cells)
                {
                    text += Tblcell.Text + "\t\t";
                }

                text += "\r\n";
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Gridtxt.txt");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.Output.Write(text);
            Response.Flush();
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void csv()
        {
            gridbind();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridCsv.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            StringBuilder str = new StringBuilder();
            for (int k = 0; k < GridView1.Columns.Count; k++)
            {
                str.Append(GridView1.Columns[k].HeaderText + ',');
            }

            str.Append("\r\n");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                for (int k = 0; k < GridView1.Columns.Count; k++)
                {
                    str.Append(GridView1.Rows[i].Cells[k].Text + ',');
                }

                str.Append("\r\n");
            }

            Response.Output.Write(str.ToString());
            Response.Flush();
            Response.End();
        }
        protected void doc()
        {
            gridbind();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
            "attachment;filename=GridDoc.doc");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        protected void html()
        {
            HtmlForm form = new HtmlForm();
            GridView1.AllowPaging = false;
            gridbind();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=GridHtml.html");
            Response.Charset = "";
            Response.ContentType = "text/html";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            form.Attributes["runat"] = "server";
            form.Controls.Add(GridView1);
            this.Controls.Add(form);
            Form.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        protected void pdf()
        {
            gridbind();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridPdf.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.RenderControl(hw);
            GridView1.HeaderRow.Style.Add("width", "15%");
            GridView1.HeaderRow.Style.Add("font-size", "10px");
            GridView1.Style.Add("text-decoration", "none");
            GridView1.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            GridView1.Style.Add("font-size", "8px");
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        protected void excel()
        {
            gridbind();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=GridExcel.xls");
            Response.ContentType = "application/excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
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
            string strFileType;
            strFileType = DropDownList1.Text.ToString();
            switch (strFileType)
            {
                case "HTML File":
                    html();
                    break;
                case "Word File":
                    doc();
                    break;
                case "Text File":
                    txt();
                    break;
                case "Excel File":
                    excel();
                    break;
                case "PDF File":
                    pdf();
                    break;
                case "CSV File":
                    csv();
                    break;
           
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox2.Text==""|| TextBox3.Text=="")
            {
            }
            else
            {

                DateTime sdate = DateTime.Parse(TextBox2.Text);
                string ssdate = sdate.Date.ToString("yyyy-MM-dd");
                DateTime edate = DateTime.Parse(TextBox3.Text);
                string eedate = edate.Date.ToString("yyyy-MM-dd");
                string que = "select * from emp1 where date between '" + ssdate + "' and '" + eedate + "'";
                SqlDataAdapter da = new SqlDataAdapter(que, conself);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Panel1.Visible = true;
            }
           
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            gridbind();
        }
    }
}