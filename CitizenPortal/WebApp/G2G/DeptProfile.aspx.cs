using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.Script.Serialization;
using static CitizenPortal.Services.AddressService;
using System.IO;
using System.Text.RegularExpressions;
using Ganss.XSS;
using System.Data.SqlClient;
using SqlHelper;

namespace CitizenPortal.WebApp.G2G
{
    public partial class DeptProfile : AdminBasePage
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";

            if (((HiddenField)Page.Master.FindControl("HFLang")).Value != "")
            {
                if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "1")
                {
                    culture = "en-GB";
                }
                else if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "2")
                {
                    culture = "hi-IN";
                }
            }

            Session["CurrentCulture"] = culture;
            if (Session["LoginID"] != null)
            {
                HFLID.Value = Session["LoginID"].ToString();
            }
            else
            {
                HFLID.Value = "";
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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertDeptProfile(string prefix, string Data)
        {
            string text = "";
            try
            {
                string noNewLines = Data.Replace("\n", "");
                
                var sanitizer = new HtmlSanitizer();
                var html = noNewLines;
                var sanitized = sanitizer.Sanitize(html);
                noNewLines = sanitized;
                DeptProfile_DT viewModel = ToObjectFromJSON<DeptProfile_DT>(noNewLines);

                string URL = "";
                URL = m_ServiceURL;
                ServiceResult t_ServiceResult = new ServiceResult();



                string[] replaceThese = { "data:image/png;base64,", "data:image/jpeg;base64,", "data:image/jpg;base64," };
                string data = viewModel.Photo;

                bool iAlpha = IsAlphabets(viewModel.Name);

                foreach (string curr in replaceThese)
                {
                    data = data.Replace(curr, string.Empty);
                }

                byte[] toBytes = System.Convert.FromBase64String(data);

                //byte[] toBytes = System.Convert.FromBase64String(viewModel.Image);
                System.Drawing.Image newImage = ByteArrayToImage(toBytes);




                string signdata = viewModel.Sign;



                foreach (string curr in replaceThese)
                {
                    signdata = data.Replace(curr, string.Empty);
                }

                byte[] tosignBytes = System.Convert.FromBase64String(data);

                //byte[] toBytes = System.Convert.FromBase64String(viewModel.Image);
                System.Drawing.Image newSignImage = ByteArrayToImage(tosignBytes);



                string Chequedata = viewModel.Cheque;



                foreach (string curr in replaceThese)
                {
                    Chequedata = data.Replace(curr, string.Empty);
                }

                byte[] toChequeBytes = System.Convert.FromBase64String(data);

                //byte[] toBytes = System.Convert.FromBase64String(viewModel.Image);
                System.Drawing.Image newChequeImage = ByteArrayToImage(toChequeBytes);

                string Passportdata = viewModel.Passbook;



                foreach (string curr in replaceThese)
                {
                    Passportdata = data.Replace(curr, string.Empty);
                }

                byte[] toPassportBytes = System.Convert.FromBase64String(data);

                //byte[] toBytes = System.Convert.FromBase64String(viewModel.Image);
                System.Drawing.Image newPassportImage = ByteArrayToImage(toPassportBytes);

                if (newImage != null && iAlpha && newSignImage != null && newChequeImage != null && newPassportImage != null)
                {

                    SqlParameter[] parameter = {

                 new SqlParameter("@LoginID", viewModel.LoginID),
                 new SqlParameter("@StudentName", viewModel.Name),
                 new SqlParameter("@Name", viewModel.Name),
                 new SqlParameter("@Designation", viewModel.Designation),
                 new SqlParameter("@Gender", viewModel.Gender),
                 new SqlParameter("@Mobile", viewModel.Mobile),
                 new SqlParameter("@PhoneNo", viewModel.PhoneNo),
                 new SqlParameter("@MailID", viewModel.MailID),
                 new SqlParameter("@JoiningDate", viewModel.JoiningDate),
                 new SqlParameter("@EmpCode", viewModel.EmpCode),
                 new SqlParameter("@AadhaarNo", viewModel.AadhaarNo),
                 new SqlParameter("@Photo", viewModel.Photo),
                 new SqlParameter("@Sign", viewModel.Sign),
                 new SqlParameter("@IsParentIcomeTaxPayer", viewModel.IsParentIcomeTaxPayer),
                 new SqlParameter("@IsMessAvailable", viewModel.IsMessAvailable),
                 new SqlParameter("@IsKitchenAvailable", viewModel.IsKitchenAvailable),
                 new SqlParameter("@IsLibraryAvailable", viewModel.IsLibraryAvailable),
                 new SqlParameter("@IsPlaygroundAvailable", viewModel.IsPlaygroundAvailable),
                 new SqlParameter("@Cheque", viewModel.Cheque),
                 new SqlParameter("@Passbook", viewModel.Passbook),
            };



                    //DataTable dtAll = sqlhelper.ExecuteDataTable("InsertScholarShipDetailsSP", parameter);
                    DataSet result = sqlhelper.ExecuteDataTableNon("InsertDeptProfileSP", parameter);
                    DataTable dt = result.Tables[0];

                    text = "alert('Profile Updated Successfully.');";
                    return text;

                }


                return text;
            }
           
            catch (Exception ex)
            {
                return ex.Message;
            }
            
        }
        public static bool IsAlphabets(string inputString)
        {
            Regex r = new Regex("^[a-zA-Z ]+$");
            if (r.IsMatch(inputString))
                return true;
            else
                return false;
        }
        public static System.Drawing.Image ByteArrayToImage(byte[] bArray)
        {
            if (bArray == null)
                return null;

            System.Drawing.Image newImage;

            try
            {
                using (MemoryStream ms = new MemoryStream(bArray, 0, bArray.Length))
                {
                    ms.Write(bArray, 0, bArray.Length);
                    newImage = System.Drawing.Image.FromStream(ms, true);
                }
            }
            catch (Exception ex)
            {
                newImage = null;

                //Log an error here
            }

            return newImage;
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string EditProfile(string prefix)
        {
            string LoginID = "";
            int Department;

            LoginID = HttpContext.Current.Session["LoginID"].ToString();
            Department = Convert.ToInt32(HttpContext.Current.Session["Department"].ToString());

            DataTable DT = new DataTable();
            WorkFlowBLL m_workFlowBLL = new WorkFlowBLL();
            DT = m_workFlowBLL.EditProfile(LoginID, Department);
            DeptProfile_DT m_DeptProfile_DT = new DeptProfile_DT();

            if (DT.Rows.Count != 0)
            {
                m_DeptProfile_DT.Name= DT.Rows[0]["FirstName"].ToString();
                m_DeptProfile_DT.AadhaarNo= DT.Rows[0]["AadhaarNumber"].ToString();
                m_DeptProfile_DT.Designation = DT.Rows[0]["Designation"].ToString();
                m_DeptProfile_DT.MailID = DT.Rows[0]["EmailID"].ToString();
                m_DeptProfile_DT.Gender = DT.Rows[0]["Gender"].ToString();
                m_DeptProfile_DT.Mobile = DT.Rows[0]["MobileNo"].ToString();
                m_DeptProfile_DT.Photo = DT.Rows[0]["PhotoStr"].ToString();
                m_DeptProfile_DT.Sign = DT.Rows[0]["SignStr"].ToString();
                if (DT.Rows[0]["JoiningDate"].ToString() == null || DT.Rows[0]["JoiningDate"].ToString() != "") {
                    m_DeptProfile_DT.JoiningDate = Convert.ToDateTime(DT.Rows[0]["JoiningDate"].ToString()).ToString("dd/MM/yyyy");
                }
                m_DeptProfile_DT.IsParentIcomeTaxPayer = DT.Rows[0]["IsParentIcomeTaxPayer"].ToString();
                m_DeptProfile_DT.IsMessAvailable = DT.Rows[0]["IsMessAvailable"].ToString();
                m_DeptProfile_DT.IsKitchenAvailable = DT.Rows[0]["IsKitchenAvailable"].ToString();
                m_DeptProfile_DT.IsLibraryAvailable = DT.Rows[0]["IsLibraryAvailable"].ToString();
                m_DeptProfile_DT.IsPlaygroundAvailable = DT.Rows[0]["IsPlaygroundAvailable"].ToString();
                m_DeptProfile_DT.Cheque = DT.Rows[0]["Cheque"].ToString();
                m_DeptProfile_DT.Passbook = DT.Rows[0]["Passbook"].ToString();
            }
            return (new JavaScriptSerializer().Serialize(m_DeptProfile_DT));
        }
    }
}
