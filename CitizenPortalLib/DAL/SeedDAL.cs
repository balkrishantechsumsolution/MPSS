using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace CitizenPortalLib.DAL
{
    public class SeedDAL: DALBase
    {
        Database m_DataBase;

        public SeedDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SeedDAL()
            : base()
        {

        }

        public bool insertSeedLiciensingDtls(SeedLiBO SeedBO, string stroeProcName)
        {

            SqlCommand cmd;
            int result;
            try
            {


                cmd = DBCon.GetConnection(DBCon.ORFile).CreateCommand();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = stroeProcName;
                cmd.Parameters.Add(new SqlParameter("@App_no", SeedBO.App_no));
                cmd.Parameters.Add(new SqlParameter("@App_For", SeedBO.App_For));
                cmd.Parameters.Add(new SqlParameter("@Notified_Authority", SeedBO.Notified_Authority));
                cmd.Parameters.Add(new SqlParameter("@AthorityPlace", SeedBO.AthorityPlace));
                cmd.Parameters.Add(new SqlParameter("@AthorityDistrict", SeedBO.AthorityDistrict));
                cmd.Parameters.Add(new SqlParameter("@AthorityState", SeedBO.AthorityState));
                cmd.Parameters.Add(new SqlParameter("@DAO_Office", SeedBO.DAO_Office));
                cmd.Parameters.Add(new SqlParameter("@Bussiness_Type", SeedBO.Bussiness_Type));
                cmd.Parameters.Add(new SqlParameter("@Application_Date", SeedBO.Application_Date));
                cmd.Parameters.Add(new SqlParameter("@Name_of_Firm", SeedBO.Name_of_Firm));
                cmd.Parameters.Add(new SqlParameter("@Applicant_Type", SeedBO.Applicant_Type));
                cmd.Parameters.Add(new SqlParameter("@Applicant_Name", SeedBO.Applicant_Name));
                cmd.Parameters.Add(new SqlParameter("@Postal_Address", SeedBO.Postal_Address));
                cmd.Parameters.Add(new SqlParameter("@State", SeedBO.State));
                cmd.Parameters.Add(new SqlParameter("@District", SeedBO.District));
                cmd.Parameters.Add(new SqlParameter("@Block", SeedBO.Block));
                cmd.Parameters.Add(new SqlParameter("@Email", SeedBO.Email));
                cmd.Parameters.Add(new SqlParameter("@Pin_Code", SeedBO.Pin_Code));
                cmd.Parameters.Add(new SqlParameter("@MobileNo", SeedBO.MobileNo));
                cmd.Parameters.Add(new SqlParameter("@Telephone", SeedBO.Telephone));
                cmd.Parameters.Add(new SqlParameter("@Photo_ID_Type", SeedBO.Photo_ID_Type));
                cmd.Parameters.Add(new SqlParameter("@Photo_ID_Number", SeedBO.Photo_ID_Number));
                cmd.Parameters.Add(new SqlParameter("@Applicant_Photo_Path", SeedBO.Applicant_Photo_Path));
                cmd.Parameters.Add(new SqlParameter("@BAddress", SeedBO.BAddress));
                cmd.Parameters.Add(new SqlParameter("@BState", SeedBO.BState));
                cmd.Parameters.Add(new SqlParameter("@BDistrict", SeedBO.BDistrict));
                cmd.Parameters.Add(new SqlParameter("@BPin_Code", SeedBO.BPin_Code));
                cmd.Parameters.Add(new SqlParameter("@BBlock", SeedBO.BBlock));
                cmd.Parameters.Add(new SqlParameter("@BGP", SeedBO.BGP));
                cmd.Parameters.Add(new SqlParameter("@Company_Type", SeedBO.Company_Type));
                cmd.Parameters.Add(new SqlParameter("@Company_Name", SeedBO.Company_Name));
                cmd.Parameters.Add(new SqlParameter("@SOSAddress", SeedBO.SOSAddress));
                cmd.Parameters.Add(new SqlParameter("@Principal_Certificate_Path", SeedBO.Principal_Certificate_Path));
                cmd.Parameters.Add(new SqlParameter("@Doc_dtls_chk", SeedBO.Doc_dtls_chk));
                cmd.Parameters.Add(new SqlParameter("@Treasury_Name", SeedBO.Treasury_Name));
                cmd.Parameters.Add(new SqlParameter("@Challan_Number", SeedBO.Challan_Number));
                cmd.Parameters.Add(new SqlParameter("@Challan_Date", SeedBO.Challan_Date.Date));
                cmd.Parameters.Add(new SqlParameter("@Amount", SeedBO.Amount));
                cmd.Parameters.Add(new SqlParameter("@insert_dt", SeedBO.insert_dt));
                cmd.Parameters.Add(new SqlParameter("@update_dt", SeedBO.update_dt));
                cmd.Parameters.Add(new SqlParameter("@paidstatus", SeedBO.paidstatus));
                cmd.Parameters.Add(new SqlParameter("@Processing_Reg_No", SeedBO.Processing_Reg_No));
                cmd.Parameters.Add(new SqlParameter("@Issue_Date", SeedBO.Issue_Date));
                cmd.Parameters.Add(new SqlParameter("@Valid_Upto", SeedBO.Valid_Upto));
                if (cmd.Connection.State == ConnectionState.Closed)
                {

                    cmd.Connection.Open();
                }

                result = cmd.ExecuteNonQuery();

                cmd.Connection.Close();

                if (result == 1)
                {
                    return true;
                }            

                return false;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }

    public class DBCon
    {
        public static string _MapPath(string url)
        {
            return GetResource("lblQuickLinksDirectory") + url.Replace("/", "\\").ToString();
        }
        public static DataTable SelectTable(SqlParameter[] p, string StoreProcedure)
        {
            DataTable dt = null;
            SqlCommand command = null;
            SqlDataAdapter da = null;

            try
            {

                using (command = DBCon.GetConnection("").CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = StoreProcedure;
                    command.Parameters.AddRange(p);
                    using (da = new SqlDataAdapter(command))
                    {
                        dt = new DataTable();
                        da.Fill(dt);
                    }
                }

            }
            catch (Exception ex)
            {
                //DBCon.LogError(ex, "ORFile");
                throw ex;
            }

            return dt;

        }
        public static DataSet Selectdataset(SqlParameter[] p, string StoreProcedure)
        {
            DataSet ds = null;
            SqlCommand command = null;
            SqlDataAdapter da = null;

            try
            {

                using (command = DBCon.GetConnection(DBCon.ORFile).CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = StoreProcedure;
                    command.Parameters.AddRange(p);
                    using (da = new SqlDataAdapter(command))
                    {
                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }

            }
            catch (Exception ex)
            {
                // DBCon.LogError(ex, "ORFile");
                throw ex;
            }

            return ds;

        }

        public static void BindDropDownList(DropDownList drp, string flag, string examCode, string command)
        {
            try
            {
                SqlParameter[] sqlprom = new SqlParameter[3];

                sqlprom[0] = new SqlParameter("@flag", flag);
                sqlprom[1] = new SqlParameter("@Name", command);
                sqlprom[2] = new SqlParameter("@Examcode", examCode);
                drp.DataTextField = "OptionText";
                drp.DataValueField = "OptionValue";
                drp.DataSource = DBCon.SelectTable(sqlprom, "USPGetDataSet");
                drp.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void BindCategoryList(RadioButtonList rdb, string flag, string examCode, string command)
        {
            try
            {
                SqlParameter[] sqlprom = new SqlParameter[3];

                sqlprom[0] = new SqlParameter("@flag", flag);
                sqlprom[1] = new SqlParameter("@Name", command);
                sqlprom[2] = new SqlParameter("@Examcode", examCode);
                rdb.DataTextField = "OptionText";
                rdb.DataValueField = "OptionValue";
                rdb.DataSource = DBCon.SelectTable(sqlprom, "USPGetDataSet");
                rdb.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void BindCheckList(CheckBoxList chk, string flag, string examCode, string command)
        {
            try
            {
                SqlParameter[] sqlprom = new SqlParameter[3];

                sqlprom[0] = new SqlParameter("@flag", flag);
                sqlprom[1] = new SqlParameter("@Name", command);
                sqlprom[2] = new SqlParameter("@Examcode", examCode);
                chk.DataTextField = "OptionText";
                chk.DataValueField = "OptionValue";
                chk.DataSource = DBCon.SelectTable(sqlprom, "USPGetDataSet");
                chk.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ListItem> WebmethodDRPRDOBind(string flag, string ExamCode, string Command)
        {
            SqlParameter[] sqlprom = new SqlParameter[3];

            sqlprom[0] = new SqlParameter("@flag", flag);
            sqlprom[1] = new SqlParameter("@Name", Command);
            sqlprom[2] = new SqlParameter("@Examcode", ExamCode);
            DataTable dt = DBCon.SelectTable(sqlprom, "USPGetDataSet");
            List<ListItem> ListCollection = new List<ListItem>();

            if (dt.Rows.Count > 0)
            {

                foreach (DataRow row in dt.Rows)
                {

                    ListCollection.Add(new ListItem
                    {
                        Value = row["OptionValue"].ToString(),
                        Text = row["OptionText"].ToString()
                    });

                }


            }
            return ListCollection;


        }


        public static string ORFile
        {
            get
            {
                return GetResource("lblORFile");
            }
        }
        public static string Server
        {
            get { return GetResource("lblServer"); }
        }
        public static string UserId
        {
            get { return GetResource("lblUID"); }
        }
        public static string Password
        {
            get
            {
                return GetResource("lblPassword");
            }
        }
        private static string GetResource(string ClassKey, string Label)
        {
            object obj = System.Web.HttpContext.GetGlobalResourceObject(ClassKey, Label);
            if (obj == null) { throw new Exception("Resource Object '" + Label + "' not found at '" + ClassKey + "'"); }
            return StringValue(obj);
        }
        private static string StringValue(object obj)
        {
            return (obj == null) ? null : obj.ToString();
        }
        private static string GetResource(string Label)
        {
            return GetResource("resource", Label);
        }

        public static SqlConnection GetConnection(string database)
        {

            //string server = Server;
            //string uid = UserId;
            //string pwd = Password;
            string server = "";
            string uid = "";
            string pwd = "";        
            //string database = Databases.MainDatabase;
            return GetConnection(server, uid, pwd, database);


        }
        private static SqlConnection GetConnection(string server,
                                                 string userName,
                                                  string password,
                                                  string database)
        {
            
            string connectionString = "server=" + server + ";"
                 + "uid=" + userName + ";"
               + "pwd=" + password + ";"

                 + "database=" + database;
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
            //string connectionString = @"server=LAPTOP-64\MSSQL2012;"
            //     + "uid=sa;"
            //   + "pwd=MPO@12345;"

            //     + "database=" + database;
            return (new SqlConnection(connectionString));


        }

        //For INSERT,UPDATE purpose
        public static string MMDD4Y(string DDMM4Y)
        {
            DateTime dt = Convert.ToDateTime(DDMM4Y, new CultureInfo("en-GB").DateTimeFormat);
            return dt.ToString("MM/dd/yyyy", new CultureInfo("en-US").DateTimeFormat);
        }
        //For FETCH purpose
        public static string DDMM4Y(string MMDD4Y)
        {
            DateTime dt = Convert.ToDateTime(MMDD4Y, new CultureInfo("en-US").DateTimeFormat);
            return dt.ToString("dd/MM/yyyy", new CultureInfo("en-GB").DateTimeFormat);
        }
        public static string MMDD4Y_Time(string DDMM4Y_Time)
        {
            DateTime dt = Convert.ToDateTime(DDMM4Y_Time, new CultureInfo("en-GB").DateTimeFormat);
            return dt.ToString(new CultureInfo("en-US").DateTimeFormat);
        }
        public static string DDMM4Y_Time(string MMDD4Y_Time)
        {
            DateTime dt = Convert.ToDateTime(MMDD4Y_Time, new CultureInfo("en-US").DateTimeFormat);
            return dt.ToString(new CultureInfo("en-GB").DateTimeFormat);
        }
        public static string GetCurrentDateTime(bool isEN_US)
        {
            string cul = isEN_US ? "en-US" : "en-GB";
            DateTimeFormatInfo DtFormat = new CultureInfo(cul, false).DateTimeFormat;
            return DateTime.Now.ToString("G", DtFormat);

        }


    }

    public class Validations
    {
        public Validations()
        {

        }
        //For Custom Expression Validation
        public bool CheckValidate(string Value, string ValidExp, bool IsMandatory)
        {
            if (!IsMandatory) //if field is optional 
            {
                if (Value.Length == 0) { return true; } //if field is optional 
                else
                {
                    if (!Regex.IsMatch(Value, ValidExp)) { return false; }
                    else { return true; }
                }
            }
            if (!Regex.IsMatch(Value, ValidExp))
            {
                return false;
            }

            else
            {
                return true;
            }
        }
        public bool BlockDuplicateCharater(TextBox txtcontain)
        {
            if (txtcontain.Text.Trim().Contains("0000"))
            {
                return false;

            }
            if (txtcontain.Text.Trim().Contains("...."))
            {
                return false;

            }
            return true;
        }
        private void ValidateRadio(RadioButtonList radio, string Msg)
        {
            if (radio.SelectedIndex == -1) { radio.Focus(); throw new Exception("Please select one of the options in " + Msg + "."); }
        }
        private void Validatedrp(DropDownList drp, string Msg)
        {
            if (drp.SelectedValue.Trim() == "0") { drp.Focus(); throw new Exception("Please select one of the options in " + Msg + "."); }
        }

    }
}
