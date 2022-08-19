using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mail;
using System.Text;
using System.Diagnostics;
using System.Data.OleDb;

/// <summary>
/// Summary description for ExceptionHandler
/// </summary>
namespace CitizenPortalLib
{
    public class LogException
    {
        public LogException() //ctor
        {
        }

        public void HandleException(Exception ex)
        {
            if (ex == null) return;

            HttpContext ctx = HttpContext.Current;
            string strData = String.Empty;
            string t_FormattedExceptionDetail = string.Empty;
        
            string referer = String.Empty;

            if (ctx.Request.ServerVariables["HTTP_REFERER"] != null)
            {
                referer = ctx.Request.ServerVariables["HTTP_REFERER"].ToString();
            }

            string sForm =
                (ctx.Request.Form != null) ? ctx.Request.Form.ToString() : String.Empty;

            string logDateTime = DateTime.Now.ToString();
            string sQuery = (ctx.Request.QueryString != null) ?
                ctx.Request.QueryString.ToString() : String.Empty;
            
            strData = FormatExceptionDescription(ex);
            t_FormattedExceptionDetail = GetFormattedExceptionDetail(ex);

            try
            {
                if (ctx.Session != null)
                    ctx.Session["Exception"] = t_FormattedExceptionDetail;                
            }
            catch
            {
            }

        }

        string GetFormattedExceptionDetail(Exception ex)
        {
            // Code that runs when an unhandled error occurs    

            HttpContext ctx = HttpContext.Current;

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("<b>Message</b>: <b>" + ex.Message.ToString() + "</b><br />");
            sb.AppendLine("<b>Exception</b>: " + ex.GetType().ToString() + "<br />");

            if (ex.TargetSite != null)
                sb.AppendLine("<b>Targetsite</b>: " + ex.TargetSite.ToString() + "<br />");

            sb.AppendLine("<b>Source</b>: " + ex.Source + "<br />");
            sb.AppendLine("<b>StackTrace</b>: " + ex.StackTrace.ToString().Replace(Environment.NewLine, "<br />") + "<br />");

            sb.AppendLine("<b>Data count</b>: " + ex.Data.Count.ToString() + "<br />");

            if (ex.Data.Count > 0)
            {
                HtmlTable tbl = new HtmlTable();
                tbl.Border = 1;

                HtmlTableRow htr = new HtmlTableRow();

                HtmlTableCell htc1 = new HtmlTableCell();
                HtmlTableCell htc2 = new HtmlTableCell();
                HtmlTableCell htc3 = new HtmlTableCell();
                HtmlTableCell htc4 = new HtmlTableCell();

                htc1.InnerHtml = "<b>Key</b>";
                htc2.InnerHtml = "<b>Value</b>";
                htc3.InnerHtml = "Key Type";
                htc4.InnerHtml = "Value Type";

                htr.Cells.Add(htc1);
                htr.Cells.Add(htc2);
                htr.Cells.Add(htc3);
                htr.Cells.Add(htc4);

                tbl.Rows.Add(htr);

                foreach (System.Collections.DictionaryEntry de in ex.Data)
                {
                    HtmlTableRow tr = new HtmlTableRow();

                    HtmlTableCell tc1 = new HtmlTableCell();
                    HtmlTableCell tc2 = new HtmlTableCell();
                    HtmlTableCell tc3 = new HtmlTableCell();
                    HtmlTableCell tc4 = new HtmlTableCell();

                    tc1.InnerHtml = "<b>" + de.Key + "</b>";
                    tc2.InnerHtml = "<b>" + de.Value + "</b>";

                    tc3.InnerHtml = de.Key.GetType().Name;
                    tc4.InnerHtml = de.Value.GetType().Name;

                    tc3.Align = "center";
                    tc4.Align = "center";

                    tr.Cells.Add(tc1);
                    tr.Cells.Add(tc2);
                    tr.Cells.Add(tc3);
                    tr.Cells.Add(tc4);

                    tbl.Rows.Add(tr);
                }
                StringBuilder tblSb = new StringBuilder();
                System.IO.StringWriter sw = new System.IO.StringWriter(tblSb);
                HtmlTextWriter htw = new HtmlTextWriter(sw);

                tbl.RenderControl(htw);

                sb.AppendLine(tblSb.ToString());
            }


            sb.AppendLine("<br />");
            sb.AppendLine("<b>Exception</b>: " + ex.ToString().Replace(Environment.NewLine, "<br />") + "<br />");

            return sb.ToString();
            //ctx.Response.Redirect("~/ExceptionMessage.aspx");
        }

        string FormatExceptionDescription(Exception e)
        {
            StringBuilder sb = new StringBuilder();
            HttpContext context = HttpContext.Current;

            sb.Append("Time of Error: " + DateTime.Now.ToString("yyyy-MM-dd HH:MM:ss") + Environment.NewLine);

            if (context.Session != null)
            {
                if (context.Session["ConfigID"] != null)
                {
                    sb.AppendLine("\r\nConfig ID: " +
                        context.Session["ConfigID"].ToString() + "\r\n");
                }

                if (context.Session["DBConnection"] != null)
                {
                    sb.AppendLine("\r\nConnection String: " +
                        context.Session["DBConnection"].ToString() + "\r\n");
                }

                if (context.Session["Emp_ID"] != null)
                {
                    sb.AppendLine(Environment.NewLine + "Employee ID: " +
                        context.Session["Emp_ID"].ToString() + Environment.NewLine);
                }
            }

            sb.Append("\r\nURL: " + context.Request.Url + Environment.NewLine);
            sb.Append("\r\nForm: " + context.Request.Form.ToString() + Environment.NewLine);
            sb.Append("\r\nQueryString: " + context.Request.QueryString.ToString() + Environment.NewLine);
            sb.Append("\r\nServer Name: " + context.Request.ServerVariables["SERVER_NAME"] + Environment.NewLine);
            sb.Append("\r\nUser Agent: " + context.Request.UserAgent + Environment.NewLine);
            sb.Append("\r\nUser IP: " + context.Request.UserHostAddress + Environment.NewLine);
            sb.Append("\r\nUser Host Name: " + context.Request.UserHostName + Environment.NewLine);
            sb.Append("\r\nUser is Authenticated: " + context.User.Identity.IsAuthenticated.ToString() + Environment.NewLine);
            sb.Append("\r\nUser Name: " + context.User.Identity.Name + Environment.NewLine);


            while (e != null)
            {
                sb.Append("\r\nMessage: " + e.Message + Environment.NewLine);
                sb.Append("\r\nSource: " + e.Source + Environment.NewLine);
                sb.Append("\r\nTargetSite: " + e.TargetSite + Environment.NewLine);
                sb.Append("\r\nStackTrace: " + e.StackTrace + Environment.NewLine);
                sb.Append(Environment.NewLine + Environment.NewLine);

                e = e.InnerException;
            }

            sb.Append("\n\n");
            return sb.ToString();
        }
    }
}
