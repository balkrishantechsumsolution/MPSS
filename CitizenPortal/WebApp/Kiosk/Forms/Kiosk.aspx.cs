using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class Kiosk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //[WebMethod]
        //public static List<Response> GetChartData()
        //{
        //    DataTable dt = new DataTable();


        //    dt.Columns.Add("Name", typeof(string));
        //    dt.Columns.Add("Count", typeof(Int32));



        //    dt.Rows.Add("Pending for Approval", 28);
        //    dt.Rows.Add("Approved Certificate", 58);
        //    dt.Rows.Add("Rejected Certificate", 14);

        //    //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
        //    //{
        //    //    con.Open();
        //    //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
        //    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    //    da.Fill(dt);
        //    //    con.Close();
        //    //}
        //    List<Response> dataList = new List<Response>();
        //    foreach (DataRow dtrow in dt.Rows)
        //    {
        //        Response details = new Response();
        //        details.Name = dtrow[0].ToString();
        //        details.Count = Convert.ToInt32(dtrow[1]);
        //        dataList.Add(details);
        //    }
        //    return dataList;
        //}
        //[WebMethod]
        //public static List<Response> GetChartData2()
        //{
        //    DataTable dt = new DataTable();


        //    dt.Columns.Add("Name", typeof(string));
        //    dt.Columns.Add("Count", typeof(Int32));



        //    dt.Rows.Add("Total Amount", 100000);
        //    dt.Rows.Add("Commission Earned", 40000);
        //    dt.Rows.Add("Balance", 60000);

        //    //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
        //    //{
        //    //    con.Open();
        //    //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
        //    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    //    da.Fill(dt);
        //    //    con.Close();
        //    //}
        //    List<Response> dataList = new List<Response>();
        //    foreach (DataRow dtrow in dt.Rows)
        //    {
        //        Response details = new Response();
        //        details.Name = dtrow[0].ToString();
        //        details.Count = Convert.ToInt32(dtrow[1]);
        //        dataList.Add(details);
        //    }
        //    return dataList;
        //}
        //[WebMethod]
        public static List<Response1> GetChartData3()
        {
            DataTable dt = new DataTable();


            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Count", typeof(Int32));
            dt.Columns.Add("Count1", typeof(Int32));
            dt.Columns.Add("Count2", typeof(Int32));



            dt.Rows.Add("Senior Citizen", 23, 36, 56);
            dt.Rows.Add("Residence", 32, 33, 34);
            dt.Rows.Add("Income", 11, 12, 13);
            dt.Rows.Add("General Affidavit", 23, 24, 25);

            //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
            //{
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select name,total=value from countrydetails order by total desc", con);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    con.Close();
            //}
            List<Response1> dataList = new List<Response1>();
            foreach (DataRow dtrow in dt.Rows)
            {
                Response1 details = new Response1();
                details.Name = dtrow[0].ToString();
                details.Count3 = Convert.ToInt32(dtrow[1]);
                details.Count1 = Convert.ToInt32(dtrow[2]);
                details.Count2 = Convert.ToInt32(dtrow[3]);
                dataList.Add(details);
            }
            return dataList;
        }
    }

    //public class Response
    //{
    //    public string Name { get; set; }
    //    public int Count { get; set; }
    //}
    //public class Response1
    //{
    //    public string Name { get; set; }
    //    public int Count3 { get; set; }
    //    public int Count1 { get; set; }
    //    public int Count2 { get; set; }
    //}
}