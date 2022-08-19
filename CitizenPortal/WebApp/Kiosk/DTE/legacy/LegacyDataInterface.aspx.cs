using AjaxControlToolkit;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DTE.legacy
{
    public partial class LegacyDataInterface : BasePage
    {
        string id = "";
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
            }
            else
            {
                if (HFInstitude.Value != null && HFInstitude.Value != "" ||
                    HFBranch.Value != null && HFBranch.Value != "" ||
                    HFRegistration.Value != null && HFRegistration.Value != ""
                    || HFStudentName.Value != null && HFStudentName.Value != "")
                {

                    ddlinstitude.SelectedValue = HFInstitude.Value;
                    DropDownList1.SelectedValue = HFBranch.Value;   
                    txtRegistration.Text = HFRegistration.Value;
                    txtStudentName.Text = HFStudentName.Value;
                    

                }
           
            }
           


        }

        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (HttpContext.Current.Session["G2GID"] != null)
            {
                ID = HttpContext.Current.Session["G2GID"].ToString();
            }
            else if (HttpContext.Current.Session["KioskID"] != null)
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }
            else if (HttpContext.Current.Session["CitizenID"] != null)
            {
                ID = HttpContext.Current.Session["CitizenID"].ToString();
            }

            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }
        public class ListItem
        {
            public string Name { get; set; }
            public string Id { get; set; }
        }
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[WebMethod]
        //public static List<ListItem> StateData()
        //{
        //    using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.CommandText = "SELECT * FROM CensusDistrictMaster WHERE STATE_Code=21 ORDER BY DISTRICT";
        //            cmd.Connection = con;
        //            List<ListItem> AllState = new List<ListItem>();
        //            cmd.CommandType = CommandType.Text;
        //            con.Open();
        //            using (SqlDataReader sdr = cmd.ExecuteReader())
        //            {
        //                while (sdr.Read())
        //                {
        //                    AllState.Add(new ListItem
        //                    {
        //                        Name = sdr["DISTRICT"].ToString(),
        //                        Id = sdr["DISTRICT_CODE"].ToString()
        //                    });
        //                }
        //            }
        //            con.Close();
        //            return AllState;
        //        }
        //    }
        //}


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
         
            //if (txtRegistration.Text == null || txtRegistration.Text == "")

            //{
            //    string m_Message = "Please Enter the Registration Number. ";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='", true);
            //    string message = "alert('Please Enter the Registration Number')";
            //    ToolkitScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "alert", message, true);

            //}
            //else if (txtStudentName.Text == null || txtStudentName.Text == "")
            //{
            //    string m_Message = "Please Enter the Student Name. ";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='", true);
            //    string message = "alert('Please Enter the Student Name')";
            //    ToolkitScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "alert", message, true);

            //}


            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetDTELegacyInterfaceData";


                cmd.Parameters.Add("@AcadmicYear", SqlDbType.NVarChar).Value = ddladmissionyear.SelectedValue;
                cmd.Parameters.Add("@InstitudeName", SqlDbType.NVarChar).Value = HFInstitude.Value == "-Select Institute Name-" ? "0" : HFInstitude.Value;
                cmd.Parameters.Add("@BranchName", SqlDbType.NVarChar).Value = HFBranch.Value == "-Select Branch Name-" ? "0" : HFBranch.Value;

                cmd.Parameters.Add("@RegistrationNo", SqlDbType.VarChar).Value = txtRegistration.Text;
                cmd.Parameters.Add("@studentname", SqlDbType.VarChar).Value = txtStudentName.Text;



                cmd.Connection = con;
                con.Open();
                //con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                dt.Load(rdr);
                con.Close();

            }
            if (dt == null || dt.Rows.Count == 0)
            {
                //string message = "alert('No Record Found')";
                DataTable dt2 = new DataTable();
                Gridview1.DataSource = dt2;
                Gridview1.DataBind();
                //ToolkitScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "alert", message, true);
               

            }
            else
            {
                ddlinstitude.SelectedValue = HFInstitude.Value;
                DropDownList1.SelectedValue = HFBranch.Value;
                Gridview1.DataSource = dt;
                Gridview1.DataBind();
            }
        }

        protected void Gridview1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            semesterDtlTble.Visible = true;
            try
            {
                if (e.CommandName == "Action")
                {

                    var value = e.CommandArgument;
                    //LinkButton lnkid = (LinkButton)Gridview1.FindControl("LinkButton1");
                    DataTable dt = new DataTable();

                    using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
                    {
                        SqlCommand cmd = new SqlCommand();

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "GetDTELegacysemesterData";


                        cmd.Parameters.Add("@Registrationnumber", SqlDbType.VarChar).Value = id;
                        //cmd.Parameters.Add("@studentname", SqlDbType.VarChar).Value = txtStudentName.Text;



                        cmd.Connection = con;
                        con.Open();

                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        dt.Load(rdr);
                        con.Close();

                    }
                    Gridview2.DataSource = dt;
                    Gridview2.DataBind();
                    //Gridview1.Visible = false;
                    //CandiadateDetails.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton LnkBtn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)LnkBtn.NamingContainer;
                    Label lblRegID = (Label)row.FindControl("lblRegdNo");
                 id = lblRegID.Text;
            }
            catch (Exception ex)
            {

            }
        }


        [WebMethod]
        public static string GetInstituteMaster(string prefix)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetCollegeMaster();

                }
            }
            
            return text;

        }

        [WebMethod]
        public static string GetBranchMaster(string prefix)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetSUBranchMaster();

                }
            }

            return text;

        }
    }
}