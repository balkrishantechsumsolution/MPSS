using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.ServiceModel.Dispatcher;
using System.Web;

namespace CitizenPortal.Services
{
    public class GlobalErrorHandler : IErrorHandler
    {
        public bool HandleError(Exception error)
        {
            return true;
        }

        public void ProvideFault(Exception error,
           System.ServiceModel.Channels.MessageVersion version,
           ref System.ServiceModel.Channels.Message fault)
        {
            //my code start
            string url = HttpContext.Current.Request.Url.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
            string que = "select logid from Tbl_ExceptionLoggingToDataBase order by logid desc";
            SqlDataAdapter da = new SqlDataAdapter(que, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                int id = int.Parse(dt.Rows[0]["logid"].ToString());
                int next = id + 1;

                //start
                //Exception ex = Server.GetLastError();

                //Exception exMsg = Server.GetLastError().GetBaseException();
                // string previousPageUrl = HttpContext.Current.Request.UrlReferrer.ToString(); ;
                // string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string msg = error.Message.ToString();

                string stackTrace = error.StackTrace.ToString();

                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CharpCorner"].ToString());

                SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ExceptionMsg", msg.ToString());
                com.Parameters.AddWithValue("@ExceptionType", error.GetType().ToString());
                com.Parameters.AddWithValue("@ExceptionSource", stackTrace.ToString());
                com.Parameters.AddWithValue("@ExceptionURL", url.ToString());
                con.Open();
                com.ExecuteNonQuery();
                con.Close();


                // HttpContext.Current.Response.Redirect("~/HttpErrorPage.aspx?code=" + next.ToString());
                //Response.Redirect("~/HttpErrorPage.aspx?msg=" + msg.ToString() + "&type=" + ex.GetType().ToString() + "&trace=" + Server.UrlEncode(stackTrace.ToString()) + "&url=" + url.ToString());


                //Response.Redirect("~/HttpErrorPage.aspx?msg="+msg.ToString()+"&type="+ex.GetType().ToString()+"&trace="+ex.Message.ToString());

                //end
            }
            else
            {

                //start
                //Exception ex = Server.GetLastError();

                //Exception exMsg = Server.GetLastError().GetBaseException();
                //string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string msg = error.Message.ToString();

                string stackTrace = error.StackTrace.ToString();

                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CharpCorner"].ToString());

                SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ExceptionMsg", msg.ToString());
                com.Parameters.AddWithValue("@ExceptionType", error.GetType().ToString());
                com.Parameters.AddWithValue("@ExceptionSource", stackTrace.ToString());
                com.Parameters.AddWithValue("@ExceptionURL", url.ToString());
                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                //WebOperationContext.Current.OutgoingResponse.Location = "~/HttpErrorPage.aspx?code=" + 1;



                //HttpContext.Current.Response.Redirect("~/HttpErrorPage.aspx?code=" + 1);
                //Response.Redirect("~/HttpErrorPage.aspx?msg=" + msg.ToString() + "&type=" + ex.GetType().ToString() + "&trace=" + Server.UrlEncode(stackTrace.ToString()) + "&url=" + url.ToString());


                //Response.Redirect("~/HttpErrorPage.aspx?msg="+msg.ToString()+"&type="+ex.GetType().ToString()+"&trace="+ex.Message.ToString());

                //end
            }


            //my code end

            //var newEx = new FaultException(
            //string.Format("Exception caught at Service Application GlobalErrorHandler{ 0 }Method: { 1}{ 2}Message: { 3}", Environment.NewLine, error.TargetSite.Name,    Environment.NewLine, error.Message));

            //MessageFault msgFault = newEx.CreateMessageFault();
            //fault = Message.CreateMessage(version, msgFault, newEx.Action);
        }

    }
}