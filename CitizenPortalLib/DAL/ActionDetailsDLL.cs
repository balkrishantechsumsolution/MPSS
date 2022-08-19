using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace CitizenPortalLib.DAL
{
    public class ActionDetailsDLL:DALBase
    {
        private Database m_DataBase;
        private string conStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
        internal DataTable getActionHistoryData(string ServiceID, string AppID)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetActionHistorySp", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
            cmd.Parameters.AddWithValue("@AppID", AppID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            return dt;
        }

        internal DataTable getActionDetails(string AppID)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("getActionDetailsSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ApplicationID", AppID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            return dt;
        }
    }
}
