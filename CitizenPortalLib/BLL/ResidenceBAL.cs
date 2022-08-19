using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class ResidenceBAL
    {
        private ResidenceDAL residenceDAL;
        public ResidenceBAL()
        {
            residenceDAL = new ResidenceDAL();
            residenceDAL.CurrentCulture = "1";
        }

        public DataTable GetResidenceDist()
        {
            return residenceDAL.GetResidenceDist();
        }
        public DataTable GetResidenceSubDiv(int DistrictCode)
        {
            return residenceDAL.GetResidenceSubDiv(DistrictCode);
        }
        public DataTable GetResidenceTahsil(int DistrictCode, int SubDivisionCode)
        {
            return residenceDAL.GetResidenceTahsil(DistrictCode, SubDivisionCode);
        }
        public DataTable GetResidenceBlock(int DistrictCode, int SubDivisionCode)
        {
            return residenceDAL.GetResidenceBlock(DistrictCode, SubDivisionCode);
        }
        public DataTable GetResidenceRI(int DistrictCode, int SubDivisionCode, int TahsilCode)
        {
            return residenceDAL.GetResidenceRI(DistrictCode, SubDivisionCode, TahsilCode);
        }


        public DataTable InsertData(CCTNSResidence CCTNSResidence, string[] aFields)
        {
            return residenceDAL.InstResidenceDtl(CCTNSResidence, aFields);
        }
        public DataSet GettResidenceDtl(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = residenceDAL.GettResidenceDtl(ServiceID, AppID);
            return t_AppDS;
        }
        public DataTable CheckLocalAadhaar(string UID)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.LocalAdhaarData(UID);
            return t_AppDS;
        }


        public bool LogResidenceEnrollRequest(string appID, string serviceID, string reqString, string ReqFileString, string createdBy)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.LogResidenceEnrollRequest(appID, serviceID, reqString, ReqFileString, createdBy);
            if (t_AppDS.Rows.Count > 0)
            { return true; }
            else { return false; }
        }

        public bool LogResidenceAPIRequest(string appID, string serviceID, string reqString, string ReqFileString, string createdBy)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.LogResidenceAPIRequest(appID, serviceID, reqString, ReqFileString, createdBy);
            if (t_AppDS.Rows.Count > 0)
            { return true; }
            else { return false; }
        }

        public DataTable ResidenceEnrollResponceGet(string appID, string serviceID, bool process)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.ResidenceEnrollResponceGet(appID, serviceID, process);
            if (t_AppDS.Rows.Count > 0)
            { return t_AppDS; }
            else { return null; }
        }

        public bool LogResidenceEnrollResponse(CitizenResult CR, string appID, string serviceID, string RespString)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.LogResidenceEnrollResponse(CR, appID, serviceID, RespString);
            if (t_AppDS.Rows.Count > 0)
            { return true; }
            else { return false; }
        }

        public bool LogResidenceAPIResponse(CitizenResult CR, string appID, string serviceID, string RespString)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.LogResidenceAPIResponse(CR, appID, serviceID, RespString);
            if (t_AppDS.Rows.Count > 0)
            { return true; }
            else { return false; }
        }


        public DataTable ResidenceAPIResponceGet(string appID, string serviceID, bool process)
        {
            DataTable t_AppDS = null;
            t_AppDS = residenceDAL.ResidenceAPIResponceGet(appID, serviceID, process);
            if (t_AppDS.Rows.Count > 0)
            { return t_AppDS; }
            else { return null; }
        }


        public void ErrorLog(LogError error)
        {
            residenceDAL.ErrorLog(error);
        }

        //public DataTable ResidenceEnrollResponse_JobData()
        //{
        //    DataTable t_AppDS = null;
        //    t_AppDS = residenceDAL.ResidenceEnrollResponse_JobData();
        //    if (t_AppDS.Rows.Count > 0)
        //    { return t_AppDS; }
        //    else { return null; }
        //}

    }
}
