using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace CitizenPortalLib
{
    public partial class CommonUtility
    {
        //Logic for writing Status if activated.
        static void WriteToLog(string Statement, bool GenerateLog, string LogFilePath)
        {
            string t_LogFilePath = "";
            string t_LogFileName = "";
            bool t_GenerateLog = false;

            t_GenerateLog = GenerateLog;
            t_LogFilePath = LogFilePath;

            t_LogFileName = DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            t_LogFileName = System.IO.Path.Combine(t_LogFilePath, t_LogFileName);

            if (t_GenerateLog && (t_LogFileName != ""))
            {
                if (!System.IO.File.Exists(t_LogFileName))
                {
                    System.IO.File.Create(t_LogFileName).Dispose();
                }
                System.IO.StreamWriter writer = new System.IO.StreamWriter(t_LogFileName, true);
                writer.WriteLine(Statement);
                writer.Close();
                writer.Dispose();
            }
        }

        public static void WriteToLog(string Statement, string LogFilePath, string LogFileName)
        {
            string t_LogFilePath = "";
            string t_LogFileName = "";
            bool t_GenerateLog = false;

            t_GenerateLog = true;
            t_LogFilePath = LogFilePath;
            t_LogFileName = LogFileName;
            
            t_LogFileName = System.IO.Path.Combine(t_LogFilePath, t_LogFileName);

            if (t_GenerateLog && (t_LogFileName != ""))
            {
                if (!System.IO.File.Exists(t_LogFileName))
                {
                    System.IO.File.Create(t_LogFileName).Dispose();
                }
                System.IO.StreamWriter writer = new System.IO.StreamWriter(t_LogFileName, true);
                writer.WriteLine(Statement);
                writer.Close();
                writer.Dispose();
            }
        }

        public static void WriteToLog(string Statement)
        {
            string t_LogFilePath = "";
            bool t_GenerateLog = false;

            t_GenerateLog = bool.Parse(System.Configuration.ConfigurationManager.AppSettings["GenerateLog"].ToString());
            t_LogFilePath = System.Configuration.ConfigurationManager.AppSettings["StatusLogPath"].ToString();

            WriteToLog(Statement, t_GenerateLog, t_LogFilePath);
        }

        public static void WriteToLog(string Statement, string LogFilePath)
        {
            WriteToLog(Statement, true, LogFilePath);
        }

        //Logic for writing Error Log
        public static void WriteErrorLog(string Statement)
        {
            string t_LogFilePath = "";
            string t_LogFileName = "";

            t_LogFilePath = System.Configuration.ConfigurationManager.AppSettings["ErrorLogPath"].ToString();

            t_LogFileName = DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            t_LogFileName = System.IO.Path.Combine(t_LogFilePath, t_LogFileName);

            if ((t_LogFilePath != ""))
            {
                if (!Directory.Exists(Path.GetDirectoryName(t_LogFileName)))
                    Directory.CreateDirectory(Path.GetDirectoryName(t_LogFileName));
            }
            if ((t_LogFileName != ""))
            {
                if (!System.IO.File.Exists(t_LogFileName))
                {
                    System.IO.File.Create(t_LogFileName).Dispose();
                }
                System.IO.StreamWriter writer = new System.IO.StreamWriter(t_LogFileName, true);                
                writer.WriteLine("------------------ Date = " + DateTime.Now.ToString("yyyy-MM-dd-hh:mm:ss") + " ------------------");
                writer.WriteLine(Statement);
                writer.WriteLine("-----------------------------------------------------------------");
                writer.Close();
                writer.Dispose();
            }
        }

        /// <summary>
        /// Return the Full Year (20xx) as per the Current Financial Year
        /// </summary>
        /// <returns></returns>
        public static int GetFinancialYear()
        {
            int Month = DateTime.Now.Month;
            int Year = DateTime.Now.Year;
            int FinancialYear = Year;

            if (Month >= 1 && Month <= 3)
            {
                Year = Year - 1;
            }

            FinancialYear = Year;
            return FinancialYear;
        }

        /// <summary>
        /// Return Year code i.e. Last two digits, as per the Current Financial Year
        /// </summary>
        /// <returns></returns>
        public static string GetFinancialYearCode()
        {
            int Month = DateTime.Now.Month;
            int Year = DateTime.Now.Year;
            string FinancialYear = Year.ToString();

            if (Month >= 1 && Month <= 3)
            {
                Year = Year - 1;
            }

            FinancialYear = Year.ToString();
            FinancialYear = FinancialYear.Substring(2);
            return FinancialYear;
        }

    }
}
