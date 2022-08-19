using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using System.Drawing;

namespace SambalpurConsole
{
    class Program
    {
        static string m_LogFilePath = "";
        static Log m_Log = new Log();
        static string m_Path_Photo, m_Path_Sign;

        static void Main(string[] args)
        {
            try
            {
                GetStudentImage();
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }

        }

        static void GetStudentImage()
        {
            string t_LogFileName = "StudentLog_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            t_LogFilePath = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location), "Logs", t_LogFileName);
            m_LogFilePath = t_LogFilePath;

            m_Log.FileName = m_LogFilePath;

            m_Path_Sign = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location), "StudentImages/Signature/");
            m_Path_Photo = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location), "StudentImages/Photo/");

            //Check if directory exist
            if (!System.IO.Directory.Exists(m_Path_Sign))
            {
                System.IO.Directory.CreateDirectory(m_Path_Sign); //Create directory if it doesn't exist
            }

            DataTable t_ImageDT = null;
            DataTable t_UpdateDT = null;

            var RollNo = "";
            var random = new Random();
            string uniquekey = "";
            string Base64Image = "";
            string Base64Sign = "";
            string s = string.Empty;
            bool t_Result_Photo = false;
            bool t_Result_Sign = false;

            for (int i = 0; i < 10; i++)
                s = String.Concat(s, random.Next(10).ToString());

            uniquekey = s;
            t_ImageDT = GetImageData();

            for (int i = 0; i < t_ImageDT.Rows.Count; i++)
            {
                try
                {
                    Base64Image = t_ImageDT.Rows[i]["BaseImage"].ToString();
                    Base64Sign = t_ImageDT.Rows[i]["BaseSign"].ToString();
                    RollNo = t_ImageDT.Rows[i]["RollNo"].ToString();

                    //conversion Logic
                    if (Base64Image != "")
                    {
                        t_Result_Photo = SaveImage(Base64Image, RollNo, m_Path_Photo);
                        t_UpdateDT = UpdateImageData("Photo", RollNo, uniquekey, t_Result_Photo, false);
                    }

                    if (Base64Sign != "")
                    {
                        t_Result_Sign = SaveImage(Base64Sign, RollNo, m_Path_Sign);
                        t_UpdateDT = UpdateImageData("Signature", RollNo, uniquekey, false, t_Result_Sign);
                    }

                   
                    m_Log.WriteToLog(Environment.NewLine);
                    m_Log.WriteToLog(Environment.NewLine);
                    m_Log.WriteToLog(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    m_Log.WriteToLog(RollNo);
                }
                catch(Exception e)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                    Console.WriteLine("Error: " + e.Message);
                }
                
            }
        }

        private static DataTable GetImageData()
        {
            DataTable t_DT = null;

            string connString = "Data Source=192.168.31.10\\testing;Initial Catalog=Sambalpur_MasterDB;User ID=devuser; Password=devuser;";
            //string connString = "Data Source=10.1.77.36\\CSCG2CDB01;Initial Catalog=MasterDB;User ID=devuser; Password=devuser";
            string sql = "GetStudentImageSP";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = new SqlCommand(sql, conn);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.SelectCommand.CommandTimeout = 5 * 60;

                        //da.SelectCommand.Parameters.AddWithValue("@AdmissionYear", AdmissionYear);

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        t_DT = ds.Tables[0];

                    }
                }
                catch (XmlException ex)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", ex.Message, ex.StackTrace));
                    Console.WriteLine("SQL Error: " + ex.Message);

                }
                catch (Exception e)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                    Console.WriteLine("Error: " + e.Message);
                }
            }

            return t_DT;
        }

        private static DataTable UpdateImageData(string Status, string RollNo, string uniquekey, bool t_Result_Photo, bool t_Result_Sign)
        {
            DataTable t_DT = null;

            string connString = "Data Source=192.168.31.10\\testing;Initial Catalog=Sambalpur_MasterDB;User ID=devuser; Password=devuser;";
            //string connString = "Data Source=10.1.77.36\\CSCG2CDB01;Initial Catalog=MasterDB;User ID=devuser; Password=devuser";
            string sql = "UpdateStudentImageSP";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = new SqlCommand(sql, conn);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.SelectCommand.Parameters.AddWithValue("@RollNo", RollNo);
                        da.SelectCommand.Parameters.AddWithValue("@Status", Status);
                        da.SelectCommand.Parameters.AddWithValue("@UniqueKey", uniquekey);
                        da.SelectCommand.Parameters.AddWithValue("@ResultSign", t_Result_Sign);
                        da.SelectCommand.Parameters.AddWithValue("@ResultPhoto", t_Result_Photo);
                    
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        t_DT = ds.Tables[0];

                    }
                }
                catch (XmlException ex)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", ex.Message, ex.StackTrace));
                    Console.WriteLine("SQL Error: " + ex.Message);

                }
                catch (Exception e)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                    Console.WriteLine("Error: " + e.Message);
                }
            }

            return t_DT;
        }
        private static DataTable UpdateImageData(string Flag, string RollNo, string UniqueKey)
        {
            DataTable t_DT = null;

            //string connString = "Data Source=192.168.31.10\\testing;Initial Catalog=MasterDB;User ID=devuser; Password=devuser;";
            string connString = "Data Source=10.1.77.36\\CSCG2CDB01;Initial Catalog=MasterDB;User ID=devuser; Password=devuser";
            string sql = "CMGICMSUpdateStatusSP";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = new SqlCommand(sql, conn);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.SelectCommand.Parameters.AddWithValue("@Flag", Flag);
                        da.SelectCommand.Parameters.AddWithValue("@RollNo", RollNo);
                        da.SelectCommand.Parameters.AddWithValue("@UniqueKey", UniqueKey);

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        t_DT = ds.Tables[0];

                    }
                }
                catch (XmlException ex)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", ex.Message, ex.StackTrace));
                    Console.WriteLine("SQL Error: " + ex.Message);

                }
                catch (Exception e)
                {
                    m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                    Console.WriteLine("Error: " + e.Message);
                }
            }

            return t_DT;
        }

        private static bool SaveImage(string ImgStr, string ImgName, string path)
        {
            try
            {
                string imageName = ImgName + ".jpg";

                //set the image path
                string imgPath = Path.Combine(path, imageName);

                byte[] imageBytes = Convert.FromBase64String(ImgStr);

                File.WriteAllBytes(imgPath, imageBytes);

                return true;
            }
            catch(Exception e)
            {
                m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                Console.WriteLine("Error: " + e.Message);
                return false;
            }            
        }

    }

    public class Log
    {
        public string FileName { get; set; }
        public void WriteToLog(string p_Text)
        {
            string fileName = FileName;
            if (fileName != "")
            {
                if (!Directory.Exists(Path.GetDirectoryName(fileName)))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(fileName));
                }

                if (!File.Exists(fileName))
                {
                    File.Create(fileName).Dispose();
                }
                StreamWriter writer = new StreamWriter(fileName, true);
                writer.WriteLine(p_Text);
                writer.Close();
                writer.Dispose();
            }
        }
    }
}
